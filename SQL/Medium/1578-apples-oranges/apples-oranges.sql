SELECT 
    sale_date,
    SUM(CASE WHEN fruit = "apples" then sold_num 
    WHEN fruit = "oranges" then sold_num * -1 END) as diff
FROM
    Sales
GROUP BY
    sale_date