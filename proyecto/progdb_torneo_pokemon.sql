-- ======================================================================================
-- Disparadores (Triggers) y Procedimientos Almacenados
-- ======================================================================================


/*
================
TRIGGERS
================
*/


/* 
Con estos Triggers se cumple la regla de negocio:
"Es importante mencionar que una persona que este participando en la captura de shinys puede participar en el
torneo de distancia recorrida, pero aquellas personas que esten en el torneo de pelea, no pueden participar en
otro torneo."
*/

-- Evita que alguien de Pelea entre a Shinys o Distancia
CREATE OR REPLACE FUNCTION evitar_pelea_en_Shinys_o_Distancia()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM Participar_Pelea pp
    JOIN Pelea pe ON pe.id_Pelea = pp.id_Pelea
    WHERE pp.id_Individuo = NEW.id_Individuo
  ) THEN
    RAISE EXCEPTION
      'El individuo % ya participa en un Torneo de pelea y no puede participar en otros torneos',
      NEW.id_Individuo;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Evita que alguien de Shinys o Distancia participe en Pelea
CREATE OR REPLACE FUNCTION evitar_otro_torneo_en_pelea()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM Captura c
    WHERE c.id_Individuo = NEW.id_Individuo
  )
  OR EXISTS (
    SELECT 1
    FROM Distancia_Recorrida d
    WHERE d.id_Individuo = NEW.id_Individuo
  ) THEN
    RAISE EXCEPTION
      'El individuo % ya participa en un Torneo de shinys o de distancia y no puede participar en un Torneo de pelea',
      NEW.id_Individuo;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------------
-- TRIGGERS QUE USAN ESAS FUNCIONES
-------------------------------------------------

-- Capturas (torneo de shinys)
CREATE TRIGGER tg_captura_sin_participantes_de_pelea
BEFORE INSERT OR UPDATE ON Captura
FOR EACH ROW
EXECUTE FUNCTION evitar_pelea_en_Shinys_o_Distancia();

-- Distancia recorrida (torneo de distancia)
CREATE TRIGGER tg_distancia_sin_participantes_de_pelea
BEFORE INSERT OR UPDATE ON Distancia_Recorrida
FOR EACH ROW
EXECUTE FUNCTION evitar_pelea_en_Shinys_o_Distancia();

-- Participación en torneo de pelea
CREATE TRIGGER tg_pelea_solo_participantes
BEFORE INSERT OR UPDATE ON Participar_Pelea
FOR EACH ROW
EXECUTE FUNCTION evitar_otro_torneo_en_pelea();


------------------------------------------------------------

/* 
Cada compra de comida (visitante o participante)
actualiza automáticamente la columna Ganancia del Evento asociado.
El monto se calcula como Cantidad * Precio_sinIVA * 1.16 (incluyendo IVA 16%).
Se ejecuta despues de un INSERT en Comprar_Visitante y Comprar_Participante.
*/


CREATE OR REPLACE FUNCTION actualizar_ganancia_evento()
RETURNS TRIGGER AS $$
DECLARE
    v_id_evento INTEGER;
    v_precio_unitario NUMERIC(12,2);
    v_monto_compra NUMERIC(12,2);
BEGIN
    -- 1. OBTENER el id_Evento DIRECTAMENTE del registro de la compra 
    v_id_evento := NEW.id_Evento;

    -- 2. Obtener el precio unitario y calcular el monto
    SELECT Precio_sinIVA INTO v_precio_unitario
    FROM Comida
    WHERE id_Comida = NEW.id_Comida;

    v_monto_compra := NEW.Cantidad * v_precio_unitario * 1.16; -- Asumiendo 16% IVA

    -- 3. Actualizar la ganancia del evento usando el id_Evento explícito
    IF v_id_evento IS NOT NULL THEN
        UPDATE Evento
        SET Ganancia = Ganancia + v_monto_compra
        WHERE id_Evento = v_id_evento;
    ELSE
        -- Esto debería ser evitado por la restricción NOT NULL/FK, pero se incluye por seguridad.
        RAISE EXCEPTION 'El campo id_Evento en la tabla de compra no puede ser NULL';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para la tabla Comprar_Visitante
CREATE TRIGGER trg_actualizar_ganancia_visitante
AFTER INSERT ON Comprar_Visitante
FOR EACH ROW
EXECUTE FUNCTION actualizar_ganancia_evento();

