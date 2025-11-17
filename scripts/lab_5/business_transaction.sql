USE spices;

-- (Необов'язково) Перевірка залишків перед транзакцією
SELECT id, name, quantity 
FROM Spice 
WHERE id IN (1, 4);

-- Початок транзакції
START TRANSACTION;

-- 1) Створюємо нове замовлення
INSERT INTO `SpiceOrder` (`status`, `createDate`, `customerId`)
VALUES ('pending', NOW(), 3);

-- Зберігаємо ID нового замовлення
SET @new_order_id = LAST_INSERT_ID();

-- 2) Додаємо позиції замовлення (ціна береться актуальна з таблиці Spice)
INSERT INTO `SpiceOrderContent` (`orderId`, `spiceId`, `productPrice`, `productQuantity`)
VALUES
    (@new_order_id, 1, (SELECT price FROM Spice WHERE id = 1), 2),
    (@new_order_id, 4, (SELECT price FROM Spice WHERE id = 4), 1);

-- 3) Зменшуємо запаси товарів
UPDATE `Spice` 
SET quantity = quantity - 2 
WHERE id = 1;

UPDATE `Spice` 
SET quantity = quantity - 1 
WHERE id = 4;

-- 4) Завершуємо замовлення
UPDATE `SpiceOrder`
SET status = 'completed'
WHERE id = @new_order_id;

-- Фіксуємо всі внесені зміни
COMMIT;

-- Перевірка результату
SELECT 
    so.id AS order_id,
    so.status,
    soc.spiceId,
    soc.productQuantity,
    s.quantity AS remaining_stock
FROM SpiceOrder AS so
JOIN SpiceOrderContent AS soc ON so.id = soc.orderId
JOIN Spice AS s ON soc.spiceId = s.id
WHERE so.id = @new_order_id;
