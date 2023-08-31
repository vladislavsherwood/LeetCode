SELECT 
  followee as follower, 
  COUNT(distinct follower) as num
FROM 
  Follow
WHERE   
  followee in (SELECT follower FROM Follow)
GROUP BY 
  1
ORDER BY 
  1
