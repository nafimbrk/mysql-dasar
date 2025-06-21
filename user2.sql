-- LOCKING RECORD
START TRANSACTION;

-- (3) nah pas select di user 2 data guestbooksnya belum terupdate
SELECT * FROM guestbooks;

-- (4)
-- kalo user 2 ingin melakukan perubahan ke data yang sama(record yang sama)
-- maka dia nunggu terus (ada loading) karena masih di lock sama user 1
UPDATE guestbooks
SET title = 'Diubah Oleh User 2'
WHERE id = 9;

COMMIT;

-- LOCKING RECORD MANUAL
START TRANSACTION;

-- (2) terus dia juga select di sini quantity nya dapet 100    
-- *harusnya kalo disini dapetnya 0 yaudah gk boleh dapet
SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;  -- &jadi disini juga harus diganti (FOR UPDATE)

-- (4) nah ketika disini diupdate lagi dia malah jadi mines (-10) artinya melebihi stok yang sebenrnya*
UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';


--percobaan setelah ditambahin FOR UPDATE
-- 3. start transaction
-- 4. select for update (ada timernya dia nungguin dia belum dikasih datanya sama mysql)
-- 7. nah sekarang selectnya hasilnya 90 gk lagi 100 (kayak yang di atas sebelumnya) karena dia nugguin proses transaction di user 1 selesai (start transaction - commit)
-- 8. baru kita update terus commit (sekarang datanya jadi 80)
COMMIT;

-- DEADLOCK
-- (3)
START TRANSACTION;

-- (4) select P0002
SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;  -- 2. ini ngelock P0002

-- (6) select P0001
SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;  -- 3. abistu dia select P0001 tapi lagi dilock sama user1 (1.)


-- LOCK TABLE READ
SELECT * FROM products;  -- 2. user2 masih bisa read tapi gk bisa write

-- 3. disuruh nunggu karena tabelnya dilock sama user1
UPDATE products
SET quantity = 100
WHERE id = 'P0001';

-- LOCK TABLE WRITE
-- 2. disuruh nunggu soalnya masih dilock
SELECT * FROM products;

-- LOCK INSTANCE

-- 2. disuruh nunggu
ALTER TABLE products
ADD COLUMN sample VARCHAR(100);
