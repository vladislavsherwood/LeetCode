SELECT 
    DATE_FORMAT(t1.trans_date, '%Y-%m') AS month, 
    t1.country, 
    COUNT(amount) AS trans_count, 
    approved_count, 
    SUM(amount) AS trans_total_amount, 
    approved_total_amount
FROM 
    Transactions t1
INNER JOIN 
  (SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') as month, 
    country,
    CASE WHEN SUM(
        CASE WHEN state = 1 THEN 1 ELSE 0 END) > 0 
    THEN SUM(CASE WHEN state = 1 THEN 1 ELSE 0 END) 
    ELSE 0 END AS approved_count,
    CASE WHEN SUM(
        CASE WHEN state = 1 THEN 1 ELSE 0 END) > 0 
    THEN SUM(CASE WHEN state = 1 THEN amount ELSE 0 END)
    ELSE 0 END AS approved_total_amount
  FROM 
    Transactions
  GROUP BY 
    month, country) AS t2 ON t2.month = DATE_FORMAT(t1.trans_date, '%Y-%m') AND t1.country = t2.country
GROUP BY month, t1.country





