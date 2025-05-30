-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-03-2024 a las 14:19:43
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

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
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `idProfe` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(41, 'Alumno 1', 'alumno1@mail.com', '632652312', 'adssssss', 7, NULL),
(42, 'Alumno 2', 'alumno2@mail.com', '620620620', 'wqeqweqweqw', 7, NULL),
(43, 'Luis', 'luis@mail.com', '612345700', 'Js php html', 11, NULL),
(44, 'imane', 'Iloutfi@hotmail.es', '62862444', 'es mi mama', 12, NULL),
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
(62, 'Juan Luis', 'juanluis@hotmail.com', '677877877', 'Descripcion', 2, '2024-03-29'),
(63, 'Ester P5js', 'ester.ms95@gmail.com', '611776887', 'Librería de Js, P5JS', 1, '2023-04-21'),
(64, 'Velentino', 'valenclases@mail.com', '657676825', 'Php, Js y SQL', 1, '2023-12-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(10) NOT NULL,
  `alumno_id` int(11) DEFAULT NULL,
  `idProfe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(151, '2024-03-29', 24, 60, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_pendientes`
--

CREATE TABLE `pagos_pendientes` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horas` decimal(5,2) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `alumno_id` int(11) DEFAULT NULL,
  `idProfe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos_pendientes`
--

INSERT INTO `pagos_pendientes` (`id`, `fecha`, `horas`, `monto`, `alumno_id`, `idProfe`) VALUES
(18, '2024-02-13', '1.00', '12.00', 3, 1),
(36, '2024-02-15', '2.00', '24.00', 43, 11),
(58, '2024-02-29', '2.00', '24.00', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `asignatura` varchar(100) DEFAULT NULL,
  `contra` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `asignatura`, `contra`) VALUES
(1, 'El Pepe', 'issamaymoutt17@gmail.com', 'mates', '$2y$10$R3hgUmo/G0w7A9k7vcVKuuzHKF8T59fH8.1/prCml/zvON4jAu8QK'),
(2, 'prueba1', 'prueba1@mail.com', 'mates', '$2y$10$oQwe/UKF63NKnO.g4qJzZOZICxkB1ycW/t1PJSu7srQ8HyonaorJC'),
(3, 'prueba2', 'prueba2@mail.com', 'lengua', '$2y$10$iIODh52twMnfi5LNdXfAgOZJF3Axw2Qux4Aw0Ty3.QxxSAli0BX3a'),
(4, 'prueba3', 'prueba3@mail.com', 'lengua', '$2y$10$.R2NtjhoHJ/qn97F/yw1XOxf/CwB0yeKoejvS3dNXzfYRqYKyfhiS'),
(5, 'prueba4', 'prueba4@mail.com', 'lengua', '$2y$10$rqub/0tKTOd7HL6q2fT8rOHQEiUENE0eZEEefKmqlwxGEtLAm0RRS'),
(6, 'prueba4', 'prueba4@mail.com', 'lengua', '$2y$10$zLTHsYgU7DyJrc8lkWOXXe/LE2FayXETt615Rg8X/OYtPzwuibQOG'),
(7, 'prueba5', 'prueba5@mail.com', 'lengua', '$2y$10$a3txC81EV.aAAaP/jTI23.99ykWO.xaDzLbOszCS3uV.LeUuWod2q'),
(8, 'admin', 'admin@mail.com', 'ingles', '$2y$10$dY2OsHCdqApTBwzJcDMzpOUwIyb3h6rszST8U8s.qiYGFKFjgE0vG'),
(9, 'prueba6', 'prueba6@mail.com', 'mates', '$2y$10$I9KREwYwWUZMgxOPBSgUv.SVQesQ2Xm.XozHKYLTL0DTBoM5NNKyS'),
(10, 'prueba7', 'prueba7@mail.com', 'mates', '$2y$10$U.VWKhHJDQ5G9ozgLnCwoejkqW7AXj1qgMGCbPfVHaZJQ5wEdJ7EK'),
(11, 'Pruebfed', 'pruebadef@mail.com', 'lengua', '$2y$10$cDCOdWPRog5PEV1Ni2lEse.TgdJFjRqVl4cz85FkGHXovL7NEx7ry'),
(12, 'Naim', 'nossman@hotmail.com', 'mates', '$2y$10$rKyzqUmMS1c54qDcBtlxBeBmBbaj2iHkIWRqacefZ6mn3QmlPsGQu');

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
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de la tabla `pagos_pendientes`
--
ALTER TABLE `pagos_pendientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
