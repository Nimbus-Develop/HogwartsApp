-- ============================================================
-- HogwartsApp - H2 Schema (sin datos)
-- ============================================================

CREATE TABLE IF NOT EXISTS alumnos (
    id        VARCHAR(12)  PRIMARY KEY,
    nombre    VARCHAR(100),
    apellidos VARCHAR(100),
    curso     INT,
    casa      VARCHAR(50),
    patronus  VARCHAR(100)
);