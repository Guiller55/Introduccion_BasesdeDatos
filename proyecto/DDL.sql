-- Equipo JoinForce

-- TABLAS
CREATE TABLE Cuidador (
  id_Individuo INT,
  Nombre VARCHAR(50),
  Apellido_Paterno VARCHAR(50),
  Apellido_Materno VARCHAR(50),
  Fecha_Nacimiento DATE,
  Sexo VARCHAR(1),
  Ciudad VARCHAR(60),
  Calle VARCHAR(80),
  Colonia VARCHAR(60),
  Codigo_Postal CHAR(5),
  No_Interior VARCHAR(10),
  No_Exterior VARCHAR(10),
  Horario VARCHAR(50),
  Locacion VARCHAR(30),
  Salario NUMERIC(12,2)
);

CREATE TABLE Limpiador (
  id_Individuo INT,
  Nombre VARCHAR(50),
  Apellido_Paterno VARCHAR(50),
  Apellido_Materno VARCHAR(50),
  Fecha_Nacimiento DATE,
  Sexo VARCHAR(1),
  Ciudad VARCHAR(60),
  Calle VARCHAR(80),
  Colonia VARCHAR(60),
  Codigo_Postal CHAR(5),
  No_Interior VARCHAR(10),
  No_Exterior VARCHAR(10),
  Horario VARCHAR(50),
  Locacion VARCHAR(30),
  Salario NUMERIC(12,2)
);

CREATE TABLE Registrador (
  id_Individuo INT,
  Nombre VARCHAR(50),
  Apellido_Paterno VARCHAR(50),
  Apellido_Materno VARCHAR(50),
  Fecha_Nacimiento DATE,
  Sexo VARCHAR(1),
  Ciudad VARCHAR(60),
  Calle VARCHAR(80),
  Colonia VARCHAR(60),
  Codigo_Postal CHAR(5),
  No_Interior VARCHAR(10),
  No_Exterior VARCHAR(10),
  Salario NUMERIC(12,2),
  Facultad VARCHAR(50),
  Carrera VARCHAR(80),
  No_Cuenta VARCHAR(9),
  esParticipante BOOLEAN,
  esPersonal BOOLEAN
);

CREATE TABLE Vendedor (
  id_Individuo INT,
  Nombre VARCHAR(50),
  Apellido_Paterno VARCHAR(50),
  Apellido_Materno VARCHAR(50),
  Fecha_Nacimiento DATE,
  Sexo VARCHAR(1),
  Ciudad VARCHAR(60),
  Calle VARCHAR(80),
  Colonia VARCHAR(60),
  Codigo_Postal CHAR(5),
  No_Interior VARCHAR(10),
  No_Exterior VARCHAR(10),
  Horario VARCHAR(50),
  Locacion VARCHAR(30),
  Ganancia NUMERIC(12,2)
);

CREATE TABLE Correo_Cuidador (
  id_Individuo INT,
  Correo_Cuidador VARCHAR(100)
);
ALTER TABLE Correo_Cuidador ADD CONSTRAINT chk_correo_formato_cuidador CHECK (Correo_Cuidador ~ '^[^@]+@[^@]+\.[^@]{2,}$');

CREATE TABLE Telefono_Cuidador (
  id_Individuo INT,
  Telefono_Cuidador VARCHAR(10)
);
ALTER TABLE Telefono_Cuidador ADD CONSTRAINT chk_telefono_formato_cuidador CHECK (Telefono_Cuidador ~ '^[0-9]{10}$');

CREATE TABLE Correo_Limpiador (
  id_Individuo INT,
  Correo_Limpiador VARCHAR(100)
);
ALTER TABLE Correo_Limpiador ADD CONSTRAINT chk_correo_formato_limpiador CHECK (Correo_Limpiador ~ '^[^@]+@[^@]+\.[^@]{2,}$');

CREATE TABLE Telefono_Limpiador (
  id_Individuo INT,
  Telefono_Limpiador VARCHAR(10)
);
ALTER TABLE Telefono_Limpiador ADD CONSTRAINT chk_telefono_formato_limpiador CHECK (Telefono_Limpiador ~ '^[0-9]{10}$');

CREATE TABLE Correo_Registrador (
  id_Individuo INT,
  Correo_Registrador VARCHAR(100)
);
ALTER TABLE Correo_Registrador ADD CONSTRAINT chk_correo_registrador CHECK (Correo_Registrador ~ '^[^@]+@[^@]+\.[^@]{2,}$');

CREATE TABLE Telefono_Registrador (
  id_Individuo INT,
  Telefono_Registrador VARCHAR(10)
);
ALTER TABLE Telefono_Registrador ADD CONSTRAINT chk_telefono_formato_registrador CHECK (Telefono_Registrador ~ '^[0-9]{10}$');

CREATE TABLE Correo_Vendedor (
  id_Individuo INT,
  Correo_Vendedor VARCHAR(100)
);
ALTER TABLE Correo_Vendedor ADD CONSTRAINT chk_correo_formato_vendedor CHECK (Correo_Vendedor ~ '^[^@]+@[^@]+\.[^@]{2,}$');

CREATE TABLE Telefono_Vendedor (
  id_Individuo INT,
  Telefono_Vendedor VARCHAR(10)
);
ALTER TABLE Telefono_Vendedor ADD CONSTRAINT chk_telefono_formato_vendedor CHECK (Telefono_Vendedor ~ '^[0-9]{10}$');

CREATE TABLE Evento (
  id_Evento INT,
  No_Edicion INTEGER,
  Fecha DATE,
  Ganancia NUMERIC(12,2)
);

CREATE TABLE Trabaja_Cuidador (
  id_Individuo INT,
  id_Evento INT
);

CREATE TABLE Trabaja_Limpiador (
  id_Individuo INT,
  id_Evento INT
);

CREATE TABLE Trabaja_Registrador (
  id_Individuo INT,
  id_Evento INT
);

CREATE TABLE Trabaja_Vendedor (
  id_Individuo INT,
  id_Evento INT
);

CREATE TABLE Torneo_Shinys (
  id_Torneo INT,
  id_Evento INT,
  Premio INT
);

CREATE TABLE Torneo_Distancia (
  id_Torneo INT,
  id_Evento INT,
  Premio INT
);

CREATE TABLE Torneo_Pelea (
  id_Torneo INT,
  id_Evento INT,
  Premio INT
);

CREATE TABLE Inscribir_Participante (
  id_Registrador INT,
  id_Participante INT
);
-- RESTRICCIONES

--CUIDADOR
ALTER TABLE Cuidador
  ALTER COLUMN id_Individuo SET NOT NULL,
  ALTER COLUMN Nombre SET NOT NULL,
  ALTER COLUMN Apellido_Paterno SET NOT NULL,
  ALTER COLUMN Apellido_Materno SET NOT NULL,
  ALTER COLUMN Fecha_Nacimiento SET NOT NULL,
  ALTER COLUMN Sexo SET NOT NULL,
  ALTER COLUMN Ciudad SET NOT NULL,
  ALTER COLUMN Calle SET NOT NULL,
  ALTER COLUMN Colonia SET NOT NULL,
  ALTER COLUMN Codigo_Postal SET NOT NULL,
  ALTER COLUMN No_Exterior SET NOT NULL,
  ALTER COLUMN Locacion SET NOT NULL,
  ALTER COLUMN Salario SET NOT NULL;

ALTER TABLE Cuidador ADD CONSTRAINT CHK_Cuidador_Sexo CHECK (Sexo IN ('F', 'M', 'X'));
ALTER TABLE Cuidador ADD CONSTRAINT CHK_Cuidador_CP CHECK (Codigo_Postal ~ '^[0-9]{5}$');
ALTER TABLE Cuidador ADD CONSTRAINT CHK_Cuidador_Horario CHECK (Horario IN ('9:00-15:00', '15:00-21:00'));
ALTER TABLE Cuidador ADD CONSTRAINT CHK_Cuidador_Locacion CHECK (Locacion IN ('Entrada CU', 'Rectoría', 'Universum'));
ALTER TABLE Cuidador ADD CONSTRAINT CHK_Cuidador_Salario CHECK (Salario >= 0);
ALTER TABLE Cuidador ADD CONSTRAINT CHK_EdadCuidador CHECK (EXTRACT(YEAR FROM AGE(CURRENT_DATE, Fecha_Nacimiento)) <= 100);

--LIMPIADOR
ALTER TABLE Limpiador
  ALTER COLUMN id_Individuo SET NOT NULL,
  ALTER COLUMN Nombre SET NOT NULL,
  ALTER COLUMN Apellido_Paterno SET NOT NULL,
  ALTER COLUMN Apellido_Materno SET NOT NULL,
  ALTER COLUMN Fecha_Nacimiento SET NOT NULL,
  ALTER COLUMN Sexo SET NOT NULL,
  ALTER COLUMN Ciudad SET NOT NULL,
  ALTER COLUMN Calle SET NOT NULL,
  ALTER COLUMN Colonia SET NOT NULL,
  ALTER COLUMN Codigo_Postal SET NOT NULL,
  ALTER COLUMN No_Exterior SET NOT NULL,
  ALTER COLUMN Locacion SET NOT NULL,
  ALTER COLUMN Salario SET NOT NULL;

ALTER TABLE Limpiador ADD CONSTRAINT CHK_Limpiador_Sexo CHECK (Sexo IN ('F', 'M', 'X'));
ALTER TABLE Limpiador ADD CONSTRAINT CHK_Limpiador_CP CHECK (Codigo_Postal ~ '^[0-9]{5}$');
ALTER TABLE Limpiador ADD CONSTRAINT CHK_Limpiador_Horario CHECK (Horario IN ('9:00-15:00', '15:00-21:00'));
ALTER TABLE Limpiador ADD CONSTRAINT CHK_Limpiador_Locacion CHECK (Locacion IN ('Entrada CU', 'Rectoría', 'Universum'));
ALTER TABLE Limpiador ADD CONSTRAINT CHK_Limpiador_Salario CHECK (Salario >= 0);
ALTER TABLE Limpiador ADD CONSTRAINT CHK_EdadLimpiador CHECK (EXTRACT(YEAR FROM AGE(CURRENT_DATE, Fecha_Nacimiento)) <= 100);

