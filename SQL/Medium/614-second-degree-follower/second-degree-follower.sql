SELECT 
  followee as follower, 
  COUNT(distinct follower) as num
FROM 
  Follow
WHERE   
  followee in (SELECT follower FROM Follow)
GROUP BY 
  followee
ORDER BY 
  followee
