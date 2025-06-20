Locking
. Locking adalah proses mengunci data di DBMS
· Proses mengunci data sangat penting dilakukan, salah satunya agar data benar-benar terjamin konsistensinya
. Karena pada kenyataannya, aplikasi yang akan kita buat pasti digunakan oleh banyak pengguna,
  dan banyak pengguna tersebut bisa saja akan mengakses data yang sama, jika tidak ada proses
  locking, bisa dipastikan akan terjadi RACE CONDITION, yaitu proses balapan ketika mengubah
  data yang sama
. Contoh saja, ketika kita belanja di toko online, kita akan balapan membeli barang yang sama, jika
  data tidak terjaga, bisa jadi kita salah mengupdate stock karena pada saat yang bersamaan banyak
  yang melakukan perubahan stock barang
															


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