-- REGISTRADOR
ALTER TABLE Registrador
  ALTER COLUMN id_Individuo SET NOT NULL,
  ALTER COLUMN Nombre SET NOT NULL,
  ALTER COLUMN Apellido_Paterno SET NOT NULL,
  ALTER COLUMN Apellido_Materno SET NOT NULL,
  ALTER COLUMN Fecha_Nacimiento SET NOT NULL,
  ALTER COLUMN Sexo SET NOT NULL,
  ALTER COLUMN Ciudad SET NOT NULL,
  ALTER COLUMN Calle SET NOT NULL,
  ALTER COLUMN Colonia SET NOT NULL,
  ALTER COLUMN Codigo_Postal SET NOT NULL,
  ALTER COLUMN No_Exterior SET NOT NULL,
  ALTER COLUMN esParticipante SET NOT NULL,
  ALTER COLUMN esPersonal SET NOT NULL,
  ALTER COLUMN Facultad SET NOT NULL,
  ALTER COLUMN Carrera SET NOT NULL,
  ALTER COLUMN No_Cuenta SET NOT NULL;

ALTER TABLE Registrador ADD CONSTRAINT CHK_Registrador_Sexo CHECK (Sexo IN ('F', 'M', 'X'));
ALTER TABLE Registrador ADD CONSTRAINT CHK_Registrador_CP CHECK (Codigo_Postal ~ '^[0-9]{5}$');
ALTER TABLE Registrador ADD CONSTRAINT CHK_Registrador_Salario CHECK (Salario >= 0);
ALTER TABLE Registrador ADD CONSTRAINT CHK_EdadRegistrador CHECK (EXTRACT(YEAR FROM AGE(CURRENT_DATE, Fecha_Nacimiento)) <= 100);

--VENDEDOR
ALTER TABLE Vendedor
  ALTER COLUMN id_Individuo SET NOT NULL,
  ALTER COLUMN Nombre SET NOT NULL,
  ALTER COLUMN Apellido_Paterno SET NOT NULL,
  ALTER COLUMN Apellido_Materno SET NOT NULL,
  ALTER COLUMN Fecha_Nacimiento SET NOT NULL,
  ALTER COLUMN Sexo SET NOT NULL,
  ALTER COLUMN Ciudad SET NOT NULL,
  ALTER COLUMN Calle SET NOT NULL,
  ALTER COLUMN Colonia SET NOT NULL,
  ALTER COLUMN Codigo_Postal SET NOT NULL,
  ALTER COLUMN No_Exterior SET NOT NULL,
  ALTER COLUMN Locacion SET NOT NULL,
  ALTER COLUMN Ganancia SET NOT NULL;

ALTER TABLE Vendedor ADD CONSTRAINT CHK_Vendedor_Sexo CHECK (Sexo IN ('F', 'M', 'X'));
ALTER TABLE Vendedor ADD CONSTRAINT CHK_Vendedor_CP CHECK (Codigo_Postal ~ '^[0-9]{5}$');
ALTER TABLE Vendedor ADD CONSTRAINT CHK_Vendedor_Horario CHECK (Horario IN ('9:00-15:00', '15:00-21:00'));
ALTER TABLE Vendedor ADD CONSTRAINT CHK_Vendedor_Locacion CHECK (Locacion IN ('Entrada CU', 'Rectoría', 'Universum'));
ALTER TABLE Vendedor ADD CONSTRAINT CHK_Vendedor_Ganancia CHECK (Ganancia >= 0);
ALTER TABLE Vendedor ADD CONSTRAINT CHK_EdadVendedor CHECK (EXTRACT(YEAR FROM AGE(CURRENT_DATE, Fecha_Nacimiento)) <= 100);

--EVENTO
ALTER TABLE Evento
  ALTER COLUMN id_Evento SET NOT NULL,
  ALTER COLUMN No_Edicion SET NOT NULL,
  ALTER COLUMN Fecha SET NOT NULL,
  ALTER COLUMN Ganancia SET NOT NULL;

ALTER TABLE Evento ADD CONSTRAINT CHK_Evento_Fecha CHECK (Fecha <= CURRENT_DATE);
ALTER TABLE Evento ADD CONSTRAINT CHK_Evento_Ganancia CHECK (Ganancia >= 0);


--TORNEOS
ALTER TABLE Torneo_Shinys ALTER COLUMN Premio SET NOT NULL;
ALTER TABLE Torneo_Shinys ADD CONSTRAINT CHK_Shinys_Premio CHECK (Premio >= 0);
ALTER TABLE Torneo_Distancia ALTER COLUMN Premio SET NOT NULL;
ALTER TABLE Torneo_Distancia ADD CONSTRAINT CHK_Distancia_Premio CHECK (Premio >= 0);
ALTER TABLE Torneo_Pelea ALTER COLUMN Premio SET NOT NULL;
ALTER TABLE Torneo_Pelea ADD CONSTRAINT CHK_Pelea_Premio CHECK (Premio >= 0);

-- LLAVES PRIMARIAS Y FORÁNEAS

ALTER TABLE Cuidador ADD CONSTRAINT PK_Cuidador PRIMARY KEY (id_Individuo);
ALTER TABLE Limpiador ADD CONSTRAINT PK_Limpiador PRIMARY KEY (id_Individuo);
ALTER TABLE Registrador ADD CONSTRAINT PK_Registrador PRIMARY KEY (id_Individuo);
ALTER TABLE Vendedor ADD CONSTRAINT PK_Vendedor PRIMARY KEY (id_Individuo);
ALTER TABLE Correo_Cuidador ADD CONSTRAINT PK_Correo_Cuidador PRIMARY KEY (Correo_Cuidador, id_Individuo);
ALTER TABLE Correo_Limpiador ADD CONSTRAINT PK_Correo_Limpiador PRIMARY KEY (Correo_Limpiador, id_Individuo);
ALTER TABLE Correo_Registrador ADD CONSTRAINT PK_Correo_Registrador PRIMARY KEY (Correo_Registrador, id_Individuo);
ALTER TABLE Correo_Vendedor ADD CONSTRAINT PK_Correo_Vendedor PRIMARY KEY (Correo_Vendedor, id_Individuo);
ALTER TABLE Telefono_Cuidador ADD CONSTRAINT PK_Telefono_Cuidador PRIMARY KEY (Telefono_Cuidador, id_Individuo);
ALTER TABLE Telefono_Limpiador ADD CONSTRAINT PK_Telefono_Limpiador PRIMARY KEY (Telefono_Limpiador, id_Individuo);
ALTER TABLE Telefono_Registrador ADD CONSTRAINT PK_Telefono_Registrador PRIMARY KEY (Telefono_Registrador, id_Individuo);
ALTER TABLE Telefono_Vendedor ADD CONSTRAINT PK_Telefono_Vendedor PRIMARY KEY (Telefono_Vendedor, id_Individuo);
ALTER TABLE Evento ADD CONSTRAINT PK_Evento PRIMARY KEY (id_Evento);
ALTER TABLE Torneo_Shinys ADD CONSTRAINT PK_Torneo_Shinys PRIMARY KEY (id_Torneo);
ALTER TABLE Torneo_Distancia ADD CONSTRAINT PK_Torneo_Distancia PRIMARY KEY (id_Torneo);
ALTER TABLE Torneo_Pelea ADD CONSTRAINT PK_Torneo_Pelea PRIMARY KEY (id_Torneo);

