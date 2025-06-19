CREATE TABLE wallet (
    id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_customer),
    CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;

-- insert into
--     wallet(id_customer)
-- VALUES
--     (1);

select
    customers.email,
    wallet.balance
from
    wallet
    join customers on (wallet.id_customer = customers.id);


-- tiap data di sebuah tabel hanya boleh berelasi ke maksimal 1 data di tabel lainnya
-- tidak boleh ada relasi lebih dari 1 data
-- contoh aplikasi toko online yang terdapat fitur wallet, dan 1 customer cuma boleh punya 1 wallet dan 1 wallet cuma boleh dimiliki sama 1 customer
-- cara buatnya ada 2 cara:
-- bisa membuat kolom FK, lalu set kolom tersebut menggunakan UNIQUE KEY, hal ini hal ini dapat mencegah terjadi data di kolom tersebut agar tidak duplikat
-- atau cara lain bisa membuat tabel dengan PK yang sama, sehhingga ga butuh lagi kolom untuk FK
