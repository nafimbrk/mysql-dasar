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
    AND price > 100000;

SELECT
    *
FROM
    products
WHERE
    quantity > 500
    OR price > 100000;

-- operator like
SELECT
    *
FROM
    products
WHERE
    name LIKE '%mie%';

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

-- price NOT BETWEEN 10000
-- AND 20000;
-- in operator
SELECT
    *
FROM
    products
WHERE
    category IN ('Makanan', 'Minuman');

-- category NOT IN ('Makanan', 'Minuman');