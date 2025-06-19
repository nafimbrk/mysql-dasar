CREATE TABLE admin (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO
    admin(first_name, last_name)
VALUES
    ('Eko', 'Khannedy'),
    ('Budi', 'Nuacaha'),
    ('Joko', 'Morrg');

-- auto increment cuma bisa di primary key
-- kalo datanya dihapus id nya ikut kehapus
-- dan kalo nambahin data baru akan lanjut ke data setelahnya, misal: data id 3 dihapus dan otomatis id 3 hilang dan saat nambahin data baru data baru tersebut id nya bakal 4 jadi datanya semua isinya id 1, 2, 4 dst


-- melihat id terakhir
SELECT LAST_INSERT_ID();
