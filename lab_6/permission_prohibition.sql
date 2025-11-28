-- Це має спрацювати, бо ми дали права SELECT
SELECT * FROM spice;

-- Це має викликати ПОМИЛКУ, бо ми не давали прав DELETE
DELETE FROM spice WHERE id = 1;

