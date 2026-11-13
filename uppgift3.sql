CREATE PROCEDURE inflation()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE products
	SET unit_price = unit_price * 1.05;
END;
$$;


-- Visa prisarna före
SELECT product_name, unit_price
FROM products;

-- Anropa proceduren
Call inflation();

-- Visa priserna efter
SELECT product_name, unit_price
FROM products;



-- Uppgift 3.2
CREATE PROCEDURE increased_price(param_category_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE products
	SET unit_price = unit_price * 1.05
	WHERE products.category_id = param_category_id;
END;
$$;


SELECT product_name, unit_price, category_id
FROM products;

-- Anropa proceduren
Call increased_price(1);

-- Visa priserna efter
SELECT product_name, unit_price, category_id
FROM products;


-- Uppgift 3.3

CREATE VIEW overview_products AS
SELECT product_name, category_name, unit_price
FROM products
JOIN categories ON (categories.category_id = products.category_id);

SELECT *
FROM overview_products;


-- Uppgift 3.4
DROP VIEW IF EXISTS overview_products;

CREATE VIEW overview_products AS
SELECT product_name, category_name, unit_price, ROUND((unit_price * 10)::NUMERIC, 2) AS price_in_sek
FROM products
JOIN categories ON (categories.category_id = products.category_id);

SELECT *
FROM overview_products;

-- Uppgift 3.5
BEGIN;

SELECT product_name, unit_price
FROM products
WHERE product_name = 'Chai' OR product_name = 'Chang';

UPDATE products
SET unit_price = 24
WHERE product_name = 'Chai' OR product_name = 'Chang';

SELECT product_name, unit_price
FROM products
WHERE product_name = 'Chai' OR product_name = 'Chang';

ROLLBACK;

SELECT product_name, unit_price
FROM products
WHERE product_name = 'Chai' OR product_name = 'Chang';

-- Test när ett fel inträffar
BEGIN;

SELECT product_name, unit_price
FROM products
WHERE product_name = 'Chai' OR product_name = 'Chang';

UPDATE products
SET unit_price = 24
WHERE product_name = 'Chai' OR product_name = 'Chang';

UPDATE products
SET olles_kolumn = '24'
WHERE product_name = 'Chai' OR product_name = 'Chang';

SELECT product_name, unit_price
FROM products
WHERE product_name = 'Chai' OR product_name = 'Chang';

ROLLBACK;