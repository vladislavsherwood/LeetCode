SELECT 
  ROUND(
  COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN "immediate" END) 
  / COUNT(order_date) * 100,2) AS immediate_percentage
FROM 
    Delivery;
