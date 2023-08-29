SELECT 
    e.employee_id, n.team_size
FROM
    Employee e
LEFT JOIN 
    (SELECT
        team_id, COUNT(employee_id) as team_size
    FROM
        Employee
    GROUP BY
        team_id) n on n.team_id = e.team_id