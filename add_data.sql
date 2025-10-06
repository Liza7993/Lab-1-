use spices;
INSERT INTO Customer (name, email, hash, registrationDate) VALUES
('Anna Novak', 'anna.novak@example.com', 'hash123', NOW()),
('Oleh Petrenko', 'oleh.petrenko@example.com', 'hash456', NOW()),
('Maria Bondar', 'maria.bondar@example.com', 'hash789', NOW());

INSERT INTO SpiceCategory (name, description) VALUES
('Азійські спеції', 'Спеції, що використовуються у стравах Азії, з гострим і насиченим смаком'),
('Європейські спеції', 'Класичні трави і приправи, популярні у європейській кухні'),
('Африканські спеції', 'Ароматні суміші спецій із півдня та сходу Африки');

INSERT INTO Spice (name, description, price, quantity, categoryId) VALUES
('Карі', 'Суміш індійських спецій із насиченим ароматом', 120.50, 25, 1),
('Базилік сушений', 'Популярна пряність для італійських страв', 80.00, 40, 2),
('Перець кайєнський', 'Дуже гострий червоний перець', 95.30, 30, 1),
('Суміш «Бербере»', 'Традиційна ефіопська суміш спецій', 130.00, 15, 3);

INSERT INTO SpiceOrder (status, createDate, customerId) VALUES
('Опрацьовується', NOW(), 1),
('Виконано', NOW(), 2),
('Очікує оплати', NOW(), 3);

INSERT INTO SpiceOrderContent (orderId, spiceId, productPrice, productQuantity) VALUES
(1, 1, 120.50, 2),
(1, 3, 95.30, 1),
(2, 2, 80.00, 3),
(3, 4, 130.00, 1);
