SELECT
    b.bus_id, COUNT(n.passenger_id) AS passengers_cnt
FROM
    (SELECT
        passenger_id, MIN(b.arrival_time) AS department_time
    FROM
        Passengers p
    LEFT JOIN 
        Buses b ON p.arrival_time <= b.arrival_time 
    GROUP BY 
        passenger_id) AS n
RIGHT JOIN
    Buses b ON b.arrival_time = n.department_time
GROUP BY
    b.bus_id
ORDER BY
    b.bus_id;

