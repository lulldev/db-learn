-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 06 2017 г., 12:19
-- Версия сервера: 5.5.49
-- Версия PHP: 5.4.45-4+deprecated+dontuse+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `hotels`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_fullname` varchar(100) NOT NULL,
  `identity_document` int(11) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `hotel_room`
--

CREATE TABLE IF NOT EXISTS `hotel_room` (
  `room_id` int(11) NOT NULL COMMENT 'номер комнаты',
  `floor` smallint(6) NOT NULL,
  `status` enum('vip','lux','standart','econom') NOT NULL,
  `room_count` smallint(6) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `reserve_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `duration_hours` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed_time` datetime NOT NULL,
  `datetime_from` datetime NOT NULL,
  PRIMARY KEY (`reserve_id`),
  UNIQUE KEY `reserve_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reserved_room`
--

CREATE TABLE IF NOT EXISTS `reserved_room` (
  `reserve_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `clients_count` int(11) NOT NULL,
  PRIMARY KEY (`reserve_id`),
  UNIQUE KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Ограничения внешнего ключа таблицы `reserved_room`
--
ALTER TABLE `reserved_room`
  ADD CONSTRAINT `reserved_room_ibfk_1` FOREIGN KEY (`reserve_id`) REFERENCES `reservation` (`reserve_id`),
  ADD CONSTRAINT `reserved_room_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `hotel_room` (`room_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
