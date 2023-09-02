#Adds a column with the time of previous bus
WITH RECURSIVE helper1 as (
    SELECT 
        bus_id,
        arrival_time,
        capacity, 
        COALESCE(LAG(arrival_time) OVER(ORDER BY arrival_time),0) as previous_time
    FROM 
        Buses
),

#Adds a column that displays the number of people who have arrived at the bus stop between buses
helper2 as (
    SELECT
        h1.bus_id,
        h1.arrival_time,
        h1.capacity, 
        h1.previous_time,
        COALESCE(COUNT(passenger_id),0) as passengers,
        ROW_NUMBER() OVER (ORDER BY h1.arrival_time) as row_num
    FROM
        helper1 h1
    LEFT JOIN 
        Passengers p ON p.arrival_time <= h1.arrival_time AND p.arrival_time > h1.previous_time
    GROUP BY
        h1.bus_id
    ),

#Recursuve CTE:
main AS (
    #First Row
    SELECT 
        row_num,
        bus_id,
        LEAST(capacity, passengers) as passengers_cnt,
        passengers - LEAST(capacity, passengers) as remaining
    FROM
        helper2
    WHERE
        row_num = 1

UNION ALL

    SELECT
    #Other rows based on remaining from 1 row (JOIN)
        h2.row_num,
        h2.bus_id,
        LEAST(capacity, passengers + remaining) as passengers_cnt,
        (passengers + remaining) - LEAST(capacity, passengers + remaining) as remaining
    FROM
        helper2 h2
    INNER JOIN main m ON
        h2.row_num = m.row_num + 1
    
)

SELECT
    bus_id,
    passengers_cnt
FROM
    main
ORDER BY
    bus_id;

