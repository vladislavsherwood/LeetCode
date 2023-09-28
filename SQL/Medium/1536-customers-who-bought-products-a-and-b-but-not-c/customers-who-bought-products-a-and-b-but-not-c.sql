SELECT
    n.customer_id, c.customer_name
FROM
    (SELECT 
        order_id,
        customer_id,
        (CASE WHEN product_name = 'A' or product_name = 'B' THEN 1
        WHEN product_name = 'C' THEN -100 END) as c
    FROM 
        Orders) n
JOIN Customers c ON c.customer_id = n.customer_id
GROUP BY customer_id
HAVING SUM(c)>=2
