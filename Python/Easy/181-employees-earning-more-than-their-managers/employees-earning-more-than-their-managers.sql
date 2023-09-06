# Write your MySQL query statement below
Select
    A.name as Employee
From
    Employee as A,
    Employee as B
Where
    A.managerId = B.id
    And B.salary < A.salary