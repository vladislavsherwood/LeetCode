SELECT d.name AS Department, e.name AS Employee, e.salary 
FROM Employee AS e
INNER JOIN Department AS d
ON d.id = e.departmentId
WHERE (
  Select Count(Distinct Salary)
  From Employee as r
  where r.salary > e.salary
  and r.DepartmentId = e.DepartmentId) < 3
