-- Calculating chargeback statistics for each month and country.
WITH CTE AS 
    (SELECT
        LEFT(c.trans_date,7) month,
        country,
        COUNT(trans_id) chargeback_count,
        SUM(amount) chargeback_amount
    FROM
        Chargebacks c
    LEFT JOIN 
        Transactions t ON id = trans_id
    GROUP BY
        LEFT(c.trans_date,7), country),

-- Calculating approved transaction statistics for each month and country.
CTE2 as
    (SELECT 
        LEFT(trans_date,7) month,
        country,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) approved_count,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) approved_amount
    FROM 
        Transactions
    GROUP BY
        LEFT(trans_date,7), country),

-- Combining all unique months and countries from both Chargebacks and Transactions.
AllMonths AS (
    SELECT 
        LEFT(trans_date, 7) month, country
    FROM 
        Transactions
    UNION
    SELECT
        LEFT(c.trans_date, 7) AS month, t.country
    FROM Chargebacks c
    JOIN Transactions t on id = trans_id 
)


-- Combining the results from the CTEs to produce the final report.
SELECT
    am.month,
    am.country,
    COALESCE(approved_count, 0) approved_count,
    COALESCE(approved_amount, 0) approved_amount,
    COALESCE(chargeback_count, 0) chargeback_count,
    COALESCE(chargeback_amount, 0) chargeback_amount
FROM
    AllMonths am
LEFT JOIN
    CTE ON am.month = CTE.month and am.country = CTE.country
LEFT JOIN
    CTE2 ON am.month = CTE2.month and am.country = CTE2.country
WHERE
    approved_count <> 0 or chargeback_count <> 0
ORDER BY
    am.month, CTE.country