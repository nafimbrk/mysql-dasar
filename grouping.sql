SELECT
    category,  -- sebelumnya dimateri agregate gk bisa ya kalo kita gabungkan kolom apapun dengan agregate function, tapi kita bisa lakukan ini kalo diakhiri dengan group by 
    COUNT(id) as 'Total Product'
FROM
    products
GROUP BY  -- jadi group by kategorinya jadi nanti kategorinya bakal di grouping / merge, jadi yang kategorinya sama bakal di merge 
    category;


-- having clause
SELECT
    COUNT(id) as total,
    category
FROM
    products
-- WHERE total > 5  -- gk bisa, bakal error
GROUP BY 
    category
HAVING total > 5;  -- bisa gunakan having
