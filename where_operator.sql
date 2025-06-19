-- operator perbandingan
SELECT
    *
FROM
    products
WHERE
    quantity > 100;

-- operator logika
SELECT
    *
FROM
    products
WHERE
    quantity > 100
    AND price > 20000;

SELECT
    *
FROM
    products
WHERE
    quantity > 200
    OR price > 20000;

-- prioritas
select * from products where (category = 'Makanan' or quantity > 200) and price > 20000;

-- operator like
SELECT
    *
FROM
    products
WHERE
    name LIKE '%mie%';
-- like itu in case sensitive
-- 'b%', '%a', '%eko%', not like

-- null operator
SELECT
    *
FROM
    products
WHERE
    description IS NULL;
-- description IS NOT NULL;

-- between operator
SELECT
    *
FROM
    products
WHERE
    price BETWEEN 10000
    AND 20000;

-- price NOT BETWEEN 10000 AND 20000;
-- in operator
SELECT
    *
FROM
    products
WHERE
    category IN ('Makanan', 'Minuman');

-- category NOT IN ('Makanan', 'Minuman');
