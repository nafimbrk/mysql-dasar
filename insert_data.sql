CREATE TABLE products (
    id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- satu-satu
INSERT INTO
    products(id, name, price, quantity)
VALUES
    (
        'PO001',
        'Mie Ayan Original',
        15000,
        100
    );

INSERT INTO
    products(id, name, description, price, quantity)
VALUES
    (
        ' P0002 ',
        'Mie Ayan Bakso Tahu',
        'Mie Ayam Original + Bakso Tahu',
        20000,
        100
    );

-- sekaligus
INSERT INTO
    products(id, name, price, quantity)
VALUES
    ('POO03', 'Mie Ayam Ceker', 20000, 100),
    ('POO04', 'Mie Ayam Spesial', 25000, 100),
    ('POO05', 'Mie Ayam Yamin', 15000, 100);