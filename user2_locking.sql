-- locking record
START TRANSACTION;

SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah Oleh User 2'
WHERE id = 9;

COMMIT;

-- locking record manual
START TRANSACTION;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT;

-- deadlock
START TRANSACTION;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

-- lock table read

SELECT * FROM products;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

-- lock table write

SELECT * FROM products;

-- lock instance

ALTER TABLE products
ADD column sample VARCHAR(100)