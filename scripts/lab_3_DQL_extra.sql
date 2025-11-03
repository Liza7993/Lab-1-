USE spices;

-- DQL: Агрегація (COUNT + GROUP BY)
-- Підраховуємо, скільки спецій належить до кожної категорії (наприклад, "прянощі", "трави", "суміші").
SELECT
  `categoryId`,
  COUNT(*) AS `total_spices`
FROM
  `Spice`
GROUP BY
  `categoryId`;

-- DQL: Агрегація (SUM)
-- Обчислюємо сумарну вартість усіх спецій у наявності (ціна × кількість).
SELECT
  SUM(`price` * `quantity`) AS `total_stock_value`
FROM
  `Spice`;

-- DQL: Агрегація (AVG, MIN, MAX)
-- Обчислюємо середню, мінімальну та максимальну ціну спецій у категорії №1 (наприклад, "Зернова кава").
SELECT
  AVG(`price`) AS `average_price`,
  MIN(`price`) AS `min_price`,
  MAX(`price`) AS `max_price`
FROM
  `Spice`
WHERE
  `categoryId` = 1;

-- DQL: Агрегація (GROUP BY + JOIN)
-- Підраховуємо, скільки кожен клієнт витратив у крамниці спецій
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

-- DQL: Фільтрація після агрегації (HAVING)
-- Визначаємо VIP-клієнтів, які витратили більше 1000 грн
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
HAVING
  total_spent > 1000
ORDER BY
  total_spent DESC;

-- DQL: INNER JOIN
-- Формуємо звіт: ім’я клієнта, товар, кількість і статус замовлення
SELECT
  c.name AS customer_name,
  s.name AS spice_name,
  soc.productQuantity AS quantity,
  so.status AS order_status
FROM
  Customer AS c
INNER JOIN
  SpiceOrder AS so ON c.id = so.customerId
INNER JOIN
  SpiceOrderContent AS soc ON so.id = soc.orderId
INNER JOIN
  Spice AS s ON soc.spiceId = s.id
WHERE
  so.status = 'completed'
ORDER BY
  c.name;

-- DQL: LEFT JOIN
-- Показуємо всіх клієнтів і, якщо є, їхні замовлення
SELECT
  c.name AS customer_name,
  so.id AS order_id
FROM
  Customer AS c
LEFT JOIN
  SpiceOrder AS so ON c.id = so.customerId
ORDER BY
  c.name;

-- DQL: Підзапит (Subquery)
-- Знаходимо спеції, які ще ніхто не замовляв
SELECT
  s.name AS spice_name
FROM
  Spice AS s
WHERE
  s.id NOT IN (
      SELECT DISTINCT soc.spiceId FROM SpiceOrderContent AS soc
  );

-- DQL: Комбінування вибірок (UNION)
-- Створюємо спільний список клієнтів і категорій спецій
SELECT
  c.name AS item_name,
  'Customer' AS item_type
FROM
  Customer AS c
UNION
SELECT
  sc.name AS item_name,
  'Category' AS item_type
FROM
  SpiceCategory AS sc
ORDER BY
  item_type, item_name;
