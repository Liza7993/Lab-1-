-- 1. Створюємо нового користувача 'spice_viewer'
-- Він може підключатися ТІЛЬКИ з локального ПК ('localhost')
use spices;
CREATE USER 'spice_viewer'@'localhost' IDENTIFIED BY 'viewer_pass_2025';

-- 2. Надаємо йому право ЛИШЕ ЧИТАТИ дані
-- Доступ даємо тільки до таблиці 'spice' у базі 'spices'
GRANT SELECT ON spices.spice TO 'spice_viewer'@'localhost';

-- 3. Оновлюємо таблиці привілеїв, щоб зміни набули чинності
FLUSH PRIVILEGES;
