SELECT
    COUNT(id) AS 'Total Product'
FROM
    products;

SELECT
    AVG(price) AS 'Rata-Rata'
FROM
    products;

SELECT
    MAX(price) AS 'Harga Termahal'
FROM
    products;

SELECT
    MIN(price) AS 'Harga Termurah'
FROM
    products;

SELECT
    SUM(quantity) AS 'Total Stock'
FROM
    products;