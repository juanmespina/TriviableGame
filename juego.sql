-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2019 a las 18:18:47
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juego`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `idPregunta` int(10) UNSIGNED NOT NULL,
  `pregunta` text COLLATE latin1_spanish_ci NOT NULL,
  `dificil` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`idPregunta`, `pregunta`, `dificil`) VALUES
(1, '¿ Cuál era el nombre del perro de Simón Bolívar?', 0),
(2, 'La Operación Overlord de la Segunda Guerra Mundial también conocida como...', 0),
(3, 'El primer presidente de los Estados Unidos fue :', 0),
(4, '¿ Cuándo fue el golpe de Estado que derrocó a Marcos Pérez Jiménez?', 0),
(5, 'El último presidente de la Unión Soviética fue :', 0),
(6, '¿Cuál es la capital de Eslovaquia?', 0),
(7, '¿ Dónde se encuentra el Parque Nacional Waraira Repano?', 0),
(8, 'La extensión territorial de Venezuela en kilométros cuadrados es de :', 0),
(9, '¿ Cuál es la cápital de Cuba?', 0),
(10, '¿ Cuál es el río que bordea a la ciudad de Londres?', 0),
(11, '¿ Quién es el mejor jugador del Mundo?', 0),
(12, '¿Que selección fue la que ganó la Copa del Mundo del año 2010?', 0),
(13, '¿ Cuántas copas del mundo tiene Italia en su palmarés?', 0),
(14, '¿ Quién es el futbolista con mayor cantidad de goles anotados?', 0),
(15, '¿ Quién es considerado el eterno capitán de la selección venezolana de fútbol?', 0),
(16, '¿ Cuál partícula tiene carga negativa en el átomo?', 0),
(17, '¿Quién fue la primera persona que inventó el radio?', 0),
(18, 'El test de Turing trata acerca de: ', 0),
(19, 'Albert Einstein recibio el Nobel De Física por : ', 0),
(20, '¿ Quién describió la tabla periódica por primera vez? ', 0),
(21, '¿Cuál fue la fecha de comienzo de la invasión a Polonia durante la Segunda Guerra Mundial ?', 1),
(22, '¿ El primer hombre en pisar la Luna fue ?', 1),
(23, ' El primer presidente de Venezuela fue :', 1),
(24, '¿ Quién fue el último líder del Tercer Reich Alemán?', 1),
(25, 'El Ataque a Pearl Harbor por parte del Imperio del Japón se realizó el día :', 1),
(26, '¿ Cuál es la capital de Kazajistán?', 1),
(27, '¿ Dónde se encuentra la ciudad de Harare?\r\n', 1),
(28, '¿Cuál es el país más extenso del mundo?', 1),
(29, '¿ Cuál es la cápital de Belice?', 1),
(30, '¿ A que nación pertenece la isla de Tristán de Acunha?', 1),
(31, '¿ Quién es el mayor goleador de la selección venezolana?', 1),
(32, '¿Que selección fue la que ganó la Copa del Mundo del año 1958?', 1),
(33, '¿ Cuántas copas del mundo categoria femenina tiene Estados Unidos en su palmarés?', 1),
(34, '¿ Quién la máxima goleadora de mundiales femeninos?', 1),
(35, '¿ Quién es el primer venezolano que ganó una medalla de oro en los JJOO?', 1),
(36, '¿ Cuál es la fórmula que describe el fenomeno físico de la Fuerza?', 1),
(37, 'Las ecuaciones desarrolladas por James Clerk Maxwell explican la...', 1),
(38, '¿Cuál fue la primera computadora programable de la historia?', 1),
(39, '¿Quien fue la primera mujer en recibir un premio nobel? ', 1),
(40, 'El lenguaje de programación C está basado en:', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion`
--

