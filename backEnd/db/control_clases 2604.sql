-- phpMyAdmin SQL Dump
-- version 5.2.1deb1ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-04-2024 a las 22:04:15
-- Versión del servidor: 8.0.36-0ubuntu0.23.10.1
-- Versión de PHP: 8.2.10-2ubuntu1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control_clases`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `descripcion` text,
  `idProfe` int DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre`, `email`, `telefono`, `descripcion`, `idProfe`, `created_at`) VALUES
(1, 'Marina Lopez', 'marina1@mail.com', '632545789', 'Javascript', 1, '2023-04-26'),
(3, 'Julian', 'Jualian@mail.com', '658698600', 'PHP y NodeJS', 1, '2024-01-04'),
(11, 'Joe', 'joe@mail.com', '+75 305 354-1778', 'IA, Python', 1, '2024-01-01'),
(12, 'Fernando', 'Fernando@mail.com', '630186506', 'Bases de Datos, PHP, JavaScript', 1, '2024-01-01'),
(13, 'Juan Ramirez', 'juan@mail.com', '632 458 652', 'Diagrama Entidad Relación', 1, '2024-01-01'),
(14, 'David Canarias', 'davidjmr16@gmail.com', '655442576', 'Bases de datos, SQL Server, MySQL.', 1, '2023-11-11'),
(15, 'David G', 'kno3.dyo@gmail.com', '618005059', 'TFG PHP, HTML, CSS', 1, '2024-01-01'),
(16, 'Enrique', 'enriqueclases@mail.com', '611010844', 'Trabajo JS, html y css', 1, '2023-12-06'),
(17, 'Lucia Hidalgo', 'lhidalgoman@uoc.edu', '634983419', 'TFG, Laravel, Php MVC', 1, '2023-11-25'),
(18, 'Jose Playlist', 'JoseClases@mail.com', '672975541', 'Php, html, css', 1, '2024-01-01'),
(19, 'Sergio', 'Sergio@mail.com', '657173319', 'PHP', 1, '2023-11-10'),
(20, 'JJ ', 'jjclases@mail.com', '601421744', 'Examen PHP', 1, '2024-01-01'),
(21, 'Alvaro Corral', 'Alvarocorralperez@gmail.com', '666622787', 'Examen PHP', 1, '2024-01-07'),
(22, 'Jose Luis', 'josetorresmadrid@gmail.com', '605 44 94 79', 'JS, HTML, CSS\r\n', 1, '2024-01-13'),
(23, 'Sara Talavera', 'SaraClases@mail.com', '649 05 18 47', 'PHP, MVC, PHP Poo', 1, '2024-01-01'),
(24, 'Dayanis', 'dayany1588@yahoo.com', '644 65 50 86', 'TypeOrm, TypeScript, JavaScript, SQL, Docker, Github.\r\n', 1, '2024-01-15'),
(25, 'Andrei', 'andreiClases@mail.com', '622 42 92 50', 'JavaScript y PHP.', 1, '2024-01-17'),
(26, 'Manu', 'manuclases@mail.com', '622 00 51 80', 'JavaScript', 1, '2023-11-20'),
(27, 'Magda', 'magdalenacoman1504@gmail.com', '672 84 60 16', 'Python, Sql, Bash', 1, '2023-11-10'),
(28, 'Juan Melendez', 'juanclases@mail.com', '642 83 15 44', 'PHP', 1, '2024-01-01'),
(29, 'Alberto DJ', 'albertoclases@mail.com', '627 25 79 69', 'JavaScript, Angular, PHP, SQL ', 1, '2024-01-01'),
(30, 'Naim', 'imane@hotmail.com', '628 62 49 44', 'HTML y CSS, Php\r\n', 1, '2024-01-01'),
(39, 'Izan Estupiñán', 'IzanClases@mail.com', '639 16 06 53', 'PHP desde 0.', 1, '2024-01-01'),
(46, 'Miguel Compaire', 'miguelclases@mail.com', '000000000', 'PHP desde 0.', 1, '2024-01-01'),
(47, 'Guillermo ', 'guilleclases@mail.com', '684391938', 'HTML y Css', 1, '2024-01-01'),
(48, 'Santi', 'santiclases@mail.com', '605504781', 'Html y y Css\r\n', 1, '2024-01-01'),
(49, 'Oscar', 'oscarclases@mail.com', '622413342', 'Php, Mvc', 1, '2024-01-01'),
(50, 'Hana', 'hanahari17@gmail.com', '611 75 47 01', 'Virtual Box', 1, '2024-01-01'),
(51, 'Victor', 'victorclases@mail.com', '653062462', 'Php, java, js', 1, '2024-01-01'),
(52, 'Carla', 'carlaclases@mail.com', '638 79 03 99', 'js\r\n', 1, '2024-01-01'),
(53, 'Camila Irlanda', 'camilaclases@mail.com', '00353 833 442517', 'JavaScript, Html, Css', 1, '2024-01-01'),
(54, 'Unax', 'unaxclases@mail.com', '665398509', 'Mysql, procedimientos, cursores, php', 1, '2024-01-01'),
(55, 'Guille Barros (Html)', 'guillebarros@mail.com', '6843991938', 'Html y Css ', 1, '2024-01-01'),
(56, 'Guille Erasmus', 'guilleerasmus@mail.com', '644582456', 'php', 1, '2024-01-01'),
(57, 'Pablo P5', 'pablop5@mail.com', '670 47 45 77', 'P5.js (Librería de JS)', 1, '2024-01-01'),
(58, 'Pablo Css', 'pablocss@mail.com', '603831936', 'Css', 1, '2024-01-01'),
(59, 'Andrey Ruso', 'andreiruso@mail.com', '649 52 44 24', 'JavaScript y Angular', 1, '2024-01-01'),
(60, 'Elena Jaen', 'elenajaen@mail.com', '652 47 19 14', 'HTML, Css y JavaScript', 1, '2024-01-01'),
(63, 'Ester P5js', 'ester.ms95@gmail.com', '611776887', 'Librería de Js, P5JS', 1, '2023-04-21'),
(64, 'Velentino', 'valenclases@mail.com', '657676825', 'Php, Js y SQL', 1, '2023-12-30'),
(65, 'Julio', 'julio@gmail.com', '8094872828', 'Probando', 14, '2024-04-01'),
(66, 'Maria', 'maria@gmail.com', '8094827272', 'Prueba', 14, '2024-04-01'),
(67, 'Isaí Mosso', 'isai@gmail.com', '123', '', 15, '2024-04-01'),
(68, 'Eduardo Velasco', 'edu233@gmail.com', '124', '', 15, '2024-04-01'),
(69, 'Daniel Canul', 'daniel123@gmail.com', '123', '', 15, '2024-04-01'),
(70, 'Denis', 'nishadev@gmail.com', '123', '', 15, '2024-04-01'),
(71, 'Uriel Hernandez', 'uriel@gmail.com', '123', '', 15, '2024-04-01'),
(72, 'Jazmin Urciel', 'jazmin@gmail.com', '555', '', 15, '2024-04-01'),
(73, 'Juan', 'jperez@aol.com', '9856587485', '', 17, '2024-04-01'),
(74, 'Claret', 'calret5@gmail.com', '0933564561251', 'tontatonta', 19, '2024-04-01'),
(75, 'NUEVO', 'as@as', '42', 'asa', 26, '2024-04-02'),
(76, 'Janny ', 'hola@gmail.com', '123', 'Hh', 27, '2024-04-02'),
(77, 'Emma', 'nielsolivera@hotmail.com', '986548785', 'Lore ipsum', 29, '2024-04-02'),
(78, 'Jose', 'jose98@gmail.com', '955555555', 'Jsjsjf', 31, '2024-04-02'),
(79, 'Juan sanchez', 'jpsanchez@gmail.com', '958624153', 'la molina', 38, '2024-04-02'),
(80, 'Edwin Ramiro', 'garciaramiro000@gmail.com', '68530715', '', 40, '2024-04-02'),
(81, 'Nicolas', 'nicolas.zajic@gmail.com', '34234', 'adfadf', 46, '2024-04-02'),
(82, 'Miguel ', 'mike@gmail.com', '9989989989889', 'Fin', 47, '2024-04-02'),
(84, 'Melissa', 'melissa1140@outlook.com', '3002932467', 'Ninguna', 55, '2024-04-02'),
(85, 'BELTRAN', 'YTTTTTUYY@GMAIL.COM', 'TUY', 'YYR', 56, '2024-04-02'),
(87, 'Hdjdj', 'javiergarciaurruchi@gmail.com', 'Hhhk', '', 63, '2024-04-02'),
(88, 'Sasha', 'javiergarciaurruchi@gmail.com', '6777777', 'Jxjdk', 63, '2024-04-02'),
(89, 'pepe', 'melchorherrera@gmail.com', '333333', 'wdfas', 86, '2024-04-02'),
(90, 'Juan Pérez', 'jperez@gmail.com', '987654321', 'Juan', 96, '2024-04-02'),
(91, 'nuevo', 'aa@c.info', '333333333', 'ffff;  S', 97, '2024-04-02'),
(92, 'ff', 'd@c.com', '44444444444444', 'ff', 97, '2024-04-02'),
(93, 'fff', 'aa@a.com', '3333333333', 'ff', 97, '2024-04-02'),
(94, 'Rosa Maria', 'palominoaraujo0@gmail.com', '922066498', 'matematicas', 87, '2024-04-02'),
(95, 'jeremy', 'sjdjd@gmsil.com', '983747573', 'euejd', 108, '2024-04-02'),
(96, 'Americo', 'jdjdj@gmai.com', '883737373', 'dkdkd', 108, '2024-04-02'),
(97, 'RENE ANTONIO\'', 'fabrix0728@gmail.com', '55441144', '<img src=\'x\' onerror=\'alert(0)\'>', 112, '2024-04-03'),
(98, 'Ricardo', 'ricardo.venancio@outlook.es', '5549376864', 'Programador', 115, '2024-04-03'),
(99, 'Alexander', 'angellazarus20@gmail.com', '990587485', 'Estudiante de pregarado', 121, '2024-04-03'),
(100, 'Guadalupe Noruega', 'gaualupeclases@gmail.com', '+4790973559', 'Clase de Lenguaje de marcas', 1, '2024-04-03'),
(101, 'Qqq', 'aaa@jshsh', '7273692827', 'Jdhdhd', 127, '2024-04-03'),
(102, 'Pedro', 'lizcg.8@gmail.com', '12345678', 'Descripción ', 128, '2024-04-04'),
(103, 'X', 'x.@c.com', '99999999999999', 'Fishing app inyection malware\r\nPayload\r\n- Day 0', 131, '2024-04-05'),
(104, '9999999999999999999999999999999999999999999', '000000000000@0000000.com', '000000000', 'Testing app inyection vulnerability \r\nDay 0', 131, '2024-04-05'),
(105, 'John ', 'jonh@pag.com', '000000000', 'Testing app for deploy ', 131, '2024-04-05'),
(106, 'Prueba Alumno', 'test@metra.com', '55441144', '<img src=\'x\' onerror=\'alert(/XSS/)\' >', 136, '2024-04-05'),
(107, 'Carlos ', 'andresariza8@hotmail.com', '3102752982', 'Estudiante ', 139, '2024-04-05'),
(108, 'CESAR ', 'asdfd@gmail.com', '2345234', 'efsfdf', 140, '2024-04-05'),
(109, 'RENE ANTONIO', 'fabrix0728@gmail.com', '55441144', 'Test ', 144, '2024-04-05'),
(110, 'Pedro Sanchez', 'jniquenf@uni.pe', '933839178', 'Descripcion de Pedro', 145, '2024-04-05'),
(111, 'Vino', 'safasfasfa121f@gmail.com', '999888777', 'fafsafasf', 147, '2024-04-06'),
(112, 'Manal', 'mboussalam15@gmail.com', '632 27 51 1', 'Git, control de versiones', 1, '2024-04-07'),
(113, 'Javier Pyhton', 'javiclases@mail.com', '+34 638 30 70 0', 'Python ', 1, '2024-04-08'),
(114, 'Ivan Js', 'ivanjsclases@mail.com', '+34 659 98 28 5', 'JavaScript, juego piedra papel o tijeras', 1, '2024-04-09'),
(115, 'Vriginia', 'virginiaclases@mail.com', '658 04 21 5', 'Html, Css, Xml, Epub', 1, '2024-04-14'),
(116, 'Mentoor', 'infoo@mentoor.es', '648 46 23 9', 'Academia de clases', 1, '2024-04-14'),
(117, 'InglesParaDevs', 'IPD@ipd.com', '9611150757', 'IPD', 15, '2024-04-15'),
(118, 'Matiz', 'Matiz1@gmail.com', '123456789', 'Matiz', 15, '2024-04-15'),
(119, 'Sentra', 'sentra@gmail.com', '123456789', 'Sentra', 15, '2024-04-15'),
(120, 'calro', 'cahnnjnmn@gmail.com', '8787', 'hjb', 149, '2024-04-19'),
(121, 'Amaia ', 'amaiaojuel@idarte.eus', '+34 619 82 61 8', 'Html y Css', 1, '2024-04-25'),
(122, 'Ana Php', 'celebridade67@gmail.com', '+34 608 69 57 3', 'Modelo Vista Controlador PHP', 1, '2024-04-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `monto` int NOT NULL,
  `alumno_id` int DEFAULT NULL,
  `idProfe` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `fecha`, `monto`, `alumno_id`, `idProfe`) VALUES
