SELECT 
  followee AS follower, 
  COUNT(distinct follower) AS num
FROM 
  Follow
WHERE   
  followee in (SELECT follower FROM Follow)
GROUP BY 
  followee
ORDER BY 
  followee
