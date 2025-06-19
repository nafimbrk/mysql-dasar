-- membuat unique constraint
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_nane VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email)  -- kalo mau lebih dari satu tinggal tambahin , lalu di bawahnya ketik lagi unique key........
) ENGINE = InnoDB;

-- menambah atau menghapus
ALTER TABLE
    customers
ADD
    CONSTRAINT email_unique UNIQUE (email);

ALTER TABLE
    customers DROP CONSTRAINT email_unique;

INSERT INTO
    customers (email, first_name, last_name)
VALUES
    ('eko@gmail.com', 'Eko', 'khannedy');  -- kalo di eksekusi 2 kali bakal error, karena emailnya harus unique, dan saat kita generate data baru dengan email yang berbeda maka dia id nya bakal 3, dan semua id nya yaitu 1, 3 untuk 2 nya yang gagal di generate tadi

-- menambah / menghapus check constraint
ALTER TABLE
    products
ADD
    CONSTRAINT price_check CHECK (price >= 1000);

ALTER TABLE
    products DROP CONSTRAINT price_check;

-- ditolak
insert into products(id, name, category, price, quantity)
values ('P0009', 'Permen', 'Lain-Lain', 500, 100)    
