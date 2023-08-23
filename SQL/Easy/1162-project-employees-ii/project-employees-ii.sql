WITH x AS
(SELECT 
    project_id,
    COUNT(employee_id) as amount
FROM
    Project
GROUP BY 
    project_id)

SELECT
    project_id
FROM
    x
WHERE x.amount = (SELECT MAX(amount) FROM x)
    

