WITH CTE AS (
    SELECT 
        home_team_id as first_team,
        away_team_id as second_team,
        home_team_goals as first_team_goals,
        away_team_goals as second_team_goals
    FROM Matches

    UNION ALL

    SELECT
        away_team_id as first_team,
        home_team_id as second_team,
        away_team_goals as first_team_goals,
        home_team_goals as second_team_goals
    FROM Matches
)


SELECT 
    team_name,
    COUNT(second_team) as matches_played,
    SUM(CASE WHEN first_team_goals > second_team_goals THEN 3
    WHEN first_team_goals = second_team_goals THEN 1
    ELSE 0 END) as points,
    SUM(first_team_goals) as goal_for,
    SUM(second_team_goals) as goal_against,
    SUM(first_team_goals) - SUM(second_team_goals) as goal_diff
FROM
    CTE
JOIN Teams t ON CTE.first_team = t.team_id
GROUP BY
    first_team
ORDER BY
    points DESC, 
    goal_diff DESC,
    team_name
