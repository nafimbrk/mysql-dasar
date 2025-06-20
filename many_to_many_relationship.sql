CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE orders_detail (
    id_product VARCHAR(10) NOT NULL,
    id_order INT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id_product, id_order)
) ENGINE = InnoDB;

ALTER TABLE
    orders_detail
ADD
    CONSTRAINT fk_orders_detail_product FOREIGN KEY (id_product) REFERENCES products (id);

ALTER TABLE
    orders_detail
ADD
    CONSTRAINT fk_orders_detail_orders FOREIGN KEY (id_order) REFERENCES orders (id);

-- insert into
--     orders(total)
-- VALUES
--     (50000),
--     (50000),
--     (50000);

insert into
    orders_detail(id_product, id_order, price, quantity)
VALUES
    ('P0001', 1, 25000, 1),
    ('P0002', 1, 25000, 1);

insert into
    orders_detail(id_product, id_order, price, quantity)
VALUES
    ('P0003', 2, 25000, 1),
    ('P0004', 3, 25000, 1);

insert into
    orders_detail(id_product, id_order, price, quantity)
VALUES
    ('P0001', 2, 25000, 1),
    ('P0003', 3, 25000, 1);

-- melihat data order, detail dan productnya
SELECT
    *
FROM
    orders
    JOIN orders_detail ON (orders_detail.id_order = orders.id)
    JOIN products ON (products.id = orders_detail.id_product);

SELECT
    orders.id,
    products.id,
    products.name,
    orders_detail.quantity,
    orders_detail.price
FROM
    orders
    JOIN orders_detail ON (orders_detail.id_order = orders.id)
    JOIN products ON (products.id = orders_detail.id_product);

-- relasi dimana ada relasi antara 2 tabel dimana tabel pertama bisa punya banyak relasi di tabel kedua, dan tabel kedua pun punya banyak relasi di tabel pertama
-- bagaimana caranya bisa relasi kebanyakan secara bolak balik, sedangkan di tabel kita punya 1 kolom untuk FK
-- contoh relasi antara produk dan penjualan, dimana setiap produk bisa dijual berkali-kali, dan setiap penjualan bisa untuk lebih dari satu produk 
-- gimana implemetasi nya?
-- id_product di tabel order:
-- jika menambahkan id_product di tabel order, artinya sekarang sudah benar bahwa 1 product bisa dijual berkali-kali
-- masalahnya adalah, berarti 1 order hanya bisa membeli 1 product, karena cuma ada 1 kolom untuk id_product
-- oke kalo gitu kita tambahkan id_product1, id_product2, id_product3 dst, solusi ini bisa dilakukan tapi tidak baik, artinya akan selalu ada maksimal barang yang bisa kita beli dalam satu order
-- id_order di tabel product:
-- jika menambahkan id_order di tabel product, artinya sekarang 1 order bisa membeli lebih dari 1 product
-- masalahnya terbalik sekarang, 1 product cuma bisa dijual 1 kali, tidak bisa dijual berkali-kali, karena kolom id_order nya cuma 1
-- kalaupun kita tambah id_order1, id_order2 dst di tabel product, tetap ada batasan maksimal nya

-- solusinya yang biasa dilakukan kalo ada relasi many to many adalah biasanya kita akan menambah 1 tabel di tengahnya
-- tabel ini berfungsi sebagai jembatan untuk menggabungkan relasi many to many
-- isi tabel ini akan ada id dari tabel pertama dan kedua, yaitu id_product dan id_order
-- dengan demikian kita bisa menambahkan beberapa data ditabel relasi ini, sehingga berarti 1 product bisa dijual beberapa kali di dalam tabel order, dan 1 order bisa membeli lebih dari 1 product
-- kalo pengen tambahakan kolom lain di tabel penghubungnya juga bebas

-- penjelasan tambahan: kalo misal kita insert data yang sama maka akan error (duplikat primary key) kenapa? karena kalo di ecommerce gk mungkin di satu penjualan membeli barang yang sama dua kali, kenapa? ya gk mungkin juga kan udah ada quantity, kalo kita beli product yang sama dua kali ya tinggal quantity jadikan dua, bukan bikin dua record
