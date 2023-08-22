SELECT
    COUNT(DISTINCT customer_id) rich_count
FROM
    Store s
WHERE
    amount > 500