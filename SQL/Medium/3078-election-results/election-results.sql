WITH CTE AS 
  (SELECT candidate, SUM(vote_value) as votes
  FROM Votes v
  JOIN(
    SELECT voter, 1/COUNT(candidate) as vote_value
    FROM Votes
    GROUP BY voter) n on v.voter = n.voter
  GROUP BY candidate)

SELECT candidate
FROM CTE
WHERE votes = (SELECT max(votes) FROM CTE)
ORDER BY candidate