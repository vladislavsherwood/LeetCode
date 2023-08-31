SELECT
    name
FROM
    Candidate
WHERE
    id =
        (SELECT
            candidateId
        FROM
            VOTE
        GROUP BY
            candidateId
        ORDER BY
            COUNT(id) desc
        LIMIT 1);


