-- ============================================================
-- HogwartsApp - Oracle XE Init Script (RAVENCLAW)
-- Se ejecuta como APP_USER (appuser) en el PDB XEPDB1
-- Usa bloques PL/SQL para ser idempotente (seguro en re-ejecuciones)
-- Solo contiene los alumnos de la casa Ravenclaw
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

-- Alumnos de Ravenclaw (MERGE es idempotente: no falla si ya existen)
MERGE INTO alumnos t USING (
  SELECT 'RAV-2b3c4d5e' id, 'Luna'    nombre, 'Lovegood' apellidos, 4 curso, 'Ravenclaw' casa, 'Liebre'     patronus FROM dual UNION ALL
  SELECT 'RAV-6f7a8b9c',   'Cho',     'Chang',             6,       'Ravenclaw',          'Cisne'              FROM dual UNION ALL
  SELECT 'RAV-0d1e2f3a',   'Padma',   'Patil',             5,       'Ravenclaw',          'Gato persa'         FROM dual UNION ALL
  SELECT 'RAV-4b5c6d7e',   'Terry',   'Boot',              5,       'Ravenclaw',          'Aguila'             FROM dual UNION ALL
  SELECT 'RAV-8f9a0b1c',   'Michael', 'Corner',            5,       'Ravenclaw',          'Halcon'             FROM dual
) s ON (t.id = s.id)
WHEN NOT MATCHED THEN
  INSERT (id, nombre, apellidos, curso, casa, patronus)
  VALUES (s.id, s.nombre, s.apellidos, s.curso, s.casa, s.patronus);

COMMIT;