(18, '2024-02-02', 36, 24, 1),
(19, '2024-02-02', 36, 26, 1),
(20, '2024-02-03', 18, 30, 1),
(21, '2024-02-04', 23, 27, 1),
(25, '2024-02-07', 24, 14, 1),
(26, '2024-02-07', 25, 27, 1),
(27, '2024-02-08', 24, 25, 1),
(28, '2024-02-09', 24, 14, 1),
(29, '2024-02-10', 28, 30, 1),
(30, '2024-02-10', 60, 29, 1),
(31, '2024-02-11', 18, 27, 1),
(32, '2024-02-11', 18, 28, 1),
(45, '2024-02-11', 18, 29, 1),
(47, '2024-02-14', 24, 25, 1),
(49, '2024-02-15', 24, 25, 1),
(58, '2024-02-16', 12, 26, 1),
(59, '2024-02-14', 12, 26, 1),
(60, '2024-02-09', 24, 26, 1),
(63, '2024-02-17', 18, 30, 1),
(64, '2024-02-18', 12, 28, 1),
(66, '2024-02-16', 12, 28, 1),
(67, '2024-02-18', 24, 25, 1),
(68, '2024-02-20', 12, 39, 1),
(69, '2024-02-20', 24, 14, 1),
(70, '2024-02-20', 12, 46, 1),
(71, '2024-02-20', 24, 25, 1),
(72, '2024-02-20', 12, 29, 1),
(73, '2024-02-19', 12, 29, 1),
(74, '2024-02-21', 24, 25, 1),
(75, '2024-02-22', 24, 24, 1),
(76, '2024-02-24', 18, 30, 1),
(77, '2024-02-25', 60, 25, 1),
(78, '2024-02-26', 48, 24, 1),
(79, '2024-02-21', 12, 28, 1),
(80, '2024-02-19', 12, 28, 1),
(81, '2024-02-27', 24, 24, 1),
(82, '2024-02-27', 12, 27, 1),
(83, '2024-02-27', 24, 3, 1),
(84, '2024-02-26', 24, 3, 1),
(85, '2024-02-23', 24, 3, 1),
(86, '2024-02-21', 12, 3, 1),
(87, '2024-02-19', 24, 3, 1),
(88, '2024-02-17', 24, 3, 1),
(89, '2024-02-15', 24, 3, 1),
(90, '2024-02-14', 24, 3, 1),
(91, '2024-02-29', 12, 24, 1),
(92, '2024-02-29', 12, 49, 1),
(93, '2024-02-29', 12, 39, 1),
(94, '2024-02-29', 12, 50, 1),
(95, '2024-03-01', 25, 51, 1),
(96, '2024-03-01', 36, 24, 1),
(97, '2024-02-09', 40, 24, 1),
(98, '2024-02-15', 24, 28, 1),
(99, '2024-02-22', 24, 25, 1),
(100, '2024-02-15', 24, 29, 1),
(101, '2024-02-28', 20, 24, 1),
(102, '2024-03-02', 12, 50, 1),
(103, '2024-03-03', 12, 22, 1),
(104, '2024-03-03', 12, 39, 1),
(106, '2024-03-04', 18, 28, 1),
(107, '2024-03-03', 12, 28, 1),
(108, '2024-03-02', 12, 28, 1),
(109, '2024-03-04', 12, 49, 1),
(110, '2024-03-03', 18, 27, 1),
(111, '2024-03-05', 12, 24, 1),
(112, '2024-03-04', 12, 46, 1),
(113, '2024-03-03', 12, 46, 1),
(114, '2024-03-06', 12, 52, 1),
(115, '2024-03-06', 12, 22, 1),
(116, '2024-03-06', 24, 24, 1),
(117, '2024-03-07', 36, 24, 1),
(118, '2024-03-08', 48, 24, 1),
(119, '2024-03-08', 24, 49, 1),
(120, '2024-03-09', 18, 30, 1),
(121, '2024-03-09', 12, 52, 1),
(122, '2024-03-09', 12, 22, 1),
(123, '2024-03-10', 19, 27, 1),
(124, '2024-03-09', 12, 53, 1),
(125, '2024-03-11', 60, 24, 1),
(126, '2024-03-12', 12, 27, 1),
(127, '2024-03-12', 48, 24, 1),
(128, '2024-03-13', 36, 24, 1),
(130, '2024-03-14', 12, 55, 1),
(131, '2024-03-14', 12, 54, 1),
(132, '2024-03-16', 18, 30, 1),
(133, '2024-03-14', 48, 24, 1),
(134, '2024-03-15', 24, 24, 1),
(135, '2024-03-15', 12, 56, 1),
(136, '2024-03-17', 36, 22, 1),
(137, '2024-03-18', 36, 24, 1),
(138, '2024-03-14', 12, 52, 1),
(139, '2024-03-19', 12, 22, 1),
(140, '2024-03-21', 84, 24, 1),
(141, '2024-03-22', 24, 24, 1),
(142, '2024-03-23', 12, 24, 1),
(143, '2024-03-23', 36, 24, 1),
(144, '2024-03-23', 12, 22, 1),
(145, '2024-03-22', 12, 57, 1),
(146, '2024-03-24', 36, 24, 1),
(147, '2024-03-24', 54, 16, 1),
(148, '2024-03-25', 48, 24, 1),
(149, '2024-03-26', 60, 24, 1),
(150, '2024-03-12', 12, 53, 1),
(151, '2024-03-29', 24, 60, 1),
(152, '2024-03-30', 24, 60, 1),
(153, '2024-03-31', 12, 60, 1),
(155, '2024-04-01', 150, 73, 17),
(156, '2024-04-11', 1500, 74, 19),
(157, '2024-04-19', 200, 74, 19),
(158, '2024-04-01', 2000, 71, 15),
(159, '2024-04-09', 5, 77, 29),
(160, '2024-05-02', 60, 77, 29),
(161, '2024-04-01', 18, 30, 1),
(162, '2024-03-28', 60, 79, 38),
(163, '2024-04-02', 22, 80, 40),
(164, '2024-04-02', 500, 81, 46),
(165, '2024-04-01', 25, 84, 55),
(169, '2024-04-17', 22, 88, 63),
(170, '2024-04-19', 22, 87, 63),
(171, '2024-04-02', 22, 87, 63),
(172, '2024-04-02', 100, 90, 96),
(173, '2024-04-06', 50, 90, 96),
(174, '2024-04-03', 33, 91, 97),
(175, '2024-02-29', 24, 3, 1),
(176, '2024-02-13', 12, 3, 1),
(177, '2024-04-02', 23, 95, 108),
(178, '2024-04-02', 25, 95, 108),
(179, '2024-04-02', 42, 96, 108),
(180, '2024-04-04', 500, 99, 121),
(181, '2024-04-25', 150, 101, 127),
(182, '1856-04-27', 0, 104, 131),
(183, '2024-04-13', 1, 105, 131),
(184, '2024-04-04', 474, 106, 136),
(185, '2024-04-05', 35000, 107, 139),
(186, '2024-04-05', 20, 110, 145),
(187, '2024-04-12', 5, 111, 147),
(188, '2024-04-07', 12, 22, 1),
(189, '2024-03-31', 12, 22, 1),
(190, '2024-04-06', 12, 57, 1),
(191, '2024-04-07', 30, 112, 1),
(192, '2024-04-07', 18, 27, 1),
(193, '2024-04-03', 12, 100, 1),
(194, '2024-04-03', 12, 100, 1),
(195, '2024-04-09', 12, 114, 1),
(196, '2024-04-08', 12, 113, 1),
(197, '2024-04-11', 12, 27, 1),
(199, '2024-04-12', 96, 22, 1),
(200, '2024-04-12', 12, 57, 1),
(201, '2024-04-14', 18, 30, 1),
(202, '2024-04-14', 24, 115, 1),
(203, '2024-04-15', 12, 113, 1),
(204, '2024-04-14', 15, 27, 1),
(205, '2024-04-15', 10, 56, 1),
(206, '2024-04-12', 12, 112, 1),
(207, '2024-04-10', 12, 112, 1),
(208, '2024-04-17', 12, 16, 1),
(209, '2024-04-16', 24, 16, 1),
(210, '2024-04-17', 12, 112, 1),
(211, '2024-04-14', 12, 16, 1),
(212, '2024-04-19', 23, 120, 149),
(213, '2024-04-26', 22, 120, 149),
(214, '2024-04-30', 2500, 69, 15),
(215, '2024-04-15', 2500, 68, 15),
(216, '2024-02-04', 1500, 117, 15),
(217, '2024-04-20', 18, 56, 1),
(218, '2024-04-21', 18, 30, 1),
(219, '2024-04-21', 12, 27, 1),
(220, '2024-04-24', 18, 56, 1),
(221, '2024-04-23', 12, 112, 1),
(222, '2024-04-17', 12, 112, 1),
(223, '2024-04-23', 22, 121, 1),
(224, '2024-04-25', 50, 122, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_pendientes`
--

CREATE TABLE `pagos_pendientes` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `horas` decimal(5,2) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `alumno_id` int DEFAULT NULL,
  `idProfe` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pagos_pendientes`
--

INSERT INTO `pagos_pendientes` (`id`, `fecha`, `horas`, `monto`, `alumno_id`, `idProfe`) VALUES
(84, '2024-04-05', 0.69, 8.28, 73, 17),
(85, '2024-04-04', 3.00, 700.00, 67, 15),
(90, '2024-04-30', 8.00, 1800.00, 72, 15),
(93, '2024-04-06', 5.00, 100.00, 90, 96),
(96, '2024-04-19', 0.61, 234.00, 108, 140),
(98, '2024-04-12', 0.10, 0.10, 111, 147),
(105, '2024-04-08', 2.00, 40.00, 116, 1),
(106, '2024-04-11', 4.00, 80.00, 116, 1),
(107, '2024-03-04', 12.00, 2300.00, 70, 15),
(108, '2024-12-04', 15.00, 18000.00, 118, 15),
(109, '2024-12-04', 0.01, 5000.00, 119, 15),
(111, '2024-04-15', 1.00, 22.00, 116, 1),
(112, '2024-04-16', 2.00, 40.00, 116, 1),
(113, '2024-04-17', 2.00, 35.20, 116, 1),
(119, '2024-04-19', 2.00, 38.20, 116, 1),
(121, '2024-04-13', 1.00, 12.00, 100, 1),
(122, '2024-04-22', 1.00, 17.60, 116, 1),
(123, '2024-04-21', 1.50, 26.40, 116, 1),
(126, '2024-04-23', 0.50, 8.80, 116, 1),
(127, '2024-04-24', 1.50, 26.40, 116, 1),
(128, '2024-04-25', 1.00, 17.60, 116, 1),
(129, '2024-04-25', 1.00, 17.60, 116, 1),
(130, '2024-04-25', 2.00, 35.20, 116, 1),
(131, '2024-04-22', 2.00, 24.00, 22, 1),
(132, '2024-04-24', 1.00, 12.00, 22, 1),
(133, '2024-04-25', 2.00, 24.00, 57, 1),
(134, '2024-04-25', 1.00, 12.00, 22, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `textColor` varchar(7) DEFAULT '#ffffff',
  `idProfe` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `titulo`, `descripcion`, `inicio`, `fin`, `color`, `textColor`, `idProfe`) VALUES
(6, 'Clase de css', 'Clase de css con juan', '2024-03-01 09:00:00', '2024-03-01 10:00:00', '#f31212', '#b51a00', 1),
(7, 'Clase de php con Carlos', 'Vamos a ver sesiones y cookies ', '2024-03-02 09:30:00', '2024-03-02 11:30:00', '#64c466', '#76bb40', 1),
(8, 'Clases para Malik', 'Clase de refuerzo en js para Malik ', '2024-03-04 09:25:00', '2024-03-04 10:25:00', '#b51a00', '#ff6a00', 1),
(10, 'Guadalupe Lenguaje', 'Clase de Teoría de lenguaje de marcas', '2024-04-01 16:00:00', '2024-04-01 17:00:00', '#000000', '#039be5', 1),
(11, 'Guadalupe Programación', 'Clase de Teoría de programación', '2024-04-03 16:00:00', '2024-04-03 17:00:00', '#000000', '#ffffff', 1),
(12, 'Naim', 'Clase de Html, css y JS', '2024-04-01 12:00:00', '2024-04-01 13:30:00', '#000000', '#039be5', 1),
(14, 'Daniel', 'Clase con Daniel', '2024-04-01 22:32:00', '2024-04-01 23:00:00', '#000000', '#000000', 15),
(15, 'Ir a ', 'Jajajajajajaja ', '2024-04-02 18:38:00', '2024-04-04 18:38:00', '#ff0000', '#00ff00', 27),
(16, 'Tuve', 'Gif 4', '2024-04-02 19:30:00', '2024-04-01 20:37:00', '#0000ff', '#ffffff', 47),
(17, 'Work ', 'Bsck office ', '2024-04-01 08:00:00', '2024-04-01 17:00:00', '#3a2842', '#000000', 48),
(18, 'Work ', 'Bsck office ', '2024-04-01 08:00:00', '2024-04-01 17:00:00', '#3a2842', '#000000', 48),
(19, 'Jskdjs', 'Fjsnd', '2024-04-02 06:42:00', '2024-04-03 06:42:00', '#ffff00', '#00ffff', 63),
(20, 'Prueba', 'Evento ', '2024-04-02 09:18:00', '2024-04-02 12:18:00', '#ff0000', '#00ff00', 88),
(21, 'Prueba', 'Prubea', '2024-04-02 10:24:00', '2024-04-03 10:24:00', '#ffff00', '#0000ff', 96),
(22, 'Prueba', 'Prubea', '2024-04-02 10:24:00', '2024-04-03 10:24:00', '#ffff00', '#0000ff', 96),
(23, 'wjkejd', 'jdjd', '2024-04-02 18:36:00', '2024-04-02 18:36:00', '#ff0000', '#000000', 108),
(24, 'evento1', 'ev', '2024-04-02 19:24:00', '2024-04-13 19:24:00', '#be3c3c', '#1acf17', 115),
(25, 'Prueba', 'Esto es una prueba', '2024-04-24 15:00:00', '2024-04-24 17:00:00', '#343036', '#c11010', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `asignatura` varchar(100) DEFAULT NULL,
  `contra` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `asignatura`, `contra`, `created_at`) VALUES
(1, 'Aissa', 'issamaymoutt17@gmail.com', NULL, '$2y$10$R3hgUmo/G0w7A9k7vcVKuuzHKF8T59fH8.1/prCml/zvON4jAu8QK', '2024-04-02 08:12:43'),
(2, 'prueba1', 'prueba1@mail.com', 'mates', '$2y$10$oQwe/UKF63NKnO.g4qJzZOZICxkB1ycW/t1PJSu7srQ8HyonaorJC', '2024-04-02 08:12:43'),
(14, 'Ronald', 'Solonidapena@gmail.com', 'Programación', '$2y$10$JY3sEDI/EJxEAuN792SSzeGQBJ9N0FVluX2qKdgvHVnzNB2JvaCle', '2024-04-02 08:12:43'),
(15, 'Luis F', 'figueroanez@gmail.com', '', '$2y$10$22qt4bMd85zDYIUE6P6ec.TxHJQTl7waNZEJgxyOGOrsZCE3bA4Zu', '2024-04-02 08:12:43'),
(17, 'Loko', 'lokotek@gmail.com', 'Matemáticas', '$2y$10$oZxFs0gXeWRf1TAbHE3EPeu4BPnyEOW1ZV68k//ZW.eU9xO3xwob.', '2024-04-02 08:12:43'),
(18, 'Paco', 'pprueba0@mail.com', 'Biologia', '$2y$10$2MrYyURmNxVwgH0P9C2YneH9A3b2vN4/t6RqmxU.GlK9VsTjeIoEC', '2024-04-02 08:12:43'),
(19, 'Diego Lojan', 'diegloj12@gmail.com', 'Programación', '$2y$10$v5owUW9ITjGisC7Cq5X.remcmK0Im1IEX7u2FDBrKNvJnj9VEOUsK', '2024-04-02 08:12:43'),
(25, 'Luiss Fernando', 'molinaillescasl@gmail.co', 'Matemáticas', '$2y$10$Xv2wV6DvaItAf3R86RX0genU.HmF3kSBo58FmDz1Xoowoc6cYdypm', '2024-04-02 08:12:43'),
(26, 'Luiss Fernando', 'molinaillescasl@gmail.com', 'Matemáticas', '$2y$10$Wu//e11/B7PzOAV1hnn4guEAVHU4hfCQnlYaafYs0/hX5EqnoeeD2', '2024-04-02 08:12:43'),
(27, 'Janny ', 'hola@gmail.com', 'Español', '$2y$10$noOL8WxLRVmVL5wxdeQ1TOIzW.YERYcAxziRNgBTR9YVe7SqgO6u2', '2024-04-02 08:12:43'),
(29, 'Niels', 'niels.olivera.zurita@gmail.com', 'Español', '$2y$10$JK9Grhx4TGXX8Zp4P1.JzOHEuKe0boiK4fhH.FKIAp9M7S/wpeA8y', '2024-04-02 08:12:43'),
(31, 'Marcio ', 'marciomeza98@gmail.com', 'Programación', '$2y$10$a5OPfujs9Dh/lzaGqk23KueKu/KD2IJeGtac412uF7S71LNE4Wq5m', '2024-04-02 08:12:43'),
(35, 'alonzo chang', 'habejif974@felibg.com', 'Programación', '$2y$10$sP0wBt0fUK26WqeaRZ57PeFzYNi3lhZIkZbW8B7F8YIUyHCWqW9o2', '2024-04-02 08:12:43'),
(38, 'pedro herz', 'pwug.ymnny16@xuneh.com', 'Programación', '$2y$10$3adwVZKTjimmJI6J31pMlOyZ/FuyQLIQ1pKXAxLKLBwRwAjwB4pI2', '2024-04-02 08:12:43'),
(39, 'dsadas', 'es@mail.com', 'Matemáticas', '$2y$10$tJ1D6Xw1WcNwRxO2WcwtbuhxGOq9EVKVN3440efcwWhJsiGV1plbC', '2024-04-02 08:12:43'),
(40, 'Edwin Ramiro', 'mayefo1278@felibg.com', 'Matemáticas', '$2y$10$rDka38vC/3/bEcUmHPnsxOJItelWnqY7uZ84z3T90UdyV6w75DLWK', '2024-04-02 08:12:43'),
(42, 'Jefferson ', 'jeff01001@gmail.com', 'Programación', '$2y$10$Zbids5GkAcJLkAIYbGA/i.CuWcHAKaZ28flGu52SlbFOSRh1iK.Qa', '2024-04-02 08:12:43'),
(44, 'Eli Cordero', 'elicordero111@gmail.com', 'Programación', '$2y$10$6lPK6/hLGVt/mLHyEm2tt.ERFHbrA6NMnF4HQ.c.M30dNGIuQ4jxm', '2024-04-02 08:12:43'),
(46, 'Nicolas', 'nicolas.zajic@gmail.com', 'Programación', '$2y$10$pyoXDZW9n.jXkxyjBLIt0u3SLuthYdIVVwtO5VxOA1ePY2SJppacq', '2024-04-02 08:12:43'),
(47, 'Mike', 'mike@gmail.com', 'Programación', '$2y$10$.C8ec8cajEgg3LtdQGPWq.ICBeHj/1EU2Wt.7lbEeZLDY.f2v.djq', '2024-04-02 08:12:43'),
(48, 'Daniela ', 'danielajq1126@gmail.com', 'Español', '$2y$10$C2rcXq7Vy/KV2.LnSUNbiemYiPDmPOSqlZIaLIv8kjrfdfCVdMyz2', '2024-04-02 08:12:43'),
(49, 'Lorem', 'lorem@ipsum.dor', 'Programación', '$2y$10$epniKvdFxgknmrDZHqBaheI2V1ZSTiWZuWZrt5MlSomuzh9M4e/Qa', '2024-04-02 08:12:43'),
(54, 'Heyller', 'heyller.ra@gmail.com', 'Programación', '$2y$10$y5jHXUauxx.68/jrER7HdeV.dYVAbvGK5OinEbhj3BdpbAxIoJxtG', '2024-04-02 08:12:43'),
(55, 'Jonathan', 'ing.jonathan_arroyo@hotmail.com', 'Programación', '$2y$10$H7kBkL0uNhXfr53a.K6jZOkuWypJeiJj2UxkVXigp3h9A1V..FeNO', '2024-04-02 08:12:43'),
(56, 'Juan', 'PERRITA@GMAIL.COM', 'Física', '$2y$10$nao548cNBvWITTEvx5c9pOpsUN2QGdSYOQfoyCIfKJ5KkRefRhsPu', '2024-04-02 08:12:43'),
(57, 'Fenox', 'daazaloaiza@gmail.com', 'Programación', '$2y$10$phHmTohhjsS0RkU/XKCJB.4CD75OW.5pNRB76L5FQJXVAAUmzC4Wi', '2024-04-02 08:12:43'),
(58, 'mekaloko', 'mekaloko2012@gmail.com', 'Matemáticas', '$2y$10$r2/ZXi73axvsse40TXLjqO8Y7VAG6FnIbRy24eQNWhe1V2sVi5LaC', '2024-04-02 08:12:43'),
(60, 'HEBERT ', 'h.e.cussi@gmail.com', 'Inglés', '$2y$10$TrIrZ0A4/rgmWUWsnE1hjuD8W.Px9ofFz0X3KzNw1BHjva8rOZL4K', '2024-04-02 08:12:43'),
(61, 'hola', 'jajaja@gmail.com', 'Español', '$2y$10$NZyG11L0cv1XCvX9DIPjnedyIy40s7nkj8A/6sDyM.DInsfvKaHTK', '2024-04-02 08:12:43'),
(62, 'Juan Manuel', 'jmab2k@gmail.com', 'Programación', '$2y$10$CnUNdiMevcQ5c23lHPiiJevDoIqzkUGyR6LyNEOomMWiUxQO.oegG', '2024-04-02 08:21:05'),
(63, 'Javier', 'javiergarciaurruchi@gmail.com', 'Psicología', '$2y$10$06bU6oeXgI7AOtGSXbRpAep90YJ.XvhKH4ODS2IXgijRzvZjJ.YvC', '2024-04-02 08:40:35'),
(85, 'Carlos', 'carloss.cs96@gmail.com', 'Programación', '$2y$10$/As3Rn0sqsIg34Tg0II4y.XxuUFbJzoduld5tdGLoxNz0XRYQgrkO', '2024-04-02 09:08:46'),
(86, 'pepe', 'melchorherrera@gmail.com', 'Matemáticas', '$2y$10$Y3De741BGq0SSDMGSLegg.hU0QMgkFwW/PXtVqnCwBJcgBPQWciLS', '2024-04-02 09:42:31'),
(87, 'Over', 'overcantoral53@gmail.com', 'Español', '$2y$10$SYnMrs0dqU0TELltUEkiXOCyqKdbZgNeI7Ha3cYpWwYeTjpD4p4jC', '2024-04-02 12:00:31'),
(88, 'Prueba', 'prueba.123@yopmail.com', 'Español', '$2y$10$.lCA8bE06VfRfGzyyemVFuvgVYQEhfCKb8UBNZdhrMyT4GQNNIpE6', '2024-04-02 12:16:51'),
(89, 'Pok', 'micuenta@gmail.com', 'Programación', '$2y$10$rHjgRRz1txTHdnIxig1IV.iIgzN8d4gf4eHq128B/fgZ3pXPFaGnu', '2024-04-02 12:19:27'),
(90, 'José Raúl Miranda Prieto ', 'mirandaprietojoseraul@gmail.com', 'Programación', '$2y$10$ZrI4ar6U0XQXogSMzXaONe.ziu3mSOKzuAa5x0FGbrCbxjLJESFbi', '2024-04-02 12:57:31'),
(93, 'Alicia Alanis ', 'alisgar9@gmail.com', 'Español', '$2y$10$vSEjyz/3iQZxnhmu8SbXkOtiuV1lbx801sckcqAcau8MwkelOXhy2', '2024-04-02 13:43:59'),
(94, 'Diana', 'user@nextmail.com', 'Programación', '$2y$10$8LNCSgVAoMgqUaDJ4sCL3uqoN2w.Zh8Z65t9izzzdhKT5nkL5jLeK', '2024-04-02 15:02:01'),
(95, 'nu', 'ggger@hotmail.com', 'Matemáticas', '$2y$10$0TXbGrdtJlaJhgQdkpWWCOckkNqvAWsy9W/fV9SLGsNSyue40Xdw.', '2024-04-02 15:20:05'),
(96, 'Luis', 'luismancov@gmail.com', 'Programación', '$2y$10$LBnWSBJHaU9T7/CX4uhOHejbG6LN4X3gEr2MIEcUJS0evDudGVlYO', '2024-04-02 15:22:32'),
(97, 'Guillermo', 'gllrmmntsns@gmail.com', 'Matemáticas', '$2y$10$3Nze9MWFTuBPApWLB3sBiO7yKahJB0P8Vb8UgeVEL1Z0tzKmKao1a', '2024-04-02 15:39:38'),
(98, 'Ejercicios ', 'ejemplo@maildrop.cc', 'Programación', '$2y$10$MWuxderuLp9Uja6h9L9z1eM8Pcs4iwHIW0Wm6E12QGSbUsycr/ybK', '2024-04-02 16:08:25'),
(99, 'Turbet', 'richarmiguelrodriguez@gmail.com', 'Programación', '$2y$10$jTpzjVBM1AIZxqNPqaM/P.2C/XcJI2QPoW8iNweFNkTo4DLCQd8JG', '2024-04-02 16:19:35'),
(100, 'Guido Montero', 'agproduce@gmail.com', 'Economía', '$2y$10$r/EGUcOj6xGtLUR1rSBYN.uQghD.AEsuZdGekKtJtegaNLZCt1H/a', '2024-04-02 17:57:38'),
(101, 'Jonathan ', 'jhonysosab1997@gmail.com', 'Economía', '$2y$10$wQRV2LFTBU2DxZ7KeW/TDeVxRbmhkuZvdUXsVmAgDt3.H6VLPRbT.', '2024-04-02 18:05:17'),
(102, 'Denis ', 'alexruime7@gmail.com', 'Español', '$2y$10$CRUkRS07qtZpH.l9S80mY.bl.DkqUJJjA9oy/IjLRzhKF7ahvC5zy', '2024-04-02 19:54:20'),
(104, 'Jajs', 'uakwiq@gmail.com', 'Programación', '$2y$10$6yHZdXgOyIa/AGm83iBBl.CEsvpWB0RshvZ2WvG32kXncWZKNcdgK', '2024-04-02 20:04:41'),
(108, 'JR', 'xaviercito052018@gmail.com', 'Matemáticas', '$2y$10$XhGHAoJYvAuzPyLUOUuk/.1rnr8gWS7M7ONILOwjiZf/AgJy32fBi', '2024-04-02 23:32:55'),
(109, '4nd', '4@gmail.com', 'Matemáticas', '$2y$10$Hmex2Unob1Q.oht5R9dLbe9433h.Wmng1WaKA21LKv9YP.Dbjajk6', '2024-04-02 23:54:18'),
(110, '212121', 'admin@admin.com', 'Matemáticas', '$2y$10$QdF3eEglRx4fG7PjwrLpTOsmI1KEwnpZwP4jrmTBsHhlTC07/M.Aq', '2024-04-03 00:18:01'),
(111, 'Jonathan ', 'jonathann2502@gmail.com', 'Programación', '$2y$10$yhJoSygGNrlnYta650LQBOGltoqmAu0J0in1Ly.XmRhffif4CowlC', '2024-04-03 00:39:28'),
(112, 'admin', 'anyaforgeryor7@gmail.com', 'Historia', '$2y$10$DkqK5jodPMq8QFuV1zN1qOyAbMTl5qNFwQsA658UscM6QLCrReXo6', '2024-04-03 00:52:37'),
(115, 'Ricardo', 'ricardo.venancio@outlook.es', 'Programación', '$2y$10$dzmtOmf/vKhn7T7gO2DK4u.0QVF0Wurf6mXfEyjKk9KkGsBfvWOVa', '2024-04-03 01:23:03'),
(116, 'Test ', 'test@gmail.com', 'Español', '$2y$10$.7f6LnJ1Qb7fc.KJiw3dzOImIys4df4sGYf9sDKSgyNovqYyG0atW', '2024-04-03 01:54:59'),
(119, 'Joaco', 'asd@asd.com', 'Programación', '$2y$10$qP7.qnI09XKSJBg1qGLoHOzFvunxcnfeUf7z1pB8jA.3UtGTzJare', '2024-04-03 02:05:21'),
(120, 'Brandon Steve Rubiano Gil ', 'brandonrubiano2006@gmail.com', 'Programación', '$2y$10$533rUqb8JQVH7Rm1L.Ewz.pFh5u1DuwgGGnJkuJk/jykED8vlz84G', '2024-04-03 03:23:50'),
(121, 'Alexander', 'angellazarus20@gmail.com', 'Programación', '$2y$10$KjdMSPaHKn.Noj5RURPc1uhd0G1oBK5r4HwQInqIVXkGKbn1CjQP6', '2024-04-03 03:42:50'),
(122, 'Jonamillananco@outlook.cl', 'jonamillananco@outlook.cl', 'Programación', '$2y$10$lapBlmm6DmMuKJVlXA4CQus9NBKNVlVil8R0XbSzc7kiPf8BLHzlC', '2024-04-03 09:28:40'),
(125, 'admin', 'niurkabonilla20@gmail.com', 'Historia', '$2y$10$npUKJbpdCiI.0rpsrqjF1uGDO3z6uVD1L6U2U7w9Ze3845HGbvbIe', '2024-04-03 14:06:47'),
(126, 'angel', 'angel_latinp@hotmail.com', 'Programación', '$2y$10$cuUh0iEed2MFj51GFUsmyuAdlq9lXCs7QEPmbPuetTCyJluSnKBlK', '2024-04-03 17:58:43'),
(127, 'Aderly', 'hshdhd@gsmil.com', 'Español', '$2y$10$Z6TtA05By6/ZWmX4DgrlgO2Imzj6E52mBG77zp74dtfcDypaLe7U2', '2024-04-03 22:12:27'),
(128, 'Lizeth', 'lizcg.8@gmail.com', 'Programación', '$2y$10$eBH14oTL8pq4IJfF81f5beamYy1fVi.1MNRUCgHIA4aMMPHjaH9UG', '2024-04-04 10:15:52'),
(129, 'Ernesto Guerrero ', 'ernestojair2020@gmail.com', 'Programación', '$2y$10$XaozxGGbQxeH9uCUoVDZhuqsRBXmlgyGOGpOCALXEL0nyg3bk06ji', '2024-04-04 16:48:29'),
(130, 'hhhhhh', 'metasenlinea@gmail.com', 'Matemáticas', '$2y$10$/I2AkWqUKJt/9tSbLKMV2.vQcBmOzhs7F.uocTj4rFoJf9T0YUBi2', '2024-04-04 20:57:17'),
(131, 'Juan perez', 'juan@perez.com', 'Historia', '$2y$10$2nb5zqwVCrefsddnvoO0PO0EZXSJey/k.H70Yi2pmgU/vaDtXNsUm', '2024-04-04 23:57:51'),
(133, 'Kevin', 'angel.96.dark@gmail.com', 'Programación', '$2y$10$Pkh1DS0oS50aceZwNLgdwOCGN19Nz3SW58XRz1JUUDeRKeHvo3Z1u', '2024-04-05 00:08:02'),
(136, 'Fabrix', 'fabrix0728@gmail.com', 'Programación', '$2y$10$ilN.NSEesv8e1RTd3/v2ce5A3URni0mi6CKO6sKSPgb.jzB5SIEue', '2024-04-05 01:22:29'),
(137, 'Wen', 'wendy.vargas15@hotmail.com', 'Programación', '$2y$10$jG3/DOP1FN6qSCy4srB3P.7a3Zsdy0PA/vgYVjjI7FMIw.4ZI8kjm', '2024-04-05 04:07:06'),
(138, 'Pruebs', 'prueba@gmail.com', 'Español', '$2y$10$UZp4lV0tC0DukcAXwHtjFODjlLqGIFxu6rL5APyUqdZZLusq73chq', '2024-04-05 06:22:57'),
(139, 'Andrés Ariza ', 'desarrolloandresariza@gmail.com', 'Programación', '$2y$10$gcuofnwowpaqAdDor82ug.SCdFJZhk5Fm/0taJx.gIq6sMkMJmB8e', '2024-04-05 07:00:42'),
(140, 'CESAR ', '123@gmail.com', 'Programación', '$2y$10$sguyQPV0Y2SxHF6FbI8rLuy14bmvlG3kmEwcjBLTgwTI4JI2xcrX2', '2024-04-05 08:33:14'),
(141, 'DonWalo', 'walter028@hotmail.com', 'Programación', '$2y$10$A3hrsDXke5Dnz2obJRcoTuM5mYKmCzfkCHw52fugyuMYedeixzGja', '2024-04-05 12:10:41'),
(144, 'Anyaa', 'anya.forgeryor7@gmail.com', 'Biologia', '$2y$10$8/7PLqdaTiA6OdF3bdtbD.Uav5WjCKfowUEoCvVtScAk0gBKvd4Vi', '2024-04-05 21:23:15'),
(145, 'Jose Armando', 'j.armando0807@gmail.com', 'Programación', '$2y$10$CYtI.UUdCDToy0/w9pUUme8VUg6xbTIfi9LYQEUAzcJ0wTnZCfAmC', '2024-04-05 22:14:47'),
(146, 'Perci', 'percimisterio12@gmail.com', 'Inglés', '$2y$10$qeIotiz4DS5bAfhRiV2PQevq2bgjiLfixlSQdG6VdZB7zWMsDO4nO', '2024-04-05 23:32:07'),
(147, 'Tallarin', 'rerere1234@gmail.com', 'Química', '$2y$10$BXpZrg30O/0SVSdUd1XQBuif4zGZch0l8CQoNIwmm7s.LjXDtbWIS', '2024-04-06 19:57:29'),
(148, 'Raymond Babbitt', 'raimond1983@proton.me', 'Programación', '$2y$10$EJdHXzJUtaelzN1qeWiTOO3mAGFAsbCZwv1xeKHaoCD0e1PfwKIY2', '2024-04-06 22:25:14'),
(149, 'diego', 'diego@disbox.net', 'Matemáticas', '$2y$10$E13ZLWx44Gi3ELBx.yIIBeiPWv6A05BgZygIBPo5DpO7PBvCPIZXO', '2024-04-19 17:04:11'),
(150, 'David', 'davidmartinhernandez2003@gmail.com', 'Programación', '$2y$10$hLhQgu1dHXSWnKcTbJPOO.cwL43L7NT4CKsT9tC00azIqntg9CS0q', '2024-04-24 16:30:33');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProfe` (`idProfe`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `idProfe` (`idProfe`);

--
-- Indices de la tabla `pagos_pendientes`
--
ALTER TABLE `pagos_pendientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `idProfe` (`idProfe`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idProfe` (`idProfe`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT de la tabla `pagos_pendientes`
--
ALTER TABLE `pagos_pendientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`idProfe`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`idProfe`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `pagos_pendientes`
--
ALTER TABLE `pagos_pendientes`
  ADD CONSTRAINT `pagos_pendientes_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pagos_pendientes_ibfk_2` FOREIGN KEY (`idProfe`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_idProfe` FOREIGN KEY (`idProfe`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
