USE spices;

SELECT 
    JSON_OBJECT(
        'client_name', c.name,
        'client_email', c.email,
        'all_orders',
            CONCAT(
                '[',
                GROUP_CONCAT(
                    JSON_OBJECT(
                        'order_id', so.id,
                        'status', so.status,
                        'date', so.createDate
                    )
                ),
                ']'
            )
    ) AS client_full_data
FROM 
    Customer AS c
JOIN 
    SpiceOrder AS so ON c.id = so.customerId
WHERE 
    c.id = 1
GROUP BY 
    c.id;
