WITH CTE AS (
  SELECT activity, COUNT(name) as a
  FROM Friends
  GROUP BY activity
),

CTE2 AS (
  SELECT MAX(a) a
  FROM CTE 
  UNION ALL
  SELECT MIN(a) a
  FROM CTE
)

SELECT 
  activity
FROM 
  CTE
WHERE 
  a NOT IN (SELECT a FROM CTE2)