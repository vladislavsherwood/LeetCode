SELECT
    COUNT(DISTINCT customer_id) as rich_count
FROM
    Store
WHERE
    amount > 500