SELECT 
    b.book_id, b.name
FROM
    Books b
LEFT JOIN 
    (SELECT book_id, sum(quantity) AS amount
    FROM Orders 
    WHERE dispatch_date >= '2018-06-23'
    GROUP BY book_id) o ON b.book_id = o.book_id
WHERE
    b.available_from <= '2019-05-23' 
    AND (amount < 10 OR amount IS NULL);

