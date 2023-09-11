SELECT 
    MIN(log_id) start_id, MAX(log_id) end_id
FROM
    (SELECT
        log_id, log_id - ROW_NUMBER() OVER (ORDER BY log_id) as grp
    FROM
        Logs) n
GROUP BY
    grp;