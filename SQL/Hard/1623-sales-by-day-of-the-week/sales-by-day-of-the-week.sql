SELECT
    item_category CATEGORY,
    COALESCE(SUM(CASE WHEN WEEKDAY(order_date) = 0 THEN quantity END),0) as MONDAY,
    COALESCE(SUM(CASE WHEN WEEKDAY(order_date) = 1 THEN quantity END),0) as TUESDAY,
    COALESCE(SUM(CASE WHEN WEEKDAY(order_date) = 2 THEN quantity END),0) as WEDNESDAY,
    COALESCE(SUM(CASE WHEN WEEKDAY(order_date) = 3 THEN quantity END),0) as THURSDAY,
    COALESCE(SUM(CASE WHEN WEEKDAY(order_date) = 4 THEN quantity END),0) as FRIDAY,
    COALESCE(SUM(CASE WHEN WEEKDAY(order_date) = 5 THEN quantity END),0) as SATURDAY,
    COALESCE(SUM(CASE WHEN WEEKDAY(order_date) = 6 THEN quantity END),0) as SUNDAY
FROM
    Orders o
RIGHT JOIN 
    Items i on i.item_id = o.item_id
GROUP BY
    item_category
ORDER BY
    CATEGORY