-- ============================================================
-- HogwartsApp - H2 Database Init Script (HUFFLEPUFF)
-- Se ejecuta en modo embedded antes de arrancar el servidor TCP
-- Solo contiene los alumnos de la casa Hufflepuff
-- ============================================================

CREATE TABLE IF NOT EXISTS alumnos (
    id        VARCHAR(12)  PRIMARY KEY,
    nombre    VARCHAR(100),
    apellidos VARCHAR(100),
    curso     INT,
    casa      VARCHAR(50),
    patronus  VARCHAR(100)
);

-- Alumnos de Hufflepuff
INSERT INTO alumnos VALUES ('HUF-3c4d5e6f', 'Cedric',  'Diggory',          7, 'Hufflepuff', 'Labrador');
INSERT INTO alumnos VALUES ('HUF-7a8b9c0d', 'Hannah',  'Abbott',           5, 'Hufflepuff', 'Conejo');
INSERT INTO alumnos VALUES ('HUF-1e2f3a4b', 'Susan',   'Bones',            5, 'Hufflepuff', 'Zorro');
INSERT INTO alumnos VALUES ('HUF-5c6d7e8f', 'Ernie',   'Macmillan',        5, 'Hufflepuff', 'Jabalí');
INSERT INTO alumnos VALUES ('HUF-9a0b1c2d', 'Justin',  'Finch-Fletchley',  5, 'Hufflepuff', 'Tejón');