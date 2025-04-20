WITH customer_type AS (
  SELECT 
    *,
    CASE WHEN rn = 1 THEN 'first_order' ELSE 'not' END AS order_type
  FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
  ) AS ranked_orders
)

SELECT 
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM Delivery), 2) 
  AS immediate_percentage
FROM customer_type
WHERE order_type = 'first_order' AND customer_pref_delivery_date = order_date;
