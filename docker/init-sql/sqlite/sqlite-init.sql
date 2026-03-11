-- ============================================================
-- HogwartsApp - SQLite Init Script
-- Se ejecuta con sqlite3 CLI en el servicio de init
-- Para desactivar la precarga de datos, elimina los bloques INSERT
-- ============================================================

CREATE TABLE IF NOT EXISTS alumnos (
    id        TEXT PRIMARY KEY,
    nombre    TEXT,
    apellidos TEXT,
    curso     INTEGER,
    casa      TEXT,
    patronus  TEXT
);

-- Datos precargados (eliminar si no se quieren datos iniciales)
INSERT OR IGNORE INTO alumnos VALUES ('GRY-a1b2c3d4', 'Harry',    'Potter',           5, 'Gryffindor', 'Ciervo');
INSERT OR IGNORE INTO alumnos VALUES ('GRY-e5f6a7b8', 'Hermione', 'Granger',          5, 'Gryffindor', 'Nutria');
INSERT OR IGNORE INTO alumnos VALUES ('GRY-c9d0e1f2', 'Ron',      'Weasley',          5, 'Gryffindor', 'Jack Russell Terrier');
INSERT OR IGNORE INTO alumnos VALUES ('GRY-a3b4c5d6', 'Neville',  'Longbottom',       5, 'Gryffindor', 'León');
INSERT OR IGNORE INTO alumnos VALUES ('GRY-e7f8a9b0', 'Ginny',    'Weasley',          4, 'Gryffindor', 'Caballo');
INSERT OR IGNORE INTO alumnos VALUES ('GRY-da9f48a3', 'George',   'Weasley',          6, 'Gryffindor', 'Hiena');
INSERT OR IGNORE INTO alumnos VALUES ('GRY-e0898ae5', 'Fred',     'Weasley',          6, 'Gryffindor', 'Hiena');
INSERT OR IGNORE INTO alumnos VALUES ('GRY-e8b77614', 'Minerva',  'McGonagall',       7, 'Gryffindor', 'Gato');
INSERT OR IGNORE INTO alumnos VALUES ('SLY-1a2b3c4d', 'Draco',    'Malfoy',           5, 'Slytherin',  'Dragón');
INSERT OR IGNORE INTO alumnos VALUES ('SLY-5e6f7a8b', 'Pansy',    'Parkinson',        5, 'Slytherin',  'Gato');
INSERT OR IGNORE INTO alumnos VALUES ('SLY-9c0d1e2f', 'Blaise',   'Zabini',           5, 'Slytherin',  'Serpiente');
INSERT OR IGNORE INTO alumnos VALUES ('SLY-3a4b5c6d', 'Theodore', 'Nott',             5, 'Slytherin',  'Búho');
INSERT OR IGNORE INTO alumnos VALUES ('SLY-7e8f9a0b', 'Daphne',   'Greengrass',       5, 'Slytherin',  'Leopardo');
INSERT OR IGNORE INTO alumnos VALUES ('RAV-6f7a8b9c', 'Cho',      'Chang',            6, 'Ravenclaw',  'Cisne');
INSERT OR IGNORE INTO alumnos VALUES ('RAV-8f9a0b1c', 'Michael',  'Corner',           5, 'Ravenclaw',  'Halcón');
INSERT OR IGNORE INTO alumnos VALUES ('HUF-3c4d5e6f', 'Cedric',   'Diggory',          7, 'Hufflepuff', 'Labrador');
INSERT OR IGNORE INTO alumnos VALUES ('HUF-7a8b9c0d', 'Hannah',   'Abbott',           5, 'Hufflepuff', 'Conejo');
INSERT OR IGNORE INTO alumnos VALUES ('HUF-1e2f3a4b', 'Susan',    'Bones',            5, 'Hufflepuff', 'Zorro');
INSERT OR IGNORE INTO alumnos VALUES ('HUF-5c6d7e8f', 'Ernie',    'Macmillan',        5, 'Hufflepuff', 'Jabalí');
INSERT OR IGNORE INTO alumnos VALUES ('HUF-9a0b1c2d', 'Justin',   'Finch-Fletchley',  5, 'Hufflepuff', 'Tejón');