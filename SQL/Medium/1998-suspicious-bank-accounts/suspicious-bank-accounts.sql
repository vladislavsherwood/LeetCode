WITH incomes as (
  SELECT 
    ROW_NUMBER() OVER(ORDER BY account_id, DATE_FORMAT(day, '%Y-%m')) as row_num,
    account_id, 
    SUM(amount) as full_amount, 
    DATE_FORMAT(day, '%Y-%m') as month_year
  FROM 
    Transactions
  WHERE 
    type = "Creditor"
  GROUP BY 
    account_id, 
    DATE_FORMAT(day, '%Y-%m')),

filter as(
  SELECT 
    i.account_id, 
    i.full_amount, 
    i.month_year,
    CASE WHEN i.full_amount > a.max_income THEN 'suspicious' ELSE 'fine' END as filter
  FROM 
    incomes i
  JOIN Accounts a ON a.account_id = i.account_id)


SELECT DISTINCT f1.account_id
FROM filter f1
LEFT JOIN filter f2 ON DATE_ADD(CONCAT(f1.month_year,'-01'), INTERVAL 1 MONTH) = CONCAT(f2.month_year,'-01') AND f1.account_id = f2.account_id
WHERE f1.filter = 'suspicious' AND f2.filter = 'suspicious';

