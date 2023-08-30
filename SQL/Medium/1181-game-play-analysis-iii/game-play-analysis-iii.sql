SELECT 
    a2.player_id,
    a2.event_date,
    SUM(a1.games_played) as games_played_so_far
FROM
    Activity a1, Activity a2
WHERE
    a1.event_date <= a2.event_date AND a1.player_id = a2.player_id
GROUP BY
    a2.player_id, a2.event_date;