-- mengurutkan
SELECT
    *
FROM
    products
ORDER BY
    category;

SELECT
    *
FROM
    products
ORDER BY
    category ASC,
    price DESC;

-- default asc
-- bisa pake where juga, example: select * from products where....... order by.........
