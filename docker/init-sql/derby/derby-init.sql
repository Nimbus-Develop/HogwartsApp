-- ============================================================
-- HogwartsApp - Apache Derby Init Script (GRYFFINDOR)
-- Nota: la primera línea CONNECT es requerida por el tool ij
-- Solo contiene los alumnos de la casa Gryffindor
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

-- Alumnos de Gryffindor
INSERT INTO alumnos VALUES ('GRY-a1b2c3d4', 'Harry',    'Potter',      5, 'Gryffindor', 'Ciervo');
INSERT INTO alumnos VALUES ('GRY-e5f6a7b8', 'Hermione', 'Granger',     5, 'Gryffindor', 'Nutria');
INSERT INTO alumnos VALUES ('GRY-c9d0e1f2', 'Ron',      'Weasley',     5, 'Gryffindor', 'Jack Russell Terrier');
INSERT INTO alumnos VALUES ('GRY-a3b4c5d6', 'Neville',  'Longbottom',  5, 'Gryffindor', 'León');
INSERT INTO alumnos VALUES ('GRY-e7f8a9b0', 'Ginny',    'Weasley',     4, 'Gryffindor', 'Caballo');
INSERT INTO alumnos VALUES ('GRY-da9f48a3', 'George',   'Weasley',     6, 'Gryffindor', 'Hiena');
INSERT INTO alumnos VALUES ('GRY-e0898ae5', 'Fred',     'Weasley',     6, 'Gryffindor', 'Hiena');
INSERT INTO alumnos VALUES ('GRY-e8b77614', 'Minerva',  'McGonagall',  7, 'Gryffindor', 'Gato');

DISCONNECT;
EXIT;