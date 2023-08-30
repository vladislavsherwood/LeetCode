SELECT 
    a1.player_id,
    a1.event_date,
    SUM(a1.games_played) OVER(PARTITION BY a1.player_id ORDER BY a1.event_date) as games_played_so_far
FROM
    Activity a1, Activity a2
WHERE
    a1.event_date <= a2.event_date
GROUP BY
    a1.player_id, a1.event_date
ORDER BY
     a1.player_id