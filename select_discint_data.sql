select
    category
from
    products;  -- yang keluar semua kategorinya per tiap produknya, jadi bakal duplikat    

-- menghilangkan data duplikat
SELECT
    distinct category
FROM
    products;

-- hati-hati
-- maka dia gk akan ngefek (kategorinya gk distinct ya walaupun distict tapi id nya itu beda semua gitu jadi ya ditampilin semua id nya), yang terjadi akan muncul juga semua kategori per tiap produknya jadi dia bakal duplikat
select distinct category, id from products;
