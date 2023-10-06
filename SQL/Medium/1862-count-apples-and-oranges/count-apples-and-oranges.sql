SELECT
    SUM(COALESCE(b.apple_count,0) + COALESCE(c.apple_count,0)) as apple_count, 
    SUM(COALESCE(b.orange_count,0) + COALESCE(c.orange_count,0)) AS orange_count
FROM
    Boxes b
LEFT JOIN Chests c ON b.chest_id = c.chest_id