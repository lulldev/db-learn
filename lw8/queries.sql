1) Успешная транзакция

Начальное состояние таблицы:

schedule_place_id	film_rent_id	place_no	status	datetime
	1	4897	71	1	0000-00-00 00:00:00
	2	1259	19	1	0000-00-00 00:00:00
Транзакция:

START TRANSACTION;
UPDATE `film_schedule` SET `place_no` = 19 WHERE `schedule_place_id`  = 1;
UPDATE `film_schedule` SET `place_no` = 71 WHERE `schedule_place_id`  = 2;
COMMIT;

Описание: Обменяли номера местт у купленных билетов.

2) Транзакция с откатом

Начальное состояние таблицы:

schedule_place_id	film_rent_id	place_no	status	datetime
	1	4897	71	1	0000-00-00 00:00:00
	2	1259	19	1	0000-00-00 00:00:00

Транзакция:
START TRANSACTION;
UPDATE `film_schedule` SET `place_no` = 71 WHERE `schedule_place_id`  = 1;
UPDATE `film_schedule` SET `place_no` = 19 WHERE `schedule_place_id`  = 2;
ROLLBACK;

Описание: то же самое что и п.1, только с откатом (изменения не произошли)

3) Процедура заполнения расписания по конкретному прокату. (status=1) - в наличии
delimiter //
CREATE PROCEDURE cinema.GenerateSchedule(IN placeCount INT, IN filmRentId INT)
BEGIN
  DECLARE place INT DEFAULT 1;
  WHILE place <= placeCount DO
      INSERT INTO `film_schedule`( `film_rent_id`, `place_no`, `status`) VALUES (filmRentId, place, 1);
      SET place = place + 1;
  END WHILE;
END

4) Триггер для автоматической генерации рассылки при добавлении новых фильмов
CREATE TRIGGER `dispatch_film_add` AFTER INSERT ON `film`
FOR EACH ROW BEGIN
  INSERT INTO dispatch (film_id) VALUES (NEW.film_id);
END
