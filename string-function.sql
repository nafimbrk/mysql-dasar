SELECT
    id,
    LOWER(name) AS 'Name Lower',
    UPPER(name) AS 'Name Upper',
    LENGTH(name) AS 'Name Length'
FROM
    products;