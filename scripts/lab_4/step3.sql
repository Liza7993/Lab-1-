-- 1. Додаємо нову колонку в таблицю Spice
--    для збереження дати останнього оновлення
ALTER TABLE `Spice`
ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL
AFTER `categoryId`;
