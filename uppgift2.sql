-- 2.1
SELECT first_name, last_name
FROM employees;

-- 2.2
SELECT home_phone
FROM employees
WHERE title = 'Vice President, Sales';

-- 2.3
SELECT company_name, contact_name, contact_title
FROM suppliers
WHERE company_name = 'Svensk Sjöföda AB';

-- 2.4
SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date DESC;

-- 2.5
SELECT *
FROM customers
ORDER BY country, city;

-- 2.6
SELECT *
FROM employees
WHERE last_name ILIKE '%an%';

-- 2.7
SELECT *
FROM employees
WHERE title LIKE '%VICE%' OR title LIKE '%President%' OR title LIKE '%Manager%';

-- 2.8
SELECT product_name, unit_price, unit_price * 1.07 AS new_value
FROM products;

-- 2.9
SELECT product_name, unit_price * units_in_stock AS stock_value
FROM products;

-- 2.10
SELECT *
from products
WHERE units_in_stock < reorder_level;

-- 2.11
SELECT *
FROM products
WHERE units_in_stock + units_on_order < reorder_level;

-- 2.12
SELECT category_name
FROM categories
JOIN products ON (products.category_id = categories.category_id)
WHERE product_name = 'Lakkalikööri';

-- 2.13
SELECT company_name, product_name
FROM suppliers
JOIN products ON (products.supplier_id = suppliers.supplier_id)
WHERE product_name = 'Gravad lax';

-- 2.14
SELECT product_name, company_name, order_id
FROM products
JOIN order_details ON (order_details.product_id = products.product_id)
JOIN suppliers ON (suppliers.supplier_id = products.supplier_id)
WHERE order_details.order_id = 10249;

-- 2.15
SELECT COUNT(*)
FROM employees
WHERE title = 'Sales Representative';

-- 2.16
SELECT SUM(unit_price * quantity)
FROM orders
JOIN order_details ON (order_details.order_id = orders.order_id)
WHERE order_date = '1996-12-12';

-- 2.17
SELECT product_name, category_name, SUM(quantity) AS total_sold
FROM products
LEFT JOIN order_details ON (order_details.product_id = products.product_id)
JOIN categories ON (categories.category_id = products.category_id)
GROUP BY products.product_id, products.product_name, categories.category_name;

--2.18
SELECT company_name
FROM customers
LEFT JOIN orders ON (orders.customer_id = customers.customer_id)
WHERE order_id IS NULL;

-- 2.19
SELECT category_id, product_name, unit_price
FROM products
WHERE category_id = 4;

UPDATE products
SET unit_price = unit_price * 1.20
WHERE category_id = 4;

-- Efter uppdatering
SELECT product_name, unit_price
FROM products
WHERE category_id = 4;

UPDATE products
SET unit_price = unit_price / 1.20
WHERE category_id = 4;

-- 2.20
SELECT unit_price, company_name
FROM products
JOIN suppliers ON (suppliers.supplier_id = products.supplier_id)
WHERE company_name = 'Tokyo Traders';

UPDATE products
SET unit_price = unit_price * 1.1
FROM suppliers WHERE (suppliers.supplier_id = products.supplier_id)
AND company_name = 'Tokyo Traders';

-- Efter uppdatering
SELECT unit_price, company_name
FROM products
JOIN suppliers ON (suppliers.supplier_id = products.supplier_id)
WHERE company_name = 'Tokyo Traders';

UPDATE products
SET Unit_price = ROUND(unit_price / 1.1)
FROM suppliers WHERE (suppliers.supplier_id = products.supplier_id)
AND company_name = 'Tokyo Traders';