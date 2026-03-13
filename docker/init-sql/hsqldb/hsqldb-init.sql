-- ============================================================
-- HogwartsApp - HSQLDB Init Script (SLYTHERIN)
-- Se ejecuta con SqlTool antes de arrancar el servidor
-- Solo contiene los alumnos de la casa Slytherin
-- ============================================================

CREATE TABLE IF NOT EXISTS alumnos (
    id        VARCHAR(12)  PRIMARY KEY,
    nombre    VARCHAR(100),
    apellidos VARCHAR(100),
    curso     INT,
    casa      VARCHAR(50),
    patronus  VARCHAR(100)
);

-- Alumnos de Slytherin
INSERT INTO alumnos VALUES ('SLY-1a2b3c4d', 'Draco',    'Malfoy',      5, 'Slytherin', 'Dragón');
INSERT INTO alumnos VALUES ('SLY-5e6f7a8b', 'Pansy',    'Parkinson',   5, 'Slytherin', 'Gato');
INSERT INTO alumnos VALUES ('SLY-9c0d1e2f', 'Blaise',   'Zabini',      5, 'Slytherin', 'Serpiente');
INSERT INTO alumnos VALUES ('SLY-3a4b5c6d', 'Theodore', 'Nott',        5, 'Slytherin', 'Búho');
INSERT INTO alumnos VALUES ('SLY-7e8f9a0b', 'Daphne',   'Greengrass',  5, 'Slytherin', 'Leopardo');

COMMIT;