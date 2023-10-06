SELECT
    (CASE WHEN from_id > to_id THEN to_id ELSE from_id END) as person1,
    (CASE WHEN from_id > to_id THEN from_id ELSE to_id END) as person2,
    COUNT(duration) as call_count,
    SUM(duration) as total_duration
FROM 
    Calls
GROUP BY
    CONCAT((CASE WHEN from_id > to_id THEN to_id ELSE from_id END),
    (CASE WHEN from_id > to_id THEN from_id ELSE to_id END))
