CREATE TABLE categories (
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- ALTER TABLE
--     products DROP column category;

ALTER TABLE
    products
ADD
    COLUMN id_category VARCHAR(10);

ALTER TABLE
    products
ADD
    CONSTRAINT fk_product_category FOREIGN KEY (id_category) REFERENCES categories (id);

insert into
    categories(id, name)
VALUES
    ('C0001', 'Makanan'),
    ('C0002', 'Minuman'),
    ('C0003', 'Lain-Lain');

update
    products
set
    id_category = 'C0001'
where
    id in (
        'P0001',
        'P0002',
        'P0003',
        'P0004',
        'P0005',
        'P0006',
        'P0013',
        'P0014',
        'P0015'
    );

update
    products
set
    id_category = 'C0002'
where
    id in (
        'P0007',
        'P0008',
        'P0009'
    );

update
    products
set
    id_category = 'C0001'
where
    id in (
        'P0010',
        'P0011',
        'P0012',
        'P0016'
    );

select
    products.id,
    products.name,
    categories.name
from
    products
    join categories on (categories.id = products.id_category);





-- dimana satu data bisa dugunakan lebih dari satu kali di tabel relasinya
-- berbeda dengan one to one yang bisa digunakan max 1 kali di tabel relasinya
-- contoh satu category bisa digunakan oleh lebih dari satu product
-- cara buatnya sama kayak one to one, yang membedakan tabel FK nya gk boleh unique soalnya datanya memang bisa berkali-kali ditambahkan di tabel relasinya
