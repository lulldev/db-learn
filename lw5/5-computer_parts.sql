-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 07 2017 г., 15:11
-- Версия сервера: 5.5.49
-- Версия PHP: 5.4.45-4+deprecated+dontuse+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `computer_parts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `computer`
--

CREATE TABLE IF NOT EXISTS `computer` (
  `id_computer` int(11) NOT NULL AUTO_INCREMENT,
  `computer_model` varchar(50) NOT NULL,
  `computer_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_computer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `computer`
--

INSERT INTO `computer` (`id_computer`, `computer_model`, `computer_name`) VALUES
(1, 'Samsung DS12313', 'Sumsung Cool 2'),
(2, 'Hackintosh SR123123', 'Hackintosh Cool 3');

-- --------------------------------------------------------

--
-- Структура таблицы `computer_part`
--

CREATE TABLE IF NOT EXISTS `computer_part` (
  `id_computer_part` int(11) NOT NULL AUTO_INCREMENT,
  `id_computer` int(11) NOT NULL,
  `id_hardware` int(11) NOT NULL,
  PRIMARY KEY (`id_computer_part`),
  KEY `id_computer` (`id_computer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `computer_part`
--

INSERT INTO `computer_part` (`id_computer_part`, `id_computer`, `id_hardware`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `computer_stock`
--

CREATE TABLE IF NOT EXISTS `computer_stock` (
  `id_stock_item` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id_stock_item`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `computer_stock`
--

INSERT INTO `computer_stock` (`id_stock_item`, `count`) VALUES
(1, 10),
(2, 20),
(3, 150);

-- --------------------------------------------------------

--
-- Структура таблицы `hardware`
--

CREATE TABLE IF NOT EXISTS `hardware` (
  `id_hardware` int(11) NOT NULL AUTO_INCREMENT,
  `hardware_name` varchar(11) NOT NULL,
  `hardware_type` int(11) NOT NULL,
  `presence_on_stock` int(11) NOT NULL,
  `id_hardware_part` int(11) NOT NULL,
  `id_hardware_price` int(11) NOT NULL,
  PRIMARY KEY (`id_hardware`),
  KEY `hardware_type` (`hardware_type`),
  KEY `presence_on_stock` (`presence_on_stock`),
  KEY `id_hardware_part` (`id_hardware_part`),
  KEY `id_hardware_price` (`id_hardware_price`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `hardware`
--

INSERT INTO `hardware` (`id_hardware`, `hardware_name`, `hardware_type`, `presence_on_stock`, `id_hardware_part`, `id_hardware_price`) VALUES
(1, 'Apple SSD', 1, 1, 1, 1),
(2, 'Samsung SSD', 1, 2, 2, 2),
(3, 'Intel Core ', 2, 3, 2, 3),
(4, 'Sony Monito', 3, 2, 3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `hardware_pricelist`
--

CREATE TABLE IF NOT EXISTS `hardware_pricelist` (
  `id_hardware_price` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id_hardware_price`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `hardware_pricelist`
--

INSERT INTO `hardware_pricelist` (`id_hardware_price`, `price`) VALUES
(1, 200),
(2, 200),
(3, 2000),
(4, 2500);

-- --------------------------------------------------------

--
-- Структура таблицы `hardware_type`
--

CREATE TABLE IF NOT EXISTS `hardware_type` (
  `id_hardware_type` int(11) NOT NULL AUTO_INCREMENT,
  `hardware_type` enum('disk','ram','rom','cpu','monitor') NOT NULL,
  PRIMARY KEY (`id_hardware_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `hardware_type`
--

INSERT INTO `hardware_type` (`id_hardware_type`, `hardware_type`) VALUES
(1, 'disk'),
(2, 'ram'),
(3, 'cpu');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`id_computer`) REFERENCES `computer_part` (`id_computer`);

--
-- Ограничения внешнего ключа таблицы `computer_part`
--
ALTER TABLE `computer_part`
  ADD CONSTRAINT `computer_part_ibfk_1` FOREIGN KEY (`id_computer_part`) REFERENCES `hardware` (`id_hardware_part`);

--
-- Ограничения внешнего ключа таблицы `computer_stock`
--
ALTER TABLE `computer_stock`
  ADD CONSTRAINT `computer_stock_ibfk_1` FOREIGN KEY (`id_stock_item`) REFERENCES `hardware` (`presence_on_stock`);

--
-- Ограничения внешнего ключа таблицы `hardware_pricelist`
--
ALTER TABLE `hardware_pricelist`
  ADD CONSTRAINT `hardware_pricelist_ibfk_1` FOREIGN KEY (`id_hardware_price`) REFERENCES `hardware` (`id_hardware_price`);

--
-- Ограничения внешнего ключа таблицы `hardware_type`
--
ALTER TABLE `hardware_type`
  ADD CONSTRAINT `hardware_type_ibfk_1` FOREIGN KEY (`id_hardware_type`) REFERENCES `hardware` (`hardware_type`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
