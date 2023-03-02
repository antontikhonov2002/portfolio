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
-- База данных: `computer_courses`
--

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id_group` int(11) NOT NULL,
  `teacher` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id_group`, `teacher`) VALUES
(101, 'Берестов С.А.'),
(102, 'Григорова С.П.'),
(103, 'Желудев М.Л.'),
(104, 'Окунева Т.В.'),
(105, 'Лебедева И.И.');

-- --------------------------------------------------------

--
-- Структура таблицы `list`
--

CREATE TABLE `list` (
  `id` int(11) NOT NULL,
  `last_name` text COLLATE cp1251_general_cs,
  `name` text COLLATE cp1251_general_cs,
  `middle_name` text COLLATE cp1251_general_cs,
  `year` int(11) DEFAULT NULL,
  `university` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `magistr` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

--
-- Дамп данных таблицы `list`
--

INSERT INTO `list` (`id`, `last_name`, `name`, `middle_name`, `year`, `university`, `course`, `group`, `magistr`) VALUES
(1, 'Иевлева', 'Анна', 'Ивановна', 1984, 'ЮФУ', 1, 101, 1),
(2, 'Гаврилова', 'Ольга', 'Петровна', 1982, 'РГПУ', 2, 102, 1),
(3, 'Максимов', 'Евгений', 'Иванович', 1980, 'РГУ', 4, 103, 0),
(4, 'Коробов', 'Андрей', 'Антонович', 1981, 'ДГТУ', 3, 104, 0),
(5, 'Даренко', 'Юрий', 'Сергеевич', 1983, 'ДГТУ', 3, 105, 1),
(6, 'Чернова', 'Нина', 'Ивановна', 1984, 'ЮФУ', 1, 101, 1),
(7, 'Ткачева', 'Инна', 'Алексеевна', 1981, 'ДГТУ', 3, 103, 0),
(8, 'Данилов', 'Иван', 'Петрович', 1980, 'РГУ', 2, 101, 1),
(9, 'Морозова', 'Ольга', 'Ильинична', 1983, 'РГУ', 3, 104, 0),
(10, 'Носов', 'Алексей', 'Николаевич', 1984, 'РГПУ', 1, 105, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_data`
--

CREATE TABLE `personal_data` (
  `id_stud` int(11) NOT NULL,
  `tel` text COLLATE cp1251_general_cs,
  `adress` text COLLATE cp1251_general_cs,
  `Word` int(11) DEFAULT NULL,
  `Excell` int(11) DEFAULT NULL,
  `Access` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

--
-- Дамп данных таблицы `personal_data`
--

INSERT INTO `personal_data` (`id_stud`, `tel`, `adress`, `Word`, `Excell`, `Access`) VALUES
(1, '261-17-22', 'Цветочная', 5, 5, 5),
(2, '258-18-22', 'Солнечная', 4, 4, 4),
(3, '234-19-22', 'Сиреневый', 3, 4, 5),
(4, '222-13-35', 'Цветочная', 5, 5, 5),
(5, '234-25-26', 'Бреговая', 3, 4, 3),
(6, '234-25-27', 'Сеченова', 5, 4, 5),
(7, '224-55-35', 'Грибной', 3, 3, 3),
(8, '224-76-56', 'Рубиновый', 3, 2, 3),
(9, '244-35-33', 'Нагибина', 3, 4, 3),
(10, '222-34-56', 'Днепровский', 3, 3, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id_group`);

--
-- Индексы таблицы `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lg` (`group`);

--
-- Индексы таблицы `personal_data`
--
ALTER TABLE `personal_data`
  ADD PRIMARY KEY (`id_stud`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `list`
--
ALTER TABLE `list`
  ADD CONSTRAINT `lg` FOREIGN KEY (`group`) REFERENCES `groups` (`id_group`);

--
-- Ограничения внешнего ключа таблицы `personal_data`
--
ALTER TABLE `personal_data`
  ADD CONSTRAINT `pl` FOREIGN KEY (`id_stud`) REFERENCES `list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
