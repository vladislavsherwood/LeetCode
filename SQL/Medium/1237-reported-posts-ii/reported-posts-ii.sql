SELECT
    ROUND(AVG(am)*100,2) as average_daily_percent
FROM
    (SELECT
        COUNT(DISTINCT r.post_id)/COUNT(DISTINCT a.post_id) as am
    FROM
        Actions a
    LEFT JOIN 
        Removals r on a.post_id = r.post_id
    WHERE
        extra = "spam"
    GROUP BY
        action_date) as n
