USE spices;

-- =========================
-- ДО: план виконання без індексу
-- =========================
EXPLAIN
SELECT 
    so.id AS order_id,
    c.name AS customer_name,
    s.name AS spice_name,
    soc.productQuantity,
    soc.productPrice
FROM SpiceOrder AS so
JOIN Customer AS c ON so.customerId = c.id
JOIN SpiceOrderContent AS soc ON soc.orderId = so.id
JOIN Spice AS s ON soc.spiceId = s.id
WHERE c.id = 3;

-- =========================
-- Створюємо індекс для оптимізації (якщо ще не існує)
-- =========================
CREATE INDEX IF NOT EXISTS idx_spiceorder_customer ON SpiceOrder(customerId);

-- =========================
-- ПІСЛЯ: план виконання після створення індексу
-- =========================
EXPLAIN
SELECT 
    so.id AS order_id,
    c.name AS customer_name,
    s.name AS spice_name,
    soc.productQuantity,
    soc.productPrice
FROM SpiceOrder AS so
JOIN Customer AS c ON so.customerId = c.id
JOIN SpiceOrderContent AS soc ON soc.orderId = so.id
JOIN Spice AS s ON soc.spiceId = s.id
WHERE c.id = 3;