-- LLAVES FORÁNEAS
ALTER TABLE Correo_Cuidador ADD CONSTRAINT FK_Correo_Cuidador FOREIGN KEY (id_Individuo) REFERENCES Cuidador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Correo_Limpiador ADD CONSTRAINT FK_Correo_Limpiador FOREIGN KEY (id_Individuo) REFERENCES Limpiador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Correo_Registrador ADD CONSTRAINT FK_Correo_Registrador FOREIGN KEY (id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Correo_Vendedor ADD CONSTRAINT FK_Correo_Vendedor FOREIGN KEY (id_Individuo) REFERENCES Vendedor(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Telefono_Cuidador ADD CONSTRAINT FK_Telefono_Cuidador FOREIGN KEY (id_Individuo) REFERENCES Cuidador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Telefono_Limpiador ADD CONSTRAINT FK_Telefono_Limpiador FOREIGN KEY (id_Individuo) REFERENCES Limpiador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Telefono_Registrador ADD CONSTRAINT FK_Telefono_Registrador FOREIGN KEY (id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Telefono_Vendedor ADD CONSTRAINT FK_Telefono_Vendedor FOREIGN KEY (id_Individuo) REFERENCES Vendedor(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Cuidador ADD CONSTRAINT FK_Trabaja_Cuidador_Cuidador FOREIGN KEY (id_Individuo) REFERENCES Cuidador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Cuidador ADD CONSTRAINT FK_Trabaja_Cuidador_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Limpiador ADD CONSTRAINT FK_Trabaja_Limpiador_Limpiador FOREIGN KEY (id_Individuo) REFERENCES Limpiador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Limpiador ADD CONSTRAINT FK_Trabaja_Limpiador_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Registrador ADD CONSTRAINT FK_Trabaja_Registrador_Registrador FOREIGN KEY (id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Registrador ADD CONSTRAINT FK_Trabaja_Registrador_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Vendedor ADD CONSTRAINT FK_Trabaja_Vendedor_Vendedor FOREIGN KEY (id_Individuo) REFERENCES Vendedor(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja_Vendedor ADD CONSTRAINT FK_Trabaja_Vendedor_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Torneo_Shinys ADD CONSTRAINT FK_Torneo_Shinys FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Torneo_Distancia ADD CONSTRAINT FK_Torneo_Distancia FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Torneo_Pelea ADD CONSTRAINT FK_Torneo_Pelea FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Inscribir_Participante ADD CONSTRAINT FK_Inscribir_Participante_Registrador FOREIGN KEY (id_Registrador) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Inscribir_Participante ADD CONSTRAINT FK_Inscribir_Participante_Participante FOREIGN KEY (id_Participante) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;






-------------------------------------------------------------









/* ------------ TABLA EQUIPO_POKEMON ----------- */
CREATE TABLE Equipo_Pokemon(
  id_Equipo INT,
  id_Individuo INT
);

-- Llaves primarias
ALTER TABLE Equipo_Pokemon ADD CONSTRAINT PK_Equipo_Pokemon PRIMARY KEY (id_Equipo, id_Individuo);

-- Llave Foranea
ALTER TABLE Equipo_Pokemon ADD CONSTRAINT FK_Equipo_Pokemon_Registrador FOREIGN KEY (id_Individuo) REFERENCES Registrador (id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;

-- Resrtricciones no nulos
ALTER TABLE Equipo_Pokemon ALTER COLUMN id_Equipo SET NOT NULL;
ALTER TABLE Equipo_Pokemon ALTER COLUMN id_Individuo SET NOT NULL;



/* ------------ TABLA VISITANTE ----------- */
CREATE TABLE Visitante(
  id_Visitante INT,
  Nombre VARCHAR(50),
  Apellido_Paterno VARCHAR(50),
  Apellido_Materno VARCHAR(50),
  Fecha_Nacimiento DATE,
  Sexo VARCHAR(1)
);

-- Llave Primaria
ALTER TABLE Visitante ADD CONSTRAINT PK_Visitante PRIMARY KEY (id_Visitante);

-- Restricciones de no nulo
ALTER TABLE Visitante ALTER COLUMN id_Visitante SET NOT NULL;
ALTER TABLE Visitante ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Visitante ALTER COLUMN Apellido_Paterno SET NOT NULL;
ALTER TABLE Visitante ALTER COLUMN Apellido_Materno SET NOT NULL;
ALTER TABLE Visitante ALTER COLUMN Fecha_Nacimiento SET NOT NULL;
ALTER TABLE Visitante ALTER COLUMN Sexo SET NOT NULL;

-- Restricciones por columna
ALTER TABLE Visitante ADD CONSTRAINT CHK_Visitante_Sexo CHECK (Sexo IN ('M','F','X'));
ALTER TABLE Visitante ADD CONSTRAINT CHK_EdadVisitante CHECK (EXTRACT(YEAR FROM AGE(CURRENT_DATE, Fecha_Nacimiento)) <= 100);




/* ------------ TABLA POKEMON ----------- */
CREATE TABLE Pokemon (
  id_Pokemon INT,
  id_Equipo INT,
  id_Individuo INT,
  Nombre VARCHAR(50),
  Peso NUMERIC(6,2),
  Sexo VARCHAR(1),
  Puntos_Combate INT,
  Shiny BOOLEAN,
  Tipo VARCHAR(30),
  Especie VARCHAR(50)
);

-- Llave Primaria y Llave Foranea Compuesta
ALTER TABLE Pokemon ADD CONSTRAINT PK_Pokemon PRIMARY KEY (id_Pokemon);
ALTER TABLE Pokemon ADD CONSTRAINT FK_Pokemon_EquipoPokemon FOREIGN KEY (id_Equipo, id_Individuo) REFERENCES Equipo_Pokemon (id_Equipo, id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;


-- Restricciones de no nulos
ALTER TABLE Pokemon ALTER COLUMN id_Pokemon SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN id_Equipo SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN id_Individuo SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN Peso SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN Sexo SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN Puntos_Combate SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN Shiny SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE Pokemon ALTER COLUMN Especie SET NOT NULL;


-- Restricciones de la tabla
ALTER TABLE Pokemon ADD CONSTRAINT CHK_SexoPokemon CHECK (Sexo IN ('M', 'F'));
ALTER TABLE Pokemon ADD CONSTRAINT CHK_PesoPositivo CHECK (Peso > 0);
ALTER TABLE Pokemon ADD CONSTRAINT CHK_PuntosCombate CHECK (Puntos_Combate >= 0);
ALTER TABLE Pokemon ALTER COLUMN Shiny SET DEFAULT FALSE;




/* ------------ TABLA CAPTURA ----------- */
CREATE TABLE Captura (
  id_Captura INT,
  id_Torneo INT,
  id_Individuo INT,
  id_Pokemon INT,
  Hora TIME,
  Fecha DATE
);

-- Llave Primaria
ALTER TABLE Captura ADD CONSTRAINT PK_Captura PRIMARY KEY (id_Captura);

-- Llaves Foraneas
ALTER TABLE Captura ADD CONSTRAINT FK_Captura_Torneo_Shinys FOREIGN KEY (id_Torneo) REFERENCES Torneo_Shinys(id_Torneo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Captura ADD CONSTRAINT FK_Captura_Individuo FOREIGN KEY (id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Captura ADD CONSTRAINT FK_Captura_Pokemon FOREIGN KEY (id_Pokemon) REFERENCES Pokemon(id_Pokemon) ON DELETE CASCADE ON UPDATE CASCADE;


-- Restricciones de no nulos
ALTER TABLE Captura ALTER COLUMN id_Captura SET NOT NULL;
ALTER TABLE Captura ALTER COLUMN id_Torneo SET NOT NULL;
ALTER TABLE Captura ALTER COLUMN id_Individuo SET NOT NULL;
ALTER TABLE Captura ALTER COLUMN id_Pokemon SET NOT NULL;
ALTER TABLE Captura ALTER COLUMN Hora  SET NOT NULL;
ALTER TABLE Captura ALTER COLUMN Fecha SET NOT NULL;

-- Restricciones de cada columna
ALTER TABLE Captura ADD CONSTRAINT UQ_Captura_Evento UNIQUE (id_Torneo, id_Individuo, id_Pokemon, Fecha, Hora);
ALTER TABLE Captura ADD CONSTRAINT CHK_Captura_Fecha CHECK (Fecha <= CURRENT_DATE);



/* ------------ TABLA DISTANCIA_RECORRIDA ----------- */
CREATE TABLE Distancia_Recorrida (
  id_Distancia INT,
  id_Torneo INT,
  id_Individuo INT,
  Hora TIME,
  Checkpoint VARCHAR(50),
  Distancia INT
);

-- Llave primaria
ALTER TABLE Distancia_Recorrida ADD CONSTRAINT PK_Distancia_Recorrida PRIMARY KEY(id_Distancia);

-- Llaves Foraneas
ALTER TABLE Distancia_Recorrida ADD CONSTRAINT FK_Distancia_Recorrida_Torneo_Distancia FOREIGN KEY(id_Torneo) REFERENCES Torneo_Distancia(id_Torneo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Distancia_Recorrida ADD CONSTRAINT FK_Distancia_Recorrida_Individuo FOREIGN KEY(id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulos
ALTER TABLE Distancia_Recorrida ALTER COLUMN id_Distancia SET NOT NULL;
ALTER TABLE Distancia_Recorrida ALTER COLUMN id_Torneo SET NOT NULL;
ALTER TABLE Distancia_Recorrida ALTER COLUMN id_Individuo SET NOT NULL;
ALTER TABLE Distancia_Recorrida ALTER COLUMN Hora SET NOT NULL;
ALTER TABLE Distancia_Recorrida ALTER COLUMN Checkpoint SET NOT NULL;
ALTER TABLE Distancia_Recorrida ALTER COLUMN Distancia SET NOT NULL;
-- Restricciones de cada columna
ALTER TABLE Distancia_Recorrida ADD CONSTRAINT CHK_Distancia_CheckpointValido CHECK (Checkpoint IN ('Entrada CU', 'Rectoría', 'Universum'));
ALTER TABLE Distancia_Recorrida ADD CONSTRAINT CHK_Distancia_valida CHECK (Distancia >= 0);

/* ------------ TABLA PELEA ----------- */
CREATE TABLE Pelea (
  id_Pelea INT,
  id_Torneo INT,
  Fase VARCHAR(20),
  Ganador VARCHAR(20),
  Perdedor VARCHAR(20)
);


-- Llave Primaria
ALTER TABLE Pelea ADD CONSTRAINT PK_Pelea PRIMARY KEY(id_Pelea);

-- Llave Foranea
ALTER TABLE Pelea ADD CONSTRAINT FK_Pelea_Torneo_Pelea FOREIGN KEY(id_Torneo) REFERENCES Torneo_Pelea(id_Torneo) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Pelea ALTER COLUMN id_Pelea SET NOT NULL;
ALTER TABLE Pelea ALTER COLUMN id_Torneo SET NOT NULL;
ALTER TABLE Pelea ALTER COLUMN Fase SET NOT NULL;
ALTER TABLE Pelea ALTER COLUMN Ganador SET NOT NULL;
ALTER TABLE Pelea ALTER COLUMN Perdedor SET NOT NULL;

-- Restricciones de cada columna
ALTER TABLE Pelea ADD CONSTRAINT CHK_Pelea_GanadorPerdedor CHECK (Ganador <> Perdedor);


/* ------------ TABLA COMIDA ----------- */

CREATE TABLE Comida(
  id_Comida INT,
  id_Individuo INT,
  Tipo_Alimento VARCHAR(30),
  Precio_sinIVA NUMERIC(12,2),
  Nombre VARCHAR(50),
  Fecha_Caducidad DATE,
  esPerecedero BOOLEAN
);

-- Llave Primaria
ALTER TABLE Comida ADD CONSTRAINT PK_Comida PRIMARY KEY(id_Comida);

-- LLave Foranea
ALTER TABLE Comida ADD CONSTRAINT FK_Comida_Vendedor FOREIGN KEY (id_Individuo) REFERENCES Vendedor(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Comida ALTER COLUMN id_Comida SET NOT NULL;
ALTER TABLE Comida ALTER COLUMN id_Individuo SET NOT NULL;
ALTER TABLE Comida ALTER COLUMN Tipo_Alimento SET NOT NULL;
ALTER TABLE Comida ALTER COLUMN Precio_sinIVA SET NOT NULL;
ALTER TABLE Comida ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Comida ALTER COLUMN esPerecedero SET NOT NULL;

-- Restricciones de cada columna
ALTER TABLE Comida ADD CONSTRAINT CHK_Comida_PrecioPositivo CHECK (Precio_sinIVA >= 0);
ALTER TABLE Comida ADD CONSTRAINT CHK_Comida_FechaCaducidad_Condicional
CHECK (
  (esPerecedero = TRUE  AND Fecha_Caducidad IS NOT NULL AND Fecha_Caducidad >= CURRENT_DATE)
  OR
  (esPerecedero = FALSE AND Fecha_Caducidad IS NULL)
);


/* ------------ TABLA CUENTA_POKEMONGO ----------- */
CREATE TABLE Cuenta_PokemonGO(
    Codigo_Entrenador VARCHAR(10),
    id_Individuo INT,
    Equipo VARCHAR(50),
    Username VARCHAR(30),
    Nivel_Entrenador INT
);

-- Llave Primaria
ALTER TABLE Cuenta_PokemonGO ADD CONSTRAINT PK_Cuenta_PokemonGO PRIMARY KEY (Codigo_Entrenador);

-- Llave Foranea
ALTER TABLE Cuenta_PokemonGO ADD CONSTRAINT  FK_Cuenta_PokemonGO_Registrador FOREIGN KEY (id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Cuenta_PokemonGO ALTER COLUMN Codigo_Entrenador SET NOT NULL;
ALTER TABLE Cuenta_PokemonGO ALTER COLUMN id_Individuo SET NOT NULL;
ALTER TABLE Cuenta_PokemonGO ALTER COLUMN Equipo SET NOT NULL;
ALTER TABLE Cuenta_PokemonGO ALTER COLUMN Username SET NOT NULL;
ALTER TABLE Cuenta_PokemonGO ALTER COLUMN Nivel_Entrenador SET NOT NULL;

-- Restricciones de cada columna
ALTER TABLE Cuenta_PokemonGO ADD CONSTRAINT CHK_Cuenta_EquipoValido CHECK (LOWER(Equipo) IN ('sabiduria', 'instinto', 'valor'));
ALTER TABLE Cuenta_PokemonGO ADD CONSTRAINT UQ_Cuenta_Username UNIQUE (Username);
ALTER TABLE Cuenta_PokemonGO ADD CONSTRAINT CHK_Cuenta_NivelPositivo CHECK (Nivel_Entrenador >= 1);

/* ------------ TABLA ASISTIR_VISITANTE ----------- */

CREATE TABLE Asistir_Visitante (
    id_Evento INT,
    id_Visitante INT,
    Hora_Ingreso TIME,
    Hora_Salida TIME
);





-- Llaves Foraneas
ALTER TABLE Asistir_Visitante ADD CONSTRAINT FK_Asistir_Visitante_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Asistir_Visitante ADD CONSTRAINT FK_Asistir_Visitante_Visitante FOREIGN KEY (id_Visitante) REFERENCES Visitante(id_Visitante) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Asistir_Visitante ALTER COLUMN id_Evento SET NOT NULL;
ALTER TABLE Asistir_Visitante ALTER COLUMN id_Visitante SET NOT NULL;
ALTER TABLE Asistir_Visitante ALTER COLUMN Hora_Ingreso SET NOT NULL;
ALTER TABLE Asistir_Visitante ALTER COLUMN Hora_Salida SET NOT NULL;

-- Restricciones de cada columna
ALTER TABLE Asistir_Visitante ADD CONSTRAINT CHK_Asistir_Visitante_Horas CHECK (Hora_Salida > Hora_Ingreso);


/* ------------ TABLA ASISTIR_PARTICIPANTE ----------- */
CREATE TABLE Asistir_Participante(
    id_Evento INT,
    id_Individuo INT
);


-- Llaves Foraneas
ALTER TABLE Asistir_Participante ADD CONSTRAINT FK_Asistir_Participante_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Asistir_Participante ADD CONSTRAINT FK_Asistir_Participante_Registrador FOREIGN KEY (id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Asistir_Participante ALTER COLUMN id_Evento SET NOT NULL;
ALTER TABLE Asistir_Participante ALTER COLUMN id_Individuo SET NOT NULL;


/* ------------ TABLA COMPRAR_VISITANTE ----------- */
CREATE TABLE Comprar_Visitante(
    id_Visitante INT,
    id_Comida INT,
    id_Individuo INT,
    id_Evento INT,
    Cantidad INTEGER,
    Metodo_Pago VARCHAR(20)
);


-- Llaves Foraneas
ALTER TABLE Comprar_Visitante ADD CONSTRAINT FK_Comprar_Visitante_Visitante FOREIGN KEY (id_Visitante) REFERENCES Visitante(id_Visitante) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Comprar_Visitante ADD CONSTRAINT FK_Comprar_Visitante_Comida FOREIGN KEY (id_Comida) REFERENCES Comida(id_Comida) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Comprar_Visitante ADD CONSTRAINT FK_Comprar_Visitante_Vendedor FOREIGN KEY (id_Individuo) REFERENCES Vendedor(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Comprar_Visitante ADD CONSTRAINT FK_Comprar_Visitante_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Comprar_Visitante ALTER COLUMN id_Visitante SET NOT NULL;
ALTER TABLE Comprar_Visitante ALTER COLUMN id_Comida SET NOT NULL;
ALTER TABLE Comprar_Visitante ALTER COLUMN Cantidad SET NOT NULL;
ALTER TABLE Comprar_Visitante ALTER COLUMN Metodo_Pago SET NOT NULL;

-- Restricciones de cada columna
ALTER TABLE Comprar_Visitante ADD CONSTRAINT CHK_Comprar_CantidadMin CHECK (Cantidad >= 1);
ALTER TABLE Comprar_Visitante ADD CONSTRAINT CHK_Comprar_MetodoPago
  CHECK (
    LOWER(Metodo_Pago) IN (
      'efectivo',
      'paypal',
      'tarjeta'
    )
  );



/* ------------ TABLA COMPRAR_PARTICIPANTE ----------- */
CREATE TABLE Comprar_Participante(
    id_Individuo INT,
    id_Comida INT,
    id_Vendedor INT,
    id_Evento INT,
    Cantidad INTEGER,
    Metodo_Pago VARCHAR(20)
);


-- Llaves Foraneas
ALTER TABLE Comprar_Participante ADD CONSTRAINT FK_Comprar_Participante_Registrador FOREIGN KEY (id_Individuo) REFERENCES Registrador(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Comprar_Participante ADD CONSTRAINT FK_Comprar_Participante_Comida FOREIGN KEY (id_Comida) REFERENCES Comida(id_Comida) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Comprar_Participante ADD CONSTRAINT FK_Comprar_Participante_Vendedor FOREIGN KEY (id_Vendedor) REFERENCES Vendedor(id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Comprar_Participante ADD CONSTRAINT FK_Comprar_Participante_Evento FOREIGN KEY (id_Evento) REFERENCES Evento(id_Evento) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Comprar_Participante ALTER COLUMN id_Individuo SET NOT NULL;
ALTER TABLE Comprar_Participante ALTER COLUMN id_Comida SET NOT NULL;
ALTER TABLE Comprar_Participante ALTER COLUMN Cantidad SET NOT NULL;
ALTER TABLE Comprar_Participante ALTER COLUMN Metodo_Pago SET NOT NULL;

-- Restricciones de cada columna
ALTER TABLE Comprar_Participante ADD CONSTRAINT CHK_Comprar_Participante_CantidadMin CHECK (Cantidad >= 1);
ALTER TABLE Comprar_Participante ADD CONSTRAINT CHK_Comprar_Participante_MetodoPago
  CHECK (
    LOWER(Metodo_Pago) IN (
      'efectivo',
      'paypal',
      'tarjeta'
    )
  );


/* ------------ TABLA PARTICIPAR_PELEA ----------- */
CREATE TABLE Participar_Pelea(
    id_Pelea INT,
    id_Equipo INT,
    id_Individuo INT
);

-- LLaves Foraneas
ALTER TABLE Participar_Pelea ADD CONSTRAINT FK_Participar_Pelea_Pelea FOREIGN KEY (id_Pelea) REFERENCES Pelea(id_Pelea) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Participar_Pelea ADD CONSTRAINT FK_Participar_Pelea_EquipoPokemon FOREIGN KEY (id_Equipo, id_Individuo) REFERENCES Equipo_Pokemon (id_Equipo, id_Individuo) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restricciones de no nulo
ALTER TABLE Participar_Pelea ALTER COLUMN id_Pelea     SET NOT NULL;
ALTER TABLE Participar_Pelea ALTER COLUMN id_Equipo    SET NOT NULL;
ALTER TABLE Participar_Pelea ALTER COLUMN id_Individuo SET NOT NULL;

-- ============================================
-- COMENTARIOS POR TABLA, COLUMNA Y RESTRICCIONES
-- ============================================


/* ------------ TABLA CUIDADOR ----------- */
-- Tabla
COMMENT ON TABLE Cuidador IS 'Tabla de cuidadores asignado al evento';

-- Columnas
COMMENT ON COLUMN Cuidador.id_Individuo IS 'Identificador único del cuidador.';
COMMENT ON COLUMN Cuidador.Nombre IS 'Nombre del cuidador.';
COMMENT ON COLUMN Cuidador.Apellido_Paterno IS 'Apellido paterno del cuidador.';
COMMENT ON COLUMN Cuidador.Apellido_Materno IS 'Apellido materno del cuidador.';
COMMENT ON COLUMN Cuidador.Fecha_Nacimiento IS 'Fecha de nacimiento del cuidador.';
COMMENT ON COLUMN Cuidador.Sexo IS 'Sexo del cuidador: F, M o X.';
COMMENT ON COLUMN Cuidador.Ciudad IS 'Ciudad del domicilio del cuidador.';
COMMENT ON COLUMN Cuidador.Calle IS 'Calle del domicilio del cuidador.';
COMMENT ON COLUMN Cuidador.Colonia IS 'Colonia del domicilio del cuidador.';
COMMENT ON COLUMN Cuidador.Codigo_Postal IS 'Código postal (5 dígitos) del cuidador.';
COMMENT ON COLUMN Cuidador.No_Interior IS 'Número interior del domicilio (si aplica).';
COMMENT ON COLUMN Cuidador.No_Exterior IS 'Número exterior del domicilio (si aplica).';
COMMENT ON COLUMN Cuidador.Horario IS 'Horario laboral asignado (bloque de 6 horas).';
COMMENT ON COLUMN Cuidador.Locacion IS 'Locación asignada dentro del evento (sede).';
COMMENT ON COLUMN Cuidador.Salario IS 'Salario del cuidador.';
COMMENT ON CONSTRAINT PK_Cuidador ON Cuidador IS 'Llave primaria de Cuidador en id_Individuo.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Cuidador_Sexo ON Cuidador IS 'Valida que Sexo ∈ {F, M, X}.';
COMMENT ON CONSTRAINT CHK_Cuidador_CP ON Cuidador IS 'Valida formato de código postal mexicano de 5 dígitos.';
COMMENT ON CONSTRAINT CHK_Cuidador_Horario ON Cuidador IS 'Limita Horario a bloques predefinidos (9:00-15:00, 15:00-21:00).';
COMMENT ON CONSTRAINT CHK_Cuidador_Locacion ON Cuidador IS 'Limita Locacion a sedes permitidas (Entrada CU, Rectoría, Universum).';
COMMENT ON CONSTRAINT CHK_Cuidador_Salario ON Cuidador IS 'Exige salario no negativo.';


/* ------------ TABLA LIMPIADOR ----------- */
-- Tabla
COMMENT ON TABLE Limpiador IS 'Tabla de personal de limpieza asignado al evento.';

-- Columnas
COMMENT ON COLUMN Limpiador.id_Individuo IS 'Identificador único del limpiador.';
COMMENT ON COLUMN Limpiador.Nombre IS 'Nombre del limpiador.';
COMMENT ON COLUMN Limpiador.Apellido_Paterno IS 'Apellido paterno del limpiador.';
COMMENT ON COLUMN Limpiador.Apellido_Materno IS 'Apellido materno del limpiador.';
COMMENT ON COLUMN Limpiador.Fecha_Nacimiento IS 'Fecha de nacimiento del limpiador.';
COMMENT ON COLUMN Limpiador.Sexo IS 'Sexo del limpiador: F, M o X.';
COMMENT ON COLUMN Limpiador.Ciudad IS 'Ciudad de residencia del limpiador.';
COMMENT ON COLUMN Limpiador.Calle IS 'Calle del domicilio del limpiador.';
COMMENT ON COLUMN Limpiador.Colonia IS 'Colonia del domicilio del limpiador.';
COMMENT ON COLUMN Limpiador.Codigo_Postal IS 'Código postal (5 dígitos) del limpiador.';
COMMENT ON COLUMN Limpiador.No_Interior IS 'Número interior del domicilio (si aplica).';
COMMENT ON COLUMN Limpiador.No_Exterior IS 'Número exterior del domicilio (si aplica).';
COMMENT ON COLUMN Limpiador.Horario IS 'Horario laboral asignado (bloque de 6 horas).';
COMMENT ON COLUMN Limpiador.Locacion IS 'Locación asignada dentro del evento (sede).';
COMMENT ON COLUMN Limpiador.Salario IS 'Salario del limpiador.';
COMMENT ON CONSTRAINT PK_Limpiador ON Limpiador IS 'Llave primaria de Limpiador en id_Individuo.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Limpiador_Sexo ON Limpiador IS 'Valida que Sexo ∈ {F, M, X}.';
COMMENT ON CONSTRAINT CHK_Limpiador_CP ON Limpiador IS 'Valida formato de código postal mexicano de 5 dígitos.';
COMMENT ON CONSTRAINT CHK_Limpiador_Horario ON Limpiador IS 'Limita Horario a bloques predefinidos (9:00-15:00, 15:00-21:00).';
COMMENT ON CONSTRAINT CHK_Limpiador_Locacion ON Limpiador IS 'Limita Locacion a sedes permitidas (Entrada CU, Rectoría, Universum).';
COMMENT ON CONSTRAINT CHK_Limpiador_Salario ON Limpiador IS 'Exige salario no negativo.';


/* ------------ TABLA REGISTRADOR ----------- */
-- Tabla
COMMENT ON TABLE Registrador IS 'Tabla de registradores / participantes: personal que realiza inscripciones y/o puede ser un participante.';

-- Columnas
COMMENT ON COLUMN Registrador.id_Individuo IS 'Identificador único del registrador.';
COMMENT ON COLUMN Registrador.Nombre IS 'Nombre del registrador.';
COMMENT ON COLUMN Registrador.Apellido_Paterno IS 'Apellido paterno del registrador.';
COMMENT ON COLUMN Registrador.Apellido_Materno IS 'Apellido materno del registrador.';
COMMENT ON COLUMN Registrador.Fecha_Nacimiento IS 'Fecha de nacimiento del registrador.';
COMMENT ON COLUMN Registrador.Sexo IS 'Sexo del registrador: F, M o X.';
COMMENT ON COLUMN Registrador.Ciudad IS 'Ciudad de residencia del registrador.';
COMMENT ON COLUMN Registrador.Calle IS 'Calle del domicilio del registrador.';
COMMENT ON COLUMN Registrador.Colonia IS 'Colonia del domicilio del registrador.';
COMMENT ON COLUMN Registrador.Codigo_Postal IS 'Código postal (5 dígitos) del registrador.';
COMMENT ON COLUMN Registrador.No_Exterior IS 'Número exterior del domicilio (si aplica).';
COMMENT ON COLUMN Registrador.Salario IS 'Salario del registrador.';
COMMENT ON COLUMN Registrador.Facultad IS 'Facultad de procedencia (en caso de ser estudiante).';
COMMENT ON COLUMN Registrador.Carrera IS 'Carrera o programa académico (en caso de ser estudiante).';
COMMENT ON COLUMN Registrador.No_Cuenta IS 'Número de cuenta (9 dígitos) del estudiante.';
COMMENT ON COLUMN Registrador.esParticipante IS 'Indica si también es participante.';
COMMENT ON COLUMN Registrador.esPersonal IS 'Indica si pertenece al personal del evento.';
COMMENT ON CONSTRAINT PK_Registrador ON Registrador IS 'Llave primaria de Registrador en id_Individuo.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Registrador_Sexo ON Registrador IS 'Valida que Sexo ∈ {F, M, X}.';
COMMENT ON CONSTRAINT CHK_Registrador_CP ON Registrador IS 'Valida formato de código postal mexicano de 5 dígitos.';
COMMENT ON CONSTRAINT CHK_Registrador_Salario ON Registrador IS 'Exige salario no negativo.';


/* ------------ TABLA VENDEDOR ----------- */
-- Tabla
COMMENT ON TABLE Vendedor IS 'Tabla de vendedores: personal que realiza ventas durante el evento.';

-- Columnas
COMMENT ON COLUMN Vendedor.id_Individuo IS 'Identificador único del vendedor.';
COMMENT ON COLUMN Vendedor.Nombre IS 'Nombre del vendedor.';
COMMENT ON COLUMN Vendedor.Apellido_Paterno IS 'Apellido paterno del vendedor.';
COMMENT ON COLUMN Vendedor.Apellido_Materno IS 'Apellido materno del vendedor.';
COMMENT ON COLUMN Vendedor.Fecha_Nacimiento IS 'Fecha de nacimiento del vendedor.';
COMMENT ON COLUMN Vendedor.Sexo IS 'Sexo del vendedor: F, M o X.';
COMMENT ON COLUMN Vendedor.Ciudad IS 'Ciudad de residencia del vendedor.';
COMMENT ON COLUMN Vendedor.Calle IS 'Calle del domicilio del vendedor.';
COMMENT ON COLUMN Vendedor.Colonia IS 'Colonia del domicilio del vendedor.';
COMMENT ON COLUMN Vendedor.Codigo_Postal IS 'Código postal (5 dígitos) del vendedor.';
COMMENT ON COLUMN Vendedor.No_Interior IS 'Número interior del domicilio (si aplica).';
COMMENT ON COLUMN Vendedor.No_Exterior IS 'Número exterior del domicilio (si aplica).';
COMMENT ON COLUMN Vendedor.Horario IS 'Horario laboral asignado (bloque de 6 horas).';
COMMENT ON COLUMN Vendedor.Locacion IS 'Locación asignada dentro del evento (sede).';
COMMENT ON COLUMN Vendedor.Ganancia IS 'Ganancia del vendedor.';
COMMENT ON CONSTRAINT PK_Vendedor ON Vendedor IS 'Llave primaria de Vendedor en id_Individuo.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Vendedor_Sexo ON Vendedor IS 'Valida que Sexo ∈ {F, M, X}.';
COMMENT ON CONSTRAINT CHK_Vendedor_CP ON Vendedor IS 'Valida formato de código postal mexicano de 5 dígitos.';
COMMENT ON CONSTRAINT CHK_Vendedor_Horario ON Vendedor IS 'Limita Horario a bloques predefinidos (9:00-15:00, 15:00-21:00).';
COMMENT ON CONSTRAINT CHK_Vendedor_Locacion ON Vendedor IS 'Limita Locacion a sedes permitidas (Entrada CU, Rectoría, Universum).';
COMMENT ON CONSTRAINT CHK_Vendedor_Ganancia ON Vendedor IS 'Exige ganancia no negativa.';


/* ------------ TABLA CORREO_CUIDADOR ----------- */
-- Tabla
COMMENT ON TABLE Correo_Cuidador IS 'Correos electrónicos asociados a cuidadores (permite múltiples correos por persona).';

-- Columnas
COMMENT ON COLUMN Correo_Cuidador.id_Individuo IS 'FK al cuidador propietario del correo.';
COMMENT ON COLUMN Correo_Cuidador.Correo_Cuidador IS 'Dirección de correo del cuidador.';
COMMENT ON CONSTRAINT PK_Correo_Cuidador ON Correo_Cuidador IS 'Llave primaria compuesta (correo + cuidador).';
COMMENT ON CONSTRAINT FK_Correo_Cuidador ON Correo_Cuidador IS 'Llave foránea a Cuidador(id_Individuo).';



/* ------------ TABLA TELEFONO_CUIDADOR ----------- */
-- Tabla
COMMENT ON TABLE Telefono_Cuidador IS 'Teléfonos asociados a cuidadores (permite múltiples teléfonos por persona).';

-- Columnas
COMMENT ON COLUMN Telefono_Cuidador.id_Individuo IS 'FK al cuidador propietario del teléfono.';
COMMENT ON COLUMN Telefono_Cuidador.Telefono_Cuidador IS 'Número telefónico (10 dígitos) del cuidador.';
COMMENT ON CONSTRAINT PK_Telefono_Cuidador ON Telefono_Cuidador IS 'Llave primaria compuesta (teléfono + cuidador).';
COMMENT ON CONSTRAINT FK_Telefono_Cuidador ON Telefono_Cuidador IS 'Llave foránea a Cuidador(id_Individuo).';


/* ------------ TABLA CORREO_LIMPIADOR ----------- */
-- Tabla
COMMENT ON TABLE Correo_Limpiador IS 'Correos electrónicos asociados a personal de limpieza.';

-- Columnas
COMMENT ON COLUMN Correo_Limpiador.id_Individuo IS 'FK al limpiador propietario del correo.';
COMMENT ON COLUMN Correo_Limpiador.Correo_Limpiador IS 'Dirección de correo del limpiador.';
COMMENT ON CONSTRAINT PK_Correo_Limpiador ON Correo_Limpiador IS 'Llave primaria compuesta (correo + limpiador).';
COMMENT ON CONSTRAINT FK_Correo_Limpiador ON Correo_Limpiador IS 'Llave foránea a Limpiador(id_Individuo).';


/* ------------ TABLA TELEFONO_LIMPIADOR ----------- */
-- Tabla
COMMENT ON TABLE Telefono_Limpiador IS 'Teléfonos asociados a personal de limpieza.';

-- Columnas
COMMENT ON COLUMN Telefono_Limpiador.id_Individuo IS 'FK al limpiador propietario del teléfono.';
COMMENT ON COLUMN Telefono_Limpiador.Telefono_Limpiador IS 'Número telefónico (10 dígitos) del limpiador.';
COMMENT ON CONSTRAINT PK_Telefono_Limpiador ON Telefono_Limpiador IS 'Llave primaria compuesta (teléfono + limpiador).';
COMMENT ON CONSTRAINT FK_Telefono_Limpiador ON Telefono_Limpiador IS 'Llave foránea a Limpiador(id_Individuo).';

/* ------------ TABLA CORREO_REGISTRADOR ----------- */
-- Tabla
COMMENT ON TABLE Correo_Registrador IS 'Correos electrónicos asociados a registradores.';

-- Columnas
COMMENT ON COLUMN Correo_Registrador.id_Individuo IS 'FK al registrador propietario del correo.';
COMMENT ON COLUMN Correo_Registrador.Correo_Registrador IS 'Dirección de correo del registrador.';
COMMENT ON CONSTRAINT PK_Correo_Registrador ON Correo_Registrador IS 'Llave primaria compuesta (correo + registrador).';
COMMENT ON CONSTRAINT FK_Correo_Registrador ON Correo_Registrador IS 'Llave foránea a Registrador(id_Individuo).';

/* ------------ TABLA TELEFONO_REGISTRADOR ----------- */
-- Tabla
COMMENT ON TABLE Telefono_Registrador IS 'Teléfonos asociados a registradores.';

-- Columnas
COMMENT ON COLUMN Telefono_Registrador.id_Individuo IS 'FK al registrador propietario del teléfono.';
COMMENT ON COLUMN Telefono_Registrador.Telefono_Registrador IS 'Número telefónico (10 dígitos) del registrador.';
COMMENT ON CONSTRAINT PK_Telefono_Registrador ON Telefono_Registrador IS 'Llave primaria compuesta (teléfono + registrador).';
COMMENT ON CONSTRAINT FK_Telefono_Registrador ON Telefono_Registrador IS 'Llave foránea a Registrador(id_Individuo).';


/* ------------ TABLA CORREO_VENDEDOR ----------- */
-- Tabla
COMMENT ON TABLE Correo_Vendedor IS 'Correos electrónicos asociados a vendedores.';

-- Columnas
COMMENT ON COLUMN Correo_Vendedor.id_Individuo IS 'FK al vendedor propietario del correo.';
COMMENT ON COLUMN Correo_Vendedor.Correo_Vendedor IS 'Dirección de correo del vendedor.';
COMMENT ON CONSTRAINT PK_Correo_Vendedor ON Correo_Vendedor IS 'Llave primaria compuesta (correo + vendedor).';
COMMENT ON CONSTRAINT FK_Correo_Vendedor ON Correo_Vendedor IS 'Llave foránea a Vendedor(id_Individuo).';


/* ------------ TABLA TELEFONO_VENDEDOR ----------- */
-- Tabla
COMMENT ON TABLE Telefono_Vendedor IS 'Teléfonos asociados a vendedores.';

-- Columnas
COMMENT ON COLUMN Telefono_Vendedor.id_Individuo IS 'FK al vendedor propietario del teléfono.';
COMMENT ON COLUMN Telefono_Vendedor.Telefono_Vendedor IS 'Número telefónico (10 dígitos) del vendedor.';
COMMENT ON CONSTRAINT PK_Telefono_Vendedor ON Telefono_Vendedor IS 'Llave primaria compuesta (teléfono + vendedor).';
COMMENT ON CONSTRAINT FK_Telefono_Vendedor ON Telefono_Vendedor IS 'Llave foránea a Vendedor(id_Individuo).';


/* ------------ TABLA EVENTO ----------- */
-- Tabla
COMMENT ON TABLE Evento IS 'Catálogo de eventos/ediciones con su fecha de realización.';

-- Columnas
COMMENT ON COLUMN Evento.id_Evento IS 'Identificador único del evento.';
COMMENT ON COLUMN Evento.No_Edicion IS 'Número de edición del evento.';
COMMENT ON COLUMN Evento.Fecha IS 'Fecha en que se realizó el evento.';
COMMENT ON COLUMN Evento.Ganancia IS 'Ganancias acumuladas en cierta edicion de evento.';
COMMENT ON CONSTRAINT PK_Evento ON Evento IS 'Llave primaria de Evento en id_Evento.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Evento_Fecha ON Evento IS 'Restringe Fecha a no ser futura (≤ fecha actual).';


/* ------------ TABLA TRABAJA_CUIDADOR ----------- */
-- Tabla
COMMENT ON TABLE Trabaja_Cuidador IS 'Relación de asignación de cuidadores a eventos.';

-- Columnas
COMMENT ON COLUMN Trabaja_Cuidador.id_Individuo IS 'FK al cuidador asignado.';
COMMENT ON COLUMN Trabaja_Cuidador.id_Evento IS 'FK al evento donde trabaja.';
COMMENT ON CONSTRAINT FK_Trabaja_Cuidador_Cuidador ON Trabaja_Cuidador IS 'Llave foránea a Cuidador(id_Individuo).';
COMMENT ON CONSTRAINT FK_Trabaja_Cuidador_Evento ON Trabaja_Cuidador IS 'Llave foránea a Evento(id_Evento).';


/* ------------ TABLA TRABAJA_LIMPUADOR ----------- */
-- Tabla
COMMENT ON TABLE Trabaja_Limpiador IS 'Relación de asignación de personal de limpieza a eventos.';

-- Columnas
COMMENT ON COLUMN Trabaja_Limpiador.id_Individuo IS 'FK al limpiador asignado.';
COMMENT ON COLUMN Trabaja_Limpiador.id_Evento IS 'FK al evento donde trabaja.';
COMMENT ON CONSTRAINT FK_Trabaja_Limpiador_Limpiador ON Trabaja_Limpiador IS 'Llave foránea a Limpiador(id_Individuo).';
COMMENT ON CONSTRAINT FK_Trabaja_Limpiador_Evento ON Trabaja_Limpiador IS 'Llave foránea a Evento(id_Evento).';

/* ------------ TABLA TRABAJA_REGISTRADOR ----------- */
-- Tabla
COMMENT ON TABLE Trabaja_Registrador IS 'Relación de asignación de registradores a eventos.';

-- Columnas
COMMENT ON COLUMN Trabaja_Registrador.id_Individuo IS 'FK al registrador asignado.';
COMMENT ON COLUMN Trabaja_Registrador.id_Evento IS 'FK al evento donde trabaja.';
COMMENT ON CONSTRAINT FK_Trabaja_Registrador_Registrador ON Trabaja_Registrador IS 'Llave foránea a Registrador(id_Individuo).';
COMMENT ON CONSTRAINT FK_Trabaja_Registrador_Evento ON Trabaja_Registrador IS 'Llave foránea a Evento(id_Evento).';


/* ------------ TABLA TRABAJA_VENDEDOR ----------- */
-- Tabla
COMMENT ON TABLE Trabaja_Vendedor IS 'Relación de asignación de vendedores a eventos.';

-- Columnas
COMMENT ON COLUMN Trabaja_Vendedor.id_Individuo IS 'FK al vendedor asignado.';
COMMENT ON COLUMN Trabaja_Vendedor.id_Evento IS 'FK al evento donde trabaja.';
COMMENT ON CONSTRAINT FK_Trabaja_Vendedor_Vendedor ON Trabaja_Vendedor IS 'Llave foránea a Vendedor(id_Individuo).';
COMMENT ON CONSTRAINT FK_Trabaja_Vendedor_Evento ON Trabaja_Vendedor IS 'Llave foránea a Evento(id_Evento).';


/* ------------ TABLA TORNEO_SHINYS ----------- */
-- Tabla
COMMENT ON TABLE Torneo_Shinys IS 'Torneo de shinys asociado a un evento.';

-- Columnas
COMMENT ON COLUMN Torneo_Shinys.id_Torneo IS 'Identificador del torneo de shinys.';
COMMENT ON COLUMN Torneo_Shinys.id_Evento IS 'FK al evento al que pertenece el torneo.';
COMMENT ON COLUMN Torneo_Shinys.Premio IS 'Premio otorgado en el torneo (no negativo).';
COMMENT ON CONSTRAINT PK_Torneo_Shinys ON Torneo_Shinys IS 'Llave primaria del torneo de shinys en id_Torneo.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Shinys_Premio ON Torneo_Shinys IS 'Exige premio no negativo.';
COMMENT ON CONSTRAINT FK_Torneo_Shinys ON Torneo_Shinys IS 'Llave foránea a Evento(id_Evento).';


/* ------------ TABLA TORNEO_DISTANCIA ----------- */
-- Tabla
COMMENT ON TABLE Torneo_Distancia IS 'Torneo de distancia asociado a un evento.';

-- Columnas
COMMENT ON COLUMN Torneo_Distancia.id_Torneo IS 'Identificador del torneo de distancia.';
COMMENT ON COLUMN Torneo_Distancia.id_Evento IS 'FK al evento al que pertenece el torneo.';
COMMENT ON COLUMN Torneo_Distancia.Premio IS 'Premio otorgado en el torneo (no negativo).';
COMMENT ON CONSTRAINT PK_Torneo_Distancia ON Torneo_Distancia IS 'Llave primaria del torneo de distancia en id_Torneo.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Distancia_Premio ON Torneo_Distancia IS 'Exige premio no negativo.';
COMMENT ON CONSTRAINT FK_Torneo_Distancia ON Torneo_Distancia IS 'Llave foránea a Evento(id_Evento).';


/* ------------ TABLA TORNEO_PELEA ----------- */
-- Tabla
COMMENT ON TABLE Torneo_Pelea IS 'Torneo de pelea asociado a un evento.';

-- Columnas
COMMENT ON COLUMN Torneo_Pelea.id_Torneo IS 'Identificador del torneo de pelea.';
COMMENT ON COLUMN Torneo_Pelea.id_Evento IS 'FK al evento al que pertenece el torneo.';

-- Restricciones
COMMENT ON COLUMN Torneo_Pelea.Premio IS 'Premio otorgado en el torneo (no negativo).';
COMMENT ON CONSTRAINT PK_Torneo_Pelea ON Torneo_Pelea IS 'Llave primaria del torneo de pelea en id_Torneo.';
COMMENT ON CONSTRAINT CHK_Pelea_Premio ON Torneo_Pelea IS 'Exige premio no negativo.';
COMMENT ON CONSTRAINT FK_Torneo_Pelea ON Torneo_Pelea IS 'Llave foránea a Evento(id_Evento).';


/* ------------ TABLA INSCRIBIR_PARTICIPANTE ----------- */
-- Tabla
COMMENT ON TABLE Inscribir_Participante IS 'Relación que registra la inscripción de participantes a cargo de un registrador.';

-- Columnas
COMMENT ON COLUMN Inscribir_Participante.id_Registrador IS 'FK al registrador que realiza la inscripción.';
COMMENT ON COLUMN Inscribir_Participante.id_Participante IS 'FK al participante inscrito.';
COMMENT ON CONSTRAINT FK_Inscribir_Participante_Registrador ON Inscribir_Participante IS 'Llave foránea a Registrador(id_Individuo) para el registrador.';
COMMENT ON CONSTRAINT FK_Inscribir_Participante_Participante ON Inscribir_Participante IS 'Llave foránea al individuo que funge como participante (referencia a Registrador.id_Individuo).';



------------------------------------



/* ------------ TABLA EQUIPO_POKEMON ----------- */
-- Tabla
COMMENT ON TABLE Equipo_Pokemon IS 'Relación que vincula un equipo con su propietario (individuo).';

-- Columnas
COMMENT ON COLUMN Equipo_Pokemon.id_Equipo IS 'Identificador del equipo del participante.';
COMMENT ON COLUMN Equipo_Pokemon.id_Individuo IS 'Identificador del individuo propietario del equipo.';
COMMENT ON CONSTRAINT PK_Equipo_Pokemon ON Equipo_Pokemon IS 'Llave primaria compuesta (id_Equipo, id_Individuo).';



/* ------------ TABLA VISITANTE ----------- */
-- Tabla
COMMENT ON TABLE Visitante IS 'Catálogo de visitantes (asistentes no participantes).';

-- Columnas
COMMENT ON COLUMN Visitante.id_Visitante IS 'Identificador único del visitante.';
COMMENT ON COLUMN Visitante.Nombre IS 'Nombre del visitante.';
COMMENT ON COLUMN Visitante.Apellido_Paterno IS 'Apellido paterno del visitante.';
COMMENT ON COLUMN Visitante.Apellido_Materno IS 'Apellido materno del visitante.';
COMMENT ON COLUMN Visitante.Fecha_Nacimiento IS 'Fecha de nacimiento del visitante.';
COMMENT ON COLUMN Visitante.Sexo IS 'Sexo del visitante: M, F o X.';
COMMENT ON CONSTRAINT PK_Visitante ON Visitante IS 'Llave primaria en id_Visitante.';

-- Restricciones
COMMENT ON CONSTRAINT CHK_Visitante_Sexo ON Visitante IS 'Restringe Sexo a {M, F, X}.';
COMMENT ON CONSTRAINT CHK_EdadVisitante ON Visitante IS 'Valida edad máxima razonable (≤ 100 años).';



/* ------------ TABLA POKEMON ----------- */
-- Tabla
COMMENT ON TABLE Pokemon IS 'Pokémon registrados por equipo/individuo, con atributos de combate y clasificación.';

-- Columnas
COMMENT ON COLUMN Pokemon.id_Pokemon IS 'Identificador único del Pokémon.';
COMMENT ON COLUMN Pokemon.id_Equipo IS 'Equipo al que pertenece el Pokémon (parte de la FK compuesta).';
COMMENT ON COLUMN Pokemon.id_Individuo IS 'Propietario del equipo (parte de la FK compuesta).';
COMMENT ON COLUMN Pokemon.Nombre IS 'Nombre asignado al Pokémon.';
COMMENT ON COLUMN Pokemon.Peso IS 'Peso del Pokémon; debe ser > 0.';
COMMENT ON COLUMN Pokemon.Sexo IS 'Sexo del Pokémon: M o F.';
COMMENT ON COLUMN Pokemon.Puntos_Combate IS 'Puntos de combate (CP); valor no negativo.';
COMMENT ON COLUMN Pokemon.Shiny IS 'Indica si el Pokémon es shiny (DEFAULT FALSE).';
COMMENT ON COLUMN Pokemon.Tipo IS 'Tipo elemental principal (p. ej., Agua, Fuego).';
COMMENT ON COLUMN Pokemon.Especie IS 'Especie del Pokémon (p. ej., Pikachu).';
COMMENT ON CONSTRAINT PK_Pokemon ON Pokemon IS 'Llave primaria en id_Pokemon.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Pokemon_EquipoPokemon ON Pokemon IS 'Llave foránea compuesta a Equipo_Pokemon(id_Equipo, id_Individuo).';
COMMENT ON CONSTRAINT CHK_SexoPokemon ON Pokemon IS 'Restringe Sexo a {M, F}.';
COMMENT ON CONSTRAINT CHK_PesoPositivo ON Pokemon IS 'Exige peso estrictamente positivo (> 0).';
COMMENT ON CONSTRAINT CHK_PuntosCombate ON Pokemon IS 'Exige CP no negativos (≥ 0).';



/* ------------ TABLA CAPTURA ----------- */
-- Tabla
COMMENT ON TABLE Captura IS 'Registro de capturas en el torneo de shinys (quién, qué, cuándo).';

-- Columnas
COMMENT ON COLUMN Captura.id_Captura IS 'Identificador único de la captura.';
COMMENT ON COLUMN Captura.id_Torneo IS 'Torneo de shinys al que pertenece la captura.';
COMMENT ON COLUMN Captura.id_Individuo IS 'Individuo que registra/realiza la captura.';
COMMENT ON COLUMN Captura.id_Pokemon IS 'Pokémon capturado.';
COMMENT ON COLUMN Captura.Hora IS 'Hora exacta de la captura.';
COMMENT ON COLUMN Captura.Fecha IS 'Fecha de la captura.';
COMMENT ON CONSTRAINT PK_Captura ON Captura IS 'Llave primaria en id_Captura.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Captura_Torneo_Shinys ON Captura IS 'Llave foránea a Torneo_Shinys(id_Torneo).';
COMMENT ON CONSTRAINT FK_Captura_Individuo ON Captura IS 'Llave foránea a Registrador(id_Individuo).';
COMMENT ON CONSTRAINT FK_Captura_Pokemon ON Captura IS 'Llave foránea a Pokemon(id_Pokemon).';
COMMENT ON CONSTRAINT UQ_Captura_Evento ON Captura IS 'Único por (id_Torneo, id_Individuo, id_Pokemon, Fecha, Hora); evita duplicados exactos.';



/* ------------ TABLA DISTANCIA_RECORRIDA ----------- */
-- Tabla
COMMENT ON TABLE Distancia_Recorrida IS 'Checkpoints alcanzados por participantes en el torneo de distancia.';

-- Columnas
COMMENT ON COLUMN Distancia_Recorrida.id_Distancia IS 'Identificador del registro de distancia/checkpoint.';
COMMENT ON COLUMN Distancia_Recorrida.id_Torneo IS 'Torneo de distancia relacionado.';
COMMENT ON COLUMN Distancia_Recorrida.id_Individuo IS 'Individuo (participante) que reporta el checkpoint.';
COMMENT ON COLUMN Distancia_Recorrida.Hora IS 'Hora en que se alcanzó el checkpoint.';
COMMENT ON COLUMN Distancia_Recorrida.Checkpoint IS 'Punto de control alcanzado.';
COMMENT ON CONSTRAINT PK_Distancia_Recorrida ON Distancia_Recorrida IS 'Llave primaria en id_Distancia.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Distancia_Recorrida_Torneo_Distancia ON Distancia_Recorrida IS 'Llave foránea a Torneo_Distancia(id_Torneo).';
COMMENT ON CONSTRAINT FK_Distancia_Recorrida_Individuo ON Distancia_Recorrida IS 'Llave foránea a Registrador(id_Individuo).';
COMMENT ON CONSTRAINT CHK_Distancia_CheckpointValido ON Distancia_Recorrida IS 'Restringe Checkpoint a {Entrada CU, Rectoría, Universum}.';



/* ------------ TABLA PELEA ----------- */
-- Tabla
COMMENT ON TABLE Pelea IS 'Enfrentamientos del torneo de pelea por fases, con ganador y perdedor.';

-- Columnas
COMMENT ON COLUMN Pelea.id_Pelea IS 'Identificador único de la pelea.';
COMMENT ON COLUMN Pelea.id_Torneo IS 'Torneo de pelea al que pertenece.';
COMMENT ON COLUMN Pelea.Fase IS 'Fase del torneo (p. ej., Semifinal, Final).';
COMMENT ON COLUMN Pelea.Ganador IS 'Equipo/competidor ganador (texto identificador).';
COMMENT ON COLUMN Pelea.Perdedor IS 'Equipo/competidor perdedor (texto identificador).';
COMMENT ON CONSTRAINT PK_Pelea ON Pelea IS 'Llave primaria en id_Pelea.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Pelea_Torneo_Pelea ON Pelea IS 'Llave foránea a Torneo_Pelea(id_Torneo).';
COMMENT ON CONSTRAINT CHK_Pelea_GanadorPerdedor ON Pelea IS 'Garantiza que Ganador y Perdedor sean distintos.';



/* ------------ TABLA COMIDA ----------- */
-- Tabla
COMMENT ON TABLE Comida IS 'Productos de comida vendidos por vendedores durante un evento.';

-- Columnas
COMMENT ON COLUMN Comida.id_Comida IS 'Identificador único del producto de comida.';
COMMENT ON COLUMN Comida.id_Individuo IS 'Vendedor que ofrece el producto (parte de la FK compuesta).';
COMMENT ON COLUMN Comida.Tipo_Alimento IS 'Categoría del alimento (p. ej., bebida, snack).';
COMMENT ON COLUMN Comida.Precio_sinIVA IS 'Precio antes de IVA; no negativo.';
COMMENT ON COLUMN Comida.Nombre IS 'Nombre comercial del producto.';
COMMENT ON COLUMN Comida.Fecha_Caducidad IS 'Fecha de caducidad (obligatoria si es perecedero).';
COMMENT ON COLUMN Comida.esPerecedero IS 'TRUE si requiere caducidad; FALSE en caso contrario.';
COMMENT ON CONSTRAINT PK_Comida ON Comida IS 'Llave primaria en id_Comida.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Comida_Vendedor ON Comida IS 'Llave foránea a Vendedor(id_Individuo).';
COMMENT ON CONSTRAINT CHK_Comida_PrecioPositivo ON Comida IS 'Exige precio sin IVA ≥ 0.';
COMMENT ON CONSTRAINT CHK_Comida_FechaCaducidad_Condicional ON Comida IS 'Si es perecedero: caducidad no pasada; si no es perecedero: caducidad NULL.';



/* ------------ TABLA CUENTA_POKEMONGO ----------- */
-- Tabla
COMMENT ON TABLE Cuenta_PokemonGO IS 'Cuentas de Pokémon GO asociadas a individuos/participantes.';

-- Columnas
COMMENT ON COLUMN Cuenta_PokemonGO.Codigo_Entrenador IS 'Código/ID de entrenador en Pokémon GO (PK).';
COMMENT ON COLUMN Cuenta_PokemonGO.id_Individuo IS 'Individuo dueño de la cuenta (FK).';
COMMENT ON COLUMN Cuenta_PokemonGO.Equipo IS 'Equipo: sabiduría, instinto o valor (case-insensitive).';
COMMENT ON COLUMN Cuenta_PokemonGO.Username IS 'Nombre de usuario en Pokémon GO (único).';
COMMENT ON COLUMN Cuenta_PokemonGO.Nivel_Entrenador IS 'Nivel actual del entrenador.';
COMMENT ON CONSTRAINT PK_Cuenta_PokemonGO ON Cuenta_PokemonGO IS 'Llave primaria en Codigo_Entrenador.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Cuenta_PokemonGO_Registrador ON Cuenta_PokemonGO IS 'Llave foránea a Registrador(id_Individuo).';
COMMENT ON CONSTRAINT CHK_Cuenta_EquipoValido ON Cuenta_PokemonGO IS 'Restringe Equipo a {sabiduria, instinto, valor}.';
COMMENT ON CONSTRAINT UQ_Cuenta_Username ON Cuenta_PokemonGO IS 'Garantiza Username único en el sistema.';



/* ------------ TABLA ASISTIR_VISITANTE ----------- */
-- Tabla
COMMENT ON TABLE Asistir_Visitante IS 'Asistencias de visitantes a eventos con horarios de entrada y salida.';

-- Columnas
COMMENT ON COLUMN Asistir_Visitante.id_Evento IS 'Evento al que asiste el visitante.';
COMMENT ON COLUMN Asistir_Visitante.id_Visitante IS 'Visitante que asiste al evento.';
COMMENT ON COLUMN Asistir_Visitante.Hora_Ingreso IS 'Hora de ingreso del visitante.';
COMMENT ON COLUMN Asistir_Visitante.Hora_Salida IS 'Hora de salida del visitante.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Asistir_Visitante_Evento ON Asistir_Visitante IS 'Llave foránea a Evento(id_Evento).';
COMMENT ON CONSTRAINT FK_Asistir_Visitante_Visitante ON Asistir_Visitante IS 'Llave foránea a Visitante(id_Visitante).';
COMMENT ON CONSTRAINT CHK_Asistir_Visitante_Horas ON Asistir_Visitante IS 'Hora_Salida debe ser posterior a Hora_Ingreso.';



/* ------------ TABLA ASISTIR_PARTICIPANTE ----------- */
-- Tabla
COMMENT ON TABLE Asistir_Participante IS 'Asistencias de participantes (individuos) a eventos.';

-- Columnas
COMMENT ON COLUMN Asistir_Participante.id_Evento IS 'Evento al que asiste el participante.';
COMMENT ON COLUMN Asistir_Participante.id_Individuo IS 'Participante (registrador) que asiste al evento.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Asistir_Participante_Evento ON Asistir_Participante IS 'Llave foránea a Evento(id_Evento).';
COMMENT ON CONSTRAINT FK_Asistir_Participante_Registrador ON Asistir_Participante IS 'Llave foránea a Registrador(id_Individuo).';



/* ------------ TABLA COMPRAR_VISITANTE ----------- */
-- Tabla
COMMENT ON TABLE Comprar_Visitante IS 'Compras de comida realizadas por visitantes.';

-- Columnas
COMMENT ON COLUMN Comprar_Visitante.id_Visitante IS 'Visitante que realiza la compra.';
COMMENT ON COLUMN Comprar_Visitante.id_Comida IS 'Producto de comida adquirido.';
COMMENT ON COLUMN Comprar_Visitante.Cantidad IS 'Cantidad de unidades compradas (≥ 1).';
COMMENT ON COLUMN Comprar_Visitante.Metodo_Pago IS 'Método de pago: efectivo, paypal o tarjeta.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Comprar_Visitante_Visitante ON Comprar_Visitante IS 'Llave foránea a Visitante(id_Visitante).';
COMMENT ON CONSTRAINT FK_Comprar_Visitante_Comida ON Comprar_Visitante IS 'Llave foránea a Comida(id_Comida).';
COMMENT ON CONSTRAINT CHK_Comprar_CantidadMin ON Comprar_Visitante IS 'Exige cantidad mínima de 1.';
COMMENT ON CONSTRAINT CHK_Comprar_MetodoPago ON Comprar_Visitante IS 'Restringe método de pago a {efectivo, paypal, tarjeta}.';



/* ------------ TABLA COMPRAR_PARTICIPANTE ----------- */
-- Tabla
COMMENT ON TABLE Comprar_Participante IS 'Compras de comida realizadas por participantes.';

-- Columnas
COMMENT ON COLUMN Comprar_Participante.id_Individuo IS 'Participante que realiza la compra.';
COMMENT ON COLUMN Comprar_Participante.id_Comida IS 'Producto de comida adquirido.';
COMMENT ON COLUMN Comprar_Participante.Cantidad IS 'Cantidad de unidades compradas (≥ 1).';
COMMENT ON COLUMN Comprar_Participante.Metodo_Pago IS 'Método de pago: efectivo, paypal o tarjeta.';

-- Restricciones
COMMENT ON CONSTRAINT FK_Comprar_Participante_Registrador ON Comprar_Participante IS 'Llave foránea a Registrador(id_Individuo).';
COMMENT ON CONSTRAINT FK_Comprar_Participante_Comida ON Comprar_Participante IS 'Llave foránea a Comida(id_Comida).';
COMMENT ON CONSTRAINT CHK_Comprar_Participante_CantidadMin ON Comprar_Participante IS 'Exige cantidad mínima de 1.';
COMMENT ON CONSTRAINT CHK_Comprar_Participante_MetodoPago ON Comprar_Participante IS 'Restringe método de pago a {efectivo, paypal, tarjeta}.';



/* ------------ TABLA PARTICIPAR_PELEA ----------- */
-- Tabla
COMMENT ON TABLE Participar_Pelea IS 'Participación de equipos Pokemon (por individuo) en una pelea específica del torneo.';

-- Columnas
COMMENT ON COLUMN Participar_Pelea.id_Pelea IS 'Pelea en la que participa el equipo.';
COMMENT ON COLUMN Participar_Pelea.id_Equipo IS 'Equipo participante (parte de la FK compuesta).';
COMMENT ON COLUMN Participar_Pelea.id_Individuo IS 'Propietario del equipo (parte de la FK compuesta).';

-- Restricciones
COMMENT ON CONSTRAINT FK_Participar_Pelea_Pelea ON Participar_Pelea IS 'Llave foránea a Pelea(id_Pelea).';
COMMENT ON CONSTRAINT FK_Participar_Pelea_EquipoPokemon ON Participar_Pelea IS 'Llave foránea compuesta a Equipo_Pokemon(id_Equipo, id_Individuo).';


COMMENT ON CONSTRAINT FK_Equipo_Pokemon_Registrador ON Equipo_Pokemon IS 'Llave foranea a Registrador(idIndividuo)';


