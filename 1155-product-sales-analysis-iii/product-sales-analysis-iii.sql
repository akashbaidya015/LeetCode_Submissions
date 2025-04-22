SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT 
        product_id, 
        year, 
        quantity, 
        price,
        DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year) AS rnk
    FROM Sales
) AS ranked_sales
WHERE rnk = 1;
