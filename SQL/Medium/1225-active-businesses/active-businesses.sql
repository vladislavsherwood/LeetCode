SELECT
    business_id
FROM
    (SELECT
        business_id, SUM(IF(occurences > average_activity,1,0)) as count_above_avg
    FROM
        Events e
    INNER JOIN
        (SELECT 
            event_type, 
            AVG(occurences) as average_activity
        FROM
            Events
        GROUP BY
            event_type) n ON n.event_type = e.event_type
    GROUP BY
        business_id
    HAVING
        count_above_avg > 1) as p