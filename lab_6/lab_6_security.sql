use spices;
-- 1. Створюємо користувача для бекенду
CREATE USER 'spice_backend'@'localhost' IDENTIFIED BY 'pass_secure_456';

-- 2. Дозволяємо ЧИТАТИ спеції та клієнтів
GRANT SELECT ON spices.spice TO 'spice_backend'@'localhost';
GRANT SELECT ON spices.customer TO 'spice_backend'@'localhost';

-- 3. Дозволяємо бекенду створювати НОВІ замовлення
GRANT SELECT, INSERT ON spices.spiceorder TO 'spice_backend'@'localhost';

-- (Якщо є додаткова таблиця order_items — аналогічно)
-- GRANT SELECT, INSERT ON spices.order_items TO 'spice_backend'@'localhost';

-- 4. Застосовуємо зміни
FLUSH PRIVILEGES;
