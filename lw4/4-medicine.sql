-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 19 2017 г., 22:44
-- Версия сервера: 5.5.49
-- Версия PHP: 5.4.45-4+deprecated+dontuse+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `medicine`
--

-- --------------------------------------------------------

--
-- Структура таблицы `medicament`
--

CREATE TABLE IF NOT EXISTS `medicament` (
  `id_medicament` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id_medicament`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `medicament`
--

INSERT INTO `medicament` (`id_medicament`, `title`, `type`) VALUES
(1, 'Витаминки', 1),
(2, 'Гексорал', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `medicament_presence`
--

CREATE TABLE IF NOT EXISTS `medicament_presence` (
  `id_medicament` int(11) NOT NULL,
  `id_pharmacy` int(11) NOT NULL,
  `residue_count` int(11) NOT NULL,
  KEY `id_medicament` (`id_medicament`),
  KEY `id_pharmacy` (`id_pharmacy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `medicament_presence`
--

INSERT INTO `medicament_presence` (`id_medicament`, `id_pharmacy`, `residue_count`) VALUES
(1, 1, 50),
(1, 2, 100),
(2, 1, 150),
(2, 2, 120);

-- --------------------------------------------------------

--
-- Структура таблицы `medicament_type`
--

CREATE TABLE IF NOT EXISTS `medicament_type` (
  `id_medicament_type` int(11) NOT NULL,
  `type` enum('spray','tablets') NOT NULL,
  PRIMARY KEY (`id_medicament_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `medicament_type`
--

INSERT INTO `medicament_type` (`id_medicament_type`, `type`) VALUES
(1, 'spray'),
(2, 'tablets');

-- --------------------------------------------------------

--
-- Структура таблицы `pharmacy`
--

CREATE TABLE IF NOT EXISTS `pharmacy` (
  `id_pharmacy` int(11) NOT NULL AUTO_INCREMENT,
  `name_pharmacy` varchar(255) NOT NULL,
  `address_pharmacy` text NOT NULL,
  `owner_pharmacy` int(11) NOT NULL,
  PRIMARY KEY (`id_pharmacy`),
  KEY `owner_pharmacy` (`owner_pharmacy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `pharmacy`
--

INSERT INTO `pharmacy` (`id_pharmacy`, `name_pharmacy`, `address_pharmacy`, `owner_pharmacy`) VALUES
(1, 'Айболит', 'ул. Волкова, д. 1', 1),
(2, 'Микстура', 'ул. Ленина, д. 2', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `pharmacy_owner`
--

CREATE TABLE IF NOT EXISTS `pharmacy_owner` (
  `id_pharmacy_owner` int(11) NOT NULL,
  `name_owner` varchar(255) NOT NULL,
  `number_tax` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pharmacy_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pharmacy_owner`
--

INSERT INTO `pharmacy_owner` (`id_pharmacy_owner`, `name_owner`, `number_tax`) VALUES
(1, 'ИП Иванов С.Д.', '12332123123'),
(2, 'ПАО ФармКомпани', '12332123122');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `medicament_ibfk_1` FOREIGN KEY (`type`) REFERENCES `medicament_type` (`id_medicament_type`);

--
-- Ограничения внешнего ключа таблицы `medicament_presence`
--
ALTER TABLE `medicament_presence`
  ADD CONSTRAINT `medicament_presence_ibfk_2` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`),
  ADD CONSTRAINT `medicament_presence_ibfk_1` FOREIGN KEY (`id_pharmacy`) REFERENCES `pharmacy` (`id_pharmacy`);

--
-- Ограничения внешнего ключа таблицы `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`owner_pharmacy`) REFERENCES `pharmacy_owner` (`id_pharmacy_owner`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
