WITH paid_by AS (
    SELECT paid_by as user_id,SUM(amount)*-1 as amount
    FROM TRANSACTIONS
    GROUP BY paid_by
),
paid_to as(
    SELECT paid_to as user_id,SUM(amount) as amount
    FROM TRANSACTIONS
    GROUP BY paid_to
)

SELECT 
    u.user_id, 
    u.user_name, 
    COALESCE(pb.amount,0) + COALESCE(pt.amount,0) + COALESCE(u.credit,0) as credit,
    CASE WHEN COALESCE(pb.amount,0) + COALESCE(pt.amount,0) + COALESCE(u.credit,0) < 0 THEN 'Yes' ELSE 'No' END as credit_limit_breached
FROM 
    Users u
LEFT JOIN 
    paid_to pt on pt.user_id = u.user_id
LEFT JOIN 
    paid_by pb on pb.user_id = u.user_id