CREATE TABLE `puntuacion` (
  `idPuntuacion` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `dificil` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `puntuacion`
--

INSERT INTO `puntuacion` (`idPuntuacion`, `puntuacion`, `nombre`, `dificil`) VALUES
(1, 4, 'Daniel', 0),
(2, 7, 'Pedro', 0),
(3, 8, 'Carlos', 0),
(4, 1, 'Giuseppe', 0),
(5, 12, 'Ronald', 0),
(6, 4, 'Reinaldo', 0),
(7, 15, 'José Luis', 1),
(8, 13, 'José Gabriel', 1),
(9, 8, 'Yadira', 1),
(10, 6, 'Gabriela', 1),
(11, 5, 'Luz', 1),
(12, 3, 'Valentina', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `idRespuesta` int(11) UNSIGNED NOT NULL,
  `respuesta` text COLLATE latin1_spanish_ci NOT NULL,
  `verdadera` tinyint(1) NOT NULL,
  `pregunta_idPregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`idRespuesta`, `respuesta`, `verdadera`, `pregunta_idPregunta`) VALUES
(1, 'Nevado ', 1, 1),
(2, 'Libertad ', 0, 1),
(3, 'Blanquito ', 0, 1),
(4, 'Nieve', 0, 1),
(5, 'Desembarco en el sur de Italia ', 0, 2),
(6, 'Desembarco de Normandía', 1, 2),
(7, 'Retirada Aliada de Dunquerque ', 0, 2),
(8, 'Ataque a la Unión Soviética', 0, 2),
(9, 'Thomas Jefferson', 0, 3),
(10, 'Alexander Hamilton', 0, 3),
(11, 'Benjamín Franklin ', 0, 3),
(12, 'George Washington ', 1, 3),
(13, '17 de Diciembre de 1957', 0, 4),
(14, '1 de Enero de 1958', 0, 4),
(15, '23 de Enero de 1958 ', 1, 4),
(16, '23 de Enero de 1959 ', 0, 4),
(17, 'Leonid Brezhnev ', 0, 5),
(18, 'Mijaíl Gorbachov', 1, 5),
(19, 'Boris Yeltsin', 0, 5),
(20, 'Nikita Kruschev', 0, 5),
(21, 'Bratislavia', 1, 6),
(22, 'Zagreb', 0, 6),
(23, 'Sarajevo', 0, 6),
(24, 'Belgrado', 0, 6),
(25, 'Al sur de Caracas', 0, 7),
(26, 'Al norte de Caracas', 1, 7),
(27, 'Al este de Caracas', 0, 7),
(28, 'Al oeste de Caracas\r\n', 0, 7),
(29, '915250', 0, 8),
(30, '950550', 0, 8),
(31, '920233', 0, 8),
(32, '916445', 1, 8),
(33, 'Santiago de Cuba', 0, 9),
(34, 'La Habana', 1, 9),
(35, 'San Juan', 0, 9),
(36, 'Santo Domingo', 0, 9),
(37, 'Kent', 0, 10),
(38, 'Siena', 0, 10),
(39, 'Támesis', 1, 10),
(40, 'Volga', 0, 10),
(41, 'Cristiano Ronaldo', 0, 11),
(42, 'Lionel Messi', 1, 11),
(43, 'Zlatan Ibrahimovic', 0, 11),
(44, 'Paul Pogba', 0, 11),
(45, 'España', 1, 12),
(46, 'Alemania ', 0, 12),
(47, 'Italia ', 0, 12),
(48, 'Brasil', 0, 12),
(49, '3', 0, 13),
(50, '5', 0, 13),
(51, '2', 0, 13),
(52, '4', 1, 13),
(53, 'Ronaldo Nazario', 0, 14),
(54, 'Gabriel Omar Battistuta', 0, 14),
(55, 'Pelé ', 1, 14),
(56, 'Cristiano Ronaldo ', 0, 14),
(57, 'Juan Arango', 1, 15),
(58, 'José Manuel Rey', 0, 15),
(59, 'Rafael Dudamel', 0, 15),
(60, 'Alexander Rondón', 0, 15),
(61, 'Protón ', 0, 16),
(62, 'Neutrón  ', 0, 16),
(63, 'Electrón  ', 1, 16),
(64, 'Ninguno ', 0, 16),
(65, 'Gugliermo Marconi', 0, 17),
(66, 'Thomas Edison', 0, 17),
(67, 'Nikola Tesla', 1, 17),
(68, 'Alexander Popov', 0, 17),
(69, 'Inteligencia artificial', 1, 18),
(70, 'Evolución de los procesadores', 0, 18),
(71, 'Sistemas Operativos', 0, 18),
(72, 'Programación web', 0, 18),
(73, 'Teoría de la Relatividad', 0, 19),
(74, 'Mecánica clásica', 0, 19),
(75, 'Efecto Fotoélectrico', 1, 19),
(76, 'Descubrimiento de las partículas del átomo', 0, 19),
(77, 'Dimitri Mendeleiev', 1, 20),
(78, 'Niels Bohr', 0, 20),
(79, 'Marie Curie', 0, 20),
(80, 'Ernest Rutherford', 0, 20),
(81, '7 de Septiembre de 1939', 0, 21),
(82, '1 de Septiembre de 1939', 1, 21),
(83, '10 de Octubre de 1939', 0, 21),
(84, '7 de Agosto de 1939', 0, 21),
(85, 'Alan Shepard', 0, 22),
(86, 'Neil Armstrong', 1, 22),
(87, 'Edwin Aldrin', 0, 22),
(88, 'Yuri Gagarin', 0, 22),
(89, 'Simón Bolívar ', 0, 23),
(90, 'Francisco De Miranda', 0, 23),
(91, 'Rafael Urdaneta', 0, 23),
(92, 'Cristóbal Mendoza', 1, 23),
(93, 'Heinrich Himmler ', 0, 24),
(94, 'Herman Goering', 0, 24),
(95, 'Karl Donitz', 1, 24),
(96, 'Alfred Jodl', 0, 24),
(97, '10 de Diciembre de 1941 ', 0, 25),
(98, '24 de Diciembre del 1941', 0, 25),
(99, '7 de Noviembre de 1941', 0, 25),
(100, 'Niguna de las anteriores', 1, 25),
(101, 'Astana ', 1, 26),
(102, 'Baikonour ', 0, 26),
(103, 'Asjabad', 0, 26),
(104, 'Ulan Bator', 0, 26),
(105, 'Nigeria ', 0, 27),
(106, 'Sudáfrica ', 0, 27),
(107, 'Zimbabue', 1, 27),
(108, 'Kenia', 0, 27),
(109, 'Canadá  ', 0, 28),
(110, 'Rusia ', 1, 28),
(111, 'China ', 0, 28),
(112, 'Australia', 0, 28),
(113, 'Paramaribo ', 0, 29),
(114, 'Georgetown', 0, 29),
(115, 'Belmopán', 1, 29),
(116, 'Kingston', 0, 29),
(117, 'Reino Unido', 1, 30),
(118, 'España', 0, 30),
(119, 'Francia', 0, 30),
(120, 'Portugal', 0, 30),
(121, 'Juan Arango', 0, 31),
(122, 'José Rey', 0, 31),
(123, 'Giancarlo Maldonado', 0, 31),
(124, 'José Salomón Rondón', 1, 31),
(125, 'España ', 0, 32),
(126, 'Alemania', 0, 32),
(127, 'Italia', 0, 32),
(128, 'Brasil', 1, 32),
(129, '3', 0, 33),
(130, '1', 0, 33),
(131, '2', 0, 33),
(132, '4', 1, 33),
(133, 'Marta  ', 1, 34),
(134, 'Alex Morgan', 0, 34),
(135, 'Megan Rapinoe', 0, 34),
(136, 'Abby Wambach', 0, 34),
(137, 'Rubén Limardo', 0, 35),
(138, 'Albert Subirats', 0, 35),
(139, 'Francisco Rodríguez', 1, 35),
(140, 'Alejandra Benítez', 0, 35),
(141, 'F=m*a', 1, 36),
(142, 'F= m(c)**2', 0, 36),
(143, 'F= v*i', 0, 36),
(144, 'Ninguna de las anteriores', 0, 36),
(145, 'Teoría atómica', 0, 37),
(146, 'Teoría electromagnética', 1, 37),
(147, 'Teoría de la relatividad', 0, 37),
(148, 'Mecánica clásica', 0, 37),
(149, 'Z1', 1, 38),
(150, 'ENIAC', 0, 38),
(151, 'EVAC', 0, 38),
(152, 'ZUSE Z22', 0, 38),
(153, 'Ada Lovelace', 0, 39),
(154, 'Bertha Von Suttner', 0, 39),
(155, 'Marie Curie ', 1, 39),
(156, 'Rosalind Franklin', 0, 39),
(157, 'B', 1, 40),
(158, 'PASCAL', 0, 40),
(159, 'ALGOL', 0, 40),
(160, 'FORTRAN', 0, 40);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`idPregunta`);

--
-- Indices de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD PRIMARY KEY (`idPuntuacion`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`idRespuesta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `idPregunta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  MODIFY `idPuntuacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `idRespuesta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
