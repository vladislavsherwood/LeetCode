# Write your MySQL query statement below
SELECT 
    user_id, ROUND(SUM(CASE WHEN action = "confirmed" THEN 1 ELSE 0 END)/COUNT(action),2) AS confirmation_rate
FROM
    Confirmations
GROUP BY
    user_id

    UNION

SELECT
    user_id, 0 AS confirmation_rate
FROM
    Signups
WHERE
    user_id not in (SELECT user_id FROM Confirmations)