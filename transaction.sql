-- Kenapa Butuh Transaction?
-- Saat membuat aplikasi berbasis database, jarang sekali kita akan melakukan satu jenis perintah SQL per aksi yang dibuat aplikasi
-- Contoh, ketika membuat toko online, ketika customer menekan tombol Pesan, banyak yang harus
-- kita lakukan, misal
-- о Membuat data pesanan di tabel order
-- о Membuat data detail pesanan di tabel order detail
-- о Menurunkan quantity di tabel produk
-- о Dan yang lainnya
-- Artinya, bisa saja dalam satu aksi, kita akan melakukan beberapa perintah sekaligus
-- Jika terjadi kesalahan di salah satu perintah, harapannya adalah perintah-perintah sebelumnya
-- dibatalkan, agar data tetap konsisten

-- dimana kita bisa memungkinkan beberapa perintah dianggap menjadi sebuah kesatuan perintah yang kita sebut transaction
-- jika terdapat satu saja proses gagal di transaction, maka secara otomatis peintah-perintah sebelumnya akan dibatalkan
-- jika sebuah transaction sukses, maka semua perintah akan dipastikan sukses (istilahnya semuanya atau tidak sama sekali)

-- perintah transaction
-- start transaction: memulai proses transaksi, proses selanjutnya akan dianggap transaksi sampai perintah commit atau rollback
-- commit: menyimpan secara permanen seluruh proses transaksi
-- rollback: membatalkan secara permanen seluruh proses transaksi

-- perintah ddl tidak bisa menggunakan fitur transaction, transaction hanya bisa dilakukan pada perintah dml
START TRANSACTION;

INSERT INTO
    guestbooks (email, title, content)
VALUES
    ('contoh@gmail.com', 'Contoh', 'Contoh'),
    ('contoh2@gmail.com', 'Contoh', 'Contoh'),
    ('contoh3@gmail.com', 'Contoh', 'Contoh');

SELECT * FROM guestbooks;

COMMIT;

START TRANSACTION;

DELETE FROM guestbooks;

SELECT * FROM guestbooks;

ROLLBACK;

