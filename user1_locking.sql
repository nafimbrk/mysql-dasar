-- locking record
START TRANSACTION;

SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah Oleh User 1'
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

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;

-- lock table read

LOCK TABLE products READ;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

UNLOCK TABLE;

-- lock table write
LOCK TABLE products WRITE;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

SELECT * FROM products;

UNLOCK TABLE;

-- lock instance
LOCK INSTANCE FOR BACKUP;

UNLOCK INSTANCE