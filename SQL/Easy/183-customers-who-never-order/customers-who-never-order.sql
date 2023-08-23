# Write your MySQL query statement below
SELECT 
    name as Customers
FROM
    Customers c
LEFT JOIN 
    Orders o ON c.Id = o.customerId
WHERE 
    o.id is NULL;
