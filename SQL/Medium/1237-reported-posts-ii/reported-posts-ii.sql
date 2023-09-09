SELECT
    ROUND(AVG(am)*100,2) AS average_daily_percent
FROM
    (SELECT
        COUNT(DISTINCT r.post_id)/COUNT(DISTINCT a.post_id) AS am
    FROM
        Actions a
    LEFT JOIN 
        Removals r ON a.post_id = r.post_id
    WHERE
        extra = "spam"
    GROUP BY
        action_date) AS n
