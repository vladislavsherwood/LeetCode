
SELECT
    left_operand,
    operator,
    right_operand,
    (CASE WHEN operator = "=" and v1.value = v2.value THEN 'true'
    WHEN operator = ">" and v1.value > v2.value THEN 'true'
    WHEN operator = "<" and v1.value < v2.value THEN 'true'
    ELSE 'false' END) as value
FROM
    Expressions
LEFT JOIN 
    Variables v1 ON left_operand = v1.name
LEFT JOIN 
    Variables v2 ON right_operand = v2.name