-- Trigger para la tabla Comprar_Participante
CREATE TRIGGER trg_actualizar_ganancia_participante
AFTER INSERT ON Comprar_Participante
FOR EACH ROW
EXECUTE FUNCTION actualizar_ganancia_evento();


-------------------------------------------------------------------------------------

/*
================
PROCEDIMIENTOS ALMACENADOS
================
*/


/*
Simula una pelea entre dos participantes (id1, id2) de un torneo de pelea.
1) Calcula la suma de Puntos_Combate de los Pokémon de cada individuo.
2) A partir de esos puntos obtiene la probabilidad de victoria del participante 1
   y genera un número aleatorio para decidir al ganador de forma probabilística.
3) Inserta la pelea en la tabla Pelea, guardando en Ganador y Perdedor los id_Individuo.
4) Obtiene los equipos de cada participante desde Equipo_Pokemon y registra su
   participación en la tabla Participar_Pelea.
Si algún participante no tiene Pokémon o equipo registrado, lanza una excepción.
 */

CREATE OR REPLACE PROCEDURE ganadorPelea(
    id1    int,
    id2    int,
    torneo int,
    fase   varchar(20)
)
LANGUAGE plpgsql
AS $$
DECLARE
    -- Llave primaria
    id_P int;

    -- Puntos equipo
    puntosCombate1 int;
    puntosCombate2 int;

    -- Id equipo
    equipo1 int;
    equipo2 int;

    -- Ganador y perdedor
    ganador varchar(50);
    perdedor varchar(50);

    -- Probabilidad de Batalla
    prob1 NUMERIC;
    resultadoBatalla NUMERIC;
BEGIN
    -- Nuevo id de pelea
    SELECT COALESCE(MAX(id_Pelea), 0) + 1
    INTO id_P
    FROM Pelea;

    -- Obtenemos puntos de combate de cada participante
    SELECT SUM(P.Puntos_Combate)
    INTO puntosCombate1
    FROM Pokemon P
    WHERE P.id_Individuo = id1;

    SELECT SUM(P.Puntos_Combate)
    INTO puntosCombate2
    FROM Pokemon P
    WHERE P.id_Individuo = id2;

    IF puntosCombate1 IS NULL OR puntosCombate2 IS NULL THEN
        RAISE EXCEPTION 'Algún participante no cuenta con Pokémon en el torneo';
    END IF;

    -- Probabilidad de victoria del participante 1
    prob1 := puntosCombate1::NUMERIC / (puntosCombate1 + puntosCombate2);

    -- Número aleatorio para la batalla
    resultadoBatalla := RANDOM();

    -- Selección del ganador usando probabilidad
    IF resultadoBatalla < prob1 THEN
        SELECT id_Individuo
        INTO ganador
        FROM Registrador
        WHERE id_Individuo = id1;

        SELECT id_Individuo
        INTO perdedor
        FROM Registrador
        WHERE id_Individuo = id2;
    ELSE
        SELECT id_Individuo
        INTO ganador
        FROM Registrador
        WHERE id_Individuo = id2;

        SELECT id_Individuo
        INTO perdedor
        FROM Registrador
        WHERE id_Individuo = id1;
    END IF;

    -- Registrar pelea
    INSERT INTO Pelea(id_Pelea, id_Torneo, Fase, Ganador, Perdedor)
    VALUES (id_P, torneo, fase, ganador, perdedor);

    -- Obtener equipos
    SELECT id_Equipo INTO equipo1
    FROM Equipo_Pokemon
    WHERE id_Individuo = id1;

    SELECT id_Equipo INTO equipo2
    FROM Equipo_Pokemon
    WHERE id_Individuo = id2;

    IF equipo1 IS NULL OR equipo2 IS NULL THEN
        RAISE EXCEPTION 'Algún participante no tiene equipo registrado en Equipo_Pokemon';
    END IF;

    -- Registrar participación
    INSERT INTO Participar_Pelea(id_Pelea, id_Equipo, id_Individuo)
    VALUES (id_P, equipo1, id1);

    INSERT INTO Participar_Pelea(id_Pelea, id_Equipo, id_Individuo)
    VALUES (id_P, equipo2, id2);

    -- Notificación
    RAISE NOTICE 'Pelea registrada: % (Ganador: %, Perdedor: %)',
        id_P, ganador, perdedor;
END;
$$;