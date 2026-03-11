-- ============================================================
-- HogwartsApp - HSQLDB Init Script
-- Se ejecuta con SqlTool antes de arrancar el servidor
-- Para desactivar la precarga de datos, elimina los bloques INSERT
-- ============================================================

CREATE TABLE IF NOT EXISTS alumnos (
    id        VARCHAR(12)  PRIMARY KEY,
    nombre    VARCHAR(100),
    apellidos VARCHAR(100),
    curso     INT,
    casa      VARCHAR(50),
    patronus  VARCHAR(100)
);

-- Datos precargados (eliminar si no se quieren datos iniciales)
INSERT INTO alumnos VALUES ('GRY-a1b2c3d4', 'Harry',    'Potter',           5, 'Gryffindor', 'Ciervo');
INSERT INTO alumnos VALUES ('GRY-e5f6a7b8', 'Hermione', 'Granger',          5, 'Gryffindor', 'Nutria');
INSERT INTO alumnos VALUES ('GRY-c9d0e1f2', 'Ron',      'Weasley',          5, 'Gryffindor', 'Jack Russell Terrier');
INSERT INTO alumnos VALUES ('GRY-a3b4c5d6', 'Neville',  'Longbottom',       5, 'Gryffindor', 'León');
INSERT INTO alumnos VALUES ('GRY-e7f8a9b0', 'Ginny',    'Weasley',          4, 'Gryffindor', 'Caballo');
INSERT INTO alumnos VALUES ('GRY-da9f48a3', 'George',   'Weasley',          6, 'Gryffindor', 'Hiena');
INSERT INTO alumnos VALUES ('GRY-e0898ae5', 'Fred',     'Weasley',          6, 'Gryffindor', 'Hiena');
INSERT INTO alumnos VALUES ('GRY-e8b77614', 'Minerva',  'McGonagall',       7, 'Gryffindor', 'Gato');
INSERT INTO alumnos VALUES ('SLY-1a2b3c4d', 'Draco',    'Malfoy',           5, 'Slytherin',  'Dragón');
INSERT INTO alumnos VALUES ('SLY-5e6f7a8b', 'Pansy',    'Parkinson',        5, 'Slytherin',  'Gato');
INSERT INTO alumnos VALUES ('SLY-9c0d1e2f', 'Blaise',   'Zabini',           5, 'Slytherin',  'Serpiente');
INSERT INTO alumnos VALUES ('SLY-3a4b5c6d', 'Theodore', 'Nott',             5, 'Slytherin',  'Búho');
INSERT INTO alumnos VALUES ('SLY-7e8f9a0b', 'Daphne',   'Greengrass',       5, 'Slytherin',  'Leopardo');
INSERT INTO alumnos VALUES ('RAV-6f7a8b9c', 'Cho',      'Chang',            6, 'Ravenclaw',  'Cisne');
INSERT INTO alumnos VALUES ('RAV-8f9a0b1c', 'Michael',  'Corner',           5, 'Ravenclaw',  'Halcón');
INSERT INTO alumnos VALUES ('HUF-3c4d5e6f', 'Cedric',   'Diggory',          7, 'Hufflepuff', 'Labrador');
INSERT INTO alumnos VALUES ('HUF-7a8b9c0d', 'Hannah',   'Abbott',           5, 'Hufflepuff', 'Conejo');
INSERT INTO alumnos VALUES ('HUF-1e2f3a4b', 'Susan',    'Bones',            5, 'Hufflepuff', 'Zorro');
INSERT INTO alumnos VALUES ('HUF-5c6d7e8f', 'Ernie',    'Macmillan',        5, 'Hufflepuff', 'Jabalí');
INSERT INTO alumnos VALUES ('HUF-9a0b1c2d', 'Justin',   'Finch-Fletchley',  5, 'Hufflepuff', 'Tejón');

COMMIT;