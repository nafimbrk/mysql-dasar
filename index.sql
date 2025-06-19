CREATE TABLE sellers (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    name2 VARCHAR(100),
    name3 VARCHAR(100),
    email VARCHAR (100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index (name),
    INDEX name2_index (name2),
    INDEX name3_index (name3),
    INDEX name1_name2_name3_index (name, name2, name3)  -- kalo kita bikin indexnya kombinasi 3 kayak gini, kita akan punya beberapa kombisani pencarian
) ENGINE = InnoDB;
-- primary key dan unique key otomatis sudah ditambahakan index oleh mysql jadi kita gk usah tambahkan manual

-- test query
SELECT
    *
FROM
    sellers
WHERE
    name = 'X';

SELECT
    *
FROM
    sellers
WHERE
    name = 'X'
    AND name2 = 'X';

SELECT
    *
FROM
    sellers
WHERE
    name2 = 'X';

SELECT
    *
FROM
    sellers
WHERE
    name = 'X'
    AND name2 = 'X'
    AND name3 = 'X';

-- add and delete index
ALTER TABLE
    sellers 
ADD
    INDEX name_index (name);

ALTER TABLE
    sellers DROP INDEX name_index;
