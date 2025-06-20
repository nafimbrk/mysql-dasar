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
-- operasi menggabungkan 2 buah select query, dimana jika terdapat data yang duplikat, data duplikatnya akan dihapus dari hasil query
SELECT DISTINCT email FROM customers
UNION
SELECT DISTINCT email FROM guestbooks;

-- union all
-- sama kayak union tapi data duplikatnya akan tetap di tampilkan
SELECT DISTINCT email FROM customers
UNION ALL
SELECT DISTINCT email FROM guestbooks;

-- kalo misal:
-- union itu otomatis nge distinct juga
SELECT email FROM customers
UNION
SELECT email FROM guestbooks;

-- tapi kalo union all itu engga
SELECT email FROM customers
UNION ALL
SELECT email FROM guestbooks;

-- kita juga bisa gini  
SELECT emails.email, count(emails.email) from
(select email from customers
union all
select email from guestbooks) as emails
group by emails.email

-- intersect
-- operasi yang menggabungkan dua query, namun yang diambil hanya data yang terdapat pada hasil query pertama dan query kedua (yang tengah-tengah)
-- data yang tidak hanya ada di salah satu query akan dihapus (mirip kayak inner join(yang tidak ada relasinya / tidak ada yang sama bakal dihapus))
-- data nya muncul tidak dalam keadaan duplikat (jadi dia di distinct juga)
-- sayangnya mysql gk memiliki operator intersect, dengan demikian untuk melakukan operasi intersect kita harus lakukan secara manual dengan join atau subquery 

-- subquery  
SELECT DISTINCT email FROM customers
WHERE email IN (SELECT DISTINCT email FROM guestbooks);

-- join
SELECT DISTINCT customers.email FROM customers
INNER JOIN guestbooks ON (guestbooks.email = customers.email);

-- minus
-- operasi dimana query pertama akan dihilangkan oleh query kedua
-- artinya jika ada data di query pertama yang sama dengan data yang ada di query kedua, maka data tersebut akan dihapus
-- sayangnya mysql juga tidak ada operator minus, namun hal ini bisa kita lakukan menggunakan join

SELECT DISTINCT customers.email, guestbooks.email FROM customers
LEFT JOIN guestbooks ON (customers.email = guestbooks.email)
WHERE guestbooks.email IS NULL;
