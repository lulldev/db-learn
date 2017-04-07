-- 1.1 --
INSERT INTO  `medicine`.`medicament` VALUES ('3',  'Кагоцел',  '2');
-- 1.2 --
INSERT INTO  `medicine`.`medicament` (`id_medicament` ,`title` ,`type`) VALUES ('3',  'Кагоцел',  '2');
-- 1.3 --
INSERT INTO `medicament_presence` (`id_medicament`, `id_pharmacy`, residue_count)
SELECT mt.id_medicament, ph.id_pharmacy, 10
FROM medicament mt, pharmacy ph
WHERE mt.id_medicament = 1 AND ph.id_pharmacy = 2

-- 2.1 --
DELETE FROM `medicament_presence`
-- 2.2 --
DELETE FROM `medicament_presence` WHERE `residue_count` < 10
-- 2.3 -- 
TRUNCATE pharmacy_owner

-- 3.1 --
UPDATE `medicament_presence` SET `residue_count` = 0
-- 3.2 --
UPDATE `medicament_presence` SET `residue_count` = 10 WHERE `id_medicament` = 2
-- 3.3 --
UPDATE `medicament` SET `title` = 'Аскорбинки', `type` = 2 WHERE `id_medicament` = 3

-- 4.1 --
SELECT `id_medicament`, `title` FROM `medicament`
-- 4.2 --
SELECT * FROM `medicament_type`
-- 4.3 --
SELECT * FROM `medicament_presence` WHERE `id_medicament` = 2


-- Необходимо написать/создать sql запросы: -- 

-- 1.1 SELECT LIMIT/TOP -- 

--  2. WHERE-- 
-- 2.1 NULL -- 
SELECT * FROM `hardware_price` WHERE price IS NULL

-- 2.2 NOT NULL -- 
SELECT * FROM `computer_stock` WHERE count IS NOT NULL

-- 2.3 условный оператор BETWEEN -- 
SELECT * FROM `hardware_price` WHERE count BETWEEN 100 AND 2000

-- 2.4 условный оператор IN --

-- 2.5 = -- 
SELECT * FROM `computer` WHERE id_computer IN(1,2)

--  2.6 != -- 
SELECT * FROM `computer_part` WHERE id_hardware NOT IN(1, 2)

-- 3. ORDER -- 
-- 3.1 ASC -- 
SELECT * FROM `computer` ORDER BY computer_model

-- 3.2 DESC -- 
-- 3.3 по двум аттрибутам -- 
SELECT * FROM `hardware` ORDER BY hardware_name, hardware_type DESC

-- 3.4 по первому аттрибуту, из списка извлекаемых -- 
SELECT * FROM `hardware` ORDER BY 1 DESC

-- 4. Функции агрегации -- 
-- 4.1 MIN -- 
SELECT MIN(count) FROM `computer_stock`

-- 4.2 MAX -- 
SELECT MAX(price) FROM `hardware_pricelist`

-- 4.3 AVG -- 
SELECT AVG(price) FROM `hardware_pricelist` WHERE id_hardware_price > 1

-- 4.4 SUM -- 
SELECT id_stock_item, SUM(count) as 'Sum' FROM `computer_stock`

-- 5.1 DISTINCT -- 
SELECT DISTINCT(*) FROM `computer_part`

-- 5.2 COUNT(DISTINCT X) -- 
SELECT id_hardware, COUNT(DISTINCT(count)) FROM `computer_stock`

-- 6 GROUP BY -- 
-- 6.1 SUM GROUP BY -- 
SELECT * FROM hardware GROUP BY hardware_type

-- 6.2 SUM WHERE GROUP BY -- 
SELECT * FROM hardware GROUP BY hardware_type WHERE id_hardware_part = 2

-- 6.3 SUM GROUP BY HAVING -- 
SELECT * FROM hardware GROUP BY hardware_type HAVING hardware_type > 1