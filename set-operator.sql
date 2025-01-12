CREATE TABLE guestbooks(
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(100),
  title VARCHAR(200),
  content TEXT,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO guestbooks(email, title, content)
VALUES ('guest@gmail.com', 'Hello', 'Hello'),
       ('guest2@gmail.com', 'Hello', 'Hello'),
       ('guest3@gmail.com', 'Hello', 'Hello'),   
       ('eko@gmail.com', 'Hello', 'Hello'),   
       ('eko@gmail.com', 'Hello', 'Hello'),   
       ('eko@gmail.com', 'Hello', 'Hello');

-- union
SELECT DISTINCT email FROM customers
UNION
SELECT DISTINCT email FROM guestbooks;

-- union all
SELECT DISTINCT email FROM customers
UNION ALL
SELECT DISTINCT email FROM guestbooks;

-- intersect
SELECT DISTINCT email FROM customers
WHERE email IN (SELECT DISTINCT email FROM guestbooks);

SELECT DISTINCT customers.email FROM customers
INNER JOIN guestbooks ON (guestbooks.email = customers.email);

-- minus

SELECT DISTINCT customers.email, guestbooks.email FROM customers
LEFT JOIN guestbooks ON (customers.email = guestbooks.email)
WHERE guestbooks.email IS NULL;
