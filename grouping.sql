SELECT
    category,
    COUNT(id) as 'Total Product'
FROM
    products
GROUP BY
    category;


    