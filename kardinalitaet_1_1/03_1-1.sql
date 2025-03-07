\! cls

-- Vorbereitungen
DROP TABLE IF EXISTS design.servants, design.cats;


-- Mastertabelle (MT): unverändert
CREATE TABLE IF NOT EXISTS design.cats
(
  id        INT         NOT NULL AUTO_INCREMENT COMMENT 'Index',
  cat_name  VARCHAR(45) NOT NULL COMMENT 'Katzenname',
  fur_color VARCHAR(45) NOT NULL COMMENT 'Fellfarbe',
  PRIMARY KEY (id)
);

-- Struktur: MT
DESCRIBE design.cats;

-- Inserts: MT 
INSERT INTO design.cats (id, cat_name,fur_color) VALUES 
(DEFAULT, "Grizabella", "white"),
(DEFAULT, "Alonzo", "grey"),
(DEFAULT, "Mausi", "striped")
;

-- Inhalte: MT
SELECT * FROM desing.cats;


-- Detailtabelle: Verbindung zur MT über Fremdschlüssel
CREATE TABLE design.servants
(
  id           INT         NOT NULL AUTO_INCREMENT COMMENT 'Index',
  servant_name VARCHAR(45) NOT NULL COMMENT 'Name der Diener',
  yrs_served   TINYINT     NOT NULL COMMENT 'Dienstzeit',
  cats_id      INT         NOT NULL COMMENT 'FK',
  PRIMARY KEY (id)
) COMMENT 'Diener';

-- Fremdschlüssel: DT
ALTER TABLE design.servants
  ADD CONSTRAINT FK_cats_TO_servants
    FOREIGN KEY (cats_id)
    REFERENCES cats (id);

-- wichtig bei 1:1  UNIQUE im fk
ALTER TABLE design.servants
  ADD CONSTRAINT UQ_cats_id UNIQUE (cats_id);

-- Struktur: DT
DESCRIBE design.servants;


-- Inserts: DT
INSERT INTO design.servants (id, servant_name, yrs_served, cats_id) VALUES 
(DEFAULT, "Max", 5, 1),
(DEFAULT, "Maxine", 2, 2),
(DEFAULT, "Mohammed", 10, 3)
;


-- Inhalte: DT
SELECT * FROM design.servants;