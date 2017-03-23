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