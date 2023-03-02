-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 09 2019 г., 21:51
-- Версия сервера: 10.1.38-MariaDB
-- Версия PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `magazin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `notebook`
--

CREATE TABLE `notebook` (
  `code` bigint(20) NOT NULL,
  `Number` int(11) NOT NULL,
  `speed` bigint(20) DEFAULT NULL,
  `RAM` bigint(20) DEFAULT NULL,
  `HD` bigint(20) DEFAULT NULL,
  `screen` bigint(20) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `notebook`
--

INSERT INTO `notebook` (`code`, `Number`, `speed`, `RAM`, `HD`, `screen`, `Price`) VALUES
(1, 7, 2000, 2000, 512, 19, 25000),
(2, 10, 2000, 3000, 1000, 24, 35000);

-- --------------------------------------------------------

--
-- Структура таблицы `pc`
--

CREATE TABLE `pc` (
  `code` bigint(20) NOT NULL,
  `Number` int(11) NOT NULL,
  `speed` bigint(20) DEFAULT NULL,
  `RAM` bigint(20) DEFAULT NULL,
  `HD` bigint(20) DEFAULT NULL,
  `reading speed` bigint(20) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `pc`
--

INSERT INTO `pc` (`code`, `Number`, `speed`, `RAM`, `HD`, `reading speed`, `Price`) VALUES
(1, 1, 1100, 1000, 500, 52, 20000),
(2, 2, 1500, 2000, 500, 52, 25000),
(3, 3, 1500, 2000, 1000, 49, 28000),
(4, 6, 2000, 2500, 1000, 52, 29000),
(5, 9, 2000, 3000, 1000, 52, 32000);

-- --------------------------------------------------------

--
-- Структура таблицы `printer`
--

CREATE TABLE `printer` (
  `code` bigint(20) NOT NULL,
  `Number` int(11) NOT NULL,
  `Color` tinyint(1) DEFAULT NULL,
  `Type` varchar(24) DEFAULT 'Лазерный',
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `printer`
--

INSERT INTO `printer` (`code`, `Number`, `Color`, `Type`, `Price`) VALUES
(1, 4, 1, 'Лазерный', 15000),
(2, 5, 0, 'Струйный', 2000),
(3, 8, 0, 'Лазерный', 4000);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `Number` int(11) NOT NULL,
  `Producer` varchar(35) DEFAULT NULL,
  `Type` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`Number`, `Producer`, `Type`) VALUES
(1, 'Америка', 'Компьютер'),
(2, 'Африка', 'Компьютер'),
(3, 'Украина', 'Компьютер'),
(4, 'Украина', 'Принтер'),
(5, 'Япония', 'Принтер'),
(6, 'Америка', 'Компьютер'),
(7, 'Украина', 'Ноутбук'),
(8, 'Китай', 'Принтер'),
(9, 'Америка', 'Компьютер'),
(10, 'Китай', 'Ноутбук');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`code`),
  ADD KEY `pn` (`Number`);

--
-- Индексы таблицы `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`code`),
  ADD KEY `ppc` (`Number`);

--
-- Индексы таблицы `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`code`),
  ADD KEY `ppr` (`Number`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Number`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `notebook`
--
ALTER TABLE `notebook`
  ADD CONSTRAINT `pn` FOREIGN KEY (`Number`) REFERENCES `product` (`Number`);

--
-- Ограничения внешнего ключа таблицы `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `ppc` FOREIGN KEY (`Number`) REFERENCES `product` (`Number`);

--
-- Ограничения внешнего ключа таблицы `printer`
--
ALTER TABLE `printer`
  ADD CONSTRAINT `ppr` FOREIGN KEY (`Number`) REFERENCES `product` (`Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
