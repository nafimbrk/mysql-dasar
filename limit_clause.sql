-- membatasi
SELECT
    *
FROM
    products
ORDER BY
    id
LIMIT
    5;  -- ini kalo skip sama aja: 0, 5
-- bisa pake where juga, example: select * from products where....... order by.........

-- skip
SELECT
    *
FROM
    products
ORDER BY
    id
LIMIT
    5, 5;
