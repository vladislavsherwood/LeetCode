# Write your MySQL query statement below
SELECT
  name
FROM
  SalesPerson
WHERE sales_id NOT IN
  (SELECT 
    SalesPerson.sales_id
  FROM 
    SalesPerson
  INNER JOIN
   Orders ON Orders.sales_id=SalesPerson.sales_id
  INNER JOIN
   Company ON Company.com_id=Orders.com_id
  WHERE Company.name = "RED")