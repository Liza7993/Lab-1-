-- Створюємо індекс
-- idx_users_name - це просто ім'я для нашого індексу
-- ON `Users` (`name`) - вказуємо, яку таблицю та колонку індексувати
CREATE INDEX `idx_customer_name` ON spices.`customer` (`name`);
