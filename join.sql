-- join table
SELECT
    *
FROM
    wishlist
    JOIN products ON (wishlist.id_product = products.id);

SELECT
    wishlist.id,
    products.id,
    products.name,
    wishlist.description
FROM
    wishlist
    JOIN products ON (wishlist.id_product = products.id);

-- alias
SELECT
    w.id AS id_wishlist,
    p.id AS id_product,
    p.name AS product_name,
    w.description AS wishlist_description
FROM
    wishlist AS w
    JOIN products AS p ON (w.id_product = p.id);

-- join lebih dari dua tabel
-- membuat relasi ke tabel customer
ALTER TABLE
    wishlist
ADD
    COLUMN id_customer INT;

JALTER TABLE wishlist
ADD
    CONSTRAINT fk_wishlist_customer FOREIGN KEY (id_customer) REFERENCES customers(id);

update
    wishlist
set
    id_customer = 1
where
    id = 1;

-- join multiple table
SELECT
    customers.email,
    products.id,
    products.name,
    wishlist.description
FROM
    wishlist
    JOIN products ON (products.id = wishlist.id_product)
    JOIN customers ON (customers.id = wishlist.id_customer);