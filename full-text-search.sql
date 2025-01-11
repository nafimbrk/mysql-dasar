-- membuat
CREATE TABLE products (
id VARCHAR(10) NOT NULL,
name VARCHAR(100) NOT NULL,
description TEXT,
price INT UNSIGNED NOT NULL,
quantity INT UNSIGNED NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
FULLTEXT product_search (name, description)
) ENGINE = InnoDB;

-- menambah / menghapus
ALTER TABLE products
ADD FULLTEXT product_search (name, description);

ALTER TABLE products
DROP INDEX product_search;

-- mencari dengan like
SELECT * FROM products WHERE name LIKE '%ayam%' OR description LIKE '%ayam%';

-- mencari dengan natural language mode
SELECT * FROM products
WHERE MATCH(name, description)
AGAINTST('ayam' IN NATURAL LANGUAGE MODE);

-- mencari dengan boolean mode
SELECT * FROM products
WHERE MATCH(name, description)
AGAINTST('+mie -bakso' IN NATURAL BOOLEAN MODE);

-- mencari dengan query expansion mode
SELECT * FROM products
WHERE MATCH(name, description)
AGAINTST('bakso' WITH QUERY EXPANSION);
