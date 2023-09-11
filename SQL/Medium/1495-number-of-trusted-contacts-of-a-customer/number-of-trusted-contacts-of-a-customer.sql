SELECT
    invoice_id, 
    customer_name, 
    price, 
    COUNT(DISTINCT con.contact_name) as contacts_cnt, 
    SUM(CASE WHEN contact_email in (SELECT email FROM Customers)  THEN 1 ELSE 0 END) as trusted_contacts_cnt
FROM
    Invoices i
LEFT JOIN 
    Contacts con on con.user_id = i.user_id
LEFT JOIN 
    Customers cus on cus.customer_id = i.user_id
GROUP BY
    invoice_id
ORDER BY
    invoice_id
    