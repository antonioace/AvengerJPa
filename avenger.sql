-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-05-2019 a las 05:58:30
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `avenger`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE IF NOT EXISTS `clasificacion` (
  `id` varchar(1) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id`, `descripcion`) VALUES
('A', 'Adultos'),
('N', 'Todas las edades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id` varchar(1) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `descripcion`) VALUES
('A', 'Activo'),
('D', 'Desaparecido'),
('R', 'Retirado'),
('X', 'Fallecido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `id` varchar(1) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `descripcion`) VALUES
('A', 'Androide'),
('E', 'Extraterrestre'),
('H', 'Hombre'),
('M', 'Mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `heroe`
--

CREATE TABLE IF NOT EXISTS `heroe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `heroe` varchar(50) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `fechaaparicion` date DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `descripcion` text,
  `arma` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IXFK_heroe_estado` (`estado`),
  KEY `IXFK_heroe_genero` (`genero`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `heroe`
--

INSERT INTO `heroe` (`id`, `nombre`, `heroe`, `fechanacimiento`, `fechaaparicion`, `genero`, `estado`, `descripcion`, `arma`) VALUES
(1, 'Tony Stark', 'Iron Man', NULL, NULL, 'H', 'X', NULL, NULL),
(2, 'Steve Rogers', 'Capitan America', NULL, NULL, 'H', 'R', NULL, 'Escudo'),
(3, 'Thor', 'Thor', NULL, NULL, 'H', 'A', NULL, NULL),
(4, 'Bruce Banner', 'Hulk', NULL, NULL, 'H', 'A', NULL, NULL),
(5, 'Natasha Romanoff', 'Black Widow', NULL, NULL, 'M', 'X', NULL, NULL),
(6, 'Clint Barton', 'Hawkeye', NULL, NULL, 'H', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE IF NOT EXISTS `participacion` (
  `idheroe` int(11) NOT NULL,
  `idpelicula` int(11) NOT NULL,
  PRIMARY KEY (`idheroe`,`idpelicula`),
  KEY `IXFK_participacion_heroe` (`idheroe`),
  KEY `IXFK_participacion_pelicula` (`idpelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `participacion`
--

INSERT INTO `participacion` (`idheroe`, `idpelicula`) VALUES
(1, 1),
(1, 3),
(1, 6),
(2, 4),
(2, 5),
(2, 6),
(3, 6),
(4, 2),
(4, 6),
(5, 6),
(6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE IF NOT EXISTS `pelicula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `anolanzamiento` decimal(4,0) DEFAULT NULL,
  `anosecuencia` decimal(4,0) DEFAULT NULL,
  `sinopsis` text,
  `clasificacion` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IXFK_pelicula_clasificacion` (`clasificacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `nombre`, `anolanzamiento`, `anosecuencia`, `sinopsis`, `clasificacion`) VALUES
(1, 'Iron Man', '2008', NULL, NULL, 'A'),
(2, 'El Increible Hulk', '2008', NULL, NULL, 'A'),
(3, 'Iron Man 2', '2010', NULL, NULL, 'A'),
(4, 'Thor', '2011', NULL, NULL, 'A'),
(5, 'Capitan America: El Primer Vengador', '2011', NULL, NULL, 'A'),
(6, 'Los Vengadores', '2012', NULL, NULL, 'A'),
(7, 'Iron Man 3', '2013', NULL, NULL, 'A'),
(8, 'Thor: El Mundo Oscuro', '2013', NULL, NULL, 'A'),
(9, 'Capitán América: El Soldado de Invierno', '2014', NULL, NULL, 'A'),
(10, 'Guardianes de la Galaxia', '2014', NULL, NULL, 'A'),
(11, 'Los Vengadores: La Era de Ultrón ', '2015', NULL, NULL, 'A'),
(12, 'Ant-Man', '2015', NULL, NULL, 'A'),
(13, 'Capitán América: Civil War', '2016', NULL, NULL, 'A'),
(14, 'Doctor Strange', '2016', NULL, NULL, 'A'),
(15, 'Guardianes de la Galaxia 2', '2017', NULL, NULL, 'A'),
(16, 'Spider-Man: Homecoming', '2017', NULL, NULL, 'A'),
(17, 'Thor: Ragnarok', '2017', NULL, NULL, 'A'),
(18, 'Pantera Negra', '2018', NULL, NULL, 'A'),
(19, 'Los Vengadores: Infinity War', '2018', NULL, NULL, 'A'),
(20, 'Ant-Man y Wasp', '2018', NULL, NULL, 'A'),
(21, 'Capitana Marvel', '2019', NULL, NULL, 'A'),
(22, 'Los Vengadores: End Game', '2019', NULL, NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planeta`
--

CREATE TABLE IF NOT EXISTS `planeta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planeta`
--

INSERT INTO `planeta` (`id`, `nombre`) VALUES
(1, 'La Tierra'),
(2, 'Xandar'),
(3, 'Evo'),
(4, 'Vormir'),
(5, 'Asgard');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE IF NOT EXISTS `ubicacion` (
  `idpelicula` int(11) NOT NULL,
  `idplaneta` int(11) NOT NULL,
  PRIMARY KEY (`idpelicula`,`idplaneta`),
  KEY `IXFK_ubicacion_pelicula` (`idpelicula`),
  KEY `IXFK_ubicacion_planeta` (`idplaneta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`idpelicula`, `idplaneta`) VALUES
(1, 1),
(2, 1),
(22, 1),
(22, 4);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `heroe`
--
ALTER TABLE `heroe`
  ADD CONSTRAINT `FK_heroe_estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_heroe_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `FK_participacion_heroe` FOREIGN KEY (`idheroe`) REFERENCES `heroe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_participacion_pelicula` FOREIGN KEY (`idpelicula`) REFERENCES `pelicula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `FK_pelicula_clasificacion` FOREIGN KEY (`clasificacion`) REFERENCES `clasificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `FK_ubicacion_pelicula` FOREIGN KEY (`idpelicula`) REFERENCES `pelicula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ubicacion_planeta` FOREIGN KEY (`idplaneta`) REFERENCES `planeta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
