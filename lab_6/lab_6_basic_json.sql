use spices;
-- Перетворюємо дані спеції з id = 1 на JSON-об'єкт
SELECT 
    JSON_OBJECT(
        'spice_id', id,          -- id спеції
        'spice_name', name,      -- назва спеції
        'spice_price', price,    -- її ціна
        'in_stock', quantity     -- кількість на складі
    ) AS spice_json_data
FROM 
    spice
WHERE 
    id = 1;
