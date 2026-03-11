-- ============================================================
-- HogwartsApp - Oracle XE Init Script
-- Se ejecuta como APP_USER (appuser) en el PDB XEPDB1
-- Usa bloques PL/SQL para ser idempotente (seguro en re-ejecuciones)
-- ============================================================

-- Crear tabla si no existe (-955 = ORA: table already exists)
BEGIN
  EXECUTE IMMEDIATE '
    CREATE TABLE alumnos (
      id        VARCHAR2(12)  PRIMARY KEY,
      nombre    VARCHAR2(100),
      apellidos VARCHAR2(100),
      curso     NUMBER(3),
      casa      VARCHAR2(50),
      patronus  VARCHAR2(100)
    )';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -955 THEN RAISE; END IF;
END;
/

-- Insertar datos con MERGE (idempotente, no falla si ya existen)
MERGE INTO alumnos t USING (
  SELECT 'GRY-a1b2c3d4' id, 'Harry'    nombre, 'Potter'          apellidos, 5 curso, 'Gryffindor' casa, 'Ciervo'               patronus FROM dual UNION ALL
  SELECT 'GRY-e5f6a7b8',   'Hermione', 'Granger',                5,         'Gryffindor',        'Nutria'               FROM dual UNION ALL
  SELECT 'GRY-c9d0e1f2',   'Ron',      'Weasley',                5,         'Gryffindor',        'Jack Russell Terrier' FROM dual UNION ALL
  SELECT 'GRY-a3b4c5d6',   'Neville',  'Longbottom',             5,         'Gryffindor',        'Leon'                 FROM dual UNION ALL
  SELECT 'GRY-e7f8a9b0',   'Ginny',    'Weasley',                4,         'Gryffindor',        'Caballo'              FROM dual UNION ALL
  SELECT 'GRY-da9f48a3',   'George',   'Weasley',                6,         'Gryffindor',        'Hiena'                FROM dual UNION ALL
  SELECT 'GRY-e0898ae5',   'Fred',     'Weasley',                6,         'Gryffindor',        'Hiena'                FROM dual UNION ALL
  SELECT 'GRY-e8b77614',   'Minerva',  'McGonagall',             7,         'Gryffindor',        'Gato'                 FROM dual UNION ALL
  SELECT 'SLY-1a2b3c4d',   'Draco',    'Malfoy',                 5,         'Slytherin',         'Dragon'               FROM dual UNION ALL
  SELECT 'SLY-5e6f7a8b',   'Pansy',    'Parkinson',              5,         'Slytherin',         'Gato'                 FROM dual UNION ALL
  SELECT 'SLY-9c0d1e2f',   'Blaise',   'Zabini',                 5,         'Slytherin',         'Serpiente'            FROM dual UNION ALL
  SELECT 'SLY-3a4b5c6d',   'Theodore', 'Nott',                   5,         'Slytherin',         'Buho'                 FROM dual UNION ALL
  SELECT 'SLY-7e8f9a0b',   'Daphne',   'Greengrass',             5,         'Slytherin',         'Leopardo'             FROM dual UNION ALL
  SELECT 'RAV-6f7a8b9c',   'Cho',      'Chang',                  6,         'Ravenclaw',         'Cisne'                FROM dual UNION ALL
  SELECT 'RAV-8f9a0b1c',   'Michael',  'Corner',                 5,         'Ravenclaw',         'Halcon'               FROM dual UNION ALL
  SELECT 'HUF-3c4d5e6f',   'Cedric',   'Diggory',                7,         'Hufflepuff',        'Labrador'             FROM dual UNION ALL
  SELECT 'HUF-7a8b9c0d',   'Hannah',   'Abbott',                 5,         'Hufflepuff',        'Conejo'               FROM dual UNION ALL
  SELECT 'HUF-1e2f3a4b',   'Susan',    'Bones',                  5,         'Hufflepuff',        'Zorro'                FROM dual UNION ALL
  SELECT 'HUF-5c6d7e8f',   'Ernie',    'Macmillan',              5,         'Hufflepuff',        'Jabali'               FROM dual UNION ALL
  SELECT 'HUF-9a0b1c2d',   'Justin',   'Finch-Fletchley',        5,         'Hufflepuff',        'Tejon'                FROM dual
) s ON (t.id = s.id)
WHEN NOT MATCHED THEN
  INSERT (id, nombre, apellidos, curso, casa, patronus)
  VALUES (s.id, s.nombre, s.apellidos, s.curso, s.casa, s.patronus);

COMMIT;