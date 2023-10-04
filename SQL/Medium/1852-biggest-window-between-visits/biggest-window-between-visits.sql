WITH visits AS (
    SELECT ROW_NUMBER() OVER (ORDER BY user_id, visit_date) as row_num, user_id, visit_date
    FROM UserVisits
    ORDER BY user_id, visit_date
)

SELECT v1.user_id, MAX(DATEDIFF(COALESCE(v2.visit_date,'2021-1-1'),v1.visit_date)) as biggest_window
FROM visits v1
LEFT JOIN visits v2 on v1.row_num +1 = v2.row_num and v1.user_id = v2.user_id
GROUP BY v1.user_id