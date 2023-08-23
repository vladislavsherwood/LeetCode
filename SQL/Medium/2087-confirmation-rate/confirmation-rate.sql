# Write your MySQL query statement below
SELECT 
    s.user_id, ROUND(AVG(CASE WHEN c.action = "confirmed" THEN 1 ELSE 0 END),2) AS confirmation_rate
FROM
    Confirmations c
RIGHT JOIN
    Signups s ON s.user_id= c.user_id
GROUP BY
    user_id;