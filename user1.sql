-- LOCKING RECORD
START TRANSACTION;

-- (1) pertama update data
UPDATE guestbooks
SET title = 'Diubah Oleh User 1'
WHERE id = 9;

-- (2) dan select maka guestbooks bakal terupdate
SELECT * FROM guestbooks;

-- (5) kalo kita commit di user 1 baru updatenya dieksekusi di user 2
COMMIT;

-- LOCKING RECORD MANUAL
START TRANSACTION;

-- (1) pertama select di sini quantity nya dapet 100
SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;  -- (5) disini harusnya ketika kita select, kita select abistu lock jangan sampai ada orang yang bisa menselect datanya lagi (tambahkan FOR UPDATE), jadi kita ngasih tau ke mysql kalo kita mau select data ini yang tujuannya nanti untuk diupdate datanya, jadi jangan sampai ada orang yang ngelakuin select lagi for update&

-- (3) nah ketika diupdate di sini harapanya jadi 0
UPDATE products
SET quantity = quantity - 100
WHERE id = 'P0001';  -- &atau lakuin update



--percobaan setelah ditambahin FOR UPDATE
-- 1. start transaction
-- 2. select for update
-- 5. update, anggap aja di -10 jadi tinggal 90
-- 6. commit

COMMIT;

-- DEADLOCK
-- (1)
START TRANSACTION;

-- (2) select P0001
SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;  -- 1. jadi ini ngelock P0001

-- (5) select P0002
SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;  -- 4. dan kita ngeselect P0002 tapi dilock sama user2 (2.)


-- LOCK TABLE READ
LOCK TABLE products READ;  -- 1. artinya user1 cuma bisa read gk bisa read write

-- 4. disini pun sama kalo kita update gk bisa soalnya tabel nya dilocknya versinya read bukan write 
UPDATE products
SET quantity = 100
WHERE id = 'P0001';

-- 5.
UNLOCK TABLES;  -- setelah di UNLOCK update di user2 nya baru dieksekusi

-- LOCK TABLE WRITE
-- 1.
LOCK TABLE products WRITE;

-- 3. kalo write disini bisa
UPDATE products
SET quantity = 100
WHERE id = 'P0001';

-- 4. read juga bisa
SELECT * FROM products;

-- 5. abis diunlok baru select user2 nya di eksekusi
UNLOCK TABLES;

-- LOCK INSTANCE

-- 1.
LOCK INSTANCE FOR BACKUP;

-- 3. abis unlock instance baru alter table di user2 dijalankan
UNLOCK INSTANCE;
