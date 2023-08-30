SELECT 
    question_id as survey_log
FROM
    (SELECT
        question_id,
        SUM(CASE 
        WHEN action = "answer" then 1 
        WHEN action = "skip" then 0 END) /
        COUNT(CASE 
        WHEN action = "show" then 1 END) as rate
    FROM
        SurveyLog
    GROUP BY
        question_id) d
ORDER BY
    rate DESC, question_id
LIMIT 1
