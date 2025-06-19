-- satu kolom
UPDATE
    products
SET
    category = 'Makanan'
WHERE
    id = 'P0001';

-- beberapa kolom
UPDATE
    products
SET
    category = 'Makanan',
    description = 'Mie Ayam + Ceker'
WHERE
    id = 'P0003';

-- dengan value
UPDATE
    products
SET
    price = price + 5000
WHERE
    id = 'P0004';
