\! cls
-- Vorbereitung

DROP TABLE IF EXISTS design.purchases;
DROP TABLE IF EXISTS design.products;
DROP TABLE IF EXISTS design.servants;

/* SERVANTS */

-- Servants: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS design.servants
(
  id           INT         NOT NULL AUTO_INCREMENT,
  servant_name VARCHAR(45) NOT NULL,
  yrs_served   TINYINT     NOT NULL,
  PRIMARY KEY (id)
);

-- Servants: Struktur
DESCRIBE design.servants;

-- Servants: Inserts
INSERT INTO design.servants (id, servant_name, yrs_served) VALUES (DEFAULT, "Hubert", 5);
INSERT INTO design.servants (id, servant_name, yrs_served) VALUES (DEFAULT, "Arian", 3);

-- Servants: Inhalte 
SELECT * FROM design.servants;

/*  PRODUCTS */

-- Products: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS design.products
(
  id            INT          NOT NULL AUTO_INCREMENT,
  product_name  VARCHAR(45)  NOT NULL,
  product_price DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (id)
);

-- Products: Struktur
DESCRIBE design.products;

-- Products: Inserts
INSERT INTO design.products (id, product_name, product_price) VALUES 
(DEFAULT, "Whiskas|Lachs", 2.75),
(DEFAULT, "Whiskas|Huhn", 2.80),
(DEFAULT, "Felix|Jelly", 3.75),
(DEFAULT, "Felix|Sauce", 3.80);

-- Products: Inhalte 
SELECT * FROM design.products;

/*  PURCHASES (Kaufprozesse)*/

-- ServantsProducts (purchases)
CREATE TABLE IF NOT EXISTS design.purchases
(
  servants_id INT NOT NULL,
  products_id INT NOT NULL
);

ALTER TABLE design.purchases
  ADD CONSTRAINT FK_servants_TO_purchases
    FOREIGN KEY (servants_id)
    REFERENCES servants (id);

ALTER TABLE design.purchases
  ADD CONSTRAINT FK_products_TO_purchases
    FOREIGN KEY (products_id)
    REFERENCES products (id);

-- Purchases: Struktur
DESCRIBE design.purchases;

-- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)
INSERT INTO design.purchases (servants_id, products_id) VALUES 
(1, 2);
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 4);


-- Purchases: Inhalte 
SELECT * FROM design.purchases;

