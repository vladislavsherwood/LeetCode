WITH CTE AS (
    SELECT
        host_team,
        guest_team,
        (CASE WHEN host_goals > guest_goals THEN 3
        WHEN host_goals = guest_goals THEN 1
        ELSE 0 END) as host_points,
        (CASE WHEN host_goals < guest_goals THEN 3
        WHEN host_goals = guest_goals THEN 1
        ELSE 0 END) as guest_points
    FROM
        Matches),
CTE2 AS (
    SELECT 
        host_team as team_id, SUM(host_points) as num_points
    FROM 
        CTE
    GROUP BY
        host_team

    UNION ALL

    SELECT 
        guest_team as team_id, SUM(guest_points) as num_points
    FROM 
        CTE
    GROUP BY
        guest_team)

SELECT
    t.team_id, team_name, COALESCE(SUM(num_points),0) as num_points
FROM
    CTE2
RIGHT JOIN
    Teams t on CTE2.team_id = t.team_id
GROUP BY
    t.team_id
ORDER BY
    num_points DESC, team_id;
