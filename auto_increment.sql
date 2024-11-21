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