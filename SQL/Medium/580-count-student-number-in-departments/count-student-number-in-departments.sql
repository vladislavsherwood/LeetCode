SELECT
    d.dept_name, COUNT(DISTINCT student_id) as student_number
FROM 
    Student s
RIGHT JOIN 
    Department d on d.dept_id = s.dept_id
GROUP BY
    d.dept_id
ORDER BY
    student_number DESC, dept_name
