SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.salary 
FROM 
    Employee AS e
INNER JOIN 
    Department AS d ON d.id = e.departmentId
WHERE 
    (SELECT 
        Count(Distinct Salary)
    FROM 
        Employee as r
    WHERE 
        r.salary > e.salary AND r.DepartmentId = e.DepartmentId) < 3
