-- ============================================================
-- HogwartsApp - MariaDB Init Script
-- Crea todas las bases de datos de casas + master hogwarts
-- Para desactivar la precarga de datos, elimina los bloques INSERT
-- ============================================================

-- Crear bases de datos
CREATE DATABASE IF NOT EXISTS gryffindor CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS slytherin  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS ravenclaw  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS hufflepuff CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS hogwarts   CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Dar acceso al usuario admin a todas las bases de datos
GRANT ALL PRIVILEGES ON gryffindor.* TO 'admin'@'%';
GRANT ALL PRIVILEGES ON slytherin.*  TO 'admin'@'%';
GRANT ALL PRIVILEGES ON ravenclaw.*  TO 'admin'@'%';
GRANT ALL PRIVILEGES ON hufflepuff.* TO 'admin'@'%';
GRANT ALL PRIVILEGES ON hogwarts.*   TO 'admin'@'%';
FLUSH PRIVILEGES;

-- ============================================================
-- GRYFFINDOR
-- ============================================================
USE gryffindor;

CREATE TABLE IF NOT EXISTS alumnos (
    id       VARCHAR(12)  PRIMARY KEY,
    nombre   VARCHAR(100),
    apellidos VARCHAR(100),
    curso    INT,
    casa     VARCHAR(50),
    patronus VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO alumnos (id, nombre, apellidos, curso, casa, patronus) VALUES
('GRY-a1b2c3d4', 'Harry',    'Potter',     5, 'Gryffindor', 'Ciervo'),
('GRY-e5f6a7b8', 'Hermione', 'Granger',    5, 'Gryffindor', 'Nutria'),
('GRY-c9d0e1f2', 'Ron',      'Weasley',    5, 'Gryffindor', 'Jack Russell Terrier'),
('GRY-a3b4c5d6', 'Neville',  'Longbottom', 5, 'Gryffindor', 'León'),
('GRY-e7f8a9b0', 'Ginny',    'Weasley',    4, 'Gryffindor', 'Caballo');

-- ============================================================
-- SLYTHERIN
-- ============================================================
USE slytherin;

CREATE TABLE IF NOT EXISTS alumnos (
    id       VARCHAR(12)  PRIMARY KEY,
    nombre   VARCHAR(100),
    apellidos VARCHAR(100),
    curso    INT,
    casa     VARCHAR(50),
    patronus VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO alumnos (id, nombre, apellidos, curso, casa, patronus) VALUES
('SLY-1a2b3c4d', 'Draco',    'Malfoy',     5, 'Slytherin', 'Dragón'),
('SLY-5e6f7a8b', 'Pansy',    'Parkinson',  5, 'Slytherin', 'Gato'),
('SLY-9c0d1e2f', 'Blaise',   'Zabini',     5, 'Slytherin', 'Serpiente'),
('SLY-3a4b5c6d', 'Theodore', 'Nott',       5, 'Slytherin', 'Búho'),
('SLY-7e8f9a0b', 'Daphne',   'Greengrass', 5, 'Slytherin', 'Leopardo');

-- ============================================================
-- RAVENCLAW
-- ============================================================
USE ravenclaw;

CREATE TABLE IF NOT EXISTS alumnos (
    id       VARCHAR(12)  PRIMARY KEY,
    nombre   VARCHAR(100),
    apellidos VARCHAR(100),
    curso    INT,
    casa     VARCHAR(50),
    patronus VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO alumnos (id, nombre, apellidos, curso, casa, patronus) VALUES
('RAV-2b3c4d5e', 'Luna',    'Lovegood', 4, 'Ravenclaw', 'Liebre'),
('RAV-6f7a8b9c', 'Cho',     'Chang',    6, 'Ravenclaw', 'Cisne'),
('RAV-0d1e2f3a', 'Padma',   'Patil',    5, 'Ravenclaw', 'Gato persa'),
('RAV-4b5c6d7e', 'Terry',   'Boot',     5, 'Ravenclaw', 'Águila'),
('RAV-8f9a0b1c', 'Michael', 'Corner',   5, 'Ravenclaw', 'Halcón');

-- ============================================================
-- HUFFLEPUFF
-- ============================================================
USE hufflepuff;

CREATE TABLE IF NOT EXISTS alumnos (
    id       VARCHAR(12)  PRIMARY KEY,
    nombre   VARCHAR(100),
    apellidos VARCHAR(100),
    curso    INT,
    casa     VARCHAR(50),
    patronus VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO alumnos (id, nombre, apellidos, curso, casa, patronus) VALUES
('HUF-3c4d5e6f', 'Cedric',  'Diggory',          7, 'Hufflepuff', 'Labrador'),
('HUF-7a8b9c0d', 'Hannah',  'Abbott',            5, 'Hufflepuff', 'Conejo'),
('HUF-1e2f3a4b', 'Susan',   'Bones',             5, 'Hufflepuff', 'Zorro'),
('HUF-5c6d7e8f', 'Ernie',   'Macmillan',         5, 'Hufflepuff', 'Jabalí'),
('HUF-9a0b1c2d', 'Justin',  'Finch-Fletchley',   5, 'Hufflepuff', 'Tejón');

-- ============================================================
-- HOGWARTS (base de datos maestra / consolidada)
-- ============================================================
USE hogwarts;

CREATE TABLE IF NOT EXISTS alumnos (
    id       VARCHAR(12)  PRIMARY KEY,
    nombre   VARCHAR(100),
    apellidos VARCHAR(100),
    curso    INT,
    casa     VARCHAR(50),
    patronus VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO alumnos (id, nombre, apellidos, curso, casa, patronus) VALUES
('GRY-a1b2c3d4', 'Harry',    'Potter',           5, 'Gryffindor', 'Ciervo'),
('GRY-e5f6a7b8', 'Hermione', 'Granger',          5, 'Gryffindor', 'Nutria'),
('GRY-c9d0e1f2', 'Ron',      'Weasley',          5, 'Gryffindor', 'Jack Russell Terrier'),
('GRY-a3b4c5d6', 'Neville',  'Longbottom',       5, 'Gryffindor', 'León'),
('GRY-e7f8a9b0', 'Ginny',    'Weasley',          4, 'Gryffindor', 'Caballo'),
('GRY-da9f48a3', 'George',   'Weasley',          6, 'Gryffindor', 'Hiena'),
('GRY-e0898ae5', 'Fred',     'Weasley',          6, 'Gryffindor', 'Hiena'),
('GRY-e8b77614', 'Minerva',  'McGonagall',       7, 'Gryffindor', 'Gato'),
('SLY-1a2b3c4d', 'Draco',    'Malfoy',           5, 'Slytherin',  'Dragón'),
('SLY-5e6f7a8b', 'Pansy',    'Parkinson',        5, 'Slytherin',  'Gato'),
('SLY-9c0d1e2f', 'Blaise',   'Zabini',           5, 'Slytherin',  'Serpiente'),
('SLY-3a4b5c6d', 'Theodore', 'Nott',             5, 'Slytherin',  'Búho'),
('SLY-7e8f9a0b', 'Daphne',   'Greengrass',       5, 'Slytherin',  'Leopardo'),
('RAV-6f7a8b9c', 'Cho',      'Chang',            6, 'Ravenclaw',  'Cisne'),
('RAV-8f9a0b1c', 'Michael',  'Corner',           5, 'Ravenclaw',  'Halcón'),
('HUF-3c4d5e6f', 'Cedric',   'Diggory',          7, 'Hufflepuff', 'Labrador'),
('HUF-7a8b9c0d', 'Hannah',   'Abbott',           5, 'Hufflepuff', 'Conejo'),
('HUF-1e2f3a4b', 'Susan',    'Bones',            5, 'Hufflepuff', 'Zorro'),
('HUF-5c6d7e8f', 'Ernie',    'Macmillan',        5, 'Hufflepuff', 'Jabalí'),
('HUF-9a0b1c2d', 'Justin',   'Finch-Fletchley',  5, 'Hufflepuff', 'Tejón');