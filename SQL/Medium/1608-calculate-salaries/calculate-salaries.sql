WITH CTE AS (
    SELECT company_id, MAX(salary) as salary
    FROM Salaries
    GROUP BY company_id
)

SELECT
    s.company_id,
    s.employee_id,
    s.employee_name,
    ROUND((CASE WHEN c.salary < 1000 THEN s.salary
    WHEN c.salary <= 10000 THEN s.salary * 76 / 100
    ELSE s.salary * 51 / 100 END),0) salary
FROM
    Salaries s
LEFT JOIN CTE c on c.company_id = s.company_id