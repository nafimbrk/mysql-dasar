-- select count(id), name from products;  -- error

SELECT
    COUNT(id) AS 'Total Product'
FROM
    products;

SELECT
    MAX(price) AS 'Product Termahal'
FROM
    products;

SELECT
    MIN(price) AS 'Product Termurah'
FROM
    products;

SELECT
    AVG(price) AS 'Rata-Rata Harga'
FROM
    products;

SELECT
    SUM(quantity) AS 'Total Stock'
FROM
    products;
