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

-- inner join
-- mekanisme join, dimana terdapat relasi antara tabel pertama dan tabel kedua
-- jika ada data di tabel pertama yang tidak memiliki relasi di tabel kedua ataupun sebaliknya, maka hasil inner join tidak akan ditampilkan
-- ini default join di mysql

-- kalo pake inner join yang akan ditampikan hanya data yang berelasi antara tabel pertama dan kedua, jadi kalo tabel pertamanya tidak penah ada relasi di tabel keduanya dia tidak akan ditampilkan
-- contoh: anggap ada 3 layer: |kiri|tengah(tampil)|kanan| misal di kiri adalah tabel produk dan di kanan kategori, nah kalo kita select product yang ternyata di dalam tabel product nya itu tidak ada id_kategori maka dia akan masuk ke kiri nah yang kanan adalah kategori yang tidak pernah dipakai sama produk dan yang kiri adalah produk yang tidak punya kategori dan yang tengah adalah produk yang memiliki kategori (dia berelasi dari produk dan kategori), jadi yang punya relasi bakal di tengah, yang tidak punya relasi yang produknya ada di kiri dan yang kategori ada di kanan, dan yang akan tampil cuma yang punya relasi(tengah) 
SELECT
    *
FROM
    categories
    INNER JOIN products ON (products.id_category = categories.id);  // kalo JOIN saja itu sebenrnya adalah INNER JOIN

-- left join
-- mekanisme join yang dimana semua data di tabel pertama akan ditampilkan juga (jadi gk cuma yang berelasi tapi yang di tabel pertama pun akan diambil)
-- jika ada yang tidak memiliki relasi(berelasi) di tabel kedua, maka hasilnya akan null (data-datanya akan null)
-- |kiri(tampil null)|tengah(tampil)|kanan|  => kiri category kanan product, maka semua kategori yang tidak punya relasi produk pun akan tampil, jadi yang tampil adalah semua kategori yang tidak punya relasi produk(kiri) dan yang punya relasi produk(tengah)
SELECT
    *
FROM
    categories
    LEFT JOIN products ON (products.id_category = categories.id);

-- right join
-- mekanisme join yang dimana semua data di tabel kedua akan ditampilkan juga (jadi gk cuma yang berelasi tapi yang di tabel kedua pun akan diambil)
-- jika ada yang tidak memiliki relasi(berelasi) di tabel pertama, maka hasilnya akan null (data-datanya akan null)
-- |kiri|tengah(tampil)|kanan(tampil nul)|  => kiri category kanan product, kiri category kanan product, maka semua produk yang tidak punya relasi kategori pun akan tampil, jadi yang tampil adalah semua produk yang tidak punya relasi kategori(kanan) dan yang punya relasi kategori(tengah)
SELECT
    *
FROM
    categories
    RIGHT JOIN products ON (products.id_category = categories.id);

-- cross join
-- join yang sangat jarang sekali digunakan
-- dengan cara mengkalikan data di tabel pertama dengan data di tabel kedua
-- artinya jika ada 5 data di tabel pertama, dan 5 data di tabel kedua, akan menghasilkan 25 kombinasi data (5x5)
select * from categories
cross join products


-- nb: yang dimaksud tabel kiri(pertama) adalah tabel yang di select duluan sedangkan yang kanan(kedua) adalah tabel yang di join
