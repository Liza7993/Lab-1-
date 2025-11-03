USE spices;

-- DML: Додавання нового користувача (customer)
INSERT INTO `customer` (`name`, `email`, `hash`) VALUES
('Ліа Кравченко', 'lia.kravc@gmail.com', 'hash_xyz_9');


-- DML: Додавання нового товару (spice)
INSERT INTO `spice` (`name`, `description`, `price`, `quantity`, `categoryId`) VALUES
('Зелений кардамон', 'Високоякісні зелені стручки кардамону з насиченим ароматом. Ідеальний для десертів і кави.', 580.00, 50, 2);


-- DML: Оновлення ціни товару (Update)
UPDATE `spice`
SET `price` = 965.00
WHERE `name` = 'Мадагаскарська ваніль';


-- DML: Видалення позиції з замовлення (Delete)
DELETE FROM `spiceordercontent`
WHERE `orderId` = 2 AND `spiceId` = 8;


-- DQL: Фільтрація (WHERE + AND)
SELECT *
FROM `spice`
WHERE `categoryId` = 1 AND `price` < 400;


-- DQL: Фільтрація (WHERE + IN)
SELECT *
FROM `spiceorder`
WHERE `status` IN ('shipped', 'completed');


-- DQL: Фільтрація (WHERE + LIKE)
SELECT *
FROM `customer`
WHERE `email` LIKE '%@gmail.com';


-- DQL: Сортування (ORDER BY)
SELECT *
FROM `spice`
ORDER BY `price` DESC;
