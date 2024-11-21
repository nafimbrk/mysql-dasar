-- membatasi
SELECT
    *
FROM
    products
ORDER BY
    id
LIMIT
    5;

-- skip
SELECT
    *
FROM
    products
ORDER BY
    id
LIMIT
    0, 5;

-- 5;
SELECT
    *
FROM
    products
ORDER BY
    id
LIMIT
    5, 5;