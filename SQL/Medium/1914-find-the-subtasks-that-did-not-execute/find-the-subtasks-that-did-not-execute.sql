WITH RECURSIVE CTE AS(
    SELECT task_id, subtasks_count
    FROM Tasks
    UNION ALL
    SELECT task_id, subtasks_count - 1
    FROM CTE
    WHERE subtasks_count >= 2
)

SELECT task_id, subtasks_count as subtask_id
FROM CTE
WHERE (task_id, subtasks_count) NOT IN (SELECT * FROM Executed) 
ORDER BY task_id, subtasks_count