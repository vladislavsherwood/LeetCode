SELECT
    seat_id
FROM
    (SELECT 
        seat_id,
        free,
        LAG(free,1) OVER (ORDER BY seat_id) as lag_seat,
        LEAD(free,1) OVER (ORDER BY seat_id) as lead_seat
    FROM 
        Cinema) as c
WHERE
    free = 1 and (lag_seat = 1 or lead_seat = 1)
ORDER BY
    seat_id