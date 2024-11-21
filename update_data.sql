-- satu kolom
UPDATE
    products
SET
    category = 'Makanan'
WHERE
    id = 'PO0O1';

-- beberapa kolom
UPDATE
    products
SET
    category = 'Makanan',
    description = 'Mie Ayam + Ceker'
WHERE
    id = 'PO0O3';

-- dengan value
UPDATE
    products
SET
    price = price + 5000
WHERE
    id = 'POO04';