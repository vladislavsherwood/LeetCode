SELECT 
    p.project_id, p.employee_id
FROM 
    Project p 
JOIN 
    Employee e on p.employee_id = e.employee_id
WHERE 
    (p.project_id, e.experience_years) in
        (SELECT
            p.project_id,
            MAX(experience_years)
        FROM
            Project p
        JOIN 
            Employee e ON p.employee_id = e.employee_id
        GROUP BY
            p.project_id);

