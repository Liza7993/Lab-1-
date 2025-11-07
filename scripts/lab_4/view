-- Створення представлення "v_Customer_Spending"
-- Це VIEW об’єднує таблиці Customer, SpiceOrder і SpiceOrderContent
-- та формує готовий звіт із сумарними витратами клієнтів

CREATE VIEW `v_Customer_Spending` AS
SELECT
    c.name AS customer_name,
    SUM(soc.productQuantity * soc.productPrice) AS total_spent
FROM
    Customer AS c
JOIN
    SpiceOrder AS so ON c.id = so.customerId
JOIN
    SpiceOrderContent AS soc ON so.id = soc.orderId
GROUP BY
    c.id, c.name
ORDER BY
    total_spent DESC;
