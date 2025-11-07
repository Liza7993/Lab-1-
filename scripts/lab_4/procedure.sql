-- Змінюємо стандартний роздільник ";" на "//"
DELIMITER //

-- 1. Створення процедури "Додати Нову Спецію"
CREATE PROCEDURE `sp_AddNewSpice`(
    IN p_name VARCHAR(255),          -- назва спеції
    IN p_description TEXT,           -- опис
    IN p_price DECIMAL(10,2),        -- ціна
    IN p_quantity INT,               -- кількість
    IN p_category_id INT             -- категорія
)
BEGIN
    -- Додаємо новий запис у таблицю Spice
    INSERT INTO `Spice`
        (`name`, `description`, `price`, `quantity`, `categoryId`)
    VALUES
        (p_name, p_description, p_price, p_quantity, p_category_id);
END //
-- Закінчили процедуру нашим новим роздільником "//"

-- Повертаємо стандартний роздільник ";"
DELIMITER ;
