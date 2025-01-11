-- membuat
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_nane VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;

-- menambah atau menghapus
ALTER TABLE
    customers
ADD
    CONSTRAINT email unique UNIQUE (email);

ALTER TABLE
    customers DROP CONSTRAINT email_unique;

INSERT INTO
    customers (email, first_name, last_name)
VALUES
    ('eko@gmail.com', 'Eko', 'khannedy');

-- menambah atau menghapus check constraint
ALTER TABLE
    products
ADD
    CONSTRAINT price_check CHECK (price >= 1000);

ALTER TABLE
    products DROP CONSTRAINT price_check;
