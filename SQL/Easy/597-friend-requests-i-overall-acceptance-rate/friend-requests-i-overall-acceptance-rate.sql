SELECT 
    COALESCE(ROUND(COUNT(distinct requester_id,accepter_id)/
    COUNT(distinct sender_id,send_to_id),2),0.00) as accept_rate
FROM 
    FriendRequest, 
    RequestAccepted
