-- subquery di where
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

-- subquery di from 
SELECT MAX(cp.price) FROM (SELECT price FROM categories JOIN products ON (products.id_category = categories.id)) as cp;
