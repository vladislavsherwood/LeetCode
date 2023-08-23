WITH RECURSIVE ids AS
    (SELECT 
        1 AS value
    UNION ALL
    SELECT 
        value + 1
    FROM 
        ids
    WHERE 
        value < (SELECT MAX(customer_id) FROM Customers))

SELECT 
    value as ids
FROM 
    ids
WHERE
    value not IN (SELECT customer_id FROM Customers)