-- inner join
insert into
    categories(id, name)
VALUES
    ('C0004', 'Oleh-Oleh'),
    ('C0005', 'Gadget');

INSERT INTO
    products(id, name, price, quantity)
VALUES
    ('XO001', 'X Satu', 25000, 200),
    ('XO002', 'X Dua', 10000, 300),
    ('XO003', 'X Tiga', 15000, 500);

SELECT
    *
FROM
    categories
    INNER JOIN products ON (products.id_category = categories.id);

-- default inner join
SELECT
    *
FROM
    categories
    LEFT JOIN products ON (products.id_category = categories.id);

SELECT
    *
FROM
    categories
    RIGHT JOIN products ON (products.id_category = categories.id);