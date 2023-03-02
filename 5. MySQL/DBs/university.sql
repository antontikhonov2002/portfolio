-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 09 2019 г., 21:52
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
-- База данных: `university`
--

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `tid` int(11) DEFAULT NULL,
  `title` varchar(25) DEFAULT NULL,
  `length` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`id`, `tid`, `title`, `length`) VALUES
(1, 1, 'php', 54),
(2, 1, 'xml', 72),
(3, 2, 'sql', 25),
(4, 9, 'МОС', 90),
(5, 6, 'ФВх', 60),
(6, 9, 'Мос', 90),
(7, 7, 'КЛоГ', 120),
(8, 6, 'СПро', 150),
(9, 8, 'СЦОИ', 150),
(10, 5, 'ТИК', 180),
(11, 91, 'АК', 300);

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `tid` int(11) DEFAULT NULL,
  `course` varchar(25) DEFAULT NULL,
  `date` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`id`, `tid`, `course`, `date`) VALUES
(1, 1, 'php', '2015-05-04'),
(2, 1, 'xml', '2016-13-12'),
(3, 1, 'php', '2016-10-04'),
(4, 2, 'php', '2016-10-03'),
(5, 9, 'Мос', '2016-09-13'),
(6, 5, 'ТИК', '2016-09-23'),
(7, 7, 'КЛоГ', '2016-10-23'),
(8, 6, 'СПро', '2016-10-24');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `zarplata` int(11) DEFAULT NULL,
  `premia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `code`, `zarplata`, `premia`) VALUES
(1, 'Иванов', 1, 10000, 500),
(2, 'Петров', 1, 15000, 1000),
(3, 'Сидоров', 1, 14000, 800),
(4, 'Боброва', 1, 11000, 800),
(5, 'Халимов', 1, 10000, 12000),
(6, 'Михаль', 1, 10500, 12400),
(7, 'Дяченко', 1, 8000, 400),
(8, 'Сумцов', 1, 8600, 100),
(9, 'Мартовицкий', 1, 4000, 1200),
(91, 'Свиридов', 2, 4000, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ct` (`tid`);

--
-- Индексы таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lt` (`tid`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `ct` FOREIGN KEY (`tid`) REFERENCES `teachers` (`id`);

--
-- Ограничения внешнего ключа таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lt` FOREIGN KEY (`tid`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
