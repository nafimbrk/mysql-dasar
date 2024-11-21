-- untuk kolom
SELECT
    id as Kode,
    name as Nama,
    category as Kategori,
    price as Harga,
    quantity as Stok
FROM
    products;

-- untuk tabel
SELECT
    p.id AS Kode,
    p.name AS Nama,
    p.category AS Kategori,
    p.price AS Harga,
    p.quantity AS Stok
FROM
    products AS p;