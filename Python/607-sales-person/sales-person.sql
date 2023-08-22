# Write your MySQL query statement below
Select name
From SalesPerson
Where sales_id not in
  (Select SalesPerson.sales_id
  From SalesPerson
  Inner join Orders on Orders.sales_id=SalesPerson.sales_id
  Inner Join Company on Company.com_id=Orders.com_id
  Where Company.name = "RED")