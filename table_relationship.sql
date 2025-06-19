-- membuat table dgn foreign key
CREATE TABLE wishlist (
    id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,  -- tipe datanya harus sama dengan primary key di tabel reference nya (products)
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;

-- menambah/menghapus
ALTER TABLE
    wishlist DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE
    wishlist
ADD
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id);

-- keuntungan pake foreign key
1 memastikan bahwa data yg kita masukkan ke kolom tersebut harus tersedia di tabel reference nya
2 saat kita menghapus data di tabel reference, mysql akan mengecek apakah id nya digunakan di foreign key di tabel lain, jika digunakan, maka secara otomatis mysql akan menolak proses delete data di tabel reference tersebut


-- mengubah behavior menghapus relasi
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id)
ON DELETE CASCADE ON UPDATE CASCADE;

-- default restrict
-- restrict, cascade, no action, set null (kalo pake set null kolomnya harus nullable)
-- selain di delete kalo misal di update juga gitu, misal kita punya primary tabel reference (products) 'P0001' menjadi 'PXXXX' maka kalo dia restrict bakal ditolak dan kalo cascade data product_id di tabel wishlist juga ikut diubah begitupun yang lainnya kayak set null dll, (perlu di ingat lagi maksud dari update bukan update barisnya tapi primary key tabel reference nya) 
