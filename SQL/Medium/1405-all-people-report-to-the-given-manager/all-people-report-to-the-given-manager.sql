WITH RECURSIVE CTE AS (
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 AND employee_id != 1

    UNION ALL

    SELECT e.employee_id
    FROM CTE
    INNER JOIN Employees e ON CTE.employee_id = e.manager_id
)

SELECT employee_id
FROM CTE