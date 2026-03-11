-- ============================================================
-- HogwartsApp - Apache Derby Schema (sin datos)
-- ============================================================

CONNECT 'jdbc:derby:/derby_data/hogwarts;create=true';

CREATE TABLE alumnos (
    id        VARCHAR(12)  PRIMARY KEY,
    nombre    VARCHAR(100),
    apellidos VARCHAR(100),
    curso     INT,
    casa      VARCHAR(50),
    patronus  VARCHAR(100)
);

DISCONNECT;
EXIT;
