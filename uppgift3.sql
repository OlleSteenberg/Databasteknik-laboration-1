

CREATE PROCEDURE inflation()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE products
	SET unit_price = unit_price * 1.05;
END;
$$;

BEGIN;

-- Visa prisarna före
SELECT product_name, unit_price
FROM products;

-- Anropa proceduren
Call inflation();

-- Visa priserna efter
SELECT product_name, unit_price
FROM products;

-- Återställa prisändringarna
ROLLBACK;