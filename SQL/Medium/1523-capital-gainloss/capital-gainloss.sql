SELECT 
    stock_name,
    SUM(CASE WHEN operation = "Buy" THEN price * -1
    WHEN operation = "Sell" THEN price End) as capital_gain_loss
FROM 
    Stocks
GROUP BY 
    stock_name;