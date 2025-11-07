	use spices;
	-- Змінюємо стандартний роздільник ";" на "//"
DELIMITER //

-- 1. Створення тригера, який спрацьовує
--    ПЕРЕД (BEFORE) ОНОВЛЕННЯМ (UPDATE)
--    на таблиці Spice
CREATE TRIGGER `trg_Spice_BeforeUpdate`
BEFORE UPDATE ON `Spice`
FOR EACH ROW
BEGIN
    -- NEW — рядок після оновлення
    -- Записуємо поточну дату і час в updated_at
    SET NEW.updated_at = NOW();
END //
-- Закінчили тригер нашим новим роздільником "//"

-- Повертаємо стандартний роздільник ";"
DELIMITER ;
