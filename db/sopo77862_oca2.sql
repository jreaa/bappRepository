-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-10-2021 a las 16:51:11
-- Versión del servidor: 10.2.36-MariaDB
-- Versión de PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sopo77862_oca2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accidente`
--

CREATE TABLE `accidente` (
  `id` int(11) NOT NULL,
  `achivo` varchar(255) NOT NULL,
  `f_evento` date NOT NULL,
  `f_resultado` date NOT NULL,
  `resultado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `accidente`
--

INSERT INTO `accidente` (`id`, `achivo`, `f_evento`, `f_resultado`, `resultado`) VALUES
(1, 'Configuracion_Servidores_Linux-20151203-D.pdf', '2020-10-13', '2020-10-29', 'testing!!'),
(2, 'Ejercicio1_S1_TM106 (CCNA2).pdf', '2020-10-23', '2020-10-31', 'testing');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_compesacion`
--

CREATE TABLE `caja_compesacion` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nfantasia` varchar(255) NOT NULL,
  `rubro` varchar(255) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `nconvenio` varchar(255) NOT NULL,
  `t_convenio` varchar(255) NOT NULL,
  `about` varchar(255) NOT NULL,
  `archivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_postular`
--

CREATE TABLE `cargo_postular` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `examen_adicional` tinyint(1) NOT NULL,
  `licencia` tinyint(1) DEFAULT 0,
  `hojaVida` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo_postular`
--

INSERT INTO `cargo_postular` (`id`, `name`, `examen_adicional`, `licencia`, `hojaVida`) VALUES
(1, 'analista programador', 0, 0, 0),
(5, 'supervisor', 1, 0, 0),
(10, 'conductor', 1, 1, 1),
(19, 'CONDUCTOR_CALIFICADO', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cc_vinculacion`
--

CREATE TABLE `cc_vinculacion` (
  `id` int(11) NOT NULL,
  `id_cc` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cc_vinculacion`
--

INSERT INTO `cc_vinculacion` (`id`, `id_cc`, `id_postulante`) VALUES
(2, 3, 91),
(3, 4, 96),
(4, 6, 101),
(5, 4, 102),
(6, 4, 111),
(7, 4, 114),
(17, 4, 115),
(9, 4, 116),
(10, 4, 121),
(11, 5, 122),
(12, 4, 125),
(13, 4, 126),
(14, 4, 127),
(15, 4, 128),
(16, 4, 129),
(18, 4, 92),
(19, 4, 93),
(20, 5, 104),
(21, 4, 94),
(22, 4, 95),
(23, 5, 97),
(24, 4, 98),
(25, 4, 99),
(32, 4, 132),
(27, 4, 103),
(28, 4, 105),
(33, 4, 92),
(34, 4, 140),
(35, 4, 139);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_costo`
--

CREATE TABLE `centro_costo` (
  `id` int(11) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centro_costo`
--

INSERT INTO `centro_costo` (`id`, `cc`, `description`) VALUES
(3, '01-0001', 'supervisor_baptner'),
(4, '01-0003', 'conductor_calificado'),
(5, '01-0004', 'administracion central'),
(6, '01-0005', 'pensionado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checklist`
--

CREATE TABLE `checklist` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `observaciones` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `checklist`
--

INSERT INTO `checklist` (`id`, `id_postulante`, `fecha`, `hora`, `observaciones`) VALUES
(0, 15, '2020-11-02', '14:50:29', 'This is a test!!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_entrevista`
--

CREATE TABLE `comentarios_entrevista` (
  `id` int(11) NOT NULL,
  `id_status_entrevista` int(11) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios_entrevista`
--

INSERT INTO `comentarios_entrevista` (`id`, `id_status_entrevista`, `comentario`) VALUES
(1, 1, 'Este usuario esta calificado exitosa mente.'),
(6, 1, 'este es otro comentario again'),
(5, 1, 'este es otro comentario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_entrevista_telefonica`
--

CREATE TABLE `comentarios_entrevista_telefonica` (
  `id` int(11) NOT NULL,
  `id_entrevista` int(11) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios_entrevista_telefonica`
--

INSERT INTO `comentarios_entrevista_telefonica` (`id`, `id_entrevista`, `comentario`) VALUES
(1, 1, 'este es un comentario'),
(2, 12, 'Aceptado'),
(3, 13, ''),
(4, 14, 'Su valor para la organización:		\r\nEstable, predecible; una amplia esfera de amistades; sabe escuchar\r\nSería más eficaz si:		\r\nPresenta más atención a las fechas límite; tuviera más iniciativa para realizar el trabajo.				\r\n				\r\n				\r\n\r\n			\r\n				\r\n'),
(5, 15, 'Su valor para la organización:		\r\nPlanifica a corto plazo; es predecible, es congruente; mantiene un ritmo uniforme y seguro. 				\r\n				\r\n'),
(6, 16, 'en fin'),
(7, 17, 'testingtestingtesting'),
(8, 18, ''),
(9, 19, 'Su valor para la organización:  Apoya; armoniza; proyecta empatía; está orientado al servicio. 				\r\nSería más eficaz si:Tuviera más conciencia de quién es y de lo que puede hacer;  mostrara más firmeza y agresividad; dijera “no” en los momentos adecuados.				\r\n							\r\n							\r\n							\r\n							\r\n'),
(10, 20, '                    \r\n                '),
(11, 21, '                    \r\n                '),
(12, 22, '                    \r\n                '),
(13, 23, '                    \r\n                ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicados`
--

CREATE TABLE `comunicados` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `leido` varchar(255) NOT NULL,
  `firmado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `t_contrato` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `name`, `t_contrato`, `fecha`, `file`) VALUES
(1, 'test', 'testing', '2020-10-26', '04_Formulario_DIAT.pdf'),
(2, 'test2346', 'testing', '2020-11-10', '04_Formulario_DIAT.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_hora`
--

CREATE TABLE `control_hora` (
  `id` int(11) NOT NULL,
  `requerimiento` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hours` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `control_hora`
--

INSERT INTO `control_hora` (`id`, `requerimiento`, `date`, `hours`, `name`, `rut`, `id_postulante`) VALUES
(3, 'testing', '2020-10-26', '20', 'jose', '1234567-k', 15),
(4, 'testing', '2020-10-26', '20', 'jose', '1234567-k', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_temp`
--

CREATE TABLE `control_temp` (
  `id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `jornada` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'no realizado',
  `hora` timestamp NULL DEFAULT NULL,
  `temperatura` float DEFAULT NULL,
  `id_postulante` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `control_temp`
--

INSERT INTO `control_temp` (`id`, `date`, `jornada`, `status`, `hora`, `temperatura`, `id_postulante`, `created_at`, `updated_at`) VALUES
(17, '2021-02-22', 'entrada', 'realizado', NULL, 38, 1, NULL, '2021-03-26 15:13:13'),
(18, '2021-02-22', 'salida', '', NULL, NULL, 1, NULL, NULL),
(19, '2021-02-22', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(20, '2021-02-22', 'salida', '', NULL, NULL, 2, NULL, NULL),
(21, '2021-02-22', 'entrada', 'realizado', '2021-02-22 16:43:27', 38, 7, NULL, '2021-02-22 16:43:27'),
(22, '2021-02-22', 'salida', 'realizado', '2021-02-23 17:19:07', 36, 7, NULL, '2021-02-23 17:19:07'),
(23, '2021-02-23', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(24, '2021-02-23', 'salida', '', NULL, NULL, 1, NULL, NULL),
(25, '2021-02-23', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(26, '2021-02-23', 'salida', '', NULL, NULL, 2, NULL, NULL),
(28, '2021-02-23', 'salida', 'realizado', '2021-04-01 14:58:40', 35, 7, NULL, NULL),
(29, '2021-02-24', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(30, '2021-02-24', 'salida', '', NULL, NULL, 1, NULL, NULL),
(31, '2021-02-24', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(32, '2021-02-24', 'salida', '', NULL, NULL, 2, NULL, NULL),
(33, '2021-02-24', 'entrada', 'realizado', '2021-04-12 02:31:49', 35.7, 7, NULL, '2021-04-12 02:31:49'),
(34, '2021-02-24', 'salida', '', NULL, NULL, 7, NULL, NULL),
(35, '2021-02-24', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(36, '2021-02-24', 'salida', '', NULL, NULL, 9, NULL, NULL),
(37, '2021-02-25', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(38, '2021-02-25', 'salida', '', NULL, NULL, 1, NULL, NULL),
(39, '2021-02-25', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(40, '2021-02-25', 'salida', '', NULL, NULL, 2, NULL, NULL),
(41, '2021-02-25', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(42, '2021-02-25', 'salida', '', NULL, NULL, 7, NULL, NULL),
(43, '2021-02-25', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(44, '2021-02-25', 'salida', '', NULL, NULL, 9, NULL, NULL),
(45, '2021-02-26', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(46, '2021-02-26', 'salida', '', NULL, NULL, 1, NULL, NULL),
(47, '2021-02-26', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(48, '2021-02-26', 'salida', '', NULL, NULL, 2, NULL, NULL),
(49, '2021-02-26', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(50, '2021-02-26', 'salida', '', NULL, NULL, 7, NULL, NULL),
(51, '2021-02-26', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(52, '2021-02-26', 'salida', '', NULL, NULL, 9, NULL, NULL),
(53, '2021-03-01', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(54, '2021-03-01', 'salida', '', NULL, NULL, 1, NULL, NULL),
(55, '2021-03-01', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(56, '2021-03-01', 'salida', '', NULL, NULL, 2, NULL, NULL),
(57, '2021-03-01', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(58, '2021-03-01', 'salida', '', NULL, NULL, 7, NULL, NULL),
(59, '2021-03-01', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(60, '2021-03-01', 'salida', '', NULL, NULL, 9, NULL, NULL),
(61, '2021-03-02', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(62, '2021-03-02', 'salida', '', NULL, NULL, 1, NULL, NULL),
(63, '2021-03-02', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(64, '2021-03-02', 'salida', '', NULL, NULL, 2, NULL, NULL),
(65, '2021-03-02', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(66, '2021-03-02', 'salida', '', NULL, NULL, 7, NULL, NULL),
(67, '2021-03-02', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(68, '2021-03-02', 'salida', '', NULL, NULL, 9, NULL, NULL),
(69, '2021-03-03', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(70, '2021-03-03', 'salida', '', NULL, NULL, 1, NULL, NULL),
(71, '2021-03-03', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(72, '2021-03-03', 'salida', '', NULL, NULL, 2, NULL, NULL),
(73, '2021-03-03', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(74, '2021-03-03', 'salida', '', NULL, NULL, 7, NULL, NULL),
(75, '2021-03-03', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(76, '2021-03-03', 'salida', '', NULL, NULL, 9, NULL, NULL),
(77, '2021-03-04', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(78, '2021-03-04', 'salida', '', NULL, NULL, 1, NULL, NULL),
(79, '2021-03-04', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(80, '2021-03-04', 'salida', '', NULL, NULL, 2, NULL, NULL),
(81, '2021-03-04', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(82, '2021-03-04', 'salida', '', NULL, NULL, 7, NULL, NULL),
(83, '2021-03-04', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(84, '2021-03-04', 'salida', '', NULL, NULL, 9, NULL, NULL),
(85, '2021-03-05', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(86, '2021-03-05', 'salida', '', NULL, NULL, 1, NULL, NULL),
(87, '2021-03-05', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(88, '2021-03-05', 'salida', '', NULL, NULL, 2, NULL, NULL),
(89, '2021-03-05', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(90, '2021-03-05', 'salida', '', NULL, NULL, 7, NULL, NULL),
(91, '2021-03-05', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(92, '2021-03-05', 'salida', '', NULL, NULL, 9, NULL, NULL),
(93, '2021-03-08', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(94, '2021-03-08', 'salida', '', NULL, NULL, 1, NULL, NULL),
(95, '2021-03-08', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(96, '2021-03-08', 'salida', '', NULL, NULL, 2, NULL, NULL),
(97, '2021-03-08', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(98, '2021-03-08', 'salida', '', NULL, NULL, 7, NULL, NULL),
(99, '2021-03-08', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(100, '2021-03-08', 'salida', '', NULL, NULL, 9, NULL, NULL),
(101, '2021-03-09', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(102, '2021-03-09', 'salida', '', NULL, NULL, 1, NULL, NULL),
(103, '2021-03-09', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(104, '2021-03-09', 'salida', '', NULL, NULL, 2, NULL, NULL),
(105, '2021-03-09', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(106, '2021-03-09', 'salida', '', NULL, NULL, 7, NULL, NULL),
(107, '2021-03-09', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(108, '2021-03-09', 'salida', '', NULL, NULL, 9, NULL, NULL),
(109, '2021-03-10', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(110, '2021-03-10', 'salida', '', NULL, NULL, 1, NULL, NULL),
(111, '2021-03-10', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(112, '2021-03-10', 'salida', '', NULL, NULL, 2, NULL, NULL),
(113, '2021-03-10', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(114, '2021-03-10', 'salida', '', NULL, NULL, 7, NULL, NULL),
(115, '2021-03-10', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(116, '2021-03-10', 'salida', '', NULL, NULL, 9, NULL, NULL),
(117, '2021-03-11', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(118, '2021-03-11', 'salida', '', NULL, NULL, 1, NULL, NULL),
(119, '2021-03-11', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(120, '2021-03-11', 'salida', '', NULL, NULL, 2, NULL, NULL),
(121, '2021-03-11', 'entrada', 'realizado', '2021-03-11 20:17:14', 37, 7, NULL, '2021-03-11 20:17:14'),
(123, '2021-03-11', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(124, '2021-03-11', 'salida', '', NULL, NULL, 9, NULL, NULL),
(125, '2021-03-12', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(126, '2021-03-12', 'salida', '', NULL, NULL, 1, NULL, NULL),
(127, '2021-03-12', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(128, '2021-03-12', 'salida', '', NULL, NULL, 2, NULL, NULL),
(129, '2021-03-12', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(130, '2021-03-12', 'salida', '', NULL, NULL, 7, NULL, NULL),
(131, '2021-03-12', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(132, '2021-03-12', 'salida', '', NULL, NULL, 9, NULL, NULL),
(133, '2021-03-12', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(134, '2021-03-12', 'salida', '', NULL, NULL, 10, NULL, NULL),
(135, '2021-03-15', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(136, '2021-03-15', 'salida', '', NULL, NULL, 1, NULL, NULL),
(137, '2021-03-15', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(138, '2021-03-15', 'salida', '', NULL, NULL, 2, NULL, NULL),
(139, '2021-03-15', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(140, '2021-03-15', 'salida', '', NULL, NULL, 7, NULL, NULL),
(141, '2021-03-15', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(142, '2021-03-15', 'salida', '', NULL, NULL, 9, NULL, NULL),
(143, '2021-03-15', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(144, '2021-03-15', 'salida', '', NULL, NULL, 10, NULL, NULL),
(145, '2021-03-16', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(146, '2021-03-16', 'salida', '', NULL, NULL, 1, NULL, NULL),
(147, '2021-03-16', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(148, '2021-03-16', 'salida', '', NULL, NULL, 2, NULL, NULL),
(149, '2021-03-16', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(150, '2021-03-16', 'salida', '', NULL, NULL, 7, NULL, NULL),
(151, '2021-03-16', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(152, '2021-03-16', 'salida', '', NULL, NULL, 9, NULL, NULL),
(153, '2021-03-16', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(154, '2021-03-16', 'salida', '', NULL, NULL, 10, NULL, NULL),
(155, '2021-03-17', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(156, '2021-03-17', 'salida', '', NULL, NULL, 1, NULL, NULL),
(157, '2021-03-17', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(158, '2021-03-17', 'salida', '', NULL, NULL, 2, NULL, NULL),
(159, '2021-03-17', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(160, '2021-03-17', 'salida', '', NULL, NULL, 7, NULL, NULL),
(161, '2021-03-17', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(162, '2021-03-17', 'salida', '', NULL, NULL, 9, NULL, NULL),
(163, '2021-03-17', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(164, '2021-03-17', 'salida', '', NULL, NULL, 10, NULL, NULL),
(165, '2021-03-18', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(166, '2021-03-18', 'salida', '', NULL, NULL, 1, NULL, NULL),
(167, '2021-03-18', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(168, '2021-03-18', 'salida', '', NULL, NULL, 2, NULL, NULL),
(169, '2021-03-18', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(170, '2021-03-18', 'salida', '', NULL, NULL, 7, NULL, NULL),
(171, '2021-03-18', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(172, '2021-03-18', 'salida', '', NULL, NULL, 9, NULL, NULL),
(173, '2021-03-18', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(174, '2021-03-18', 'salida', '', NULL, NULL, 10, NULL, NULL),
(175, '2021-03-19', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(176, '2021-03-19', 'salida', '', NULL, NULL, 1, NULL, NULL),
(177, '2021-03-19', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(178, '2021-03-19', 'salida', '', NULL, NULL, 2, NULL, NULL),
(179, '2021-03-19', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(180, '2021-03-19', 'salida', '', NULL, NULL, 7, NULL, NULL),
(181, '2021-03-19', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(182, '2021-03-19', 'salida', '', NULL, NULL, 9, NULL, NULL),
(183, '2021-03-19', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(184, '2021-03-19', 'salida', '', NULL, NULL, 10, NULL, NULL),
(185, '2021-03-22', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(186, '2021-03-22', 'salida', '', NULL, NULL, 1, NULL, NULL),
(187, '2021-03-22', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(188, '2021-03-22', 'salida', '', NULL, NULL, 2, NULL, NULL),
(189, '2021-03-22', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(190, '2021-03-22', 'salida', '', NULL, NULL, 7, NULL, NULL),
(191, '2021-03-22', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(192, '2021-03-22', 'salida', '', NULL, NULL, 9, NULL, NULL),
(193, '2021-03-22', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(194, '2021-03-22', 'salida', '', NULL, NULL, 10, NULL, NULL),
(195, '2021-03-23', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(196, '2021-03-23', 'salida', '', NULL, NULL, 1, NULL, NULL),
(197, '2021-03-23', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(198, '2021-03-23', 'salida', '', NULL, NULL, 2, NULL, NULL),
(199, '2021-03-23', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(200, '2021-03-23', 'salida', '', NULL, NULL, 7, NULL, NULL),
(201, '2021-03-23', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(202, '2021-03-23', 'salida', '', NULL, NULL, 9, NULL, NULL),
(203, '2021-03-23', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(204, '2021-03-23', 'salida', '', NULL, NULL, 10, NULL, NULL),
(205, '2021-03-24', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(206, '2021-03-24', 'salida', '', NULL, NULL, 1, NULL, NULL),
(207, '2021-03-24', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(208, '2021-03-24', 'salida', '', NULL, NULL, 2, NULL, NULL),
(209, '2021-03-24', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(210, '2021-03-24', 'salida', '', NULL, NULL, 7, NULL, NULL),
(211, '2021-03-24', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(212, '2021-03-24', 'salida', '', NULL, NULL, 9, NULL, NULL),
(213, '2021-03-24', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(214, '2021-03-24', 'salida', '', NULL, NULL, 10, NULL, NULL),
(215, '2021-03-25', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(216, '2021-03-25', 'salida', '', NULL, NULL, 1, NULL, NULL),
(217, '2021-03-25', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(218, '2021-03-25', 'salida', '', NULL, NULL, 2, NULL, NULL),
(219, '2021-03-25', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(220, '2021-03-25', 'salida', '', NULL, NULL, 7, NULL, NULL),
(221, '2021-03-25', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(222, '2021-03-25', 'salida', '', NULL, NULL, 9, NULL, NULL),
(223, '2021-03-25', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(224, '2021-03-25', 'salida', '', NULL, NULL, 10, NULL, NULL),
(225, '2021-03-26', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(226, '2021-03-26', 'salida', '', NULL, NULL, 1, NULL, NULL),
(227, '2021-03-26', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(228, '2021-03-26', 'salida', '', NULL, NULL, 2, NULL, NULL),
(229, '2021-03-26', 'entrada', 'realizado', NULL, 35, 7, NULL, '2021-03-26 17:01:18'),
(230, '2021-03-26', 'salida', 'realizado', NULL, 36, 7, NULL, '2021-03-26 19:21:36'),
(231, '2021-03-26', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(232, '2021-03-26', 'salida', '', NULL, NULL, 9, NULL, NULL),
(233, '2021-03-26', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(234, '2021-03-26', 'salida', '', NULL, NULL, 10, NULL, NULL),
(235, '2021-03-27', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(236, '2021-03-27', 'salida', '', NULL, NULL, 1, NULL, NULL),
(237, '2021-03-27', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(238, '2021-03-27', 'salida', '', NULL, NULL, 2, NULL, NULL),
(239, '2021-03-27', 'entrada', 'realizado', NULL, 36, 7, NULL, '2021-03-27 22:55:11'),
(240, '2021-03-27', 'salida', '', NULL, NULL, 7, NULL, NULL),
(241, '2021-03-27', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(242, '2021-03-27', 'salida', '', NULL, NULL, 9, NULL, NULL),
(243, '2021-03-27', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(244, '2021-03-27', 'salida', '', NULL, NULL, 10, NULL, NULL),
(245, '2021-03-28', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(246, '2021-03-28', 'salida', '', NULL, NULL, 1, NULL, NULL),
(247, '2021-03-28', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(248, '2021-03-28', 'salida', '', NULL, NULL, 2, NULL, NULL),
(249, '2021-03-28', 'entrada', 'realizado', NULL, 36, 7, NULL, '2021-03-28 03:57:18'),
(250, '2021-03-28', 'salida', '', NULL, NULL, 7, NULL, NULL),
(251, '2021-03-28', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(252, '2021-03-28', 'salida', '', NULL, NULL, 9, NULL, NULL),
(253, '2021-03-28', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(254, '2021-03-28', 'salida', '', NULL, NULL, 10, NULL, NULL),
(255, '2021-03-29', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(256, '2021-03-29', 'salida', '', NULL, NULL, 1, NULL, NULL),
(257, '2021-03-29', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(258, '2021-03-29', 'salida', '', NULL, NULL, 2, NULL, NULL),
(259, '2021-03-29', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(260, '2021-03-29', 'salida', '', NULL, NULL, 7, NULL, NULL),
(261, '2021-03-29', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(262, '2021-03-29', 'salida', '', NULL, NULL, 9, NULL, NULL),
(263, '2021-03-29', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(264, '2021-03-29', 'salida', '', NULL, NULL, 10, NULL, NULL),
(265, '2021-03-30', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(266, '2021-03-30', 'salida', '', NULL, NULL, 1, NULL, NULL),
(267, '2021-03-30', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(268, '2021-03-30', 'salida', '', NULL, NULL, 2, NULL, NULL),
(269, '2021-03-30', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(270, '2021-03-30', 'salida', '', NULL, NULL, 7, NULL, NULL),
(271, '2021-03-30', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(272, '2021-03-30', 'salida', '', NULL, NULL, 9, NULL, NULL),
(273, '2021-03-30', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(274, '2021-03-30', 'salida', '', NULL, NULL, 10, NULL, NULL),
(275, '2021-03-31', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(276, '2021-03-31', 'salida', '', NULL, NULL, 1, NULL, NULL),
(277, '2021-03-31', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(278, '2021-03-31', 'salida', '', NULL, NULL, 2, NULL, NULL),
(279, '2021-03-31', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(280, '2021-03-31', 'salida', '', NULL, NULL, 7, NULL, NULL),
(281, '2021-03-31', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(282, '2021-03-31', 'salida', '', NULL, NULL, 9, NULL, NULL),
(283, '2021-03-31', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(284, '2021-03-31', 'salida', '', NULL, NULL, 10, NULL, NULL),
(285, '2021-04-01', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(286, '2021-04-01', 'salida', '', NULL, NULL, 1, NULL, NULL),
(287, '2021-04-01', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(288, '2021-04-01', 'salida', '', NULL, NULL, 2, NULL, NULL),
(289, '2021-04-01', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(290, '2021-04-01', 'salida', '', NULL, NULL, 7, NULL, NULL),
(291, '2021-04-01', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(292, '2021-04-01', 'salida', '', NULL, NULL, 9, NULL, NULL),
(293, '2021-04-01', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(294, '2021-04-01', 'salida', '', NULL, NULL, 10, NULL, NULL),
(295, '2021-04-02', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(296, '2021-04-02', 'salida', '', NULL, NULL, 1, NULL, NULL),
(297, '2021-04-02', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(298, '2021-04-02', 'salida', '', NULL, NULL, 2, NULL, NULL),
(299, '2021-04-02', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(300, '2021-04-02', 'salida', '', NULL, NULL, 7, NULL, NULL),
(301, '2021-04-02', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(302, '2021-04-02', 'salida', '', NULL, NULL, 9, NULL, NULL),
(303, '2021-04-02', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(304, '2021-04-02', 'salida', '', NULL, NULL, 10, NULL, NULL),
(305, '2021-04-04', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(306, '2021-04-04', 'salida', '', NULL, NULL, 1, NULL, NULL),
(307, '2021-04-04', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(308, '2021-04-04', 'salida', '', NULL, NULL, 2, NULL, NULL),
(309, '2021-04-03', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(310, '2021-04-03', 'salida', '', NULL, NULL, 7, NULL, NULL),
(311, '2021-04-04', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(312, '2021-04-04', 'salida', '', NULL, NULL, 9, NULL, NULL),
(313, '2021-04-04', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(314, '2021-04-03', 'salida', '', NULL, NULL, 10, NULL, NULL),
(315, '2021-04-05', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(316, '2021-04-05', 'salida', '', NULL, NULL, 1, NULL, NULL),
(317, '2021-04-05', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(318, '2021-04-05', 'salida', '', NULL, NULL, 2, NULL, NULL),
(319, '2021-04-05', 'entrada', 'realizado', NULL, 36.1, 7, NULL, '2021-04-05 15:26:03'),
(320, '2021-04-05', 'salida', 'realizado', NULL, 36.4, 7, NULL, '2021-04-05 15:26:12'),
(321, '2021-04-05', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(322, '2021-04-05', 'salida', '', NULL, NULL, 9, NULL, NULL),
(323, '2021-04-05', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(324, '2021-04-05', 'salida', '', NULL, NULL, 10, NULL, NULL),
(325, '2021-04-06', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(326, '2021-04-06', 'salida', '', NULL, NULL, 1, NULL, NULL),
(327, '2021-04-06', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(328, '2021-04-06', 'salida', '', NULL, NULL, 2, NULL, NULL),
(329, '2021-04-06', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(330, '2021-04-06', 'salida', '', NULL, NULL, 7, NULL, NULL),
(331, '2021-04-06', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(332, '2021-04-06', 'salida', '', NULL, NULL, 9, NULL, NULL),
(333, '2021-04-06', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(334, '2021-04-06', 'salida', '', NULL, NULL, 10, NULL, NULL),
(335, '2021-04-07', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(336, '2021-04-07', 'salida', '', NULL, NULL, 1, NULL, NULL),
(337, '2021-04-07', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(338, '2021-04-07', 'salida', '', NULL, NULL, 2, NULL, NULL),
(339, '2021-04-07', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(340, '2021-04-07', 'salida', '', NULL, NULL, 7, NULL, NULL),
(341, '2021-04-07', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(342, '2021-04-07', 'salida', '', NULL, NULL, 9, NULL, NULL),
(343, '2021-04-07', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(344, '2021-04-07', 'salida', '', NULL, NULL, 10, NULL, NULL),
(345, '2021-04-08', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(346, '2021-04-08', 'salida', '', NULL, NULL, 1, NULL, NULL),
(347, '2021-04-08', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(348, '2021-04-08', 'salida', '', NULL, NULL, 2, NULL, NULL),
(349, '2021-04-08', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(350, '2021-04-08', 'salida', '', NULL, NULL, 7, NULL, NULL),
(351, '2021-04-08', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(352, '2021-04-08', 'salida', '', NULL, NULL, 9, NULL, NULL),
(353, '2021-04-08', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(354, '2021-04-08', 'salida', '', NULL, NULL, 10, NULL, NULL),
(355, '2021-04-09', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(356, '2021-04-09', 'salida', '', NULL, NULL, 1, NULL, NULL),
(357, '2021-04-09', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(358, '2021-04-09', 'salida', '', NULL, NULL, 2, NULL, NULL),
(360, '2021-04-09', 'salida', 'realizado', '2021-05-05 10:59:26', 35.7, 7, NULL, NULL),
(361, '2021-04-09', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(362, '2021-04-09', 'salida', '', NULL, NULL, 9, NULL, NULL),
(363, '2021-04-09', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(364, '2021-04-09', 'salida', '', NULL, NULL, 10, NULL, NULL),
(365, '09-04-2021', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(366, '09-04-2021', 'salida', '', NULL, NULL, 1, NULL, NULL),
(367, '09-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(368, '09-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(369, '09-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(370, '09-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(371, '09-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(372, '09-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(373, '09-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(374, '09-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(375, '09-04-2021', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(376, '09-04-2021', 'salida', '', NULL, NULL, 1, NULL, NULL),
(377, '09-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(378, '09-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(379, '09-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(380, '09-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(381, '09-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(382, '09-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(383, '09-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(384, '09-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(385, '12-04-2021', 'entrada', '', NULL, NULL, 1, NULL, NULL),
(386, '12-04-2021', 'salida', '', NULL, NULL, 1, NULL, NULL),
(387, '12-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(388, '12-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(389, '12-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(390, '12-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(391, '12-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(392, '12-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(393, '12-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(394, '12-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(395, '13-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(396, '13-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(397, '13-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(398, '13-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(399, '13-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(400, '13-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(401, '13-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(402, '13-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(403, '13-04-2021', 'entrada', '', NULL, NULL, 13, NULL, NULL),
(404, '13-04-2021', 'salida', '', NULL, NULL, 13, NULL, NULL),
(405, '13-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(406, '13-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(407, '14-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(408, '14-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(409, '14-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(410, '14-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(411, '14-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(412, '14-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(413, '14-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(414, '14-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(415, '14-04-2021', 'entrada', '', NULL, NULL, 13, NULL, NULL),
(416, '14-04-2021', 'salida', '', NULL, NULL, 13, NULL, NULL),
(417, '14-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(418, '14-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(419, '15-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(420, '15-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(421, '15-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(422, '15-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(423, '15-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(424, '15-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(425, '15-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(426, '15-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(427, '15-04-2021', 'entrada', '', NULL, NULL, 13, NULL, NULL),
(428, '15-04-2021', 'salida', '', NULL, NULL, 13, NULL, NULL),
(429, '15-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(430, '15-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(431, '15-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(432, '15-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(433, '16-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(434, '16-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(435, '16-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(436, '16-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(437, '16-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(438, '16-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(439, '16-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(440, '16-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(441, '16-04-2021', 'entrada', '', NULL, NULL, 13, NULL, NULL),
(442, '16-04-2021', 'salida', '', NULL, NULL, 13, NULL, NULL),
(443, '16-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(444, '16-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(445, '16-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(446, '16-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(447, '19-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(448, '19-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(449, '19-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(450, '19-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(451, '19-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(452, '19-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(453, '19-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(454, '19-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(455, '19-04-2021', 'entrada', '', NULL, NULL, 13, NULL, NULL),
(456, '19-04-2021', 'salida', '', NULL, NULL, 13, NULL, NULL),
(457, '19-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(458, '19-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(459, '19-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(460, '19-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(461, '20-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(462, '20-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(463, '20-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(464, '20-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(465, '20-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(466, '20-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(467, '20-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(468, '20-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(469, '20-04-2021', 'entrada', '', NULL, NULL, 13, NULL, NULL),
(470, '20-04-2021', 'salida', '', NULL, NULL, 13, NULL, NULL),
(471, '20-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(472, '20-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(473, '20-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(474, '20-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(475, '21-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(476, '21-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(477, '21-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(478, '21-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(479, '21-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(480, '21-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(481, '21-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(482, '21-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(483, '21-04-2021', 'entrada', '', NULL, NULL, 13, NULL, NULL),
(484, '21-04-2021', 'salida', '', NULL, NULL, 13, NULL, NULL),
(485, '21-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(486, '21-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(487, '21-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(488, '21-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(489, '22-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(490, '22-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(491, '22-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(492, '22-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(493, '22-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(494, '22-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(495, '22-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(496, '22-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(497, '22-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(498, '22-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(499, '22-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(500, '22-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(501, '22-04-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(502, '22-04-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(503, '23-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(504, '23-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(505, '23-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(506, '23-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(507, '23-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(508, '23-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(509, '23-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(510, '23-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(511, '23-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(512, '23-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(513, '23-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(514, '23-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(515, '23-04-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(516, '23-04-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(517, '26-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(518, '26-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(519, '26-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(520, '26-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(521, '26-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(522, '26-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(523, '26-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(524, '26-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(525, '26-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(526, '26-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(527, '26-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(528, '26-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(529, '26-04-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(530, '26-04-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(531, '27-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(532, '27-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(533, '27-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(534, '27-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(535, '27-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(536, '27-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(537, '27-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(538, '27-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(539, '27-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(540, '27-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(541, '27-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(542, '27-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(543, '27-04-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(544, '27-04-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(545, '28-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(546, '28-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(547, '28-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(548, '28-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(549, '28-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(550, '28-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(551, '28-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(552, '28-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(553, '28-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(554, '28-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(555, '28-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(556, '28-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(557, '28-04-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(558, '28-04-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(559, '29-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(560, '29-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(561, '29-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(562, '29-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(563, '29-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(564, '29-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(565, '29-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(566, '29-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(567, '29-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(568, '29-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(569, '29-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(570, '29-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(571, '29-04-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(572, '29-04-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(573, '30-04-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(574, '30-04-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(575, '30-04-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(576, '30-04-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(577, '30-04-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(578, '30-04-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(579, '30-04-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(580, '30-04-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(581, '30-04-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(582, '30-04-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(583, '30-04-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(584, '30-04-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(585, '30-04-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(586, '30-04-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(587, '03-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(588, '03-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(589, '03-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(590, '03-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(591, '03-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(592, '03-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(593, '03-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(594, '03-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(595, '03-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(596, '03-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(597, '03-05-2021', 'entrada', 'realizado', NULL, 35, 15, NULL, '2021-05-04 02:04:45'),
(598, '03-05-2021', 'salida', 'realizado', NULL, 34.5, 15, NULL, '2021-05-04 09:56:39'),
(599, '03-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(600, '03-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(601, '04-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(602, '04-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(603, '04-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(604, '04-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(605, '04-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(606, '04-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(607, '04-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(608, '04-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(609, '04-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(610, '04-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(611, '04-05-2021', 'entrada', 'realizado', NULL, 35.2, 15, NULL, '2021-05-05 01:56:03'),
(612, '04-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(613, '04-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(614, '04-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(615, '05-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(616, '05-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(617, '05-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(618, '05-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(619, '05-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(620, '05-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(621, '05-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(622, '05-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(623, '05-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(624, '05-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(625, '05-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(626, '05-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(627, '05-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(628, '05-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(629, '06-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(630, '06-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(631, '06-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(632, '06-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(633, '06-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(634, '06-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(635, '06-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(636, '06-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(637, '06-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(638, '06-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(639, '06-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(640, '06-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(641, '06-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(642, '06-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(643, '07-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(644, '07-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(645, '07-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(646, '07-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(647, '07-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(648, '07-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(649, '07-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(650, '07-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(651, '07-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(652, '07-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(653, '07-05-2021', 'entrada', 'realizado', NULL, 35.4, 15, NULL, '2021-05-08 01:51:37'),
(654, '07-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(655, '07-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(656, '07-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(657, '10-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(658, '10-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(659, '10-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(660, '10-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(661, '10-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(662, '10-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(663, '10-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(664, '10-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(665, '10-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(666, '10-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(667, '10-05-2021', 'entrada', 'realizado', NULL, 35.7, 15, NULL, '2021-05-11 03:59:08'),
(668, '10-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(669, '10-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(670, '10-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(671, '10-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(672, '10-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(673, '11-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(674, '11-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(675, '11-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(676, '11-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(677, '11-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(678, '11-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(679, '11-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(680, '11-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(681, '11-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(682, '11-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(683, '11-05-2021', 'entrada', 'realizado', NULL, 34, 15, NULL, '2021-05-12 01:49:59'),
(684, '11-05-2021', 'salida', 'realizado', NULL, 34.5, 15, NULL, '2021-05-12 09:59:12'),
(685, '11-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(686, '11-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(687, '11-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(688, '11-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(689, '12-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(690, '12-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(691, '12-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(692, '12-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(693, '12-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(694, '12-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(695, '12-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(696, '12-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(697, '12-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(698, '12-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(699, '12-05-2021', 'entrada', 'realizado', NULL, 35.6, 15, NULL, '2021-05-13 01:58:11'),
(700, '12-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(701, '12-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(702, '12-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(703, '12-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(704, '12-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(705, '13-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(706, '13-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(707, '13-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(708, '13-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(709, '13-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(710, '13-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(711, '13-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(712, '13-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(713, '13-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(714, '13-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(715, '13-05-2021', 'entrada', 'realizado', NULL, 36, 15, NULL, '2021-05-14 02:03:04'),
(716, '13-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(717, '13-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(718, '13-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(719, '13-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(720, '13-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(721, '14-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(722, '14-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(723, '14-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(724, '14-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(725, '14-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(726, '14-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(727, '14-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(728, '14-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(729, '14-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(730, '14-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(731, '14-05-2021', 'entrada', 'realizado', NULL, 36.5, 15, NULL, '2021-05-15 02:09:04'),
(732, '14-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(733, '14-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(734, '14-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(735, '14-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(736, '14-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(737, '17-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(738, '17-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(739, '17-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(740, '17-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(741, '17-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(742, '17-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(743, '17-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(744, '17-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(745, '17-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(746, '17-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(747, '17-05-2021', 'entrada', 'realizado', NULL, 34.8, 15, NULL, '2021-05-18 03:39:52'),
(748, '17-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(749, '17-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(750, '17-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(751, '17-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(752, '17-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(753, '18-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(754, '18-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(755, '18-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(756, '18-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(757, '18-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(758, '18-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(759, '18-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(760, '18-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(761, '18-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(762, '18-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(763, '18-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(764, '18-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(765, '18-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(766, '18-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(767, '18-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(768, '18-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(769, '19-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(770, '19-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(771, '19-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(772, '19-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(773, '19-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(774, '19-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(775, '19-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(776, '19-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(777, '19-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(778, '19-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(779, '19-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(780, '19-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(781, '19-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(782, '19-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(783, '19-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(784, '19-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(785, '20-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(786, '20-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(787, '20-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(788, '20-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(789, '20-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(790, '20-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(791, '20-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(792, '20-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(793, '20-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(794, '20-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(795, '20-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(796, '20-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(797, '20-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(798, '20-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(799, '20-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(800, '20-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(801, '21-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(802, '21-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(803, '21-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(804, '21-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(805, '21-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(806, '21-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(807, '21-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(808, '21-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(809, '21-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(810, '21-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(811, '21-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(812, '21-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(813, '21-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(814, '21-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(815, '21-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(816, '21-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(817, '24-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(818, '24-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(819, '24-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(820, '24-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(821, '24-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(822, '24-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(823, '24-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(824, '24-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(825, '24-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(826, '24-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(827, '24-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(828, '24-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL);
INSERT INTO `control_temp` (`id`, `date`, `jornada`, `status`, `hora`, `temperatura`, `id_postulante`, `created_at`, `updated_at`) VALUES
(829, '24-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(830, '24-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(831, '24-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(832, '24-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(833, '25-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(834, '25-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(835, '25-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(836, '25-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(837, '25-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(838, '25-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(839, '25-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(840, '25-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(841, '25-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(842, '25-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(843, '25-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(844, '25-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(845, '25-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(846, '25-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(847, '25-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(848, '25-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(849, '26-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(850, '26-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(851, '26-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(852, '26-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(853, '26-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(854, '26-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(855, '26-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(856, '26-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(857, '26-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(858, '26-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(859, '26-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(860, '26-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(861, '26-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(862, '26-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(863, '26-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(864, '26-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(865, '27-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(866, '27-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(867, '27-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(868, '27-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(869, '27-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(870, '27-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(871, '27-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(872, '27-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(873, '27-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(874, '27-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(875, '27-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(876, '27-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(877, '27-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(878, '27-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(879, '27-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(880, '27-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(881, '28-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(882, '28-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(883, '28-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(884, '28-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(885, '28-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(886, '28-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(887, '28-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(888, '28-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(889, '28-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(890, '28-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(891, '28-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(892, '28-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(893, '28-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(894, '28-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(895, '28-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(896, '28-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(897, '31-05-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(898, '31-05-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(899, '31-05-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(900, '31-05-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(901, '31-05-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(902, '31-05-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(903, '31-05-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(904, '31-05-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(905, '31-05-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(906, '31-05-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(907, '31-05-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(908, '31-05-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(909, '31-05-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(910, '31-05-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(911, '31-05-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(912, '31-05-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(913, '01-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(914, '01-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(915, '01-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(916, '01-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(917, '01-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(918, '01-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(919, '01-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(920, '01-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(921, '01-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(922, '01-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(923, '01-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(924, '01-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(925, '01-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(926, '01-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(927, '01-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(928, '01-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(929, '02-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(930, '02-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(931, '02-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(932, '02-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(933, '02-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(934, '02-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(935, '02-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(936, '02-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(937, '02-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(938, '02-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(939, '02-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(940, '02-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(941, '02-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(942, '02-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(943, '02-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(944, '02-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(945, '03-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(946, '03-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(947, '03-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(948, '03-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(949, '03-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(950, '03-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(951, '03-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(952, '03-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(953, '03-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(954, '03-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(955, '03-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(956, '03-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(957, '03-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(958, '03-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(959, '03-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(960, '03-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(961, '04-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(962, '04-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(963, '04-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(964, '04-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(965, '04-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(966, '04-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(967, '04-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(968, '04-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(969, '04-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(970, '04-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(971, '04-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(972, '04-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(973, '04-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(974, '04-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(975, '04-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(976, '04-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(977, '07-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(978, '07-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(979, '07-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(980, '07-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(981, '07-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(982, '07-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(983, '07-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(984, '07-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(985, '07-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(986, '07-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(987, '07-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(988, '07-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(989, '07-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(990, '07-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(991, '07-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(992, '07-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(993, '08-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(994, '08-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(995, '08-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(996, '08-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(997, '08-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(998, '08-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(999, '08-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1000, '08-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1001, '08-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1002, '08-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1003, '08-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1004, '08-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1005, '08-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1006, '08-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1007, '08-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1008, '08-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1009, '09-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1010, '09-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1011, '09-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1012, '09-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1013, '09-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1014, '09-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1015, '09-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1016, '09-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1017, '09-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1018, '09-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1019, '09-06-2021', 'entrada', 'realizado', NULL, 33.2, 15, NULL, '2021-06-10 01:53:49'),
(1020, '09-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1021, '09-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1022, '09-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1023, '09-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1024, '09-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1025, '10-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1026, '10-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1027, '10-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1028, '10-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1029, '10-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1030, '10-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1031, '10-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1032, '10-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1033, '10-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1034, '10-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1035, '10-06-2021', 'entrada', 'realizado', NULL, 32.3, 15, NULL, '2021-06-11 01:43:59'),
(1036, '10-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1037, '10-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1038, '10-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1039, '10-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1040, '10-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1041, '11-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1042, '11-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1043, '11-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1044, '11-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1045, '11-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1046, '11-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1047, '11-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1048, '11-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1049, '11-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1050, '11-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1051, '11-06-2021', 'entrada', 'realizado', NULL, 34.9, 15, NULL, '2021-06-12 02:01:27'),
(1052, '11-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1053, '11-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1054, '11-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1055, '11-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1056, '11-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1057, '14-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1058, '14-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1059, '14-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1060, '14-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1061, '14-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1062, '14-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1063, '14-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1064, '14-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1065, '14-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1066, '14-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1067, '14-06-2021', 'entrada', 'realizado', NULL, 35.4, 15, NULL, '2021-06-15 01:46:45'),
(1068, '14-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1069, '14-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1070, '14-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1071, '14-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1072, '14-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1073, '15-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1074, '15-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1075, '15-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1076, '15-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1077, '15-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1078, '15-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1079, '15-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1080, '15-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1081, '15-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1082, '15-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1083, '15-06-2021', 'entrada', 'realizado', NULL, 35.2, 15, NULL, '2021-06-16 01:40:13'),
(1084, '15-06-2021', 'salida', 'realizado', NULL, 34.5, 15, NULL, '2021-06-16 10:06:06'),
(1085, '15-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1086, '15-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1087, '15-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1088, '15-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1089, '16-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1090, '16-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1091, '16-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1092, '16-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1093, '16-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1094, '16-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1095, '16-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1096, '16-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1097, '16-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1098, '16-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1099, '16-06-2021', 'entrada', 'realizado', NULL, 34.4, 15, NULL, '2021-06-17 01:49:53'),
(1100, '16-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1101, '16-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1102, '16-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1103, '16-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1104, '16-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1105, '17-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1106, '17-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1107, '17-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1108, '17-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1109, '17-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1110, '17-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1111, '17-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1112, '17-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1113, '17-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1114, '17-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1115, '17-06-2021', 'entrada', 'realizado', NULL, 35.2, 15, NULL, '2021-06-18 01:42:23'),
(1116, '17-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1117, '17-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1118, '17-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1119, '17-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1120, '17-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1121, '18-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1122, '18-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1123, '18-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1124, '18-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1125, '18-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1126, '18-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1127, '18-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1128, '18-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1129, '18-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1130, '18-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1131, '18-06-2021', 'entrada', 'realizado', NULL, 35.4, 15, NULL, '2021-06-19 01:41:37'),
(1132, '18-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1133, '18-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1134, '18-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1135, '18-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1136, '18-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1137, '21-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1138, '21-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1139, '21-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1140, '21-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1141, '21-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1142, '21-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1143, '21-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1144, '21-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1145, '21-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1146, '21-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1147, '21-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1148, '21-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1149, '21-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1150, '21-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1151, '21-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1152, '21-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1153, '22-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1154, '22-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1155, '22-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1156, '22-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1157, '22-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1158, '22-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1159, '22-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1160, '22-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1161, '22-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1162, '22-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1163, '22-06-2021', 'entrada', 'realizado', NULL, 34.8, 15, NULL, '2021-06-23 01:49:33'),
(1164, '22-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1165, '22-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1166, '22-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1167, '22-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1168, '22-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1169, '23-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1170, '23-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1171, '23-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1172, '23-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1173, '23-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1174, '23-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1175, '23-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1176, '23-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1177, '23-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1178, '23-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1179, '23-06-2021', 'entrada', 'realizado', NULL, 34.4, 15, NULL, '2021-06-24 01:50:16'),
(1180, '23-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1181, '23-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1182, '23-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1183, '23-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1184, '23-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1185, '24-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1186, '24-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1187, '24-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1188, '24-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1189, '24-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1190, '24-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1191, '24-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1192, '24-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1193, '24-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1194, '24-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1195, '24-06-2021', 'entrada', 'realizado', NULL, 34.9, 15, NULL, '2021-06-25 01:55:38'),
(1196, '24-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1197, '24-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1198, '24-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1199, '24-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1200, '24-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1201, '25-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1202, '25-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1203, '25-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1204, '25-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1205, '25-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1206, '25-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1207, '25-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1208, '25-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1209, '25-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1210, '25-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1211, '25-06-2021', 'entrada', 'realizado', NULL, 34.9, 15, NULL, '2021-06-26 01:35:55'),
(1212, '25-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1213, '25-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1214, '25-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1215, '25-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1216, '25-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1217, '28-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1218, '28-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1219, '28-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1220, '28-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1221, '28-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1222, '28-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1223, '28-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1224, '28-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1225, '28-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1226, '28-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1227, '28-06-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1228, '28-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1229, '28-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1230, '28-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1231, '28-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1232, '28-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1233, '29-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1234, '29-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1235, '29-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1236, '29-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1237, '29-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1238, '29-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1239, '29-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1240, '29-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1241, '29-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1242, '29-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1243, '29-06-2021', 'entrada', 'realizado', NULL, 35.2, 15, NULL, '2021-06-30 01:54:57'),
(1244, '29-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1245, '29-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1246, '29-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1247, '29-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1248, '29-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1249, '30-06-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1250, '30-06-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1251, '30-06-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1252, '30-06-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1253, '30-06-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1254, '30-06-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1255, '30-06-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1256, '30-06-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1257, '30-06-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1258, '30-06-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1259, '30-06-2021', 'entrada', 'realizado', NULL, 35.5, 15, NULL, '2021-07-01 01:45:10'),
(1260, '30-06-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1261, '30-06-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1262, '30-06-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1263, '30-06-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1264, '30-06-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1265, '01-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1266, '01-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1267, '01-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1268, '01-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1269, '01-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1270, '01-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1271, '01-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1272, '01-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1273, '01-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1274, '01-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1275, '01-07-2021', 'entrada', 'realizado', NULL, 34, 15, NULL, '2021-07-02 02:03:41'),
(1276, '01-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1277, '01-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1278, '01-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1279, '01-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1280, '01-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1281, '02-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1282, '02-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1283, '02-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1284, '02-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1285, '02-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1286, '02-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1287, '02-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1288, '02-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1289, '02-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1290, '02-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1291, '02-07-2021', 'entrada', 'realizado', NULL, 35.7, 15, NULL, '2021-07-03 01:43:22'),
(1292, '02-07-2021', 'salida', 'realizado', NULL, 35, 15, NULL, '2021-07-03 10:05:09'),
(1293, '02-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1294, '02-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1295, '02-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1296, '02-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1297, '05-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1298, '05-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1299, '05-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1300, '05-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1301, '05-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1302, '05-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1303, '05-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1304, '05-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1305, '05-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1306, '05-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1307, '05-07-2021', 'entrada', 'realizado', NULL, 35, 15, NULL, '2021-07-06 02:01:16'),
(1308, '05-07-2021', 'salida', 'realizado', NULL, 35, 15, NULL, '2021-07-06 10:07:57'),
(1309, '05-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1310, '05-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1311, '05-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1312, '05-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1313, '06-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1314, '06-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1315, '06-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1316, '06-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1317, '06-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1318, '06-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1319, '06-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1320, '06-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1321, '06-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1322, '06-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1323, '06-07-2021', 'entrada', 'realizado', NULL, 34.9, 15, NULL, '2021-07-07 01:41:36'),
(1324, '06-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1325, '06-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1326, '06-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1327, '06-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1328, '06-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1329, '07-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1330, '07-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1331, '07-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1332, '07-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1333, '07-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1334, '07-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1335, '07-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1336, '07-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1337, '07-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1338, '07-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1339, '07-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1340, '07-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1341, '07-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1342, '07-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1343, '07-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1344, '07-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1345, '08-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1346, '08-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1347, '08-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1348, '08-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1349, '08-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1350, '08-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1351, '08-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1352, '08-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1353, '08-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1354, '08-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1355, '08-07-2021', 'entrada', 'realizado', NULL, 34.8, 15, NULL, '2021-07-09 03:37:16'),
(1356, '08-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1357, '08-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1358, '08-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1359, '08-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1360, '08-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1361, '09-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1362, '09-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1363, '09-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1364, '09-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1365, '09-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1366, '09-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1367, '09-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1368, '09-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1369, '09-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1370, '09-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1371, '09-07-2021', 'entrada', 'realizado', NULL, 35.2, 15, NULL, '2021-07-10 01:44:49'),
(1372, '09-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1373, '09-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1374, '09-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1375, '09-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1376, '09-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1377, '12-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1378, '12-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1379, '12-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1380, '12-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1381, '12-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1382, '12-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1383, '12-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1384, '12-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1385, '12-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1386, '12-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1387, '12-07-2021', 'entrada', 'realizado', NULL, 35.1, 15, NULL, '2021-07-13 01:53:21'),
(1388, '12-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1389, '12-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1390, '12-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1391, '12-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1392, '12-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1393, '13-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1394, '13-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1395, '13-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1396, '13-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1397, '13-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1398, '13-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1399, '13-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1400, '13-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1401, '13-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1402, '13-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1403, '13-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1404, '13-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1405, '13-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1406, '13-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1407, '13-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1408, '13-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1409, '13-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1410, '13-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1411, '14-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1412, '14-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1413, '14-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1414, '14-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1415, '14-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1416, '14-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1417, '14-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1418, '14-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1419, '14-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1420, '14-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1421, '14-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1422, '14-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1423, '14-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1424, '14-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1425, '14-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1426, '14-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1427, '14-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1428, '14-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1429, '15-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1430, '15-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1431, '15-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1432, '15-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1433, '15-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1434, '15-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1435, '15-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1436, '15-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1437, '15-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1438, '15-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1439, '15-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1440, '15-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1441, '15-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1442, '15-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1443, '15-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1444, '15-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1445, '15-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1446, '15-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1447, '16-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1448, '16-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1449, '16-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1450, '16-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1451, '16-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1452, '16-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1453, '16-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1454, '16-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1455, '16-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1456, '16-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1457, '16-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1458, '16-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1459, '16-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1460, '16-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1461, '16-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1462, '16-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1463, '16-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1464, '16-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1465, '19-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1466, '19-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1467, '19-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1468, '19-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1469, '19-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1470, '19-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1471, '19-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1472, '19-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1473, '19-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1474, '19-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1475, '19-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1476, '19-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1477, '19-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1478, '19-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1479, '19-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1480, '19-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1481, '19-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1482, '19-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1483, '20-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1484, '20-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1485, '20-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1486, '20-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1487, '20-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1488, '20-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1489, '20-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1490, '20-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1491, '20-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1492, '20-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1493, '20-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1494, '20-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1495, '20-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1496, '20-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1497, '20-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1498, '20-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1499, '20-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1500, '20-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1501, '21-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1502, '21-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1503, '21-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1504, '21-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1505, '21-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1506, '21-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1507, '21-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1508, '21-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1509, '21-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1510, '21-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1511, '21-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1512, '21-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1513, '21-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1514, '21-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1515, '21-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1516, '21-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1517, '21-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1518, '21-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1519, '22-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1520, '22-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1521, '22-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1522, '22-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1523, '22-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1524, '22-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1525, '22-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1526, '22-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1527, '22-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1528, '22-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1529, '22-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1530, '22-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1531, '22-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1532, '22-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1533, '22-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1534, '22-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1535, '22-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1536, '22-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1537, '23-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1538, '23-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1539, '23-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1540, '23-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1541, '23-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1542, '23-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1543, '23-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1544, '23-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1545, '23-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1546, '23-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1547, '23-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1548, '23-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1549, '23-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1550, '23-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1551, '23-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1552, '23-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1553, '23-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1554, '23-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1555, '26-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1556, '26-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1557, '26-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1558, '26-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1559, '26-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1560, '26-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1561, '26-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1562, '26-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1563, '26-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1564, '26-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1565, '26-07-2021', 'entrada', 'realizado', NULL, 35.5, 15, NULL, '2021-07-27 01:59:44'),
(1566, '26-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1567, '26-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1568, '26-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1569, '26-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1570, '26-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1571, '26-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1572, '26-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1573, '26-07-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1574, '26-07-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1575, '27-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1576, '27-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1577, '27-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1578, '27-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1579, '27-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1580, '27-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1581, '27-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1582, '27-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1583, '27-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1584, '27-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1585, '27-07-2021', 'entrada', 'realizado', NULL, 35.1, 15, NULL, '2021-07-28 01:43:17'),
(1586, '27-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1587, '27-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1588, '27-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1589, '27-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1590, '27-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1591, '27-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1592, '27-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1593, '27-07-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1594, '27-07-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1595, '28-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1596, '28-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1597, '28-07-2021', 'entrada', 'realizado', NULL, 37, 7, NULL, '2021-07-28 16:49:24'),
(1598, '28-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1599, '28-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1600, '28-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1601, '28-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1602, '28-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1603, '28-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1604, '28-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1605, '28-07-2021', 'entrada', 'realizado', NULL, 35.5, 15, NULL, '2021-07-29 02:05:18'),
(1606, '28-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1607, '28-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1608, '28-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1609, '28-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1610, '28-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1611, '28-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1612, '28-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1613, '28-07-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1614, '28-07-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1615, '29-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1616, '29-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1617, '29-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1618, '29-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1619, '29-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1620, '29-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1621, '29-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL);
INSERT INTO `control_temp` (`id`, `date`, `jornada`, `status`, `hora`, `temperatura`, `id_postulante`, `created_at`, `updated_at`) VALUES
(1622, '29-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1623, '29-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1624, '29-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1625, '29-07-2021', 'entrada', 'realizado', NULL, 35.1, 15, NULL, '2021-07-30 01:41:43'),
(1626, '29-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1627, '29-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1628, '29-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1629, '29-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1630, '29-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1631, '29-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1632, '29-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1633, '29-07-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1634, '29-07-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1635, '30-07-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1636, '30-07-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1637, '30-07-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1638, '30-07-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1639, '30-07-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1640, '30-07-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1641, '30-07-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1642, '30-07-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1643, '30-07-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1644, '30-07-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1645, '30-07-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1646, '30-07-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1647, '30-07-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1648, '30-07-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1649, '30-07-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1650, '30-07-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1651, '30-07-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1652, '30-07-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1653, '30-07-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1654, '30-07-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1655, '02-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1656, '02-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1657, '02-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1658, '02-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1659, '02-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1660, '02-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1661, '02-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1662, '02-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1663, '02-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1664, '02-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1665, '02-08-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1666, '02-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1667, '02-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1668, '02-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1669, '02-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1670, '02-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1671, '02-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1672, '02-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1673, '02-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1674, '02-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1675, '03-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1676, '03-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1677, '03-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1678, '03-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1679, '03-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1680, '03-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1681, '03-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1682, '03-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1683, '03-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1684, '03-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1685, '03-08-2021', 'entrada', 'realizado', NULL, 34.9, 15, NULL, '2021-08-04 01:48:15'),
(1686, '03-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1687, '03-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1688, '03-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1689, '03-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1690, '03-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1691, '03-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1692, '03-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1693, '03-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1694, '03-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1695, '04-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1696, '04-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1697, '04-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1698, '04-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1699, '04-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1700, '04-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1701, '04-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1702, '04-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1703, '04-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1704, '04-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1705, '04-08-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1706, '04-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1707, '04-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1708, '04-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1709, '04-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1710, '04-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1711, '04-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1712, '04-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1713, '04-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1714, '04-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1715, '05-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1716, '05-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1717, '05-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1718, '05-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1719, '05-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1720, '05-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1721, '05-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1722, '05-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1723, '05-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1724, '05-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1725, '05-08-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1726, '05-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1727, '05-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1728, '05-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1729, '05-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1730, '05-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1731, '05-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1732, '05-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1733, '05-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1734, '05-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1735, '06-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1736, '06-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1737, '06-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1738, '06-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1739, '06-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1740, '06-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1741, '06-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1742, '06-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1743, '06-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1744, '06-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1745, '06-08-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1746, '06-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1747, '06-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1748, '06-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1749, '06-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1750, '06-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1751, '06-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1752, '06-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1753, '06-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1754, '06-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1755, '09-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1756, '09-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1757, '09-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1758, '09-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1759, '09-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1760, '09-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1761, '09-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1762, '09-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1763, '09-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1764, '09-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1765, '09-08-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1766, '09-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1767, '09-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1768, '09-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1769, '09-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1770, '09-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1771, '09-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1772, '09-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1773, '09-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1774, '09-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1775, '10-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1776, '10-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1777, '10-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1778, '10-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1779, '10-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1780, '10-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1781, '10-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1782, '10-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1783, '10-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1784, '10-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1785, '10-08-2021', 'entrada', '', NULL, NULL, 15, NULL, NULL),
(1786, '10-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1787, '10-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1788, '10-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1789, '10-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1790, '10-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1791, '10-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1792, '10-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1793, '10-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1794, '10-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1795, '11-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1796, '11-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1797, '11-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1798, '11-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1799, '11-08-2021', 'entrada', '', NULL, NULL, 9, NULL, NULL),
(1800, '11-08-2021', 'salida', '', NULL, NULL, 9, NULL, NULL),
(1801, '11-08-2021', 'entrada', '', NULL, NULL, 10, NULL, NULL),
(1802, '11-08-2021', 'salida', '', NULL, NULL, 10, NULL, NULL),
(1803, '11-08-2021', 'entrada', '', NULL, NULL, 14, NULL, NULL),
(1804, '11-08-2021', 'salida', '', NULL, NULL, 14, NULL, NULL),
(1805, '11-08-2021', 'entrada', 'realizado', NULL, 34, 15, NULL, '2021-08-12 03:41:38'),
(1806, '11-08-2021', 'salida', '', NULL, NULL, 15, NULL, NULL),
(1807, '11-08-2021', 'entrada', '', NULL, NULL, 19, NULL, NULL),
(1808, '11-08-2021', 'salida', '', NULL, NULL, 19, NULL, NULL),
(1809, '11-08-2021', 'entrada', '', NULL, NULL, 20, NULL, NULL),
(1810, '11-08-2021', 'salida', '', NULL, NULL, 20, NULL, NULL),
(1811, '11-08-2021', 'entrada', '', NULL, NULL, 21, NULL, NULL),
(1812, '11-08-2021', 'salida', '', NULL, NULL, 21, NULL, NULL),
(1813, '11-08-2021', 'entrada', '', NULL, NULL, 22, NULL, NULL),
(1814, '11-08-2021', 'salida', '', NULL, NULL, 22, NULL, NULL),
(1815, '11-08-2021', 'entrada', '', NULL, NULL, 23, NULL, NULL),
(1816, '11-08-2021', 'salida', '', NULL, NULL, 23, NULL, NULL),
(1817, '11-08-2021', 'entrada', '', NULL, NULL, 24, NULL, NULL),
(1818, '11-08-2021', 'salida', '', NULL, NULL, 24, NULL, NULL),
(1819, '12-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1820, '12-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1821, '12-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1822, '12-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1823, '12-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1824, '12-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1825, '12-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1826, '12-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1827, '13-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1828, '13-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1829, '13-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1830, '13-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1831, '13-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1832, '13-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1833, '13-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1834, '13-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1835, '16-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1836, '16-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1837, '16-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1838, '16-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1839, '16-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1840, '16-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1841, '16-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1842, '16-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1843, '17-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1844, '17-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1845, '17-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1846, '17-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1847, '17-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1848, '17-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1849, '17-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1850, '17-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1851, '18-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1852, '18-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1853, '18-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1854, '18-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1855, '18-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1856, '18-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1857, '18-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1858, '18-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1859, '19-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1860, '19-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1861, '19-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1862, '19-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1863, '19-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1864, '19-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1865, '19-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1866, '19-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1867, '19-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1868, '19-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1869, '20-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1870, '20-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1871, '20-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1872, '20-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1873, '20-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1874, '20-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1875, '20-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1876, '20-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1877, '20-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1878, '20-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1879, '20-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1880, '20-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1881, '23-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1882, '23-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1883, '23-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1884, '23-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1885, '23-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1886, '23-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1887, '23-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1888, '23-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1889, '23-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1890, '23-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1891, '23-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1892, '23-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1893, '23-08-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1894, '23-08-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1895, '24-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1896, '24-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1897, '24-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1898, '24-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1899, '24-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1900, '24-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1901, '24-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1902, '24-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1903, '24-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1904, '24-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1905, '24-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1906, '24-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1907, '24-08-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1908, '24-08-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1909, '25-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1910, '25-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1911, '25-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1912, '25-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1913, '25-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1914, '25-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1915, '25-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1916, '25-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1917, '25-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1918, '25-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1919, '25-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1920, '25-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1921, '25-08-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1922, '25-08-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1923, '26-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1924, '26-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1925, '26-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1926, '26-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1927, '26-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1928, '26-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1929, '26-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1930, '26-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1931, '26-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1932, '26-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1933, '26-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1934, '26-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1935, '26-08-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1936, '26-08-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1937, '27-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1938, '27-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1939, '27-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1940, '27-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1941, '27-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1942, '27-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1943, '27-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1944, '27-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1945, '27-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1946, '27-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1947, '27-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1948, '27-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1949, '27-08-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1950, '27-08-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1951, '30-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1952, '30-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1953, '30-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1954, '30-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1955, '30-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1956, '30-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1957, '30-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1958, '30-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1959, '30-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1960, '30-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1961, '30-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1962, '30-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1963, '30-08-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1964, '30-08-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1965, '31-08-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1966, '31-08-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1967, '31-08-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1968, '31-08-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1969, '31-08-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1970, '31-08-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1971, '31-08-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1972, '31-08-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1973, '31-08-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1974, '31-08-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1975, '31-08-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1976, '31-08-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1977, '31-08-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1978, '31-08-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1979, '01-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1980, '01-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1981, '01-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1982, '01-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1983, '01-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1984, '01-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1985, '01-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(1986, '01-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(1987, '01-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(1988, '01-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(1989, '01-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(1990, '01-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(1991, '01-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(1992, '01-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(1993, '02-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(1994, '02-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(1995, '02-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(1996, '02-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(1997, '02-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(1998, '02-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(1999, '02-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2000, '02-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2001, '02-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2002, '02-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2003, '02-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2004, '02-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2005, '02-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2006, '02-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2007, '03-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2008, '03-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2009, '03-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2010, '03-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2011, '03-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2012, '03-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2013, '03-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2014, '03-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2015, '03-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2016, '03-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2017, '03-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2018, '03-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2019, '03-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2020, '03-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2021, '06-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2022, '06-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2023, '06-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2024, '06-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2025, '06-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2026, '06-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2027, '06-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2028, '06-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2029, '06-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2030, '06-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2031, '06-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2032, '06-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2033, '06-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2034, '06-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2035, '06-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2036, '06-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2037, '07-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2038, '07-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2039, '07-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2040, '07-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2041, '07-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2042, '07-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2043, '07-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2044, '07-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2045, '07-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2046, '07-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2047, '07-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2048, '07-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2049, '07-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2050, '07-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2051, '07-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2052, '07-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2053, '07-09-2021', 'entrada', 'realizado', NULL, 36.2, 33, NULL, '2021-09-08 01:21:16'),
(2054, '07-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2055, '08-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2056, '08-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2057, '08-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2058, '08-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2059, '08-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2060, '08-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2061, '08-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2062, '08-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2063, '08-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2064, '08-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2065, '08-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2066, '08-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2067, '08-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2068, '08-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2069, '08-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2070, '08-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2071, '08-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2072, '08-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2073, '09-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2074, '09-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2075, '09-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2076, '09-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2077, '09-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2078, '09-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2079, '09-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2080, '09-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2081, '09-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2082, '09-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2083, '09-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2084, '09-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2085, '09-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2086, '09-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2087, '09-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2088, '09-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2089, '09-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2090, '09-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2091, '10-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2092, '10-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2093, '10-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2094, '10-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2095, '10-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2096, '10-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2097, '10-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2098, '10-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2099, '10-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2100, '10-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2101, '10-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2102, '10-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2103, '10-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2104, '10-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2105, '10-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2106, '10-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2107, '10-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2108, '10-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2109, '13-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2110, '13-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2111, '13-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2112, '13-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2113, '13-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2114, '13-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2115, '13-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2116, '13-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2117, '13-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2118, '13-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2119, '13-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2120, '13-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2121, '13-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2122, '13-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2123, '13-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2124, '13-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2125, '13-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2126, '13-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2127, '14-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2128, '14-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2129, '14-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2130, '14-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2131, '14-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2132, '14-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2133, '14-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2134, '14-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2135, '14-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2136, '14-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2137, '14-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2138, '14-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2139, '14-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2140, '14-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2141, '14-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2142, '14-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2143, '14-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2144, '14-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2145, '15-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2146, '15-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2147, '15-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2148, '15-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2149, '15-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2150, '15-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2151, '15-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2152, '15-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2153, '15-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2154, '15-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2155, '15-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2156, '15-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2157, '15-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2158, '15-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2159, '15-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2160, '15-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2161, '15-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2162, '15-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2163, '16-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2164, '16-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2165, '16-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2166, '16-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2167, '16-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2168, '16-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2169, '16-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2170, '16-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2171, '16-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2172, '16-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2173, '16-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2174, '16-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2175, '16-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2176, '16-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2177, '16-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2178, '16-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2179, '16-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2180, '16-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2181, '17-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2182, '17-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2183, '17-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2184, '17-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2185, '17-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2186, '17-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2187, '17-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2188, '17-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2189, '17-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2190, '17-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2191, '17-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2192, '17-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2193, '17-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2194, '17-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2195, '17-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2196, '17-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2197, '17-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2198, '17-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2199, '20-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2200, '20-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2201, '20-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2202, '20-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2203, '20-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2204, '20-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2205, '20-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2206, '20-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2207, '20-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2208, '20-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2209, '20-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2210, '20-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2211, '20-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2212, '20-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2213, '20-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2214, '20-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2215, '20-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2216, '20-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2217, '21-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2218, '21-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2219, '21-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2220, '21-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2221, '21-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2222, '21-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2223, '21-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2224, '21-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2225, '21-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2226, '21-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2227, '21-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2228, '21-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2229, '21-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2230, '21-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2231, '21-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2232, '21-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2233, '21-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2234, '21-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2235, '21-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2236, '21-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2237, '22-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2238, '22-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2239, '22-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2240, '22-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2241, '22-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2242, '22-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2243, '22-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2244, '22-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2245, '22-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2246, '22-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2247, '22-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2248, '22-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2249, '22-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2250, '22-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2251, '22-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2252, '22-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2253, '22-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2254, '22-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2255, '22-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2256, '22-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2257, '23-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2258, '23-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2259, '23-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2260, '23-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2261, '23-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2262, '23-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2263, '23-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2264, '23-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2265, '23-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2266, '23-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2267, '23-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2268, '23-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2269, '23-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2270, '23-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2271, '23-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2272, '23-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2273, '23-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2274, '23-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2275, '23-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2276, '23-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2277, '24-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2278, '24-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2279, '24-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2280, '24-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2281, '24-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2282, '24-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2283, '24-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2284, '24-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2285, '24-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2286, '24-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2287, '24-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2288, '24-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2289, '24-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2290, '24-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2291, '24-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2292, '24-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2293, '24-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2294, '24-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2295, '24-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2296, '24-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2297, '27-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2298, '27-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2299, '27-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2300, '27-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2301, '27-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2302, '27-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2303, '27-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2304, '27-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2305, '27-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2306, '27-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2307, '27-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2308, '27-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2309, '27-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2310, '27-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2311, '27-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2312, '27-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2313, '27-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2314, '27-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2315, '27-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2316, '27-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2317, '28-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2318, '28-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2319, '28-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2320, '28-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2321, '28-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2322, '28-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2323, '28-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2324, '28-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2325, '28-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2326, '28-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2327, '28-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2328, '28-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2329, '28-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2330, '28-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2331, '28-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2332, '28-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2333, '28-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2334, '28-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2335, '28-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2336, '28-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2337, '29-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2338, '29-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2339, '29-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2340, '29-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2341, '29-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2342, '29-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2343, '29-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2344, '29-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2345, '29-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2346, '29-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2347, '29-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2348, '29-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2349, '29-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2350, '29-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2351, '29-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2352, '29-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2353, '29-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2354, '29-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2355, '29-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2356, '29-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2357, '30-09-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2358, '30-09-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2359, '30-09-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2360, '30-09-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2361, '30-09-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2362, '30-09-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2363, '30-09-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2364, '30-09-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2365, '30-09-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2366, '30-09-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2367, '30-09-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2368, '30-09-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2369, '30-09-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2370, '30-09-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2371, '30-09-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2372, '30-09-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2373, '30-09-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2374, '30-09-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2375, '30-09-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2376, '30-09-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2377, '01-10-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2378, '01-10-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2379, '01-10-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2380, '01-10-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2381, '01-10-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2382, '01-10-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2383, '01-10-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2384, '01-10-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2385, '01-10-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2386, '01-10-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2387, '01-10-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2388, '01-10-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2389, '01-10-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2390, '01-10-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2391, '01-10-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2392, '01-10-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2393, '01-10-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2394, '01-10-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2395, '01-10-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2396, '01-10-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2397, '04-10-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2398, '04-10-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2399, '04-10-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2400, '04-10-2021', 'salida', '', NULL, NULL, 7, NULL, NULL),
(2401, '04-10-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2402, '04-10-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2403, '04-10-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2404, '04-10-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2405, '04-10-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2406, '04-10-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2407, '04-10-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2408, '04-10-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2409, '04-10-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2410, '04-10-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2411, '04-10-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2412, '04-10-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2413, '04-10-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2414, '04-10-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2415, '04-10-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2416, '04-10-2021', 'salida', '', NULL, NULL, 35, NULL, NULL),
(2417, '05-10-2021', 'entrada', '', NULL, NULL, 2, NULL, NULL),
(2418, '05-10-2021', 'salida', '', NULL, NULL, 2, NULL, NULL),
(2419, '05-10-2021', 'entrada', '', NULL, NULL, 7, NULL, NULL),
(2420, '05-10-2021', 'salida', '', NULL, NULL, 7, NULL, NULL);
INSERT INTO `control_temp` (`id`, `date`, `jornada`, `status`, `hora`, `temperatura`, `id_postulante`, `created_at`, `updated_at`) VALUES
(2421, '05-10-2021', 'entrada', '', NULL, NULL, 26, NULL, NULL),
(2422, '05-10-2021', 'salida', '', NULL, NULL, 26, NULL, NULL),
(2423, '05-10-2021', 'entrada', '', NULL, NULL, 27, NULL, NULL),
(2424, '05-10-2021', 'salida', '', NULL, NULL, 27, NULL, NULL),
(2425, '05-10-2021', 'entrada', '', NULL, NULL, 28, NULL, NULL),
(2426, '05-10-2021', 'salida', '', NULL, NULL, 28, NULL, NULL),
(2427, '05-10-2021', 'entrada', '', NULL, NULL, 30, NULL, NULL),
(2428, '05-10-2021', 'salida', '', NULL, NULL, 30, NULL, NULL),
(2429, '05-10-2021', 'entrada', '', NULL, NULL, 31, NULL, NULL),
(2430, '05-10-2021', 'salida', '', NULL, NULL, 31, NULL, NULL),
(2431, '05-10-2021', 'entrada', '', NULL, NULL, 32, NULL, NULL),
(2432, '05-10-2021', 'salida', '', NULL, NULL, 32, NULL, NULL),
(2433, '05-10-2021', 'entrada', '', NULL, NULL, 33, NULL, NULL),
(2434, '05-10-2021', 'salida', '', NULL, NULL, 33, NULL, NULL),
(2435, '05-10-2021', 'entrada', '', NULL, NULL, 35, NULL, NULL),
(2436, '05-10-2021', 'salida', '', NULL, NULL, 35, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio`
--

CREATE TABLE `convenio` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nfantasia` varchar(255) NOT NULL,
  `rubro` varchar(255) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `nconvenio` varchar(255) NOT NULL,
  `t_convenio` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `archivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cron`
--

CREATE TABLE `cron` (
  `name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cron`
--

INSERT INTO `cron` (`name`, `date`) VALUES
('testing', 'running'),
('testing', 'running'),
('testing', 'running'),
('testing', 'running');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desvincular`
--

CREATE TABLE `desvincular` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `fecha_culminacion` date NOT NULL,
  `motivo` text NOT NULL,
  `notificar_trabajador` varchar(255) NOT NULL,
  `finiquito` varchar(255) NOT NULL,
  `firma_notario` varchar(255) NOT NULL,
  `documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `desvincular`
--

INSERT INTO `desvincular` (`id`, `id_postulante`, `fecha_culminacion`, `motivo`, `notificar_trabajador`, `finiquito`, `firma_notario`, `documento`) VALUES
(4, 15, '2020-10-09', 'testing', 'Realizado', 'Realizado', 'Realizado', 'Configuracion_Servidores_Linux-20151203-D.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentaria`
--

CREATE TABLE `documentaria` (
  `id` int(11) NOT NULL,
  `cedula_front` varchar(255) NOT NULL,
  `cedula_back` varchar(255) NOT NULL,
  `antecedentes` varchar(255) NOT NULL,
  `comprobante_domicilio` varchar(255) NOT NULL,
  `AFP` varchar(255) NOT NULL,
  `certificado_salud` varchar(255) NOT NULL,
  `finiquito` varchar(255) NOT NULL,
  `CV` varchar(255) NOT NULL,
  `examen_achs` varchar(255) DEFAULT NULL,
  `hoja_vida` varchar(255) NOT NULL DEFAULT 'default.png',
  `licencia` varchar(255) NOT NULL,
  `licencia_v` date DEFAULT NULL,
  `cedula_v` date DEFAULT NULL,
  `antecedentes_v` date NOT NULL,
  `afp_v` date NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documentaria`
--

INSERT INTO `documentaria` (`id`, `cedula_front`, `cedula_back`, `antecedentes`, `comprobante_domicilio`, `AFP`, `certificado_salud`, `finiquito`, `CV`, `examen_achs`, `hoja_vida`, `licencia`, `licencia_v`, `cedula_v`, `antecedentes_v`, `afp_v`, `id_postulante`) VALUES
(86, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 91),
(87, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 92),
(88, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 93),
(89, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 94),
(90, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 95),
(91, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 96),
(92, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 97),
(93, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 98),
(94, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 99),
(95, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 100),
(96, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 101),
(97, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 102),
(98, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 103),
(99, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 104),
(100, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 105),
(101, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 106),
(102, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 107),
(103, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 108),
(104, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 109),
(105, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 110),
(106, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 111),
(107, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 112),
(108, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 113),
(109, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 114),
(110, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 115),
(111, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 116),
(112, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 117),
(113, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 118),
(114, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 119),
(115, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 120),
(116, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 121),
(117, 'WhatsApp Image 2021-09-07 at 19.49.23.jpeg', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '2022-09-29', '0000-00-00', '0000-00-00', 122),
(118, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 123),
(119, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 124),
(120, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 125),
(121, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 126),
(122, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 127),
(123, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 128),
(124, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', NULL, 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 129),
(132, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', '', 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 137),
(134, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', '', 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 139),
(135, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', '', 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 140),
(136, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', '', 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 141),
(137, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', '', 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 142),
(138, 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', 'default.png', '', 'default.png', 'default.png', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 143);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `img` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `examenes`
--

INSERT INTO `examenes` (`id`, `title`, `description`, `fecha_inicio`, `fecha_cierre`, `img`) VALUES
(10, 'examen2', 'testing', '2020-12-17', '2020-12-25', 'Rubrica.pdf'),
(11, 'formato disco', 'examen', '2021-01-05', '2022-01-05', 'formatDisc.html');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_extra`
--

CREATE TABLE `examen_extra` (
  `id` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `cargo_examen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `examen_extra`
--

INSERT INTO `examen_extra` (`id`, `id_examen`, `cargo_examen`) VALUES
(14, 11, 'supervisor'),
(15, 11, 'conductor calificado'),
(16, 11, 'conductor'),
(17, 10, 'conductor'),
(18, 10, 'conductor'),
(19, 10, 'conductor'),
(20, 10, 'conductor'),
(21, 10, 'conductor'),
(22, 10, 'conductor'),
(26, 10, 'tsting'),
(27, 10, 'testing'),
(28, 10, 'testing'),
(29, 10, 'testing'),
(30, 10, 'testing'),
(31, 10, 'testing'),
(32, 10, 'testing');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `periodo` varchar(255) NOT NULL,
  `vigencia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `files`
--

INSERT INTO `files` (`id`, `file`, `periodo`, `vigencia`) VALUES
(1, 'sobrenos.html', '2020-10-01', '2020-10-16'),
(2, 'achs.png', '2020-10-08', '2020-10-09'),
(3, 'achs.png', '2020-10-09', '2020-10-08'),
(4, 'achs.png', '2020-10-10', '2020-10-17'),
(5, 'Configuracion_Servidores_Linux-20151203-D.pdf', '2020-10-13', '2020-10-29'),
(6, 'Imagen1.png', '2020-10-23', '2020-10-23'),
(7, 'Imagen1.png', '2020-10-23', '2020-10-23'),
(8, 'Imagen1.png', '2020-10-23', '2020-10-23'),
(9, 'Imagen1.png', '2020-10-23', '2020-10-23'),
(10, 'Imagen1.png', '2020-10-23', '2020-10-23'),
(11, 'achs.png', '2020-10-23', '2020-10-23'),
(12, 'Ejercicio1_S1_TM106 (CCNA2).pdf', '2020-10-23', '2020-10-31'),
(13, 'firma.png', '2020-10-23', '2020-10-23'),
(14, 'Solemne1_JoseEra.pdf', '2020-10-26', '2020-10-26'),
(15, 'Solemne1_JoseEra.pdf', '2020-10-26', '2020-10-26'),
(16, 'EvaluaciónSolemne1_AppWeb.docx', '2020-10-26', '2020-10-26'),
(17, 'EvaluaciónSolemne1_AppWeb.docx', '2020-10-26', '2020-10-26'),
(18, 'Configuracion_Servidores_Linux-20151203-D.pdf', '2020-10-28', '2020-10-28'),
(19, 'Configuracion_Servidores_Linux-20151203-D.pdf', '2020-10-28', '2020-10-28'),
(20, 'Configuracion_Servidores_Linux-20151203-D.pdf', '0000-00-00', '0000-00-00'),
(21, 'Configuracion_Servidores_Linux-20151203-D.pdf', '0000-00-00', '0000-00-00'),
(22, 'Conjunto-de-Endpoints-GV2.pdf', '0000-00-00', '0000-00-00'),
(23, 'Configuracion_Servidores_Linux-20151203-D.pdf', '0000-00-00', '0000-00-00'),
(24, '04_Formulario_DIAT.pdf', '2020-10-29', '2020-10-29'),
(25, 'agendar.jpg', '', ''),
(26, 'test.jpg', '2020-11-11', '2020-11-12'),
(27, '04_Formulario_DIAT.pdf', '2020-11-10', '2020-11-11'),
(28, 'test.jpg', '2020-11-10', '2020-11-10'),
(29, 'test.jpg', '2020-11-10', '2020-11-10'),
(30, 'test.jpg', '2020-11-10', '2020-11-10'),
(31, '04_Formulario_DIAT.pdf', '0000-0-0', '0000-0-0'),
(32, '04_Formulario_DIAT.pdf', '0000-0-0', '0000-0-0'),
(33, 'test.jpg', '2020-11-10', '2020-11-10'),
(34, 'test.jpg', '', ''),
(35, 'test.jpg', '2020-11-12', '2020-11-20'),
(36, 'test.jpg', '2020-11-12', '2020-11-20'),
(37, 'test.jpg', '2020-11-11', '2020-11-12'),
(38, 'test.jpg', '2020-11-14', '2020-11-06'),
(39, 'test.jpg', '2020-11-14', '2020-11-06'),
(40, '2.3_Tercer_Contrato_Jorge_Lopez.pdf', '2020-11-24', '2020-11-24'),
(41, 'Solemne III beginner.pdf', '2021-01-07', '2021-01-20'),
(42, 'me.jpg', '2021-01-18', '2021-01-18'),
(43, 'canserbero-1024x585.jpg', '2021-01-18', '2021-01-18'),
(44, 'Solemne III beginner.pdf', '0000-0-0', '0000-0-0'),
(45, 'Solemne III beginner.pdf', '2021-01-19', '2021-01-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `files_achs`
--

CREATE TABLE `files_achs` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `periodo` varchar(255) NOT NULL,
  `vigencia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `files_achs`
--

INSERT INTO `files_achs` (`id`, `file`, `periodo`, `vigencia`) VALUES
(17, '04_Formulario_DIAT.pdf', '0000-0-0', '0000-00-00'),
(18, 'test.jpg', '2020-11-10', '2020-11-05'),
(19, 'Solemne III beginner (1).pdf', '2021', '2021-01-30'),
(20, 'Solemne III beginner.pdf', '2021-01-20', '2021-01-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formatodisc`
--

CREATE TABLE `formatodisc` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `intentos` tinyint(1) NOT NULL,
  `g1` varchar(255) NOT NULL,
  `g2` varchar(255) NOT NULL,
  `g3` varchar(255) NOT NULL,
  `g4` varchar(255) NOT NULL,
  `g5` varchar(255) NOT NULL,
  `g6` varchar(255) NOT NULL,
  `g7` varchar(255) NOT NULL,
  `g8` varchar(255) NOT NULL,
  `g9` varchar(255) NOT NULL,
  `g10` varchar(255) NOT NULL,
  `g11` varchar(255) NOT NULL,
  `g12` varchar(255) NOT NULL,
  `g13` varchar(255) NOT NULL,
  `g14` varchar(255) NOT NULL,
  `g15` varchar(255) NOT NULL,
  `g16` varchar(255) NOT NULL,
  `g17` varchar(255) NOT NULL,
  `g18` varchar(255) NOT NULL,
  `g19` varchar(255) NOT NULL,
  `g20` varchar(255) NOT NULL,
  `g21` varchar(255) NOT NULL,
  `g22` varchar(255) NOT NULL,
  `g23` varchar(255) NOT NULL,
  `g24` varchar(255) NOT NULL,
  `g25` varchar(255) NOT NULL,
  `g26` varchar(255) NOT NULL,
  `g27` varchar(255) NOT NULL,
  `g28` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `formatodisc`
--

INSERT INTO `formatodisc` (`id`, `id_postulante`, `intentos`, `g1`, `g2`, `g3`, `g4`, `g5`, `g6`, `g7`, `g8`, `g9`, `g10`, `g11`, `g12`, `g13`, `g14`, `g15`, `g16`, `g17`, `g18`, `g19`, `g20`, `g21`, `g22`, `g23`, `g24`, `g25`, `g26`, `g27`, `g28`) VALUES
(1, 15, 0, 'mas logico menos apacible', 'mas Cauteloso menos Bondadoso', 'mas Preciso menos Preciso', 'mas Controlado menos Decisivo', 'mas Moderado menos Comunicativo', 'mas Ameno menos Ingenioso', 'mas Expresivo menos Sensible', 'mas Extrovertido menos Constante', 'mas Discreto menos Complaciente', ' menos Pacifico', 'mas Alegre menos Osado', 'mas Independiente menos Independiente', 'mas Considerado menos Competitivo', 'mas Meticuloso menos Obediente', 'mas Popular menos Reflexivo', 'mas Analítico menos Audaz', 'mas Certero menos Certero', 'mas Vivaz menos Prevenido', 'mas Discerniente menosDiscerniente', 'mas trato menos Cauto', 'mas Evaluador menos Generoso', 'mas Enérgico menos Enérgico', 'mas Tolerante menos Vigoroso', 'mas Apegado menos Contento', 'mas Desenvuelto menos Desenvuelto', 'mas Directo menos Ecuánime', 'mas Inquieto menos Inquieto', 'mas Prudente menos Prudente'),
(11, 22, 0, 'mas entusiasta menos logico', 'mas Cauteloso menos Cauteloso', 'mas Amigable menos Preciso', 'mas Elocuente menos Elocuente', 'mas Atrevido menos Concienzudo', 'mas Ameno menos Ingenioso', 'mas Cuidadoso menos Cuidadoso', 'mas Constante menos Impaciente', 'mas Insistente menos Complaciente', 'mas animo menos Pacifico', 'mas Reservado menos Osado', 'mas Gentil menos Gentil', 'mas Competitivo menos Considerado', 'mas Meticuloso menos Alentador', 'mas Calmado menos Tenaz', 'mas Leal menos Analítico', 'mas Sociable menos Sociable', 'mas Resuelto menos Adaptable', 'mas Discerniente menos Amistoso', 'mas trato menos Compasivo', 'mas Evaluador menos Generoso', 'mas Tranquilo menos detalle', 'mas Sistemático menos Vigoroso', 'mas Contento menos Contento', 'mas Comedido menos discutir', 'mas Jovial menos Preciso', 'mas Amable menos Inquieto', 'mas Pionero menos Espontáneo'),
(12, 3, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(13, 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, 5, 0, 'mas entusiasta menos rapido', 'mas Decidido menos Cauteloso', 'mas Amigable menos Preciso', 'mas Elocuente menos Controlado', 'mas Atrevido menos Comunicativo', 'mas Ameno menos Ingenioso', 'mas Cuidadoso menos Cuidadoso', 'mas Precavido menos Extrovertido', 'mas Discreto menos Discreto', 'mas Valeroso menos animo', 'mas Atento menos Atento', 'mas Gentil menos Gentil', 'mas Competitivo menos Sagaz', 'mas Meticuloso menos Alentador', 'mas Reflexivo menos Reflexivo', 'mas Leal menos Promotor', 'mas Certero menos Autosuficiente', 'mas Prevenido menos Resuelto', 'mas Impetuoso menos Agresivo', 'mas directo menos Cauto', 'mas Generoso menos Evaluador', 'mas detalle menos Enérgico', 'mas Vigoroso menos Sistemático', 'mas Contento menos Cautivador', 'mas Metódico menos Desenvuelto', 'mas Jovial menos Preciso', 'mas Amable menos Inquieto', 'mas Prudente menos Pionero'),
(17, 6, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, 6, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, 7, 0, 'mas entusiasta-menos logico', 'mas Cauteloso-menos Decidido', 'mas Franco-menos Preciso', 'mas Elocuente-menos Controlado', 'mas Concienzudo-menos Concienzudo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Dominante', 'mas Precavido-menos Extrovertido', 'mas Discreto-menos Complaciente', 'mas animo-menos Pacifico', 'mas Atento-menos Reservado', 'mas Gentil-menos Estimulante', 'mas Considerado-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Popular-menos Reflexivo', 'mas Audaz-menos Promotor', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Resuelto', 'mas Agresivo-menos Impetuoso', 'mas Compasivo-menos Cauto', 'mas Persistente-menos Generoso', 'mas detalle-menos Enérgico', 'mas Tolerante-menos Vigoroso', 'mas Cautivador-menos Contento', 'mas Metódico-menos discutir', 'mas Jovial-menos Preciso', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(20, 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, 10, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, 10, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, 5, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, 5, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, 5, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, 5, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, 10, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, 1, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, 12, 0, 'mas entusiasta-menos apacible', 'mas Cauteloso-menos Receptivo', 'mas Amigable-menos Preciso', 'mas Tolerante-menos Elocuente', 'mas Concienzudo-menos Atrevido', 'mas Ameno-menos Investigador', 'mas Cuidadoso-menos Dominante', 'mas Constante-menos Impaciente', 'mas Discreto-menos Insistente', 'mas animo-menos Pacifico', 'mas Atento-menos Osado', 'mas Gentil-menos Estimulante', 'mas Competitivo-menos Sagaz', 'mas Obediente-menos Alentador', 'mas Reflexivo-menos Popular', 'mas Leal-menos Audaz', 'mas Autosuficiente-menos Sociable', 'mas Adaptable-menos Resuelto', 'mas Amistoso-menosDiscerniente', 'mas Cauto-menos directo', 'mas Animado-menos Evaluador', 'mas Tranquilo-menos detalle', 'mas Tolerante-menos Sociable', 'mas Exigente-menos Apegado', 'mas Comedido-menos Metódico', 'mas Ecuánime-menos Preciso', 'mas Amable-menos Cuidadoso', 'mas Colaborador-menos Espontáneo'),
(31, 17, 0, 'mas entusiasta-menos logico', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Elocuente-menos Controlado', 'mas Atrevido-menos Comunicativo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Precavido', 'mas Complaciente-menos Insistente', 'mas Valeroso-menos animo', 'mas Reservado-menos Atento', 'mas Estimulante-menos Gentil', 'mas Competitivo-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Reflexivo-menos Tenaz', 'mas Analítico-menos Leal', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Prevenido', 'mas Agresivo-menos Impetuoso', 'mas trato-menos Compasivo', 'mas Animado-menos Generoso', 'mas detalle-menos Tranquilo', 'mas Sistemático-menos Tolerante', 'mas Cautivador-menos Contento', 'mas discutir-menos Metódico', 'mas Jovial-menos Ecuánime', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(32, 18, 0, 'mas entusiasta-menos logico', 'mas Cauteloso-menos Decidido', 'mas Amigable-menos Preciso', 'mas Tolerante-menos Decisivo', 'mas Comunicativo-menos Atrevido', 'mas Ameno-menos Investigador', 'mas Expresivo-menos Sensible', 'mas Precavido-menos Impaciente', 'mas Insistente-menos Complaciente', 'mas Pacifico-menos animo', 'mas Alegre-menos Osado', 'mas Gentil-menos Estimulante', 'mas Alegre-menos Competitivo', 'mas Ideas-menos Alentador', 'mas Calmado-menos Tenaz', 'mas Leal-menos Promotor', 'mas Paciente-menos Certero', 'mas Adaptable-menos Resuelto', 'mas Amistoso-menos Agresivo', 'mas directo-menos Compasivo', 'mas Persistente-menos Evaluador', 'mas detalle-menos Impulsivo', 'mas Tolerante-menos Sistemático', 'mas Apegado-menos Contento', 'mas Metódico-menos discutir', 'mas Directo-menos Jovial', 'mas Amable-menos Inquieto', 'mas Colaborador-menos Pionero'),
(33, 19, 0, 'mas entusiasta-menos apacible', 'mas Bondadoso-menos Cauteloso', 'mas Amigable-menos Preciso', 'mas Tolerante-menos Controlado', 'mas Comunicativo-menos Atrevido', 'mas Ingenioso-menos Ameno', 'mas Dominante-menos Sensible', 'mas Extrovertido-menos Impaciente', 'mas Insistente-menos Complaciente', 'mas animo-menos Pacifico', 'mas Osado-menos Alegre', 'mas Independiente-menos Gentil', 'mas Considerado-menos Competitivo', 'mas Obediente-menos Meticuloso', 'mas Popular-menos  Calmado', 'mas Leal-menos Analítico', 'mas Sociable-menos Paciente', 'mas Adaptable-menos Vivaz', 'mas Amistoso-menos Agresivo', 'mas directo-menos Cauto', 'mas Generoso-menos Evaluador', 'mas Enérgico-menos detalle', 'mas Tolerante-menos Sistemático', 'mas Apegado-menos Exigente', 'mas Comedido-menos discutir', 'mas Jovial-menos Preciso', 'mas Inquieto-menos Cuidadoso', 'mas Prudente-menos Espontáneo'),
(34, 17, 0, 'mas entusiasta-menos logico', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Elocuente-menos Controlado', 'mas Atrevido-menos Comunicativo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Precavido', 'mas Complaciente-menos Insistente', 'mas Valeroso-menos animo', 'mas Reservado-menos Atento', 'mas Estimulante-menos Gentil', 'mas Competitivo-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Reflexivo-menos Tenaz', 'mas Analítico-menos Leal', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Prevenido', 'mas Agresivo-menos Impetuoso', 'mas trato-menos Compasivo', 'mas Animado-menos Generoso', 'mas detalle-menos Tranquilo', 'mas Sistemático-menos Tolerante', 'mas Cautivador-menos Contento', 'mas discutir-menos Metódico', 'mas Jovial-menos Ecuánime', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(35, 17, 0, 'mas entusiasta-menos logico', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Elocuente-menos Controlado', 'mas Atrevido-menos Comunicativo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Precavido', 'mas Complaciente-menos Insistente', 'mas Valeroso-menos animo', 'mas Reservado-menos Atento', 'mas Estimulante-menos Gentil', 'mas Competitivo-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Reflexivo-menos Tenaz', 'mas Analítico-menos Leal', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Prevenido', 'mas Agresivo-menos Impetuoso', 'mas trato-menos Compasivo', 'mas Animado-menos Generoso', 'mas detalle-menos Tranquilo', 'mas Sistemático-menos Tolerante', 'mas Cautivador-menos Contento', 'mas discutir-menos Metódico', 'mas Jovial-menos Ecuánime', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(36, 17, 0, 'mas entusiasta-menos logico', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Elocuente-menos Controlado', 'mas Atrevido-menos Comunicativo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Precavido', 'mas Complaciente-menos Insistente', 'mas Valeroso-menos animo', 'mas Reservado-menos Atento', 'mas Estimulante-menos Gentil', 'mas Competitivo-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Reflexivo-menos Tenaz', 'mas Analítico-menos Leal', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Prevenido', 'mas Agresivo-menos Impetuoso', 'mas trato-menos Compasivo', 'mas Animado-menos Generoso', 'mas detalle-menos Tranquilo', 'mas Sistemático-menos Tolerante', 'mas Cautivador-menos Contento', 'mas discutir-menos Metódico', 'mas Jovial-menos Ecuánime', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(37, 17, 0, 'mas entusiasta-menos logico', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Elocuente-menos Controlado', 'mas Atrevido-menos Comunicativo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Precavido', 'mas Complaciente-menos Insistente', 'mas Valeroso-menos animo', 'mas Reservado-menos Atento', 'mas Estimulante-menos Gentil', 'mas Competitivo-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Reflexivo-menos Tenaz', 'mas Analítico-menos Leal', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Prevenido', 'mas Agresivo-menos Impetuoso', 'mas trato-menos Compasivo', 'mas Animado-menos Generoso', 'mas detalle-menos Tranquilo', 'mas Sistemático-menos Tolerante', 'mas Cautivador-menos Contento', 'mas discutir-menos Metódico', 'mas Jovial-menos Ecuánime', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(38, 17, 0, 'mas entusiasta-menos logico', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Elocuente-menos Controlado', 'mas Atrevido-menos Comunicativo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Precavido', 'mas Complaciente-menos Insistente', 'mas Valeroso-menos animo', 'mas Reservado-menos Atento', 'mas Estimulante-menos Gentil', 'mas Competitivo-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Reflexivo-menos Tenaz', 'mas Analítico-menos Leal', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Prevenido', 'mas Agresivo-menos Impetuoso', 'mas trato-menos Compasivo', 'mas Animado-menos Generoso', 'mas detalle-menos Tranquilo', 'mas Sistemático-menos Tolerante', 'mas Cautivador-menos Contento', 'mas discutir-menos Metódico', 'mas Jovial-menos Ecuánime', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(39, 17, 0, 'mas entusiasta-menos logico', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Elocuente-menos Controlado', 'mas Atrevido-menos Comunicativo', 'mas Ameno-menos Ingenioso', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Precavido', 'mas Complaciente-menos Insistente', 'mas Valeroso-menos animo', 'mas Reservado-menos Atento', 'mas Estimulante-menos Gentil', 'mas Competitivo-menos Considerado', 'mas Meticuloso-menos Obediente', 'mas Reflexivo-menos Tenaz', 'mas Analítico-menos Leal', 'mas Paciente-menos Sociable', 'mas Adaptable-menos Prevenido', 'mas Agresivo-menos Impetuoso', 'mas trato-menos Compasivo', 'mas Animado-menos Generoso', 'mas detalle-menos Tranquilo', 'mas Sistemático-menos Tolerante', 'mas Cautivador-menos Contento', 'mas discutir-menos Metódico', 'mas Jovial-menos Ecuánime', 'mas Inquieto-menos Amable', 'mas Prudente-menos Espontáneo'),
(40, 24, 0, 'mas entusiasta-menos apacible', 'mas Cauteloso-menos Bondadoso', 'mas Franco-menos Tranquilo', 'mas Tolerante-menos Elocuente', 'mas Moderado-menos Atrevido', 'mas Acepta Riesgos-menos Ameno', 'mas Cuidadoso-menos Sensible', 'mas Constante-menos Impaciente', 'mas Insistente-menos Complaciente', 'mas Pacifico-menos animo', 'mas Atento-menos Osado', 'mas Perceptivo-menos Estimulante', 'mas Competitivo-menos Considerado', 'mas Ideas-menos Alentador', 'mas Reflexivo-menos Popular', 'mas Analítico-menos Promotor', 'mas Certero-menos Paciente', 'mas Resuelto-menos Vivaz', 'mas Discerniente-menos Agresivo', 'mas Cauto-menos Compasivo', 'mas Persistente-menos Generoso', 'mas Enérgico-menos Impulsivo', 'mas Sistemático-menos Sociable', 'mas Exigente-menos Cautivador', 'mas Desenvuelto-menos discutir', 'mas Preciso-menos Directo', 'mas Cuidadoso-menos Inquieto', 'mas Prudente-menos Pionero'),
(41, 24, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, 25, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, 26, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(44, 26, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(45, 27, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, 28, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, 29, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, 30, 0, 'mas rapido-menos entusiasta', 'mas Decidido-menos Cauteloso', 'mas Preciso-menos Amigable', 'mas Controlado-menos Elocuente', 'mas Concienzudo-menos Atrevido', 'mas Ingenioso-menos Ameno', 'mas Cuidadoso-menos Expresivo', 'mas Precavido-menos Extrovertido', 'mas Complaciente-menos Discreto', 'mas animo-menos Valeroso', 'mas Atento-menos Reservado', 'mas Gentil-menos Estimulante', 'mas Considerado-menos Competitivo', 'mas Obediente-menos Meticuloso', 'mas Reflexivo-menos Popular', 'mas Audaz-menos Analítico', 'mas Paciente-menos Sociable', 'mas Resuelto-menos Adaptable', 'mas Impetuoso-menos Agresivo', 'mas Compasivo-menos trato', 'mas Generoso-menos Evaluador', 'mas detalle-menos Impulsivo', 'mas Sistemático-menos Sociable', 'mas Contento-menos Cautivador', 'mas Metódico-menos discutir', 'mas Preciso-menos Jovial', 'mas Amable-menos Inquieto', 'mas Pionero-menos Prudente'),
(49, 31, 0, 'mas entusiasta-menos apacible', 'mas Cauteloso-menos Decidido', 'mas Franco-menos Preciso', 'mas Tolerante-menos Decisivo', 'mas Moderado-menos Atrevido', 'mas Acepta Riesgos-menos Ameno', 'mas Cuidadoso-menos Dominante', 'mas Precavido-menos Extrovertido', 'mas Discreto-menos Insistente', 'mas Valeroso-menos Pacifico', 'mas Atento-menos Osado', 'mas Perceptivo-menos Estimulante', 'mas Competitivo-menos Sagaz', 'mas Meticuloso-menos Ideas', 'mas Reflexivo-menos Popular', 'mas Analítico-menos Promotor', 'mas Sociable-menos Autosuficiente', 'mas Adaptable-menos Resuelto', 'mas Amistoso-menos Agresivo', 'mas Cauto-menos directo', 'mas Persistente-menos Generoso', 'mas detalle-menos Impulsivo', 'mas Sociable-menos Vigoroso', 'mas Apegado-menos Cautivador', 'mas Metódico-menos discutir', 'mas Jovial-menos Ecuánime', 'mas Amable-menos Inquieto', 'mas Colaborador-menos Pionero'),
(50, 32, 0, 'mas logico-menos rapido', 'mas Bondadoso-menos Decidido', 'mas Tranquilo-menos Preciso', 'mas Controlado-menos Decisivo', 'mas Comunicativo-menos Atrevido', 'mas Ingenioso-menos Investigador', 'mas Cuidadoso-menos Dominante', 'mas Precavido-menos Extrovertido', 'mas Discreto-menos Encantador', 'mas Valeroso-menos Pacifico', 'mas Atento-menos Osado', 'mas Gentil-menos Independiente', 'mas Alegre-menos Competitivo', 'mas Obediente-menos Ideas', 'mas Calmado-menos Popular', 'mas Analítico-menos Promotor', 'mas Autosuficiente-menos Paciente', 'mas Adaptable-menos Prevenido', 'mas Amistoso-menos Agresivo', 'mas directo-menos Cauto', 'mas Persistente-menos Evaluador', 'mas detalle-menos Enérgico', 'mas Sociable-menos Vigoroso', 'mas Apegado-menos Cautivador', 'mas Metódico-menos discutir', 'mas Directo-menos Ecuánime', 'mas Cuidadoso-menos Inquieto', 'mas Colaborador-menos Pionero'),
(51, 32, 0, 'mas logico-menos rapido', 'mas Bondadoso-menos Decidido', 'mas Tranquilo-menos Preciso', 'mas Controlado-menos Decisivo', 'mas Comunicativo-menos Atrevido', 'mas Ingenioso-menos Investigador', 'mas Cuidadoso-menos Dominante', 'mas Precavido-menos Extrovertido', 'mas Discreto-menos Encantador', 'mas Valeroso-menos Pacifico', 'mas Atento-menos Osado', 'mas Gentil-menos Independiente', 'mas Alegre-menos Competitivo', 'mas Obediente-menos Ideas', 'mas Calmado-menos Popular', 'mas Analítico-menos Promotor', 'mas Autosuficiente-menos Paciente', 'mas Adaptable-menos Prevenido', 'mas Amistoso-menos Agresivo', 'mas directo-menos Cauto', 'mas Persistente-menos Evaluador', 'mas detalle-menos Enérgico', 'mas Sociable-menos Vigoroso', 'mas Apegado-menos Cautivador', 'mas Metódico-menos discutir', 'mas Directo-menos Ecuánime', 'mas Cuidadoso-menos Inquieto', 'mas Colaborador-menos Pionero'),
(52, 33, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, 34, 0, 'mas rapido-menos logico', 'mas Cauteloso-menos Receptivo', 'mas Franco-menos Tranquilo', 'mas Controlado-menos Decisivo', 'mas Comunicativo-menos Atrevido', 'mas Ameno-menos Acepta Riesgos', 'mas Cuidadoso-menos Dominante', 'mas Constante-menos Extrovertido', 'mas Discreto-menos Insistente', 'mas Pacifico-menos Valeroso', 'mas Atento-menos Osado', 'mas Gentil-menos Independiente', 'mas Considerado-menos Competitivo', 'mas Meticuloso-menos Ideas', 'mas Calmado-menos Popular', 'mas Analítico-menos Promotor', 'mas Paciente-menos Certero', 'mas Adaptable-menos Vivaz', 'mas Discerniente-menos Agresivo', 'mas Compasivo-menos Cauto', 'mas Generoso-menos Persistente', 'mas detalle-menos Impulsivo', 'mas Tolerante-menos Sistemático', 'mas Apegado-menos Exigente', 'mas Metódico-menos discutir', 'mas Directo-menos Preciso', 'mas Amable-menos Inquieto', 'mas Prudente-menos Espontáneo'),
(54, 35, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, 36, 0, 'mas logico-menos apacible', 'mas Cauteloso-menos Bondadoso', 'mas Tranquilo-menos Amigable', 'mas Tolerante-menos Decisivo', 'mas Moderado-menos Atrevido', 'mas Ingenioso-menos Acepta Riesgos', 'mas Cuidadoso-menos Expresivo', 'mas Constante-menos Extrovertido', 'mas Discreto-menos Insistente', 'mas Pacifico-menos Valeroso', 'mas Reservado-menos Osado', 'mas Gentil-menos Estimulante', 'mas Considerado-menos Sagaz', 'mas Meticuloso-menos Alentador', 'mas Calmado-menos Popular', 'mas Analítico-menos Audaz', 'mas Paciente-menos Certero', 'mas Adaptable-menos Vivaz', 'mas Discerniente-menos Agresivo', 'mas Cauto-menos directo', 'mas Generoso-menos Persistente', 'mas Tranquilo-menos Impulsivo', 'mas Sistemático-menos Sociable', 'mas Apegado-menos Cautivador', 'mas Metódico-menos discutir', 'mas Ecuánime-menos Jovial', 'mas Cuidadoso-menos Inquieto', 'mas Colaborador-menos Pionero'),
(56, 131, 0, 'mas entusiasta-menos apacible', 'mas Receptivo-menos Decidido', 'mas Amigable-menos Preciso', 'mas Controlado-menos Decisivo', 'mas Comunicativo-menos Atrevido', 'mas Ingenioso-menos Investigador', 'mas Expresivo-menos Dominante', 'mas Constante-menos Extrovertido', 'mas Discreto-menos Insistente', 'mas animo-menos Pacifico', 'mas Atento-menos Osado', 'mas Gentil-menos Estimulante', 'mas Alegre-menos Competitivo', 'mas Alentador-menos Ideas', 'mas Calmado-menos Popular', 'mas Analítico-menos Promotor', 'mas Sociable-menos Certero', 'mas Adaptable-menos Resuelto', 'mas Amistoso-menos Agresivo', 'mas trato-menos Cauto', 'mas Animado-menos Persistente', 'mas Enérgico-menos Tranquilo', 'mas Tolerante-menos Sistemático', 'mas Apegado-menos Cautivador', 'mas Comedido-menos discutir', 'mas Directo-menos Ecuánime', 'mas Cuidadoso-menos Inquieto', 'mas Colaborador-menos Pionero'),
(57, 132, 0, 'mas entusiasta-menos rapido', 'mas Cauteloso-menos Decidido', 'mas Amigable-menos Preciso', 'mas Elocuente-menos Controlado', 'mas Comunicativo-menos Atrevido', 'mas Ameno-menos Investigador', 'mas Cuidadoso-menos Sensible', 'mas Precavido-menos Impaciente', 'mas Discreto-menos Insistente', 'mas Pacifico-menos animo', 'mas Alegre-menos Osado', 'mas Gentil-menos Estimulante', 'mas Competitivo-menos Sagaz', 'mas Meticuloso-menos Alentador', 'mas Calmado-menos Popular', 'mas Analítico-menos Promotor', 'mas Sociable-', 'mas Adaptable-menos Vivaz', 'mas Amistoso-menos Agresivo', 'mas directo-menos Compasivo', 'mas Persistente-menos Evaluador', 'mas Tranquilo-menos Impulsivo', 'mas Sistemático-menos Vigoroso', 'mas Contento-menos Exigente', 'mas Desenvuelto-menos discutir', 'mas Directo-menos Preciso', 'mas Amable-menos Inquieto', 'mas Prudente-menos Espontáneo'),
(58, 137, 0, 'mas logico-menos apacible', 'mas Cauteloso-menos Bondadoso', 'mas Preciso-menos Amigable', 'mas Tolerante-menos Elocuente', 'mas Comunicativo-menos Atrevido', 'mas Ameno-menos Ameno', 'mas Cuidadoso-menos Sensible', 'mas Precavido-menos Impaciente', 'mas Discreto-menos Insistente', 'mas Pacifico-menos Pacifico', 'mas Reservado-menos Alegre', 'mas Gentil-menos Perceptivo', 'mas Competitivo-menos Alegre', 'mas Obediente-menos Alentador', 'mas Tenaz-menos Reflexivo', 'mas Audaz-menos Audaz', 'mas Paciente-menos Autosuficiente', 'mas Resuelto-menos Prevenido', 'mas Amistoso-menos Impetuoso', 'mas Compasivo-menos Compasivo', 'mas Generoso-menos Animado', 'mas detalle-menos detalle', 'mas Sistemático-menos Sistemático', 'mas Contento-menos Contento', 'mas Metódico-menos Metódico', 'mas Preciso-menos Preciso', 'mas Amable-menos Amable', 'mas Pionero-menos Pionero'),
(59, 138, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, 138, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, 139, 0, 'mas entusiasta-menos apacible', 'mas Receptivo-menos Cauteloso', 'mas Amigable-menos Preciso', 'mas Elocuente-menos Decisivo', 'mas Comunicativo-menos Atrevido', 'mas Ingenioso-menos Ameno', 'mas Expresivo-menos Dominante', 'mas Constante-menos Impaciente', 'mas Discreto-menos Insistente', 'mas animo-menos Pacifico', 'mas Atento-menos Reservado', 'mas Gentil-menos Independiente', 'mas Alegre-menos Sagaz', 'mas Alentador-menos Meticuloso', 'mas Reflexivo-menos Tenaz', 'mas Leal-menos Audaz', 'mas Sociable-menos Certero', 'mas Adaptable-menos Vivaz', 'mas Amistoso-menos Agresivo', 'mas trato-menos Compasivo', 'mas Generoso-menos Persistente', 'mas detalle-menos Impulsivo', 'mas Sociable-menos Sistemático', 'mas Apegado-menos Cautivador', 'mas Desenvuelto-menos discutir', 'mas Ecuánime-menos Preciso', 'mas Amable-menos Inquieto', 'mas Prudente-menos Espontáneo'),
(62, 140, 0, 'mas entusiasta-menos logico', 'mas Cauteloso-menos Decidido', 'mas Amigable-menos Franco', 'mas Tolerante-menos Elocuente', 'mas Moderado-menos Atrevido', 'mas Ameno-menos Acepta Riesgos', 'mas Cuidadoso-menos Dominante', 'mas Precavido-menos Impaciente', 'mas Discreto-menos Insistente', 'mas Pacifico-menos Valeroso', 'mas Atento-menos Osado', 'mas Gentil-menos Independiente', 'mas Alegre-menos Sagaz', 'mas Obediente-menos Ideas', 'mas Calmado-menos Popular', 'mas Leal-menos Audaz', 'mas Paciente-menos Certero', 'mas Prevenido-menos Resuelto', 'mas Amistoso-menos Agresivo', 'mas trato-menos directo', 'mas Persistente-menos Evaluador', 'mas detalle-menos Impulsivo', 'mas Sociable-menos Sistemático', 'mas Exigente-menos Cautivador', 'mas Desenvuelto-menos discutir', 'mas Jovial-menos Directo', 'mas Amable-menos Inquieto', 'mas Prudente-menos Pionero'),
(63, 141, 0, 'mas entusiasta-menos rapido', 'mas Cauteloso-menos Decidido', 'mas Amigable-menos Franco', 'mas Elocuente-menos Decisivo', 'mas Comunicativo-menos Atrevido', 'mas Ameno-menos Acepta Riesgos', 'mas Cuidadoso-menos Sensible', 'mas Precavido-menos Impaciente', 'mas Discreto-menos Insistente', 'mas animo-menos Valeroso', 'mas Atento-menos Osado', 'mas Perceptivo-menos Independiente', 'mas Sagaz-menos Competitivo', 'mas Meticuloso-menos Ideas', 'mas Tenaz-menos Popular', 'mas Leal-menos Audaz', 'mas Sociable-menos Autosuficiente', 'mas Adaptable-menos Prevenido', 'mas Amistoso-menos Agresivo', 'mas Cauto-menos directo', 'mas Persistente-menos Generoso', 'mas detalle-menos Impulsivo', 'mas Sistemático-menos Vigoroso', 'mas Cautivador-menos Exigente', 'mas Comedido-menos discutir', 'mas Ecuánime-menos Preciso', 'mas Cuidadoso-menos Inquieto', 'mas Prudente-menos Espontáneo'),
(64, 142, 0, 'mas entusiasta-menos rapido', 'mas Cauteloso-menos Decidido', 'mas Tranquilo-menos Preciso', 'mas Tolerante-menos Decisivo', 'mas Moderado-menos Concienzudo', 'mas Acepta Riesgos-menos Investigador', 'mas Cuidadoso-menos Dominante', 'mas Precavido-menos Impaciente', 'mas Discreto-menos Insistente', 'mas animo-menos Pacifico', 'mas Atento-menos Osado', 'mas Gentil-menos Independiente', 'mas Considerado-menos Competitivo', 'mas Alentador-menos Ideas', 'mas Reflexivo-menos Popular', 'mas Leal-menos Audaz', 'mas Autosuficiente-menos Sociable', 'mas Adaptable-menos Vivaz', 'mas Discerniente-menos Agresivo', 'mas trato-menos Compasivo', 'mas Animado-menos Persistente', 'mas detalle-menos Impulsivo', 'mas Tolerante-menos Sociable', 'mas Apegado-menos Cautivador', 'mas Metódico-menos Comedido', 'mas Jovial-menos Ecuánime', 'mas Amable-menos Inquieto', 'mas Prudente-menos Pionero'),
(65, 143, 0, 'mas logico-menos rapido', 'mas Cauteloso-menos Receptivo', 'mas Amigable-menos Preciso', 'mas Tolerante-menos Decisivo', 'mas Moderado-menos Atrevido', 'mas Acepta Riesgos-menos Ingenioso', 'mas Cuidadoso-menos Dominante', 'mas Precavido-menos Extrovertido', 'mas Complaciente-menos Encantador', 'mas Pacifico-menos animo', 'mas Atento-menos Osado', 'mas Gentil-menos Estimulante', 'mas Considerado-menos Sagaz', 'mas Obediente-menos Meticuloso', 'mas Calmado-menos Popular', 'mas Leal-menos Audaz', 'mas Sociable-menos Paciente', 'mas Adaptable-menos Vivaz', 'mas Amistoso-menos Agresivo', 'mas directo-menos trato', 'mas Generoso-menos Animado', 'mas Tranquilo-menos Enérgico', 'mas Sociable-menos Tolerante', 'mas Contento-menos Exigente', 'mas Comedido-menos discutir', 'mas Directo-menos Jovial', 'mas Amable-menos Inquieto', 'mas Colaborador-menos Pionero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inductivo`
--

CREATE TABLE `inductivo` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_usuario_inductivo` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `comentario_adicional` text DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'proceso'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inductivo`
--

INSERT INTO `inductivo` (`id`, `fecha`, `hora`, `id_usuario_inductivo`, `comentario`, `comentario_adicional`, `archivo`, `status`) VALUES
(9, '2021-09-14', '02:00:00', 91, '[\"cual son los puntos de retiro de person\",\"donde debo marcar mi asistenci\",\"cada cuanto tiempo debo sanitizar mi vehiculo\",\"para que se usa la bitacor\",\"mientra se cumple el turno el telefono debe estar apagado o encendido\"]', NULL, NULL, 'proceso'),
(8, '2021-08-26', '14:21:00', 122, '[\"\\u00bfusted entendio el inductivo?\",\"usted no s\",\"usted si pudo equis cosas\"]', NULL, '01_Clasificacion.xlsx', 'realizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inductivo_resultado`
--

CREATE TABLE `inductivo_resultado` (
  `id` int(11) NOT NULL,
  `id_inductivo` int(11) NOT NULL,
  `fecha_real` date DEFAULT NULL,
  `hora_real` time DEFAULT NULL,
  `comentario` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inductivo_resultado`
--

INSERT INTO `inductivo_resultado` (`id`, `id_inductivo`, `fecha_real`, `hora_real`, `comentario`) VALUES
(4, 6, '2021-08-26', '11:56:01', '[\" testing\",\"testing \"]'),
(5, 7, '2021-08-12', '14:06:32', '[\" testing\",\"testing \",\"testingtesting \",\"testing \"]'),
(7, 8, '2021-08-30', '14:39:50', '[\" si todo correcto\",\"todo perfecto \",\"muy bien todo \"]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informativo`
--

CREATE TABLE `informativo` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_usuario_informativo` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `comentario_adicional` text DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'proceso'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `informativo`
--

INSERT INTO `informativo` (`id`, `fecha`, `hora`, `id_usuario_informativo`, `comentario`, `comentario_adicional`, `archivo`, `status`) VALUES
(3, '2021-09-15', '17:12:00', 122, '[\"testing testing\",\"testing\",\"test test\"]', NULL, 'unnamed.jpg', 'realizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informativo_resultado`
--

CREATE TABLE `informativo_resultado` (
  `id` int(11) NOT NULL,
  `id_informativo` int(11) NOT NULL,
  `fecha_real` date DEFAULT NULL,
  `hora_real` time DEFAULT NULL,
  `comentario` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `informativo_resultado`
--

INSERT INTO `informativo_resultado` (`id`, `id_informativo`, `fecha_real`, `hora_real`, `comentario`) VALUES
(1, 3, '2021-09-06', '17:23:51', '[\" testing\",\"testing \",\"testing testing \"]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `limpieza`
--

CREATE TABLE `limpieza` (
  `id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `hora` time DEFAULT NULL,
  `status` varchar(125) NOT NULL DEFAULT 'no realizado',
  `id_postulante` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `limpieza`
--

INSERT INTO `limpieza` (`id`, `date`, `hora`, `status`, `id_postulante`, `created_at`, `updated_at`) VALUES
(1, '2021-03-27', '09:41:46', 'no realizado', 7, NULL, '2021-03-28 00:28:54'),
(2, '2021-03-26', '21:00:04', 'realizado', 7, NULL, '2021-02-25 00:00:04'),
(3, '2021-04-01', NULL, 'no realizado', 1, NULL, NULL),
(4, '2021-04-01', NULL, 'no realizado', 2, NULL, NULL),
(5, '2021-04-01', NULL, 'no realizado', 7, NULL, NULL),
(6, '2021-04-01', NULL, 'no realizado', 9, NULL, NULL),
(7, '2021-04-01', NULL, 'no realizado', 10, NULL, NULL),
(8, '2021-04-02', NULL, 'no realizado', 1, NULL, NULL),
(9, '2021-04-02', NULL, 'no realizado', 2, NULL, NULL),
(10, '2021-04-02', NULL, 'no realizado', 7, NULL, NULL),
(11, '2021-04-02', NULL, 'no realizado', 9, NULL, NULL),
(12, '2021-04-02', NULL, 'no realizado', 10, NULL, NULL),
(13, '2021-04-03', NULL, 'no realizado', 1, NULL, NULL),
(14, '2021-04-04', NULL, 'no realizado', 2, NULL, NULL),
(15, '2021-04-07', NULL, 'no realizado', 7, NULL, NULL),
(16, '2021-04-04', NULL, 'no realizado', 9, NULL, NULL),
(17, '2021-04-04', NULL, 'no realizado', 10, NULL, NULL),
(18, '2021-04-03', '22:48:05', 'realizado', 7, '2021-04-04 01:48:05', '2021-04-04 01:48:05'),
(19, '2021-04-03', '22:53:10', 'realizado', 7, '2021-04-04 01:53:10', '2021-04-04 01:53:10'),
(20, '2021-04-03', '22:54:06', 'realizado', 7, '2021-04-04 01:54:06', '2021-04-04 01:54:06'),
(21, '2021-04-03', '23:06:27', 'realizado', 7, '2021-04-04 03:06:27', '2021-04-04 03:06:27'),
(22, '2021-04-04', '00:03:49', 'realizado', 7, '2021-04-04 04:03:49', '2021-04-04 04:03:49'),
(23, '2021-04-04', '00:03:52', 'realizado', 7, '2021-04-04 04:03:52', '2021-04-04 04:03:52'),
(24, '2021-04-04', '16:59:25', 'realizado', 7, '2021-04-04 20:59:25', '2021-04-04 20:59:25'),
(25, '2021-04-04', '18:23:11', 'realizado', 7, '2021-04-04 22:23:11', '2021-04-04 22:23:11'),
(26, '2021-04-04', '18:23:12', 'realizado', 7, '2021-04-04 22:23:12', '2021-04-04 22:23:12'),
(27, '2021-04-04', '18:23:13', 'realizado', 7, '2021-04-04 22:23:13', '2021-04-04 22:23:13'),
(28, '2021-04-05', NULL, 'no realizado', 1, NULL, NULL),
(29, '2021-04-05', NULL, 'no realizado', 2, NULL, NULL),
(30, '2021-04-05', '11:28:11', 'realizado', 7, NULL, '2021-04-05 15:28:11'),
(31, '2021-04-05', NULL, 'no realizado', 9, NULL, NULL),
(32, '2021-04-05', NULL, 'no realizado', 10, NULL, NULL),
(33, '2021-04-05', '11:27:56', 'realizado', 7, '2021-04-05 15:27:56', '2021-04-05 15:27:56'),
(34, '2021-04-05', '11:28:26', 'realizado', 7, '2021-04-05 15:28:26', '2021-04-05 15:28:26'),
(35, '2021-04-05', '11:29:07', 'realizado', 7, '2021-04-05 15:29:07', '2021-04-05 15:29:07'),
(36, '2021-04-06', NULL, 'no realizado', 1, NULL, NULL),
(37, '2021-04-06', NULL, 'no realizado', 2, NULL, NULL),
(38, '2021-04-06', NULL, 'no realizado', 7, NULL, NULL),
(39, '2021-04-06', NULL, 'no realizado', 9, NULL, NULL),
(40, '2021-04-06', NULL, 'no realizado', 10, NULL, NULL),
(41, '2021-04-07', NULL, 'no realizado', 1, NULL, NULL),
(42, '2021-04-07', NULL, 'no realizado', 2, NULL, NULL),
(43, '2021-04-07', NULL, 'no realizado', 7, NULL, NULL),
(44, '2021-04-07', NULL, 'no realizado', 9, NULL, NULL),
(45, '2021-04-07', NULL, 'no realizado', 10, NULL, NULL),
(46, '2021-04-08', NULL, 'no realizado', 1, NULL, NULL),
(47, '2021-04-08', NULL, 'no realizado', 2, NULL, NULL),
(48, '2021-04-08', NULL, 'no realizado', 7, NULL, NULL),
(49, '2021-04-08', NULL, 'no realizado', 9, NULL, NULL),
(50, '2021-04-08', NULL, 'no realizado', 10, NULL, NULL),
(51, '2021-04-09', NULL, 'no realizado', 1, NULL, NULL),
(52, '2021-04-09', NULL, 'no realizado', 2, NULL, NULL),
(53, '2021-04-09', NULL, 'no realizado', 7, NULL, NULL),
(54, '2021-04-09', NULL, 'no realizado', 9, NULL, NULL),
(55, '2021-04-09', NULL, 'no realizado', 10, NULL, NULL),
(56, '2021-04-09', '11:43:55', 'realizado', 7, '2021-04-09 15:43:55', '2021-04-09 15:43:55'),
(57, '09-04-2021', '11:44:42', 'realizado', 7, '2021-04-09 15:44:42', '2021-04-09 15:44:42'),
(58, '09-04-2021', '12:00:27', 'realizado', 7, '2021-04-09 16:00:27', '2021-04-09 16:00:27'),
(59, '09-04-2021', '12:23:37', 'realizado', 7, '2021-04-09 16:23:37', '2021-04-09 16:23:37'),
(60, '09-04-2021', '12:23:37', 'realizado', 7, '2021-04-09 16:23:37', '2021-04-09 16:23:37'),
(61, '09-04-2021', '12:23:38', 'realizado', 7, '2021-04-09 16:23:38', '2021-04-09 16:23:38'),
(62, '09-04-2021', '12:23:40', 'realizado', 7, '2021-04-09 16:23:40', '2021-04-09 16:23:40'),
(63, '14-04-2021', '11:42:16', 'realizado', 7, '2021-04-14 15:42:16', '2021-04-14 15:42:16'),
(64, '04-05-2021', '04:55:31', 'realizado', 15, '2021-05-04 08:55:32', '2021-05-04 08:55:32'),
(65, '04-05-2021', '23:13:00', 'realizado', 15, '2021-05-05 03:13:00', '2021-05-05 03:13:00'),
(66, '04-05-2021', '23:13:09', 'realizado', 15, '2021-05-05 03:13:09', '2021-05-05 03:13:09'),
(67, '05-05-2021', '02:53:05', 'realizado', 15, '2021-05-05 06:53:05', '2021-05-05 06:53:05'),
(68, '05-05-2021', '02:53:22', 'realizado', 15, '2021-05-05 06:53:22', '2021-05-05 06:53:22'),
(69, '05-05-2021', '05:51:01', 'realizado', 15, '2021-05-05 09:51:01', '2021-05-05 09:51:01'),
(70, '05-05-2021', '05:51:15', 'realizado', 15, '2021-05-05 09:51:15', '2021-05-05 09:51:15'),
(71, '06-05-2021', '00:36:31', 'realizado', 15, '2021-05-06 04:36:31', '2021-05-06 04:36:31'),
(72, '06-05-2021', '00:36:47', 'realizado', 15, '2021-05-06 04:36:47', '2021-05-06 04:36:47'),
(73, '06-05-2021', '23:43:26', 'realizado', 15, '2021-05-07 03:43:26', '2021-05-07 03:43:26'),
(74, '06-05-2021', '23:43:34', 'realizado', 15, '2021-05-07 03:43:34', '2021-05-07 03:43:34'),
(75, '07-05-2021', '02:13:23', 'realizado', 15, '2021-05-07 06:13:23', '2021-05-07 06:13:23'),
(76, '07-05-2021', '02:13:31', 'realizado', 15, '2021-05-07 06:13:31', '2021-05-07 06:13:31'),
(77, '08-05-2021', '01:54:27', 'realizado', 15, '2021-05-08 05:54:27', '2021-05-08 05:54:27'),
(78, '08-05-2021', '01:54:28', 'realizado', 15, '2021-05-08 05:54:28', '2021-05-08 05:54:28'),
(79, '08-05-2021', '04:43:29', 'realizado', 15, '2021-05-08 08:43:29', '2021-05-08 08:43:29'),
(80, '08-05-2021', '04:43:32', 'realizado', 15, '2021-05-08 08:43:32', '2021-05-08 08:43:32'),
(81, '08-05-2021', '05:50:14', 'realizado', 15, '2021-05-08 09:50:14', '2021-05-08 09:50:14'),
(82, '10-05-2021', '23:59:28', 'realizado', 15, '2021-05-11 03:59:28', '2021-05-11 03:59:28'),
(83, '10-05-2021', '23:59:31', 'realizado', 15, '2021-05-11 03:59:31', '2021-05-11 03:59:31'),
(84, '12-05-2021', '00:17:34', 'realizado', 15, '2021-05-12 04:17:34', '2021-05-12 04:17:34'),
(85, '12-05-2021', '00:17:36', 'realizado', 15, '2021-05-12 04:17:36', '2021-05-12 04:17:36'),
(86, '12-05-2021', '05:58:51', 'realizado', 15, '2021-05-12 09:58:51', '2021-05-12 09:58:51'),
(87, '13-05-2021', '00:02:47', 'realizado', 15, '2021-05-13 04:02:47', '2021-05-13 04:02:47'),
(88, '13-05-2021', '00:02:49', 'realizado', 15, '2021-05-13 04:02:49', '2021-05-13 04:02:49'),
(89, '13-05-2021', '05:07:04', 'realizado', 15, '2021-05-13 09:07:04', '2021-05-13 09:07:04'),
(90, '13-05-2021', '05:07:06', 'realizado', 15, '2021-05-13 09:07:06', '2021-05-13 09:07:06'),
(91, '17-05-2021', '23:40:22', 'realizado', 15, '2021-05-18 03:40:22', '2021-05-18 03:40:22'),
(92, '17-05-2021', '23:40:27', 'realizado', 15, '2021-05-18 03:40:27', '2021-05-18 03:40:27'),
(93, '10-06-2021', '02:21:19', 'realizado', 15, '2021-06-10 06:21:19', '2021-06-10 06:21:19'),
(94, '10-06-2021', '02:21:20', 'realizado', 15, '2021-06-10 06:21:20', '2021-06-10 06:21:20'),
(95, '10-06-2021', '03:25:31', 'realizado', 15, '2021-06-10 07:25:31', '2021-06-10 07:25:31'),
(96, '10-06-2021', '03:25:32', 'realizado', 15, '2021-06-10 07:25:32', '2021-06-10 07:25:32'),
(97, '11-06-2021', '23:44:25', 'realizado', 15, '2021-06-12 03:44:25', '2021-06-12 03:44:25'),
(98, '11-06-2021', '23:44:28', 'realizado', 15, '2021-06-12 03:44:28', '2021-06-12 03:44:28'),
(99, '15-06-2021', '00:33:01', 'realizado', 15, '2021-06-15 04:33:01', '2021-06-15 04:33:01'),
(100, '15-06-2021', '00:33:03', 'realizado', 15, '2021-06-15 04:33:03', '2021-06-15 04:33:03'),
(101, '15-06-2021', '05:56:00', 'realizado', 15, '2021-06-15 09:56:00', '2021-06-15 09:56:00'),
(102, '15-06-2021', '05:56:02', 'realizado', 15, '2021-06-15 09:56:02', '2021-06-15 09:56:02'),
(103, '15-06-2021', '23:38:33', 'realizado', 15, '2021-06-16 03:38:33', '2021-06-16 03:38:33'),
(104, '15-06-2021', '23:38:36', 'realizado', 15, '2021-06-16 03:38:36', '2021-06-16 03:38:36'),
(105, '16-06-2021', '04:39:05', 'realizado', 15, '2021-06-16 08:39:05', '2021-06-16 08:39:05'),
(106, '16-06-2021', '04:39:06', 'realizado', 15, '2021-06-16 08:39:06', '2021-06-16 08:39:06'),
(107, '17-06-2021', '02:31:37', 'realizado', 15, '2021-06-17 06:31:37', '2021-06-17 06:31:37'),
(108, '17-06-2021', '02:31:45', 'realizado', 15, '2021-06-17 06:31:45', '2021-06-17 06:31:45'),
(109, '17-06-2021', '23:36:27', 'realizado', 15, '2021-06-18 03:36:27', '2021-06-18 03:36:27'),
(110, '17-06-2021', '23:36:30', 'realizado', 15, '2021-06-18 03:36:30', '2021-06-18 03:36:30'),
(111, '18-06-2021', '04:39:08', 'realizado', 15, '2021-06-18 08:39:08', '2021-06-18 08:39:08'),
(112, '18-06-2021', '04:39:10', 'realizado', 15, '2021-06-18 08:39:10', '2021-06-18 08:39:10'),
(113, '19-06-2021', '03:37:08', 'realizado', 15, '2021-06-19 07:37:08', '2021-06-19 07:37:08'),
(114, '19-06-2021', '03:37:09', 'realizado', 15, '2021-06-19 07:37:09', '2021-06-19 07:37:09'),
(115, '19-06-2021', '05:40:43', 'realizado', 15, '2021-06-19 09:40:43', '2021-06-19 09:40:43'),
(116, '19-06-2021', '05:40:44', 'realizado', 15, '2021-06-19 09:40:44', '2021-06-19 09:40:44'),
(117, '22-06-2021', '23:04:05', 'realizado', 15, '2021-06-23 03:04:05', '2021-06-23 03:04:05'),
(118, '23-06-2021', '05:36:02', 'realizado', 15, '2021-06-23 09:36:02', '2021-06-23 09:36:02'),
(119, '23-06-2021', '23:58:25', 'realizado', 15, '2021-06-24 03:58:25', '2021-06-24 03:58:25'),
(120, '23-06-2021', '23:58:28', 'realizado', 15, '2021-06-24 03:58:28', '2021-06-24 03:58:28'),
(121, '24-06-2021', '03:10:44', 'realizado', 15, '2021-06-24 07:10:44', '2021-06-24 07:10:44'),
(122, '24-06-2021', '22:52:50', 'realizado', 15, '2021-06-25 02:52:50', '2021-06-25 02:52:50'),
(123, '24-06-2021', '22:52:52', 'realizado', 15, '2021-06-25 02:52:52', '2021-06-25 02:52:52'),
(124, '25-06-2021', '04:35:07', 'realizado', 15, '2021-06-25 08:35:07', '2021-06-25 08:35:07'),
(125, '25-06-2021', '04:35:09', 'realizado', 15, '2021-06-25 08:35:09', '2021-06-25 08:35:09'),
(126, '29-06-2021', '23:41:05', 'realizado', 15, '2021-06-30 03:41:05', '2021-06-30 03:41:05'),
(127, '29-06-2021', '23:41:08', 'realizado', 15, '2021-06-30 03:41:08', '2021-06-30 03:41:08'),
(128, '30-06-2021', '05:41:53', 'realizado', 15, '2021-06-30 09:41:53', '2021-06-30 09:41:53'),
(129, '30-06-2021', '05:41:55', 'realizado', 15, '2021-06-30 09:41:55', '2021-06-30 09:41:55'),
(130, '02-07-2021', '05:35:51', 'realizado', 15, '2021-07-02 09:35:51', '2021-07-02 09:35:51'),
(131, '02-07-2021', '05:35:52', 'realizado', 15, '2021-07-02 09:35:52', '2021-07-02 09:35:52'),
(132, '06-07-2021', '04:41:09', 'realizado', 15, '2021-07-06 08:41:09', '2021-07-06 08:41:09'),
(133, '06-07-2021', '04:41:10', 'realizado', 15, '2021-07-06 08:41:10', '2021-07-06 08:41:10'),
(134, '07-09-2021', '22:24:03', 'realizado', 33, '2021-09-08 01:24:03', '2021-09-08 01:24:03'),
(135, '07-09-2021', '22:24:10', 'realizado', 33, '2021-09-08 01:24:10', '2021-09-08 01:24:10'),
(136, '07-09-2021', '22:24:11', 'realizado', 33, '2021-09-08 01:24:11', '2021-09-08 01:24:11'),
(137, '11-09-2021', '07:52:10', 'realizado', 15, '2021-09-11 10:52:10', '2021-09-11 10:52:10'),
(138, '21-09-2021', '03:28:07', 'realizado', 15, '2021-09-21 06:28:07', '2021-09-21 06:28:07'),
(139, '21-09-2021', '03:28:09', 'realizado', 15, '2021-09-21 06:28:09', '2021-09-21 06:28:09'),
(140, '22-09-2021', '03:58:05', 'realizado', 15, '2021-09-22 06:58:05', '2021-09-22 06:58:05'),
(141, '22-09-2021', '03:58:07', 'realizado', 15, '2021-09-22 06:58:07', '2021-09-22 06:58:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantencion_siniestro`
--

CREATE TABLE `mantencion_siniestro` (
  `id` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `patente` varchar(255) NOT NULL,
  `modelo_v` varchar(255) NOT NULL,
  `n_reserva` int(11) NOT NULL,
  `taller` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `t_servicio` varchar(255) NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `resultado` varchar(255) NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monestacion`
--

CREATE TABLE `monestacion` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `formato` varchar(255) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `leido` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `description`, `usuario`, `fecha`) VALUES
(8, 'El ha calificado al usuario Jose Era , el cual ha sido aceptado ', 'Jose Era', '2021-02-01'),
(6, 'Se ha creado una nueva entrevista presencial para el usuario Jose Era ', 'Jose Era', '2021-02-01'),
(7, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' Jose Era', '2021-02-01'),
(9, 'Se ha creado un nuevo postulante: Jose Era Era ', 'Jose Era Era', '2021-02-01'),
(10, 'Se ha creado una nueva entrevista presencial para el usuario Jose Era ', 'Jose Era', '2021-02-19'),
(11, 'El ha calificado al usuario Jose Era , el cual ha sido aceptado ', 'Jose Era', '2021-02-19'),
(12, 'Se ha creado una nueva entrevista presencial para el usuario Jose Era ', 'Jose Era', '2021-02-19'),
(13, 'El ha calificado al usuario Jose Era , el cual ha sido aceptado ', 'Jose Era', '2021-02-19'),
(14, 'Se ha creado una nueva entrevista presencial para el usuario Jose Era ', 'Jose Era', '2021-02-19'),
(15, 'El ha calificado al usuario Jose Era , el cual ha sido aceptado ', 'Jose Era', '2021-02-19'),
(16, 'Se ha creado un nuevo postulante: Maria Jose Silva Morales ', 'Maria Jose Silva Morales', '2021-02-23'),
(17, 'Se ha creado una nueva entrevista telefonica para el usuario Maria Jose Silva Morales Silva Morales ', 'Maria Jose Silva Morales Silva Morales', '2021-02-23'),
(18, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-02-23'),
(19, 'El ha calificado al usuario Maria Jose  Silva Morales , el cual ha sido aceptado ', 'Maria Jose  Silva Morales', '2021-02-23'),
(20, 'Se ha creado una nueva entrevista telefonica para el usuario Maria Jose  Silva Morales ', 'Maria Jose  Silva Morales', '2021-02-23'),
(21, 'El ha calificado al usuario Maria Jose  Silva Morales , el cual ha sido aceptado ', 'Maria Jose  Silva Morales', '2021-02-23'),
(22, 'Se ha creado un nuevo postulante: Juan Ochando ', 'Juan Ochando', '2021-03-11'),
(23, 'Se ha creado una nueva entrevista presencial para el usuario Juan Ochando Ochando ', 'Juan Ochando Ochando', '2021-03-11'),
(24, 'El ha calificado al usuario Juan Ochando Ochando , el cual ha sido aceptado ', 'Juan Ochando Ochando', '2021-03-11'),
(25, 'Se ha creado un nuevo postulante: Jhon Doe ', 'Jhon Doe', '2021-03-15'),
(26, 'Se ha creado una nueva entrevista presencial para el usuario Jhon Doe Doe ', 'Jhon Doe Doe', '2021-03-15'),
(27, 'Se ha creado una nueva entrevista presencial para el usuario Jhon Doe Doe ', 'Jhon Doe Doe', '2021-03-24'),
(28, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-03-24'),
(29, 'Se ha creado una nueva entrevista telefonica para el usuario Jonathan Miguel Fuentes Osorio ', 'Jonathan Miguel Fuentes Osorio', '2021-04-10'),
(30, 'Se ha creado un nuevo postulante: Prueba Prueba 1 ', 'Prueba Prueba 1', '2021-04-10'),
(31, 'Se ha creado una nueva entrevista telefonica para el usuario Prueba Prueba 1 Prueba 1 ', 'Prueba Prueba 1 Prueba 1', '2021-04-10'),
(32, 'Se ha creado un nuevo postulante: Test Test ', 'Test Test', '2021-04-12'),
(33, 'Se ha creado una nueva entrevista presencial para el usuario Test Test Test ', 'Test Test Test', '2021-04-12'),
(34, 'El ha calificado al usuario Test Test Test , el cual ha sido aceptado ', 'Test Test Test', '2021-04-12'),
(35, 'El ha calificado al usuario Test Test Test , el cual ha sido aceptado ', 'Test Test Test', '2021-04-12'),
(36, 'Se ha creado un nuevo postulante: Prueba Prueba ', 'Prueba Prueba', '2021-04-12'),
(37, 'Se ha creado una nueva entrevista telefonica para el usuario Prueba Prueba Prueba ', 'Prueba Prueba Prueba', '2021-04-12'),
(38, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-04-12'),
(39, 'El ha calificado al usuario Prueba Prueba Prueba , el cual ha sido aceptado ', 'Prueba Prueba Prueba', '2021-04-12'),
(40, 'Se ha creado un nuevo postulante: Jorge Hans Escobar Olivera ', 'Jorge Hans Escobar Olivera', '2021-04-13'),
(41, 'Se ha creado una nueva entrevista telefonica para el usuario JORGE HANS ESCOBAR OLIVERA ', 'JORGE HANS ESCOBAR OLIVERA', '2021-04-13'),
(42, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-04-13'),
(43, 'El ha calificado al usuario JORGE HANS ESCOBAR OLIVERA , el cual ha sido aceptado ', 'JORGE HANS ESCOBAR OLIVERA', '2021-04-14'),
(44, 'Se ha creado una nueva entrevista telefonica para el usuario JONATHAN MIGUEL  FUENTES OSORIO ', 'JONATHAN MIGUEL  FUENTES OSORIO', '2021-04-14'),
(45, 'Se ha creado una nueva entrevista telefonica para el usuario JONATHAN MIGUEL  FUENTES OSORIO ', 'JONATHAN MIGUEL  FUENTES OSORIO', '2021-04-16'),
(46, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-04-17'),
(47, 'Se ha creado un nuevo postulante: Test Ceo ', 'Test Ceo', '2021-04-21'),
(48, 'Se ha creado una nueva entrevista presencial para el usuario Test Ceo Ceo ', 'Test Ceo Ceo', '2021-04-22'),
(49, 'El ha calificado al usuario Test Ceo Ceo , el cual ha sido aceptado ', 'Test Ceo Ceo', '2021-04-22'),
(50, 'El ha calificado al usuario Test Ceo Ceo , el cual ha sido aceptado ', 'Test Ceo Ceo', '2021-04-22'),
(51, 'Se ha creado un nuevo postulante: Luis Armando Alex Tapia Caro ', 'Luis Armando Alex Tapia Caro', '2021-05-07'),
(52, 'Se ha creado una nueva entrevista telefonica para el usuario Luis Armando Alex Tapia Caro Tapia Caro ', 'Luis Armando Alex Tapia Caro Tapia Caro', '2021-05-07'),
(53, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-05-07'),
(54, 'El ha calificado al usuario Luis Armando Alex Tapia Caro Tapia Caro , el cual ha sido aceptado ', 'Luis Armando Alex Tapia Caro Tapia Caro', '2021-05-07'),
(55, 'Se ha creado una nueva entrevista telefonica para el usuario Jorge Rodolfo Edmundo  Lopez Figueroa ', 'Jorge Rodolfo Edmundo  Lopez Figueroa', '2021-05-28'),
(56, 'El ha calificado al usuario Jose Era , el cual ha sido rechazado ', 'Jose Era', '2021-06-07'),
(57, 'El ha calificado al usuario Jose Era , el cual ha sido rechazado ', 'Jose Era', '2021-06-07'),
(58, 'El ha calificado al usuario Jose Era , el cual ha sido rechazado ', 'Jose Era', '2021-06-07'),
(59, 'El ha calificado al usuario Jose Era , el cual ha sido rechazado ', 'Jose Era', '2021-06-07'),
(60, 'Se ha creado un nuevo postulante: Santiago Sebastian Lopez Sandoval ', 'Santiago Sebastian Lopez Sandoval', '2021-07-09'),
(61, 'Se ha creado una nueva entrevista telefonica para el usuario Santiago Sebastian Lopez Sandoval ', 'Santiago Sebastian Lopez Sandoval', '2021-07-09'),
(62, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-07-09'),
(63, 'El ha calificado al usuario Santiago Sebastian Lopez Sandoval , el cual ha sido aceptado ', 'Santiago Sebastian Lopez Sandoval', '2021-07-12'),
(64, 'El ha calificado al usuario Jorge Rodolfo Edmundo  Lopez Figueroa , el cual ha sido aceptado ', 'Jorge Rodolfo Edmundo  Lopez Figueroa', '2021-07-25'),
(65, 'Se ha creado un nuevo postulante: Jorge Rodolfo Edmundo  Lopez Figueroa ', 'Jorge Rodolfo Edmundo  Lopez Figueroa', '2021-07-25'),
(66, 'Se ha creado un nuevo postulante: Felipe Gerardo Sepulveda Pizarro ', 'Felipe Gerardo Sepulveda Pizarro', '2021-08-10'),
(67, 'Se ha creado una nueva entrevista telefonica para el usuario Felipe Gerardo Sepulveda Pizarro Sepulveda Pizarro ', 'Felipe Gerardo Sepulveda Pizarro Sepulveda Pizarro', '2021-08-10'),
(68, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-08-10'),
(69, 'El ha calificado al usuario Felipe Gerardo Sepulveda Pizarro Sepulveda Pizarro , el cual ha sido aceptado ', 'Felipe Gerardo Sepulveda Pizarro Sepulveda Pizarro', '2021-08-11'),
(70, 'Se ha creado un nuevo postulante: Ricardo Elias Pino Droguett ', 'Ricardo Elias Pino Droguett', '2021-08-11'),
(71, 'Se ha creado una nueva entrevista telefonica para el usuario Ricardo Elias Pino Droguett Pino Droguett ', 'Ricardo Elias Pino Droguett Pino Droguett', '2021-08-11'),
(72, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-08-11'),
(73, 'El ha calificado al usuario Ricardo Elias Pino Droguett Pino Droguett , el cual ha sido aceptado ', 'Ricardo Elias Pino Droguett Pino Droguett', '2021-08-11'),
(74, 'Se ha creado un nuevo postulante: Testing Testing ', 'Testing Testing', '2021-08-18'),
(75, 'Se ha creado un nuevo postulante: Testing2 Testing ', 'Testing2 Testing', '2021-08-18'),
(76, 'Se ha creado un nuevo postulante: Testing3 Testing3 ', 'Testing3 Testing3', '2021-08-18'),
(77, 'Se ha creado un nuevo postulante: Testing Testing ', 'Testing Testing', '2021-08-18'),
(78, 'Se ha creado un nuevo postulante: Prueba Prueba ', 'Prueba Prueba', '2021-08-18'),
(79, 'Se ha creado una nueva entrevista telefonica para el usuario Prueba Prueba Prueba ', 'Prueba Prueba Prueba', '2021-08-18'),
(80, 'Se ha creado un nuevo postulante: Testing Testing ', 'Testing Testing', '2021-08-18'),
(81, 'Se ha creado una nueva entrevista telefonica para el usuario Testing Testing Testing ', 'Testing Testing Testing', '2021-08-18'),
(82, 'Se ha creado una nueva entrevista telefonica para el usuario Testing Testing Testing ', 'Testing Testing Testing', '2021-08-18'),
(83, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-08-18'),
(84, 'El ha calificado al usuario Prueba Prueba Prueba , el cual ha sido aceptado ', 'Prueba Prueba Prueba', '2021-08-18'),
(85, 'Se ha creado un nuevo postulante: Felipe Gerardo Sepulveda Pizarro ', 'Felipe Gerardo Sepulveda Pizarro', '2021-08-19'),
(86, 'Se ha creado una nueva entrevista telefonica para el usuario Felipe Gerardo Sepulveda Pizarro ', 'Felipe Gerardo Sepulveda Pizarro', '2021-08-19'),
(87, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-08-19'),
(88, 'El ha calificado al usuario Felipe Gerardo Sepulveda Pizarro , el cual ha sido aceptado ', 'Felipe Gerardo Sepulveda Pizarro', '2021-08-19'),
(89, 'Se ha creado un nuevo postulante: Daniel Alejandro Gomez Rubio ', 'Daniel Alejandro Gomez Rubio', '2021-08-20'),
(90, 'Se ha creado una nueva entrevista telefonica para el usuario Daniel Alejandro Gomez Rubio ', 'Daniel Alejandro Gomez Rubio', '2021-08-20'),
(91, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-08-20'),
(92, 'El ha calificado al usuario Daniel Alejandro Gomez Rubio , el cual ha sido aceptado ', 'Daniel Alejandro Gomez Rubio', '2021-08-20'),
(93, 'Se ha creado un nuevo postulante: Orlando Patricio  Ramirez Torrez ', 'Orlando Patricio  Ramirez Torrez', '2021-09-02'),
(94, 'Se ha creado una nueva entrevista telefonica para el usuario Orlando Patricio  Ramirez Torrez ', 'Orlando Patricio  Ramirez Torrez', '2021-09-02'),
(95, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-09-03'),
(96, 'El ha calificado al usuario Orlando Patricio  Ramirez Torrez , el cual ha sido aceptado ', 'Orlando Patricio  Ramirez Torrez', '2021-09-03'),
(97, 'Se ha creado un nuevo postulante: Jorge Isidro  Parra Acevedo ', 'Jorge Isidro  Parra Acevedo', '2021-09-06'),
(98, 'Se ha creado una nueva entrevista telefonica para el usuario Jorge Isidro  Parra Acevedo ', 'Jorge Isidro  Parra Acevedo', '2021-09-06'),
(99, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-09-06'),
(100, 'El ha calificado al usuario Jorge Isidro  Parra Acevedo , el cual ha sido aceptado ', 'Jorge Isidro  Parra Acevedo', '2021-09-06'),
(101, 'Se ha creado un nuevo postulante: Peter Aland Charrier MuÑoz ', 'Peter Aland Charrier MuÑoz', '2021-09-20'),
(102, 'Se ha creado una nueva entrevista telefonica para el usuario Peter Aland Charrier MuÑoz ', 'Peter Aland Charrier MuÑoz', '2021-09-20'),
(103, 'El usuario   ha realizado el examen, formato disco satisfactoriamente ', ' ', '2021-09-20'),
(104, 'El ha calificado al usuario Peter Aland Charrier MuÑoz , el cual ha sido aceptado ', 'Peter Aland Charrier MuÑoz', '2021-09-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `departamento` varchar(255) NOT NULL,
  `tipo_permiso` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `firma` varchar(255) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulante`
--

CREATE TABLE `postulante` (
  `id` int(225) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `date_born` varchar(255) NOT NULL,
  `genere` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `writer` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `disponible` varchar(255) NOT NULL DEFAULT 'En Proceso',
  `cargo_postular` varchar(255) NOT NULL,
  `cedula` varchar(255) NOT NULL,
  `numero_licencia` varchar(255) NOT NULL,
  `examen_adicional` tinyint(1) DEFAULT 0,
  `fecha_postulacion` date NOT NULL,
  `nivel_educacion` varchar(255) NOT NULL DEFAULT 'Media Basica',
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `postulante`
--

INSERT INTO `postulante` (`id`, `rut`, `name`, `lastname`, `date_born`, `genere`, `email`, `address`, `phone`, `country`, `city`, `date`, `writer`, `img`, `disponible`, `cargo_postular`, `cedula`, `numero_licencia`, `examen_adicional`, `fecha_postulacion`, `nivel_educacion`, `fecha_inicio`, `fecha_final`) VALUES
(91, '17546221-k', 'MARIA JOSE SILVA MORALES', 'MARIA JOSE SILVA MORALES', '1990-10-29', 'MUJER', 'Kotito.silva@gmail.com', 'MEDIA COMPLETA', '935438121', 'CHILENA', 'MAIPU', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2018-04-01', NULL),
(92, '09037531-8', 'MANUEL ALFARO URZUA ARIAS', 'MANUEL ALFARO URZUA ARIAS', '1964-01-10', 'HOMBRE', 'murzua1964@gmail.com', 'PADRE JUAN MELLE 0494', '967185022', 'CHILENA', 'LA GRANJA', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2019-04-02', NULL),
(93, '05393728-4', 'CARLOS DELFIN CAMPOS CASTRO', 'CARLOS DELFIN CAMPOS CASTRO', '1947-09-05', 'HOMBRE', 'carlosdelfincampos@gmail.com', 'CHILE ESPAÑA 8425', '995400894', 'CHILENA', 'LA CISTERNA', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIO', '2018-04-02', NULL),
(94, '17022369-1', 'GONZALO IGNACIO RETAMAL YAÑEZ', 'GONZALO IGNACIO RETAMAL YAÑEZ', '1988-06-14', 'HOMBRE', 'g.retamal@hotmail.com', 'BALDOMERO LILLO 7022', '988000961', 'CHILENA', 'CERRILLOS', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICA COMPLETA', '2018-04-02', NULL),
(95, '08771338-5', 'JUAN ALBERTO ESPINOSA CARRERA', 'JUAN ALBERTO ESPINOSA CARRERA', '1947-06-24', 'HOMBRE', 'cheocandombe@gmail.com', 'GUEMES 77', '994386387', 'URUGUAYA', 'LA REINA', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIO', '2018-04-02', NULL),
(96, '10521657-2', 'JORGE RODOLFO EDMUNDO LOPEZ FIGUEROA', 'JORGE RODOLFO EDMUNDO LOPEZ FIGUEROA', '1967-04-16', 'HOMBRE', 'koke77union@gmail.com', 'LA FLORIDA 7076', '957047668', 'CHILENA', 'LA FLORIDA', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2018-04-02', NULL),
(97, '15637201-3', 'EVELYN DE LOS ANGELES BAEZA RAMOS', 'EVELYN DE LOS ANGELES BAEZA RAMOS', '1983-08-05', 'MUJER', 'EVELYN.BAEZA@GMAIL.COM', 'SARGENTO ROJAS 4547', '990889954', 'CHILENA', 'ESTACION CENTRAL', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'SUPERVISOR_BAPCENTER', '', '', NULL, '2021-08-09', 'UNIVERSIDAD COMPLETA', '2018-04-02', NULL),
(98, '09664982-7', 'JAIME ANTONIO MORALES CONTRERAS', 'JAIME ANTONIO MORALES CONTRERAS', '1965-06-13', 'HOMBRE', 'jaimemoralescontreras@yahoo.es', 'CALETA IQUIQUE 219', '950035640', 'CHILENA', 'LO PRADO', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'SUPERIOR', '2018-04-02', NULL),
(99, '07510535-5', 'JORGE FERNANDO OSSES CONTRERAS', 'JORGE FERNANDO OSSES CONTRERAS', '1958-08-29', 'HOMBRE', 'chichosses@gmail.com', 'EL TRIGAL 1779', '997951784', 'CHILENA', 'SANTIAGO', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'UNIVERSATARIA INCOMPLETA', '2018-04-05', NULL),
(100, '06984749-8', 'IVAN EUGENIO PEREZ CARO', 'IVAN EUGENIO PEREZ CARO', '1956-11-21', 'HOMBRE', 'ivan.perez.caro@hotmail.com', 'PASAJE LOS GUINDOS 2469', '998021386', 'CHILENA', 'SAN BERNARDO', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO INCOMPLETO', NULL, NULL),
(101, '06345962-3', 'CARLOS EUGENIO PINOCHET MUÑOZ', 'CARLOS EUGENIO PINOCHET MUÑOZ', '1953-09-08', 'HOMBRE', 'carloseugeniopinochet@gmail.com', 'LOS GLADIOLOS 5068', '978637279', 'CHILENA', 'ESTACION CENTRAL', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2018-04-16', NULL),
(102, '15337563-1', 'CESAR AUGUSTO OVIEDO CORNU', 'CESAR AUGUSTO OVIEDO CORNU', '1982-07-19', 'HOMBRE', 'caochrb@gmail.com', 'LOS GUERRILLEROS 3275', '967091428', 'CHILENA', 'MAIPU', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO INCOMPLETO', '2018-08-27', NULL),
(103, '15706470-3', 'CARLOS ANDRES CERPA RAMOS', 'CARLOS ANDRES CERPA RAMOS', '1983-07-06', 'HOMBRE', 'carloscerparamos@hotmail.com', 'ANDRES BOBE 5207', '966920027', 'CHILENA', 'MAIPU', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', '2018-11-05', NULL),
(104, '26606913-8', 'CARLOS MOISES CAMPO MIERES', 'CARLOS MOISES CAMPO MIERES', '1993-12-13', 'HOMBRE', 'campo18.93@gmail.com', 'INGENIERO ROBERTO LLONA 5142', '946339826', 'VENEZOLANA', 'MAIPU', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'TEAM DESING', '', '', NULL, '2021-08-09', 'TECNICA COMPLETA', '2019-01-01', NULL),
(105, '16085532-0', 'HEBERT JOHATHAN CAMPOS SALGADO', 'HEBERT JOHATHAN CAMPOS SALGADO', '1985-10-05', 'HOMBRE', 'hgccampos@gmail.com', 'PADRE JUAN LUCARINI 2610', '944355610', 'CHILENA', 'CERRILLOS', '2021-08-09', 'Admin', 'postul.jpg', 'Inactivo', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2019-01-02', NULL),
(106, '12489507-3', 'RODRIGO ALEJANDRO FUENTEALBA NUÑEZ', 'RODRIGO ALEJANDRO FUENTEALBA NUÑEZ', '1979-01-04', 'HOMBRE', 'roro42.1973@gmail.com', 'LAS TORRES PASAJE 472 Nº 6178', '961699114', 'CHILENA', 'PEÑALOLEN', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(107, '13940019-9', 'ELIZABETH CAROLINA SEPULVEDA SILVA', 'ELIZABETH CAROLINA SEPULVEDA SILVA', '1980-07-10', 'MUJER', 'elizabeth_karla25@hotmail.com', 'HERMOSILLO 8208 DEPTO 22 SANTA OLGA', '989769073', 'CHILENA', 'LO ESPEJO', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', NULL, NULL),
(108, '12050356-1', 'MIGUEL ANGEL MATURANA MORENO', 'MIGUEL ANGEL MATURANA MORENO', '1979-07-07', 'HOMBRE', 'migueleko@gmail.com', 'CONSINTORIAL 0658', '935683539', 'CHILENA', 'PUENTE ALTO', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(109, '26706359-1', 'SANNCHISS ENMANUEL ANTONIO PEREZ RODRIGUEZ', 'SANNCHISS ENMANUEL ANTONIO PEREZ RODRIGUEZ', '1983-06-13', 'HOMBRE', 'sanchiss@gmail.com', 'AV LIBERTADOR BERNARDO O` HIGGINS 490', '953487612', 'VENEZOLANA', 'MAIPU', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'IT COACH', '', '', NULL, '2021-08-09', 'UNIVERSIDAD COMPLETA', NULL, NULL),
(110, '14242871-7', 'JOSE MIGUEL JARA CASTRO', 'JOSE MIGUEL JARA CASTRO', '1974-04-24', 'HOMBRE', 'mjara745@gmail.com', 'PASAJE VEINTISIETE 01189', '978300530', 'CHILENA', 'PUENTE ALTO', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(111, '09579251-0', 'PATRICIA ERIKA FERNANDEZ ELIZONDO', 'PATRICIA ERIKA FERNANDEZ ELIZONDO', '1965-01-20', 'MUJER', 'patriciafdez@gmail.com', 'PASAJE 05 DE MAYO 3074', '962660380', 'CHILENA', 'LO ESPEJO', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2019-05-08', NULL),
(112, '16679218-5', 'HUMBERTO ANDRES MORALES SALGADO', 'HUMBERTO ANDRES MORALES SALGADO', '1987-05-24', 'HOMBRE', 'morales.ws@gmail.com', 'JUAN ANTONIO RIOS 8761', '972278756', 'CHILENA', 'SAN RAMON', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', '2019-09-01', NULL),
(113, '12410214-6', 'PATRICIO EDUARDO FUENZALIDA SANCHEZ', 'PATRICIO EDUARDO FUENZALIDA SANCHEZ', '1973-09-09', 'HOMBRE', 'patricio.fuenzalida01@gmal.com', 'PUKARA DE LASANA 02775', '988332526', 'CHILENA', 'PUENTE ALTO', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(114, '17230021-9', 'RAUL ALBERTO POZO MORENO', 'RAUL ALBERTO POZO MORENO', '1989-12-27', 'HOMBRE', 'pozomoreno@gmail.com', 'PASAJE SAN CRISTOBAL 13562', '991873933', 'CHILENA', 'SAN BERNARDO', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', '0219-09-10', NULL),
(115, '13558778-8', 'HUMBERTO RICARDO RAMIREZ BARRERA', 'HUMBERTO RICARDO RAMIREZ BARRERA', '1978-12-14', 'HOMBRE', 'humbertin03@gmail.com', 'LOS CANELOS 1158', '983463935', 'CHILENA', 'TALAGANTE', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', '2019-10-01', NULL),
(116, '15411435-1', 'DAVID ESTEBAN MORENO OVALLE', 'DAVID ESTEBAN MORENO OVALLE', '1982-03-26', 'HOMBRE', 'davidmorenoovalle@gmail.com', 'LOS ALELIES 6321', '936313242', 'CHILENA', 'PEDRO AGUIRRE CERDA', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2019-11-05', NULL),
(117, '13691954-7', 'CESAR ANTONIO OLMEDO SANCHEZ', 'CESAR ANTONIO OLMEDO SANCHEZ', '1979-02-14', 'HOMBRE', 'cesarantonio.olmedo@gmail.com', 'PASAJE RIO ILLAPEL 30 DEPTO 33', '942939189', 'CHILENA', 'SAN JOAQUIN', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(118, '13449830-7', 'LUIS GUILLERMO MONTES MUÑOZ', 'LUIS GUILLERMO MONTES MUÑOZ', '1978-05-13', 'HOMBRE', 'gigioliza@gmail.com', 'PASAJE PUTRE 3269', '976530419', 'CHILENA', 'PEÑAFLOR', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(119, '16644631-7', 'JULIO ALBERTO MONTT CIFUENTES', 'JULIO ALBERTO MONTT CIFUENTES', '1987-06-16', 'HOMBRE', 'montt.julio@gmail.com', 'VARAS MENA 771 DEPTO 1212', '975174326', 'CHILENA', 'SAN MIGUEL', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(120, '18454417-2', 'JOSE ALFREDO MORALES HERNANDEZ', 'JOSE ALFREDO MORALES HERNANDEZ', '1993-01-26', 'HOMBRE', 'josealfredo.mh1993@gmail.com', 'MANUEL CASTILLO 195 -A', '933513254', 'CHILENA', 'PEÑAFLOR', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'IT COACH ASSITAN', '', '', NULL, '2021-08-09', 'TECNICA COMPLETA', NULL, NULL),
(121, '08666520-4', 'JOSE ANTONIO VARGAS MELLADO', 'JOSE ANTONIO VARGAS MELLADO', '1960-12-11', 'HOMBRE', 'vargasmelladoj@gmail.com', 'COLIMAHUIDAN 3001', '977603999', 'CHILENA', 'MAIPU', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2020-05-11', NULL),
(122, '27454293-4', 'JOSE RAFAEL ERA ALVAREZ', 'JOSE RAFAEL ERA ALVAREZ', '2000-06-11', 'HOMBRE', 'jorfgfe@gmail.com', 'ELEUTERIO RAMIREZ 1291 DEPTO 1414', '972228080', 'VENEZOLANA', 'SANTIAGO', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'IT COACH ASSITAN', '', '', NULL, '2021-08-09', 'UNIVERVIDAD INCOMPLETA', '2020-10-01', NULL),
(123, '17375851-0', 'DIEGO IGNACIO BARAHONA TAPIA', 'DIEGO IGNACIO BARAHONA TAPIA', '1990-05-16', 'HOMBRE', 'diegobarahona241@gmail.com', 'RIO CAUTIN 8321', '985847157', 'CHILENA', 'PUDAHUEL', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(124, '16356970-1', 'TAMARA ALEJANDRA MIRANDA IBARRA', 'TAMARA ALEJANDRA MIRANDA IBARRA', '1986-05-17', 'MUJER', 'tama.miranda30@gmail.com', 'EL SAUCE S/N PARCELA 3', '933000180', 'CHILENA', 'CALERA DE TANGO', '2021-08-09', 'Admin', 'postul.jpg', 'En Proceso', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', NULL, NULL),
(125, '13177905-4', 'ENRIQUE ALEJANDRO PIZARRO CARMONA', 'ENRIQUE ALEJANDRO PIZARRO CARMONA', '1977-12-05', 'HOMBRE', 'kikepizarro.carmona@gmail.com', 'CARLOS DAVILA 7966', '963524101', 'CHILENA', 'SAN RAMON', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', '2021-01-11', NULL),
(126, '15374188-3', 'JONATHAN MIGUEL FUENTES OSORIO', 'JONATHAN MIGUEL FUENTES OSORIO', '1982-10-01', 'HOMBRE', 'jonathanfuentesosorio20@gmail.com', 'GUANAJUATO 7751', '937819796', 'CHILENA', 'LO ESPEJO', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO INCOMPLETO', '2021-04-12', NULL),
(127, '16322594-8', 'JORGE HANS ESCOBAR OLIVERA', 'JORGE HANS ESCOBAR OLIVERA', '1986-07-06', 'HOMBRE', 'jorgeescobarolivera@gmail.com', 'LAS LOICAS 1334', '950701943', 'CHILENA', 'SAN BERNARDO', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'MEDIA COMPLETA', '2021-04-19', NULL),
(128, '17507114-8', 'LUIS ARMANDO ALEX TAPIA CARO', 'LUIS ARMANDO ALEX TAPIA CARO', '1990-10-10', 'HOMBRE', 'luis.tapiacaro17@gmail.com', 'LIKA 1433', '975356903', 'CHILENA', 'CERRO NAVIA', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', '2021-05-10', NULL),
(129, '10539677-5', 'SANTIAGO SEBASTIAN PEREZ SANDOVAL', 'SANTIAGO SEBASTIAN PEREZ SANDOVAL', '1966-03-03', 'HOMBRE', 'stgo_perez@hotmail.com', 'LOS GERANIOS 145', '949728637', 'CHILENA', 'MAIPU', '2021-08-09', 'Admin', 'postul.jpg', 'Trabajando', 'CONDUCTOR_CALIFICADO', '', '', NULL, '2021-08-09', 'TECNICO COMPLETO', '2021-07-12', NULL),
(137, '12345677-3', 'Prueba Prueba', 'prueba', '2021-12-12', 'hombre', 'claudio.alarcon.gutierrez@gmail.com', 'prueba', '935438118', 'chile', 'prueba', '2021-08-18', 'jose era', 'postul.jpg', 'aceptado', 'conductor calificado', '', '', 0, '2021-08-18', '', NULL, NULL),
(139, '14143984-7', 'Felipe Gerardo Sepulveda Pizarro', 'Sepulveda Pizarro', '1981-08-10', 'hombre', 'Felipesepulveda6976@gmail.com', 'Av Sur 130 N° 12', '936745196', 'chile', 'maipu', '2021-08-19', 'jose era', '14143984-7.jpg', 'Trabajando', 'conductor calificado', '', '', 0, '2021-08-19', 'MEDIA COMPLETA', '2021-08-24', NULL),
(140, '10799992-2', 'Daniel Alejandro Gomez Rubio', 'gomez rubio', '1967-08-15', 'hombre', 'danielitogomezrubio1967@gmail.com', 'santa ana 1120', '964024923', 'chile', 'san bernardo', '2021-08-20', 'jose era', 'postul.jpg', 'Activo', 'conductor calificado', '', '', 0, '2021-08-20', '', NULL, NULL),
(141, '12287559-8', 'Orlando Patricio  Ramirez Torrez', 'Ramirez Torrez', '1972-08-02', 'hombre', 'Oramirez2872@gmail.com', 'Ricardo Lyon 3530', '944341135', 'chile', 'ÑuÑoa', '2021-09-02', 'jose era', '12287559-8.jpg', 'Activo', 'conductor calificado', '', '', 0, '2021-09-02', '', NULL, NULL),
(142, '10462633-5', 'Jorge Isidro  Parra Acevedo', 'Parra Acevedo', '1965-07-30', 'hombre', 'Jorge.parra30@gmail.com', 'Juan Solar Parra 1156', '933250960', 'chile', 'el bosque', '2021-09-06', 'jose era', 'postul.jpg', 'Activo', 'conductor calificado', '', '', 0, '2021-09-06', 'MEIDA COMPLETA', NULL, NULL),
(143, '16655929-4', 'Peter Aland Charrier MuÑoz', 'charrier muÑoz', '1982-09-25', 'hombre', 'charrier_27@hotmail.com', 'jacinto contreras 731', '942474841', 'chile', 'rengo', '2021-09-20', 'jose era', 'postul.jpg', 'Activo', 'conductor_calificado', '', '', 0, '2021-09-20', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privileges`
--

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `position` varchar(25) NOT NULL,
  `privileges` int(11) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `privileges`
--

INSERT INTO `privileges` (`id`, `name`, `lastname`, `position`, `privileges`, `usuario`, `password`, `img`) VALUES
(4, 'claudio', 'alarcon', 'jefe', 1, 'calarcon2020', '$2y$10$ZG8u6N3F.l.UGQ.gCcB9w.3kH8daabx/DWqaWRqk0.PFd4DrGkh5S', 'add3.png'),
(7, 'jose', 'era', 'analista programador', 1, 'jorfgf', '$2y$10$4cKkl.ar33qhNdgRNJd6e.rpf8pb9KbnV6yUKmBY7VwbjZSGWMdxi', 'me.jpg'),
(23, 'testing', 'testing', '', 0, '', '$2y$10$5XAg8IgcSvdTKKntV0YlNOqLn1N5RoBES.dAa9uZWz3/vjl17TkDy', 'add3.png'),
(24, 'prueba', 'prueba', 'sup', 2, 'prueba', '$2y$10$L9.3sWyslSHvWZ8Fqvq0fuqMtYeQu.lVqvCAR6kW9Hs71bi5.gzpO', 'add3.png'),
(25, 'prueba2', 'prueba2', 'sup', 2, 'prueba1', '$2y$10$uZfDErHkjsz6F9jb1n3olee8aLs/Ehe4mvo.Hd4QT1EVFazUuFLBm', 'add3.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privileges_modulos`
--

CREATE TABLE `privileges_modulos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `1` tinyint(1) NOT NULL DEFAULT 0,
  `2` tinyint(1) NOT NULL DEFAULT 0,
  `3` tinyint(1) NOT NULL DEFAULT 0,
  `4` tinyint(1) NOT NULL DEFAULT 0,
  `5` tinyint(1) NOT NULL DEFAULT 0,
  `6` tinyint(1) NOT NULL DEFAULT 0,
  `7` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `privileges_modulos`
--

INSERT INTO `privileges_modulos` (`id`, `id_user`, `1`, `2`, `3`, `4`, `5`, `6`, `7`) VALUES
(11, 7, 0, 0, 0, 0, 0, 0, 0),
(13, 4, 0, 0, 0, 0, 0, 0, 0),
(16, 23, 0, 0, 0, 0, 0, 0, 0),
(17, 24, 0, 0, 1, 0, 0, 0, 0),
(18, 25, 0, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) NOT NULL,
  `answer4` varchar(255) NOT NULL,
  `answer5` varchar(255) NOT NULL,
  `answer6` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `question`
--

INSERT INTO `question` (`id`, `id_test`, `question`, `correct_answer`, `answer1`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`) VALUES
(14, 23, 'tsting1', 'test2', 'testing', 'test2', '', '', '', ''),
(15, 23, 'tsting2', 'testing', 'testing', 'test2', '', '', '', ''),
(16, 24, 'tsting1', 'testing', 'testing', 'test2', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `question2`
--

CREATE TABLE `question2` (
  `id` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  `question` varchar(225) NOT NULL,
  `correct_answer` varchar(225) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) NOT NULL,
  `answer4` varchar(255) NOT NULL,
  `answer5` varchar(255) NOT NULL,
  `answer6` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `question2`
--

INSERT INTO `question2` (`id`, `id_test`, `question`, `correct_answer`, `answer1`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`) VALUES
(1, 24, 'tsting2', 'testing', 'testing', 'test', '', '', '', ''),
(2, 10, 'tsting1', 'testing', 'testing', 'test2', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sanitizacion`
--

CREATE TABLE `sanitizacion` (
  `id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `hora` time DEFAULT NULL,
  `status` varchar(225) NOT NULL DEFAULT 'no realizado',
  `id_postulante` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sanitizacion`
--

INSERT INTO `sanitizacion` (`id`, `date`, `hora`, `status`, `id_postulante`, `created_at`, `updated_at`) VALUES
(4, '2021-02-22', NULL, 'no realizado', 2, NULL, NULL),
(3, '2021-02-22', '13:50:19', 'realizado', 1, NULL, '2021-02-22 16:50:19'),
(5, '2021-04-01', '22:12:02', 'realizado', 7, NULL, '2021-04-04 01:12:02'),
(6, '2021-02-22', '13:50:21', 'realizado', 1, NULL, '2021-02-22 16:50:21'),
(7, '2021-02-22', NULL, 'realizado', 2, NULL, '2021-03-26 17:42:20'),
(8, '2021-02-22', '10:59:55', 'realizado', 7, NULL, '2021-02-22 13:59:55'),
(9, '2021-02-23', NULL, 'no realizado', 1, NULL, NULL),
(10, '2021-02-23', NULL, 'no realizado', 2, NULL, NULL),
(261, '2021-04-01', NULL, 'no realizado', 1, NULL, NULL),
(12, '2021-02-23', NULL, 'no realizado', 1, NULL, NULL),
(13, '2021-02-23', NULL, 'no realizado', 2, NULL, NULL),
(262, '2021-04-01', NULL, 'no realizado', 2, NULL, NULL),
(15, '2021-02-24', NULL, 'no realizado', 1, NULL, NULL),
(16, '2021-02-24', NULL, 'no realizado', 2, NULL, NULL),
(263, '2021-04-01', '22:31:58', 'realizado', 7, NULL, '2021-04-12 02:31:58'),
(18, '2021-02-24', NULL, 'no realizado', 9, NULL, NULL),
(19, '2021-02-24', NULL, 'no realizado', 1, NULL, NULL),
(20, '2021-02-24', NULL, 'no realizado', 2, NULL, NULL),
(21, '2021-02-24', NULL, 'no realizado', 7, NULL, NULL),
(22, '2021-02-24', NULL, 'no realizado', 9, NULL, NULL),
(23, '2021-02-25', NULL, 'no realizado', 1, NULL, NULL),
(24, '2021-02-25', NULL, 'no realizado', 2, NULL, NULL),
(25, '2021-02-25', NULL, 'no realizado', 7, NULL, NULL),
(26, '2021-02-25', NULL, 'no realizado', 9, NULL, NULL),
(27, '2021-02-25', NULL, 'no realizado', 1, NULL, NULL),
(28, '2021-02-25', NULL, 'no realizado', 2, NULL, NULL),
(29, '2021-02-25', NULL, 'no realizado', 7, NULL, NULL),
(30, '2021-02-25', NULL, 'no realizado', 9, NULL, NULL),
(31, '2021-02-26', NULL, 'no realizado', 1, NULL, NULL),
(32, '2021-02-26', NULL, 'no realizado', 2, NULL, NULL),
(33, '2021-02-26', NULL, 'no realizado', 7, NULL, NULL),
(34, '2021-02-26', NULL, 'no realizado', 9, NULL, NULL),
(35, '2021-02-26', NULL, 'no realizado', 1, NULL, NULL),
(36, '2021-02-26', NULL, 'no realizado', 2, NULL, NULL),
(37, '2021-02-26', NULL, 'no realizado', 7, NULL, NULL),
(38, '2021-02-26', NULL, 'no realizado', 9, NULL, NULL),
(39, '2021-03-01', NULL, 'no realizado', 1, NULL, NULL),
(40, '2021-03-01', NULL, 'no realizado', 2, NULL, NULL),
(41, '2021-03-01', NULL, 'no realizado', 7, NULL, NULL),
(42, '2021-03-01', NULL, 'no realizado', 9, NULL, NULL),
(43, '2021-03-01', NULL, 'no realizado', 1, NULL, NULL),
(44, '2021-03-01', NULL, 'no realizado', 2, NULL, NULL),
(45, '2021-03-01', NULL, 'no realizado', 7, NULL, NULL),
(46, '2021-03-01', NULL, 'no realizado', 9, NULL, NULL),
(47, '2021-03-02', NULL, 'no realizado', 1, NULL, NULL),
(48, '2021-03-02', NULL, 'no realizado', 2, NULL, NULL),
(49, '2021-03-02', NULL, 'no realizado', 7, NULL, NULL),
(50, '2021-03-02', NULL, 'no realizado', 9, NULL, NULL),
(51, '2021-03-02', NULL, 'no realizado', 1, NULL, NULL),
(52, '2021-03-02', NULL, 'no realizado', 2, NULL, NULL),
(53, '2021-03-02', NULL, 'no realizado', 7, NULL, NULL),
(54, '2021-03-02', NULL, 'no realizado', 9, NULL, NULL),
(55, '2021-03-03', NULL, 'no realizado', 1, NULL, NULL),
(56, '2021-03-03', NULL, 'no realizado', 2, NULL, NULL),
(57, '2021-03-03', NULL, 'no realizado', 7, NULL, NULL),
(58, '2021-03-03', NULL, 'no realizado', 9, NULL, NULL),
(59, '2021-03-03', NULL, 'no realizado', 1, NULL, NULL),
(60, '2021-03-03', NULL, 'no realizado', 2, NULL, NULL),
(61, '2021-03-03', NULL, 'no realizado', 7, NULL, NULL),
(62, '2021-03-03', NULL, 'no realizado', 9, NULL, NULL),
(63, '2021-03-04', NULL, 'no realizado', 1, NULL, NULL),
(64, '2021-03-04', NULL, 'no realizado', 2, NULL, NULL),
(65, '2021-03-04', NULL, 'no realizado', 7, NULL, NULL),
(66, '2021-03-04', NULL, 'no realizado', 9, NULL, NULL),
(67, '2021-03-04', NULL, 'no realizado', 1, NULL, NULL),
(68, '2021-03-04', NULL, 'no realizado', 2, NULL, NULL),
(69, '2021-03-04', NULL, 'no realizado', 7, NULL, NULL),
(70, '2021-03-04', NULL, 'no realizado', 9, NULL, NULL),
(71, '2021-03-05', NULL, 'no realizado', 1, NULL, NULL),
(72, '2021-03-05', NULL, 'no realizado', 2, NULL, NULL),
(73, '2021-03-05', NULL, 'no realizado', 7, NULL, NULL),
(74, '2021-03-05', NULL, 'no realizado', 9, NULL, NULL),
(75, '2021-03-05', NULL, 'no realizado', 1, NULL, NULL),
(76, '2021-03-05', NULL, 'no realizado', 2, NULL, NULL),
(77, '2021-03-05', NULL, 'no realizado', 7, NULL, NULL),
(78, '2021-03-05', NULL, 'no realizado', 9, NULL, NULL),
(79, '2021-03-08', NULL, 'no realizado', 1, NULL, NULL),
(80, '2021-03-08', NULL, 'no realizado', 2, NULL, NULL),
(81, '2021-03-08', NULL, 'no realizado', 7, NULL, NULL),
(82, '2021-03-08', NULL, 'no realizado', 9, NULL, NULL),
(83, '2021-03-08', NULL, 'no realizado', 1, NULL, NULL),
(84, '2021-03-08', NULL, 'no realizado', 2, NULL, NULL),
(85, '2021-03-08', NULL, 'no realizado', 7, NULL, NULL),
(86, '2021-03-08', NULL, 'no realizado', 9, NULL, NULL),
(87, '2021-03-09', NULL, 'no realizado', 1, NULL, NULL),
(88, '2021-03-09', NULL, 'no realizado', 2, NULL, NULL),
(89, '2021-03-09', NULL, 'no realizado', 7, NULL, NULL),
(90, '2021-03-09', NULL, 'no realizado', 9, NULL, NULL),
(91, '2021-03-09', NULL, 'no realizado', 1, NULL, NULL),
(92, '2021-03-09', NULL, 'no realizado', 2, NULL, NULL),
(93, '2021-03-09', NULL, 'no realizado', 7, NULL, NULL),
(94, '2021-03-09', NULL, 'no realizado', 9, NULL, NULL),
(95, '2021-03-10', NULL, 'no realizado', 1, NULL, NULL),
(96, '2021-03-10', NULL, 'no realizado', 2, NULL, NULL),
(97, '2021-03-10', NULL, 'no realizado', 7, NULL, NULL),
(98, '2021-03-10', NULL, 'no realizado', 9, NULL, NULL),
(99, '2021-03-10', NULL, 'no realizado', 1, NULL, NULL),
(100, '2021-03-10', NULL, 'no realizado', 2, NULL, NULL),
(101, '2021-03-10', NULL, 'no realizado', 7, NULL, NULL),
(102, '2021-03-10', NULL, 'no realizado', 9, NULL, NULL),
(103, '2021-03-11', NULL, 'no realizado', 1, NULL, NULL),
(104, '2021-03-11', NULL, 'no realizado', 2, NULL, NULL),
(105, '2021-03-11', NULL, 'no realizado', 7, NULL, NULL),
(106, '2021-03-11', NULL, 'no realizado', 9, NULL, NULL),
(107, '2021-03-11', NULL, 'no realizado', 1, NULL, NULL),
(108, '2021-03-11', NULL, 'no realizado', 2, NULL, NULL),
(109, '2021-03-11', NULL, 'no realizado', 7, NULL, NULL),
(110, '2021-03-11', NULL, 'no realizado', 9, NULL, NULL),
(111, '2021-03-12', NULL, 'no realizado', 1, NULL, NULL),
(112, '2021-03-12', NULL, 'no realizado', 2, NULL, NULL),
(113, '2021-03-12', NULL, 'no realizado', 7, NULL, NULL),
(114, '2021-03-12', NULL, 'no realizado', 9, NULL, NULL),
(115, '2021-03-12', NULL, 'no realizado', 10, NULL, NULL),
(116, '2021-03-12', NULL, 'no realizado', 1, NULL, NULL),
(117, '2021-03-12', NULL, 'no realizado', 2, NULL, NULL),
(118, '2021-03-12', NULL, 'no realizado', 7, NULL, NULL),
(119, '2021-03-12', NULL, 'no realizado', 9, NULL, NULL),
(120, '2021-03-12', NULL, 'no realizado', 10, NULL, NULL),
(121, '2021-03-15', NULL, 'no realizado', 1, NULL, NULL),
(122, '2021-03-15', NULL, 'no realizado', 2, NULL, NULL),
(123, '2021-03-15', NULL, 'no realizado', 7, NULL, NULL),
(124, '2021-03-15', NULL, 'no realizado', 9, NULL, NULL),
(125, '2021-03-15', NULL, 'no realizado', 10, NULL, NULL),
(126, '2021-03-15', NULL, 'no realizado', 1, NULL, NULL),
(127, '2021-03-15', NULL, 'no realizado', 2, NULL, NULL),
(128, '2021-03-15', NULL, 'no realizado', 7, NULL, NULL),
(129, '2021-03-15', NULL, 'no realizado', 9, NULL, NULL),
(130, '2021-03-15', NULL, 'no realizado', 10, NULL, NULL),
(131, '2021-03-16', NULL, 'no realizado', 1, NULL, NULL),
(132, '2021-03-16', NULL, 'no realizado', 2, NULL, NULL),
(133, '2021-03-16', NULL, 'no realizado', 7, NULL, NULL),
(134, '2021-03-16', NULL, 'no realizado', 9, NULL, NULL),
(135, '2021-03-16', NULL, 'no realizado', 10, NULL, NULL),
(136, '2021-03-16', NULL, 'no realizado', 1, NULL, NULL),
(137, '2021-03-16', NULL, 'no realizado', 2, NULL, NULL),
(138, '2021-03-16', NULL, 'no realizado', 7, NULL, NULL),
(139, '2021-03-16', NULL, 'no realizado', 9, NULL, NULL),
(140, '2021-03-16', NULL, 'no realizado', 10, NULL, NULL),
(141, '2021-03-17', NULL, 'no realizado', 1, NULL, NULL),
(142, '2021-03-17', NULL, 'no realizado', 2, NULL, NULL),
(143, '2021-03-17', NULL, 'no realizado', 7, NULL, NULL),
(144, '2021-03-17', NULL, 'no realizado', 9, NULL, NULL),
(145, '2021-03-17', NULL, 'no realizado', 10, NULL, NULL),
(146, '2021-03-17', NULL, 'no realizado', 1, NULL, NULL),
(147, '2021-03-17', NULL, 'no realizado', 2, NULL, NULL),
(148, '2021-03-17', NULL, 'no realizado', 7, NULL, NULL),
(149, '2021-03-17', NULL, 'no realizado', 9, NULL, NULL),
(150, '2021-03-17', NULL, 'no realizado', 10, NULL, NULL),
(151, '2021-03-18', NULL, 'no realizado', 1, NULL, NULL),
(152, '2021-03-18', NULL, 'no realizado', 2, NULL, NULL),
(153, '2021-03-18', NULL, 'no realizado', 7, NULL, NULL),
(154, '2021-03-18', NULL, 'no realizado', 9, NULL, NULL),
(155, '2021-03-18', NULL, 'no realizado', 10, NULL, NULL),
(156, '2021-03-18', NULL, 'no realizado', 1, NULL, NULL),
(157, '2021-03-18', NULL, 'no realizado', 2, NULL, NULL),
(158, '2021-03-18', NULL, 'no realizado', 7, NULL, NULL),
(159, '2021-03-18', NULL, 'no realizado', 9, NULL, NULL),
(160, '2021-03-18', NULL, 'no realizado', 10, NULL, NULL),
(161, '2021-03-19', NULL, 'no realizado', 1, NULL, NULL),
(162, '2021-03-19', NULL, 'no realizado', 2, NULL, NULL),
(163, '2021-03-19', NULL, 'no realizado', 7, NULL, NULL),
(164, '2021-03-19', NULL, 'no realizado', 9, NULL, NULL),
(165, '2021-03-19', NULL, 'no realizado', 10, NULL, NULL),
(166, '2021-03-19', NULL, 'no realizado', 1, NULL, NULL),
(167, '2021-03-19', NULL, 'no realizado', 2, NULL, NULL),
(168, '2021-03-19', NULL, 'no realizado', 7, NULL, NULL),
(169, '2021-03-19', NULL, 'no realizado', 9, NULL, NULL),
(170, '2021-03-19', NULL, 'no realizado', 10, NULL, NULL),
(171, '2021-03-22', NULL, 'no realizado', 1, NULL, NULL),
(172, '2021-03-22', NULL, 'no realizado', 2, NULL, NULL),
(173, '2021-03-22', NULL, 'no realizado', 7, NULL, NULL),
(174, '2021-03-22', NULL, 'no realizado', 9, NULL, NULL),
(175, '2021-03-22', NULL, 'no realizado', 10, NULL, NULL),
(176, '2021-03-22', NULL, 'no realizado', 1, NULL, NULL),
(177, '2021-03-22', NULL, 'no realizado', 2, NULL, NULL),
(178, '2021-03-22', NULL, 'no realizado', 7, NULL, NULL),
(179, '2021-03-22', NULL, 'no realizado', 9, NULL, NULL),
(180, '2021-03-22', NULL, 'no realizado', 10, NULL, NULL),
(181, '2021-03-23', NULL, 'no realizado', 1, NULL, NULL),
(182, '2021-03-23', NULL, 'no realizado', 2, NULL, NULL),
(183, '2021-03-23', NULL, 'no realizado', 7, NULL, NULL),
(184, '2021-03-23', NULL, 'no realizado', 9, NULL, NULL),
(185, '2021-03-23', NULL, 'no realizado', 10, NULL, NULL),
(186, '2021-03-23', NULL, 'no realizado', 1, NULL, NULL),
(187, '2021-03-23', NULL, 'no realizado', 2, NULL, NULL),
(188, '2021-03-23', NULL, 'no realizado', 7, NULL, NULL),
(189, '2021-03-23', NULL, 'no realizado', 9, NULL, NULL),
(190, '2021-03-23', NULL, 'no realizado', 10, NULL, NULL),
(191, '2021-03-24', NULL, 'no realizado', 1, NULL, NULL),
(192, '2021-03-24', NULL, 'no realizado', 2, NULL, NULL),
(193, '2021-03-24', NULL, 'no realizado', 7, NULL, NULL),
(194, '2021-03-24', NULL, 'no realizado', 9, NULL, NULL),
(195, '2021-03-24', NULL, 'no realizado', 10, NULL, NULL),
(196, '2021-03-24', NULL, 'no realizado', 1, NULL, NULL),
(197, '2021-03-24', NULL, 'no realizado', 2, NULL, NULL),
(198, '2021-03-24', NULL, 'no realizado', 7, NULL, NULL),
(199, '2021-03-24', NULL, 'no realizado', 9, NULL, NULL),
(200, '2021-03-24', NULL, 'no realizado', 10, NULL, NULL),
(201, '2021-03-25', NULL, 'no realizado', 1, NULL, NULL),
(202, '2021-03-25', NULL, 'no realizado', 2, NULL, NULL),
(203, '2021-03-25', NULL, 'no realizado', 7, NULL, NULL),
(204, '2021-03-25', NULL, 'no realizado', 9, NULL, NULL),
(205, '2021-03-25', NULL, 'no realizado', 10, NULL, NULL),
(206, '2021-03-25', NULL, 'no realizado', 1, NULL, NULL),
(207, '2021-03-25', NULL, 'no realizado', 2, NULL, NULL),
(208, '2021-03-25', NULL, 'no realizado', 7, NULL, NULL),
(209, '2021-03-25', NULL, 'no realizado', 9, NULL, NULL),
(210, '2021-03-25', NULL, 'no realizado', 10, NULL, NULL),
(211, '2021-03-26', NULL, 'no realizado', 1, NULL, NULL),
(212, '2021-03-26', NULL, 'no realizado', 2, NULL, NULL),
(213, '2021-03-26', NULL, 'realizado', 7, NULL, '2021-03-26 17:43:27'),
(214, '2021-03-26', NULL, 'no realizado', 9, NULL, NULL),
(215, '2021-03-26', NULL, 'no realizado', 10, NULL, NULL),
(216, '2021-03-26', NULL, 'no realizado', 1, NULL, NULL),
(217, '2021-03-26', NULL, 'no realizado', 2, NULL, NULL),
(218, '2021-03-26', NULL, 'realizado', 7, NULL, '2021-03-26 19:21:42'),
(219, '2021-03-26', NULL, 'no realizado', 9, NULL, NULL),
(220, '2021-03-26', NULL, 'no realizado', 10, NULL, NULL),
(221, '2021-03-27', NULL, 'no realizado', 1, NULL, NULL),
(222, '2021-03-27', NULL, 'no realizado', 2, NULL, NULL),
(223, '2021-03-27', NULL, 'realizado', 7, NULL, '2021-03-28 00:59:02'),
(224, '2021-03-27', NULL, 'no realizado', 9, NULL, NULL),
(225, '2021-03-27', NULL, 'no realizado', 10, NULL, NULL),
(226, '2021-03-28', NULL, 'no realizado', 1, NULL, NULL),
(227, '2021-03-28', NULL, 'no realizado', 2, NULL, NULL),
(228, '2021-03-28', NULL, 'no realizado', 7, NULL, NULL),
(229, '2021-03-28', NULL, 'no realizado', 9, NULL, NULL),
(230, '2021-03-28', NULL, 'no realizado', 10, NULL, NULL),
(231, '2021-03-29', NULL, 'no realizado', 1, NULL, NULL),
(232, '2021-03-29', NULL, 'no realizado', 2, NULL, NULL),
(233, '2021-03-29', NULL, 'realizado', 7, NULL, '2021-03-29 14:40:05'),
(234, '2021-03-29', NULL, 'no realizado', 9, NULL, NULL),
(235, '2021-03-29', NULL, 'no realizado', 10, NULL, NULL),
(236, '2021-03-29', NULL, 'no realizado', 1, NULL, NULL),
(237, '2021-03-29', NULL, 'no realizado', 2, NULL, NULL),
(238, '2021-03-29', NULL, 'no realizado', 7, NULL, NULL),
(239, '2021-03-29', NULL, 'no realizado', 9, NULL, NULL),
(240, '2021-03-29', NULL, 'no realizado', 10, NULL, NULL),
(241, '2021-03-30', NULL, 'no realizado', 1, NULL, NULL),
(242, '2021-03-30', NULL, 'no realizado', 2, NULL, NULL),
(243, '2021-03-30', NULL, 'no realizado', 7, NULL, NULL),
(244, '2021-03-30', NULL, 'no realizado', 9, NULL, NULL),
(245, '2021-03-30', NULL, 'no realizado', 10, NULL, NULL),
(246, '2021-03-30', NULL, 'no realizado', 1, NULL, NULL),
(247, '2021-03-30', NULL, 'no realizado', 2, NULL, NULL),
(248, '2021-03-30', NULL, 'no realizado', 7, NULL, NULL),
(249, '2021-03-30', NULL, 'no realizado', 9, NULL, NULL),
(250, '2021-03-30', NULL, 'no realizado', 10, NULL, NULL),
(251, '2021-03-31', NULL, 'no realizado', 1, NULL, NULL),
(252, '2021-03-31', NULL, 'no realizado', 2, NULL, NULL),
(253, '2021-03-31', NULL, 'no realizado', 7, NULL, NULL),
(254, '2021-03-31', NULL, 'no realizado', 9, NULL, NULL),
(255, '2021-03-31', NULL, 'no realizado', 10, NULL, NULL),
(256, '2021-03-31', NULL, 'no realizado', 1, NULL, NULL),
(257, '2021-03-31', NULL, 'no realizado', 2, NULL, NULL),
(258, '2021-03-31', NULL, 'no realizado', 7, NULL, NULL),
(259, '2021-03-31', NULL, 'no realizado', 9, NULL, NULL),
(260, '2021-03-31', NULL, 'no realizado', 10, NULL, NULL),
(264, '2021-04-01', NULL, 'no realizado', 9, NULL, NULL),
(265, '2021-04-01', NULL, 'no realizado', 10, NULL, NULL),
(266, '2021-04-01', NULL, 'no realizado', 1, NULL, NULL),
(267, '2021-04-01', NULL, 'no realizado', 2, NULL, NULL),
(268, '2021-04-01', NULL, 'no realizado', 7, NULL, NULL),
(269, '2021-04-01', NULL, 'no realizado', 9, NULL, NULL),
(270, '2021-04-01', NULL, 'no realizado', 10, NULL, NULL),
(271, '2021-04-02', NULL, 'no realizado', 1, NULL, NULL),
(272, '2021-04-02', NULL, 'no realizado', 2, NULL, NULL),
(273, '2021-04-02', NULL, 'no realizado', 7, NULL, NULL),
(274, '2021-04-02', NULL, 'no realizado', 9, NULL, NULL),
(275, '2021-04-02', NULL, 'no realizado', 10, NULL, NULL),
(276, '2021-04-02', NULL, 'no realizado', 1, NULL, NULL),
(277, '2021-04-02', NULL, 'no realizado', 2, NULL, NULL),
(278, '2021-04-02', NULL, 'no realizado', 7, NULL, NULL),
(279, '2021-04-02', NULL, 'no realizado', 9, NULL, NULL),
(280, '2021-04-02', NULL, 'no realizado', 10, NULL, NULL),
(281, '2021-04-04', NULL, 'no realizado', 1, NULL, NULL),
(282, '2021-04-04', NULL, 'no realizado', 2, NULL, NULL),
(283, '2021-04-03', '22:14:36', 'realizado', 7, NULL, '2021-04-04 01:14:36'),
(284, '2021-04-04', NULL, 'no realizado', 9, NULL, NULL),
(285, '2021-04-04', NULL, 'no realizado', 10, NULL, NULL),
(286, '2021-04-04', NULL, 'no realizado', 1, NULL, NULL),
(287, '2021-04-04', NULL, 'no realizado', 2, NULL, NULL),
(288, '2021-04-04', '00:03:41', 'realizado', 7, NULL, '2021-04-04 04:03:41'),
(289, '2021-04-04', NULL, 'no realizado', 9, NULL, NULL),
(290, '2021-04-04', NULL, 'no realizado', 10, NULL, NULL),
(291, '2021-04-04', NULL, 'no realizado', 1, NULL, NULL),
(292, '2021-04-04', NULL, 'no realizado', 2, NULL, NULL),
(293, '2021-04-03', NULL, 'no realizado', 7, NULL, '2021-04-04 03:51:59'),
(294, '2021-04-04', NULL, 'no realizado', 9, NULL, NULL),
(295, '2021-04-04', NULL, 'no realizado', 10, NULL, NULL),
(296, '2021-04-05', NULL, 'no realizado', 1, NULL, NULL),
(297, '2021-04-05', NULL, 'no realizado', 2, NULL, NULL),
(298, '2021-04-05', '11:27:14', 'realizado', 7, NULL, '2021-04-05 15:27:14'),
(299, '2021-04-05', NULL, 'no realizado', 9, NULL, NULL),
(300, '2021-04-05', NULL, 'no realizado', 10, NULL, NULL),
(301, '2021-04-05', NULL, 'no realizado', 1, NULL, NULL),
(302, '2021-04-05', NULL, 'no realizado', 2, NULL, NULL),
(303, '2021-04-05', NULL, 'no realizado', 7, NULL, NULL),
(304, '2021-04-05', NULL, 'no realizado', 9, NULL, NULL),
(305, '2021-04-05', NULL, 'no realizado', 10, NULL, NULL),
(306, '2021-04-06', NULL, 'no realizado', 1, NULL, NULL),
(307, '2021-04-06', NULL, 'no realizado', 2, NULL, NULL),
(308, '2021-04-06', NULL, 'no realizado', 7, NULL, NULL),
(309, '2021-04-06', NULL, 'no realizado', 9, NULL, NULL),
(310, '2021-04-06', NULL, 'no realizado', 10, NULL, NULL),
(311, '2021-04-06', NULL, 'no realizado', 1, NULL, NULL),
(312, '2021-04-06', NULL, 'no realizado', 2, NULL, NULL),
(313, '2021-04-06', NULL, 'no realizado', 7, NULL, NULL),
(314, '2021-04-06', NULL, 'no realizado', 9, NULL, NULL),
(315, '2021-04-06', NULL, 'no realizado', 10, NULL, NULL),
(316, '2021-04-07', NULL, 'no realizado', 1, NULL, NULL),
(317, '2021-04-07', NULL, 'no realizado', 2, NULL, NULL),
(318, '2021-04-07', NULL, 'no realizado', 7, NULL, NULL),
(319, '2021-04-07', NULL, 'no realizado', 9, NULL, NULL),
(320, '2021-04-07', NULL, 'no realizado', 10, NULL, NULL),
(321, '2021-04-07', NULL, 'no realizado', 1, NULL, NULL),
(322, '2021-04-07', NULL, 'no realizado', 2, NULL, NULL),
(323, '2021-04-07', NULL, 'no realizado', 7, NULL, NULL),
(324, '2021-04-07', NULL, 'no realizado', 9, NULL, NULL),
(325, '2021-04-07', NULL, 'no realizado', 10, NULL, NULL),
(326, '2021-04-08', NULL, 'no realizado', 1, NULL, NULL),
(327, '2021-04-08', NULL, 'no realizado', 2, NULL, NULL),
(328, '2021-04-08', '16:42:59', 'realizado', 7, NULL, '2021-04-08 20:42:59'),
(329, '2021-04-08', NULL, 'no realizado', 9, NULL, NULL),
(330, '2021-04-08', NULL, 'no realizado', 10, NULL, NULL),
(331, '2021-04-08', NULL, 'no realizado', 1, NULL, NULL),
(332, '2021-04-08', NULL, 'no realizado', 2, NULL, NULL),
(333, '2021-04-08', NULL, 'no realizado', 7, NULL, NULL),
(334, '2021-04-08', NULL, 'no realizado', 9, NULL, NULL),
(335, '2021-04-08', NULL, 'no realizado', 10, NULL, NULL),
(336, '2021-04-09', NULL, 'no realizado', 1, NULL, NULL),
(337, '2021-04-09', NULL, 'no realizado', 2, NULL, NULL),
(338, '2021-04-09', NULL, 'no realizado', 7, NULL, NULL),
(339, '2021-04-09', NULL, 'no realizado', 9, NULL, NULL),
(340, '2021-04-09', NULL, 'no realizado', 10, NULL, NULL),
(341, '2021-04-09', NULL, 'no realizado', 1, NULL, NULL),
(342, '2021-04-09', NULL, 'no realizado', 2, NULL, NULL),
(343, '2021-04-09', NULL, 'no realizado', 7, NULL, NULL),
(344, '2021-04-09', NULL, 'no realizado', 9, NULL, NULL),
(345, '2021-04-09', NULL, 'no realizado', 10, NULL, NULL),
(346, '09-04-2021', '11:41:32', 'realizado', 7, '2021-04-09 15:41:32', '2021-04-09 15:41:32'),
(347, '09-04-2021', NULL, 'no realizado', 1, NULL, NULL),
(348, '09-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(349, '09-04-2021', '11:43:15', 'realizado', 7, NULL, '2021-04-09 15:43:15'),
(350, '09-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(351, '09-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(352, '09-04-2021', '12:03:39', 'realizado', 7, '2021-04-09 16:03:39', '2021-04-09 16:03:39'),
(353, '09-04-2021', '12:04:11', 'realizado', 7, '2021-04-09 16:04:11', '2021-04-09 16:04:11'),
(354, '09-04-2021', '12:04:19', 'realizado', 7, '2021-04-09 16:04:19', '2021-04-09 16:04:19'),
(355, '09-04-2021', '12:11:12', 'realizado', 7, '2021-04-09 16:11:12', '2021-04-09 16:11:12'),
(356, '12-04-2021', NULL, 'no realizado', 1, NULL, NULL),
(357, '12-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(358, '12-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(359, '12-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(360, '12-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(361, '12-04-2021', NULL, 'no realizado', 1, NULL, NULL),
(362, '12-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(363, '12-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(364, '12-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(365, '12-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(366, '13-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(367, '13-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(368, '13-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(369, '13-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(370, '13-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(371, '13-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(372, '13-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(373, '13-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(374, '13-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(375, '13-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(376, '13-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(377, '13-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(378, '14-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(379, '14-04-2021', '18:59:26', 'realizado', 7, NULL, '2021-04-14 22:59:26'),
(380, '14-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(381, '14-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(382, '14-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(383, '14-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(384, '14-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(385, '14-04-2021', '18:59:27', 'realizado', 7, NULL, '2021-04-14 22:59:27'),
(386, '14-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(387, '14-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(388, '14-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(389, '14-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(390, '14-04-2021', '18:59:28', 'realizado', 7, '2021-04-14 22:59:28', '2021-04-14 22:59:28'),
(391, '15-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(392, '15-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(393, '15-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(394, '15-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(395, '15-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(396, '15-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(397, '15-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(398, '15-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(399, '15-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(400, '15-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(401, '15-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(402, '15-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(403, '15-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(404, '15-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(405, '16-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(406, '16-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(407, '16-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(408, '16-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(409, '16-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(410, '16-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(411, '16-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(412, '16-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(413, '16-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(414, '16-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(415, '16-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(416, '16-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(417, '16-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(418, '16-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(419, '17-04-2021', '11:14:07', 'realizado', 15, '2021-04-17 15:14:07', '2021-04-17 15:14:07'),
(420, '17-04-2021', '11:14:08', 'realizado', 15, '2021-04-17 15:14:08', '2021-04-17 15:14:08'),
(421, '19-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(422, '19-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(423, '19-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(424, '19-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(425, '19-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(426, '19-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(427, '19-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(428, '19-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(429, '19-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(430, '19-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(431, '19-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(432, '19-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(433, '19-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(434, '19-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(435, '20-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(436, '20-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(437, '20-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(438, '20-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(439, '20-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(440, '20-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(441, '20-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(442, '20-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(443, '20-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(444, '20-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(445, '20-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(446, '20-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(447, '20-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(448, '20-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(449, '21-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(450, '21-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(451, '21-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(452, '21-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(453, '21-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(454, '21-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(455, '21-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(456, '21-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(457, '21-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(458, '21-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(459, '21-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(460, '21-04-2021', NULL, 'no realizado', 13, NULL, NULL),
(461, '21-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(462, '21-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(463, '22-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(464, '22-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(465, '22-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(466, '22-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(467, '22-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(468, '22-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(469, '22-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(470, '22-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(471, '22-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(472, '22-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(473, '22-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(474, '22-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(475, '22-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(476, '22-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(477, '23-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(478, '23-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(479, '23-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(480, '23-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(481, '23-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(482, '23-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(483, '23-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(484, '23-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(485, '23-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(486, '23-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(487, '23-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(488, '23-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(489, '23-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(490, '23-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(491, '26-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(492, '26-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(493, '26-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(494, '26-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(495, '26-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(496, '26-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(497, '26-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(498, '26-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(499, '26-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(500, '26-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(501, '26-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(502, '26-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(503, '26-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(504, '26-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(505, '27-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(506, '27-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(507, '27-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(508, '27-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(509, '27-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(510, '27-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(511, '27-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(512, '27-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(513, '27-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(514, '27-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(515, '27-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(516, '27-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(517, '27-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(518, '27-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(519, '28-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(520, '28-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(521, '28-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(522, '28-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(523, '28-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(524, '28-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(525, '28-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(526, '28-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(527, '28-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(528, '28-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(529, '28-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(530, '28-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(531, '28-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(532, '28-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(533, '29-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(534, '29-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(535, '29-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(536, '29-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(537, '29-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(538, '29-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(539, '29-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(540, '29-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(541, '29-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(542, '29-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(543, '29-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(544, '29-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(545, '29-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(546, '29-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(547, '30-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(548, '30-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(549, '30-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(550, '30-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(551, '30-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(552, '30-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(553, '30-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(554, '30-04-2021', NULL, 'no realizado', 2, NULL, NULL),
(555, '30-04-2021', NULL, 'no realizado', 7, NULL, NULL),
(556, '30-04-2021', NULL, 'no realizado', 9, NULL, NULL),
(557, '30-04-2021', NULL, 'no realizado', 10, NULL, NULL),
(558, '30-04-2021', NULL, 'no realizado', 14, NULL, NULL),
(559, '30-04-2021', NULL, 'no realizado', 15, NULL, NULL),
(560, '30-04-2021', NULL, 'no realizado', 19, NULL, NULL),
(561, '03-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(562, '03-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(563, '03-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(564, '03-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(565, '03-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(566, '03-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(567, '03-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(568, '03-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(569, '03-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(570, '03-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(571, '03-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(572, '03-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(573, '03-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(574, '03-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(575, '03-05-2021', '23:15:48', 'realizado', 15, '2021-05-04 03:15:48', '2021-05-04 03:15:48'),
(576, '03-05-2021', '23:15:53', 'realizado', 15, '2021-05-04 03:15:53', '2021-05-04 03:15:53'),
(577, '04-05-2021', '04:55:44', 'realizado', 15, '2021-05-04 08:55:44', '2021-05-04 08:55:44'),
(578, '04-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(579, '04-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(580, '04-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(581, '04-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(582, '04-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(583, '04-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(584, '04-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(585, '04-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(586, '04-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(587, '04-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(588, '04-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(589, '04-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(590, '04-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(591, '04-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(592, '04-05-2021', '23:13:16', 'realizado', 15, '2021-05-05 03:13:16', '2021-05-05 03:13:16'),
(593, '04-05-2021', '23:13:25', 'realizado', 15, '2021-05-05 03:13:25', '2021-05-05 03:13:25'),
(594, '05-05-2021', '02:52:38', 'realizado', 15, '2021-05-05 06:52:38', '2021-05-05 06:52:38'),
(595, '05-05-2021', '02:52:50', 'realizado', 15, '2021-05-05 06:52:50', '2021-05-05 06:52:50'),
(596, '05-05-2021', '05:51:05', 'realizado', 15, '2021-05-05 09:51:05', '2021-05-05 09:51:05'),
(597, '05-05-2021', '05:51:19', 'realizado', 15, '2021-05-05 09:51:19', '2021-05-05 09:51:19'),
(598, '05-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(599, '05-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(600, '05-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(601, '05-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(602, '05-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(603, '05-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(604, '05-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(605, '05-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(606, '05-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(607, '05-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(608, '05-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(609, '05-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(610, '05-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(611, '05-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(612, '06-05-2021', '00:36:36', 'realizado', 15, '2021-05-06 04:36:36', '2021-05-06 04:36:36'),
(613, '06-05-2021', '00:36:42', 'realizado', 15, '2021-05-06 04:36:42', '2021-05-06 04:36:42'),
(614, '06-05-2021', '02:02:17', 'realizado', 15, '2021-05-06 06:02:17', '2021-05-06 06:02:17'),
(615, '06-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(616, '06-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(617, '06-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(618, '06-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(619, '06-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(620, '06-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(621, '06-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(622, '06-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(623, '06-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(624, '06-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(625, '06-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(626, '06-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(627, '06-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(628, '06-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(629, '06-05-2021', '23:43:15', 'realizado', 15, '2021-05-07 03:43:15', '2021-05-07 03:43:15'),
(630, '06-05-2021', '23:43:21', 'realizado', 15, '2021-05-07 03:43:21', '2021-05-07 03:43:21'),
(631, '07-05-2021', '02:13:15', 'realizado', 15, '2021-05-07 06:13:15', '2021-05-07 06:13:15'),
(632, '07-05-2021', '02:13:27', 'realizado', 15, '2021-05-07 06:13:27', '2021-05-07 06:13:27'),
(633, '07-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(634, '07-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(635, '07-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(636, '07-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(637, '07-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(638, '07-05-2021', '01:52:52', 'realizado', 15, NULL, '2021-05-08 05:52:52'),
(639, '07-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(640, '07-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(641, '07-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(642, '07-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(643, '07-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(644, '07-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(645, '07-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(646, '07-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(647, '08-05-2021', '01:52:56', 'realizado', 15, '2021-05-08 05:52:56', '2021-05-08 05:52:56'),
(648, '08-05-2021', '01:53:02', 'realizado', 15, '2021-05-08 05:53:02', '2021-05-08 05:53:02'),
(649, '08-05-2021', '03:05:21', 'realizado', 15, '2021-05-08 07:05:21', '2021-05-08 07:05:21'),
(650, '08-05-2021', '03:05:26', 'realizado', 15, '2021-05-08 07:05:26', '2021-05-08 07:05:26'),
(651, '08-05-2021', '04:43:41', 'realizado', 15, '2021-05-08 08:43:41', '2021-05-08 08:43:41'),
(652, '08-05-2021', '04:43:49', 'realizado', 15, '2021-05-08 08:43:49', '2021-05-08 08:43:49'),
(653, '08-05-2021', '05:50:10', 'realizado', 15, '2021-05-08 09:50:10', '2021-05-08 09:50:10'),
(654, '08-05-2021', '05:50:11', 'realizado', 15, '2021-05-08 09:50:11', '2021-05-08 09:50:11'),
(655, '10-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(656, '10-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(657, '10-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(658, '10-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(659, '10-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(660, '10-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(661, '10-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(662, '10-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(663, '10-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(664, '10-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(665, '10-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(666, '10-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(667, '10-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(668, '10-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(669, '10-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(670, '10-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(671, '10-05-2021', '23:59:17', 'realizado', 15, '2021-05-11 03:59:17', '2021-05-11 03:59:17'),
(672, '10-05-2021', '23:59:20', 'realizado', 15, '2021-05-11 03:59:20', '2021-05-11 03:59:20'),
(673, '11-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(674, '11-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(675, '11-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(676, '11-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(677, '11-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(678, '11-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(679, '11-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(680, '11-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(681, '11-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(682, '11-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(683, '11-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(684, '11-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(685, '11-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(686, '11-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(687, '11-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(688, '11-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(689, '12-05-2021', '00:17:26', 'realizado', 15, '2021-05-12 04:17:26', '2021-05-12 04:17:26'),
(690, '12-05-2021', '00:17:28', 'realizado', 15, '2021-05-12 04:17:28', '2021-05-12 04:17:28'),
(691, '12-05-2021', '05:58:56', 'realizado', 15, '2021-05-12 09:58:56', '2021-05-12 09:58:56'),
(692, '12-05-2021', '05:59:04', 'realizado', 15, '2021-05-12 09:59:04', '2021-05-12 09:59:04'),
(693, '12-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(694, '12-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(695, '12-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(696, '12-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(697, '12-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(698, '12-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(699, '12-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(700, '12-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(701, '12-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(702, '12-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(703, '12-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(704, '12-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(705, '12-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(706, '12-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(707, '12-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(708, '12-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(709, '13-05-2021', '00:02:40', 'realizado', 15, '2021-05-13 04:02:40', '2021-05-13 04:02:40'),
(710, '13-05-2021', '05:06:56', 'realizado', 15, '2021-05-13 09:06:56', '2021-05-13 09:06:56'),
(711, '13-05-2021', '05:07:00', 'realizado', 15, '2021-05-13 09:07:00', '2021-05-13 09:07:00'),
(712, '13-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(713, '13-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(714, '13-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(715, '13-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(716, '13-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(717, '13-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(718, '13-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(719, '13-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(720, '13-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(721, '13-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(722, '13-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(723, '13-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(724, '13-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(725, '13-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(726, '13-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(727, '13-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(728, '13-05-2021', '23:29:06', 'realizado', 15, '2021-05-14 03:29:06', '2021-05-14 03:29:06'),
(729, '13-05-2021', '23:29:10', 'realizado', 15, '2021-05-14 03:29:10', '2021-05-14 03:29:10'),
(730, '14-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(731, '14-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(732, '14-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(733, '14-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(734, '14-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(735, '14-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(736, '14-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(737, '14-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(738, '14-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(739, '14-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(740, '14-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(741, '14-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(742, '14-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(743, '14-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(744, '14-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(745, '14-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(746, '17-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(747, '17-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(748, '17-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(749, '17-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(750, '17-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(751, '17-05-2021', '23:40:06', 'realizado', 15, NULL, '2021-05-18 03:40:06'),
(752, '17-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(753, '17-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(754, '17-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(755, '17-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(756, '17-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(757, '17-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(758, '17-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(759, '17-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(760, '17-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(761, '17-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(762, '17-05-2021', '23:40:00', 'realizado', 15, '2021-05-18 03:40:00', '2021-05-18 03:40:00'),
(763, '18-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(764, '18-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(765, '18-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(766, '18-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(767, '18-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(768, '18-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(769, '18-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(770, '18-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(771, '18-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(772, '18-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(773, '18-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(774, '18-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(775, '18-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(776, '18-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(777, '18-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(778, '18-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(779, '19-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(780, '19-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(781, '19-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(782, '19-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(783, '19-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(784, '19-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(785, '19-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(786, '19-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(787, '19-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(788, '19-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(789, '19-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(790, '19-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(791, '19-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(792, '19-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(793, '19-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(794, '19-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(795, '20-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(796, '20-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(797, '20-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(798, '20-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(799, '20-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(800, '20-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(801, '20-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(802, '20-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(803, '20-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(804, '20-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(805, '20-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(806, '20-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(807, '20-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(808, '20-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(809, '20-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(810, '20-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(811, '21-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(812, '21-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(813, '21-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(814, '21-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(815, '21-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(816, '21-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(817, '21-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(818, '21-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(819, '21-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(820, '21-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(821, '21-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(822, '21-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(823, '21-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(824, '21-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(825, '21-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(826, '21-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(827, '24-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(828, '24-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(829, '24-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(830, '24-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(831, '24-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(832, '24-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(833, '24-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(834, '24-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(835, '24-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(836, '24-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(837, '24-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(838, '24-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(839, '24-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(840, '24-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(841, '24-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(842, '24-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(843, '25-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(844, '25-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(845, '25-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(846, '25-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(847, '25-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(848, '25-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(849, '25-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(850, '25-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(851, '25-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(852, '25-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(853, '25-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(854, '25-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(855, '25-05-2021', NULL, 'no realizado', 14, NULL, NULL);
INSERT INTO `sanitizacion` (`id`, `date`, `hora`, `status`, `id_postulante`, `created_at`, `updated_at`) VALUES
(856, '25-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(857, '25-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(858, '25-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(859, '26-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(860, '26-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(861, '26-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(862, '26-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(863, '26-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(864, '26-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(865, '26-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(866, '26-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(867, '26-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(868, '26-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(869, '26-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(870, '26-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(871, '26-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(872, '26-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(873, '26-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(874, '26-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(875, '27-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(876, '27-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(877, '27-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(878, '27-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(879, '27-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(880, '27-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(881, '27-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(882, '27-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(883, '27-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(884, '27-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(885, '27-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(886, '27-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(887, '27-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(888, '27-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(889, '27-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(890, '27-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(891, '28-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(892, '28-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(893, '28-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(894, '28-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(895, '28-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(896, '28-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(897, '28-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(898, '28-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(899, '28-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(900, '28-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(901, '28-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(902, '28-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(903, '28-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(904, '28-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(905, '28-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(906, '28-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(907, '31-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(908, '31-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(909, '31-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(910, '31-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(911, '31-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(912, '31-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(913, '31-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(914, '31-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(915, '31-05-2021', NULL, 'no realizado', 2, NULL, NULL),
(916, '31-05-2021', NULL, 'no realizado', 7, NULL, NULL),
(917, '31-05-2021', NULL, 'no realizado', 9, NULL, NULL),
(918, '31-05-2021', NULL, 'no realizado', 10, NULL, NULL),
(919, '31-05-2021', NULL, 'no realizado', 14, NULL, NULL),
(920, '31-05-2021', NULL, 'no realizado', 15, NULL, NULL),
(921, '31-05-2021', NULL, 'no realizado', 19, NULL, NULL),
(922, '31-05-2021', NULL, 'no realizado', 20, NULL, NULL),
(923, '01-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(924, '01-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(925, '01-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(926, '01-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(927, '01-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(928, '01-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(929, '01-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(930, '01-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(931, '01-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(932, '01-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(933, '01-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(934, '01-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(935, '01-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(936, '01-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(937, '01-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(938, '01-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(939, '02-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(940, '02-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(941, '02-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(942, '02-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(943, '02-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(944, '02-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(945, '02-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(946, '02-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(947, '02-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(948, '02-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(949, '02-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(950, '02-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(951, '02-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(952, '02-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(953, '02-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(954, '02-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(955, '03-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(956, '03-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(957, '03-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(958, '03-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(959, '03-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(960, '03-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(961, '03-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(962, '03-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(963, '03-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(964, '03-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(965, '03-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(966, '03-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(967, '03-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(968, '03-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(969, '03-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(970, '03-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(971, '04-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(972, '04-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(973, '04-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(974, '04-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(975, '04-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(976, '04-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(977, '04-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(978, '04-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(979, '04-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(980, '04-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(981, '04-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(982, '04-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(983, '04-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(984, '04-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(985, '04-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(986, '04-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(987, '07-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(988, '07-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(989, '07-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(990, '07-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(991, '07-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(992, '07-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(993, '07-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(994, '07-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(995, '07-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(996, '07-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(997, '07-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(998, '07-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(999, '07-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1000, '07-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1001, '07-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1002, '07-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1003, '08-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1004, '08-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1005, '08-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1006, '08-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1007, '08-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1008, '08-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1009, '08-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1010, '08-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1011, '08-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1012, '08-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1013, '08-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1014, '08-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1015, '08-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1016, '08-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1017, '08-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1018, '08-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1019, '09-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1020, '09-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1021, '09-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1022, '09-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1023, '09-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1024, '09-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1025, '09-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1026, '09-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1027, '09-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1028, '09-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1029, '09-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1030, '09-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1031, '09-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1032, '09-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1033, '09-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1034, '09-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1035, '10-06-2021', '02:11:54', 'realizado', 15, '2021-06-10 06:11:54', '2021-06-10 06:11:54'),
(1036, '10-06-2021', '02:12:03', 'realizado', 15, '2021-06-10 06:12:03', '2021-06-10 06:12:03'),
(1037, '10-06-2021', '03:25:36', 'realizado', 15, '2021-06-10 07:25:36', '2021-06-10 07:25:36'),
(1038, '10-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1039, '10-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1040, '10-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1041, '10-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1042, '10-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1043, '10-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1044, '10-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1045, '10-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1046, '10-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1047, '10-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1048, '10-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1049, '10-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1050, '10-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1051, '10-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1052, '10-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1053, '10-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1054, '11-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1055, '11-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1056, '11-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1057, '11-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1058, '11-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1059, '11-06-2021', '23:44:21', 'realizado', 15, NULL, '2021-06-12 03:44:21'),
(1060, '11-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1061, '11-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1062, '11-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1063, '11-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1064, '11-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1065, '11-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1066, '11-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1067, '11-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1068, '11-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1069, '11-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1070, '14-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1071, '14-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1072, '14-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1073, '14-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1074, '14-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1075, '14-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1076, '14-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1077, '14-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1078, '14-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1079, '14-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1080, '14-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1081, '14-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1082, '14-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1083, '14-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1084, '14-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1085, '14-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1086, '15-06-2021', '00:32:50', 'realizado', 15, '2021-06-15 04:32:50', '2021-06-15 04:32:50'),
(1087, '15-06-2021', '00:32:52', 'realizado', 15, '2021-06-15 04:32:52', '2021-06-15 04:32:52'),
(1088, '15-06-2021', '02:30:36', 'realizado', 15, '2021-06-15 06:30:36', '2021-06-15 06:30:36'),
(1089, '15-06-2021', '02:30:37', 'realizado', 15, '2021-06-15 06:30:37', '2021-06-15 06:30:37'),
(1090, '15-06-2021', '04:56:43', 'realizado', 15, '2021-06-15 08:56:43', '2021-06-15 08:56:43'),
(1091, '15-06-2021', '04:56:46', 'realizado', 15, '2021-06-15 08:56:46', '2021-06-15 08:56:46'),
(1092, '15-06-2021', '05:55:53', 'realizado', 15, '2021-06-15 09:55:53', '2021-06-15 09:55:53'),
(1093, '15-06-2021', '05:55:54', 'realizado', 15, '2021-06-15 09:55:54', '2021-06-15 09:55:54'),
(1094, '15-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1095, '15-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1096, '15-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1097, '15-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1098, '15-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1099, '15-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1100, '15-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1101, '15-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1102, '15-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1103, '15-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1104, '15-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1105, '15-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1106, '15-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1107, '15-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1108, '15-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1109, '15-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1110, '15-06-2021', '22:42:39', 'realizado', 15, '2021-06-16 02:42:39', '2021-06-16 02:42:39'),
(1111, '15-06-2021', '22:42:42', 'realizado', 15, '2021-06-16 02:42:42', '2021-06-16 02:42:42'),
(1112, '15-06-2021', '22:42:49', 'realizado', 15, '2021-06-16 02:42:49', '2021-06-16 02:42:49'),
(1113, '15-06-2021', '22:42:51', 'realizado', 15, '2021-06-16 02:42:51', '2021-06-16 02:42:51'),
(1114, '15-06-2021', '22:42:53', 'realizado', 15, '2021-06-16 02:42:53', '2021-06-16 02:42:53'),
(1115, '15-06-2021', '23:38:13', 'realizado', 15, '2021-06-16 03:38:13', '2021-06-16 03:38:13'),
(1116, '15-06-2021', '23:38:14', 'realizado', 15, '2021-06-16 03:38:14', '2021-06-16 03:38:14'),
(1117, '16-06-2021', '04:39:13', 'realizado', 15, '2021-06-16 08:39:13', '2021-06-16 08:39:13'),
(1118, '16-06-2021', '04:39:14', 'realizado', 15, '2021-06-16 08:39:14', '2021-06-16 08:39:14'),
(1119, '16-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1120, '16-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1121, '16-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1122, '16-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1123, '16-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1124, '16-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1125, '16-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1126, '16-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1127, '16-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1128, '16-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1129, '16-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1130, '16-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1131, '16-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1132, '16-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1133, '16-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1134, '16-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1135, '17-06-2021', '02:27:50', 'realizado', 15, '2021-06-17 06:27:50', '2021-06-17 06:27:50'),
(1136, '17-06-2021', '02:27:53', 'realizado', 15, '2021-06-17 06:27:53', '2021-06-17 06:27:53'),
(1137, '17-06-2021', '04:37:51', 'realizado', 15, '2021-06-17 08:37:51', '2021-06-17 08:37:51'),
(1138, '17-06-2021', '04:37:51', 'realizado', 15, '2021-06-17 08:37:51', '2021-06-17 08:37:51'),
(1139, '17-06-2021', '05:45:48', 'realizado', 15, '2021-06-17 09:45:48', '2021-06-17 09:45:48'),
(1140, '17-06-2021', '05:45:49', 'realizado', 15, '2021-06-17 09:45:49', '2021-06-17 09:45:49'),
(1141, '17-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1142, '17-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1143, '17-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1144, '17-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1145, '17-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1146, '17-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1147, '17-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1148, '17-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1149, '17-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1150, '17-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1151, '17-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1152, '17-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1153, '17-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1154, '17-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1155, '17-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1156, '17-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1157, '17-06-2021', '23:36:12', 'realizado', 15, '2021-06-18 03:36:12', '2021-06-18 03:36:12'),
(1158, '17-06-2021', '23:36:18', 'realizado', 15, '2021-06-18 03:36:18', '2021-06-18 03:36:18'),
(1159, '18-06-2021', '02:10:20', 'realizado', 15, '2021-06-18 06:10:20', '2021-06-18 06:10:20'),
(1160, '18-06-2021', '02:10:23', 'realizado', 15, '2021-06-18 06:10:23', '2021-06-18 06:10:23'),
(1161, '18-06-2021', '04:39:02', 'realizado', 15, '2021-06-18 08:39:02', '2021-06-18 08:39:02'),
(1162, '18-06-2021', '04:39:03', 'realizado', 15, '2021-06-18 08:39:03', '2021-06-18 08:39:03'),
(1163, '18-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1164, '18-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1165, '18-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1166, '18-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1167, '18-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1168, '18-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1169, '18-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1170, '18-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1171, '18-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1172, '18-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1173, '18-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1174, '18-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1175, '18-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1176, '18-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1177, '18-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1178, '18-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1179, '19-06-2021', '00:11:06', 'realizado', 15, '2021-06-19 04:11:06', '2021-06-19 04:11:06'),
(1180, '19-06-2021', '00:11:08', 'realizado', 15, '2021-06-19 04:11:08', '2021-06-19 04:11:08'),
(1181, '19-06-2021', '01:47:20', 'realizado', 15, '2021-06-19 05:47:20', '2021-06-19 05:47:20'),
(1182, '19-06-2021', '01:47:20', 'realizado', 15, '2021-06-19 05:47:20', '2021-06-19 05:47:20'),
(1183, '19-06-2021', '03:33:12', 'realizado', 15, '2021-06-19 07:33:12', '2021-06-19 07:33:12'),
(1184, '19-06-2021', '03:33:14', 'realizado', 15, '2021-06-19 07:33:14', '2021-06-19 07:33:14'),
(1185, '19-06-2021', '05:40:36', 'realizado', 15, '2021-06-19 09:40:36', '2021-06-19 09:40:36'),
(1186, '19-06-2021', '05:40:38', 'realizado', 15, '2021-06-19 09:40:38', '2021-06-19 09:40:38'),
(1187, '21-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1188, '21-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1189, '21-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1190, '21-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1191, '21-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1192, '21-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1193, '21-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1194, '21-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1195, '21-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1196, '21-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1197, '21-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1198, '21-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1199, '21-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1200, '21-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1201, '21-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1202, '21-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1203, '22-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1204, '22-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1205, '22-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1206, '22-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1207, '22-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1208, '22-06-2021', '23:03:56', 'realizado', 15, NULL, '2021-06-23 03:03:56'),
(1209, '22-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1210, '22-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1211, '22-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1212, '22-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1213, '22-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1214, '22-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1215, '22-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1216, '22-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1217, '22-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1218, '22-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1219, '22-06-2021', '23:03:58', 'realizado', 15, '2021-06-23 03:03:58', '2021-06-23 03:03:58'),
(1220, '22-06-2021', '23:43:12', 'realizado', 15, '2021-06-23 03:43:12', '2021-06-23 03:43:12'),
(1221, '22-06-2021', '23:43:13', 'realizado', 15, '2021-06-23 03:43:13', '2021-06-23 03:43:13'),
(1222, '23-06-2021', '02:53:31', 'realizado', 15, '2021-06-23 06:53:31', '2021-06-23 06:53:31'),
(1223, '23-06-2021', '02:53:33', 'realizado', 15, '2021-06-23 06:53:33', '2021-06-23 06:53:33'),
(1224, '23-06-2021', '04:34:42', 'realizado', 15, '2021-06-23 08:34:42', '2021-06-23 08:34:42'),
(1225, '23-06-2021', '04:34:52', 'realizado', 15, '2021-06-23 08:34:52', '2021-06-23 08:34:52'),
(1226, '23-06-2021', '05:35:59', 'realizado', 15, '2021-06-23 09:35:59', '2021-06-23 09:35:59'),
(1227, '23-06-2021', '05:35:59', 'realizado', 15, '2021-06-23 09:35:59', '2021-06-23 09:35:59'),
(1228, '23-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1229, '23-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1230, '23-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1231, '23-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1232, '23-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1233, '23-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1234, '23-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1235, '23-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1236, '23-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1237, '23-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1238, '23-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1239, '23-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1240, '23-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1241, '23-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1242, '23-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1243, '23-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1244, '23-06-2021', '23:56:10', 'realizado', 15, '2021-06-24 03:56:10', '2021-06-24 03:56:10'),
(1245, '23-06-2021', '23:56:16', 'realizado', 15, '2021-06-24 03:56:16', '2021-06-24 03:56:16'),
(1246, '24-06-2021', '03:10:41', 'realizado', 15, '2021-06-24 07:10:41', '2021-06-24 07:10:41'),
(1247, '24-06-2021', '03:10:41', 'realizado', 15, '2021-06-24 07:10:41', '2021-06-24 07:10:41'),
(1248, '24-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1249, '24-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1250, '24-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1251, '24-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1252, '24-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1253, '24-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1254, '24-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1255, '24-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1256, '24-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1257, '24-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1258, '24-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1259, '24-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1260, '24-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1261, '24-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1262, '24-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1263, '24-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1264, '24-06-2021', '22:52:43', 'realizado', 15, '2021-06-25 02:52:43', '2021-06-25 02:52:43'),
(1265, '25-06-2021', '01:39:55', 'realizado', 15, '2021-06-25 05:39:55', '2021-06-25 05:39:55'),
(1266, '25-06-2021', '04:35:02', 'realizado', 15, '2021-06-25 08:35:02', '2021-06-25 08:35:02'),
(1267, '25-06-2021', '04:35:04', 'realizado', 15, '2021-06-25 08:35:04', '2021-06-25 08:35:04'),
(1268, '25-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1269, '25-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1270, '25-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1271, '25-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1272, '25-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1273, '25-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1274, '25-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1275, '25-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1276, '25-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1277, '25-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1278, '25-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1279, '25-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1280, '25-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1281, '25-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1282, '25-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1283, '25-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1284, '26-06-2021', '01:11:02', 'realizado', 15, '2021-06-26 05:11:02', '2021-06-26 05:11:02'),
(1285, '26-06-2021', '04:53:23', 'realizado', 15, '2021-06-26 08:53:23', '2021-06-26 08:53:23'),
(1286, '28-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1287, '28-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1288, '28-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1289, '28-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1290, '28-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1291, '28-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1292, '28-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1293, '28-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1294, '28-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1295, '28-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1296, '28-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1297, '28-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1298, '28-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1299, '28-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1300, '28-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1301, '28-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1302, '29-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1303, '29-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1304, '29-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1305, '29-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1306, '29-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1307, '29-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1308, '29-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1309, '29-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1310, '29-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1311, '29-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1312, '29-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1313, '29-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1314, '29-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1315, '29-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1316, '29-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1317, '29-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1318, '29-06-2021', '23:41:01', 'realizado', 15, '2021-06-30 03:41:01', '2021-06-30 03:41:01'),
(1319, '30-06-2021', '04:41:47', 'realizado', 15, '2021-06-30 08:41:47', '2021-06-30 08:41:47'),
(1320, '30-06-2021', '04:41:48', 'realizado', 15, '2021-06-30 08:41:48', '2021-06-30 08:41:48'),
(1321, '30-06-2021', '05:41:48', 'realizado', 15, '2021-06-30 09:41:48', '2021-06-30 09:41:48'),
(1322, '30-06-2021', '05:41:49', 'realizado', 15, '2021-06-30 09:41:49', '2021-06-30 09:41:49'),
(1323, '30-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1324, '30-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1325, '30-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1326, '30-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1327, '30-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1328, '30-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1329, '30-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1330, '30-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1331, '30-06-2021', NULL, 'no realizado', 2, NULL, NULL),
(1332, '30-06-2021', NULL, 'no realizado', 7, NULL, NULL),
(1333, '30-06-2021', NULL, 'no realizado', 9, NULL, NULL),
(1334, '30-06-2021', NULL, 'no realizado', 10, NULL, NULL),
(1335, '30-06-2021', NULL, 'no realizado', 14, NULL, NULL),
(1336, '30-06-2021', NULL, 'no realizado', 15, NULL, NULL),
(1337, '30-06-2021', NULL, 'no realizado', 19, NULL, NULL),
(1338, '30-06-2021', NULL, 'no realizado', 20, NULL, NULL),
(1339, '30-06-2021', '23:02:58', 'realizado', 15, '2021-07-01 03:02:58', '2021-07-01 03:02:58'),
(1340, '30-06-2021', '23:03:01', 'realizado', 15, '2021-07-01 03:03:01', '2021-07-01 03:03:01'),
(1341, '01-07-2021', '00:47:06', 'realizado', 15, '2021-07-01 04:47:07', '2021-07-01 04:47:07'),
(1342, '01-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1343, '01-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1344, '01-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1345, '01-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1346, '01-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1347, '01-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1348, '01-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1349, '01-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1350, '01-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1351, '01-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1352, '01-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1353, '01-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1354, '01-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1355, '01-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1356, '01-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1357, '01-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1358, '02-07-2021', '00:01:00', 'realizado', 15, '2021-07-02 04:01:00', '2021-07-02 04:01:00'),
(1359, '02-07-2021', '00:01:04', 'realizado', 15, '2021-07-02 04:01:04', '2021-07-02 04:01:04'),
(1360, '02-07-2021', '03:37:58', 'realizado', 15, '2021-07-02 07:37:58', '2021-07-02 07:37:58'),
(1361, '02-07-2021', '03:38:00', 'realizado', 15, '2021-07-02 07:38:00', '2021-07-02 07:38:00'),
(1362, '02-07-2021', '05:35:44', 'realizado', 15, '2021-07-02 09:35:44', '2021-07-02 09:35:44'),
(1363, '02-07-2021', '05:35:46', 'realizado', 15, '2021-07-02 09:35:46', '2021-07-02 09:35:46'),
(1364, '02-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1365, '02-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1366, '02-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1367, '02-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1368, '02-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1369, '02-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1370, '02-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1371, '02-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1372, '02-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1373, '02-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1374, '02-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1375, '02-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1376, '02-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1377, '02-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1378, '02-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1379, '02-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1380, '02-07-2021', '23:53:26', 'realizado', 15, '2021-07-03 03:53:26', '2021-07-03 03:53:26'),
(1381, '02-07-2021', '23:53:28', 'realizado', 15, '2021-07-03 03:53:28', '2021-07-03 03:53:28'),
(1382, '03-07-2021', '04:45:44', 'realizado', 15, '2021-07-03 08:45:44', '2021-07-03 08:45:44'),
(1383, '03-07-2021', '04:45:45', 'realizado', 15, '2021-07-03 08:45:45', '2021-07-03 08:45:45'),
(1384, '03-07-2021', '05:55:27', 'realizado', 15, '2021-07-03 09:55:27', '2021-07-03 09:55:27'),
(1385, '03-07-2021', '05:55:27', 'realizado', 15, '2021-07-03 09:55:27', '2021-07-03 09:55:27'),
(1386, '05-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1387, '05-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1388, '05-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1389, '05-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1390, '05-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1391, '05-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1392, '05-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1393, '05-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1394, '05-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1395, '05-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1396, '05-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1397, '05-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1398, '05-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1399, '05-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1400, '05-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1401, '05-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1402, '05-07-2021', '22:48:06', 'realizado', 15, '2021-07-06 02:48:06', '2021-07-06 02:48:06'),
(1403, '05-07-2021', '22:48:08', 'realizado', 15, '2021-07-06 02:48:08', '2021-07-06 02:48:08'),
(1404, '06-07-2021', '01:49:52', 'realizado', 15, '2021-07-06 05:49:52', '2021-07-06 05:49:52'),
(1405, '06-07-2021', '01:50:03', 'realizado', 15, '2021-07-06 05:50:03', '2021-07-06 05:50:03'),
(1406, '06-07-2021', '04:39:35', 'realizado', 15, '2021-07-06 08:39:35', '2021-07-06 08:39:35'),
(1407, '06-07-2021', '04:39:35', 'realizado', 15, '2021-07-06 08:39:35', '2021-07-06 08:39:35'),
(1408, '06-07-2021', '04:39:36', 'realizado', 15, '2021-07-06 08:39:36', '2021-07-06 08:39:36'),
(1409, '06-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1410, '06-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1411, '06-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1412, '06-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1413, '06-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1414, '06-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1415, '06-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1416, '06-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1417, '06-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1418, '06-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1419, '06-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1420, '06-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1421, '06-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1422, '06-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1423, '06-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1424, '06-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1425, '07-07-2021', '00:53:48', 'realizado', 15, '2021-07-07 04:53:48', '2021-07-07 04:53:48'),
(1426, '07-07-2021', '00:53:50', 'realizado', 15, '2021-07-07 04:53:50', '2021-07-07 04:53:50'),
(1427, '07-07-2021', '01:52:28', 'realizado', 15, '2021-07-07 05:52:28', '2021-07-07 05:52:28'),
(1428, '07-07-2021', '01:52:29', 'realizado', 15, '2021-07-07 05:52:29', '2021-07-07 05:52:29'),
(1429, '07-07-2021', '03:49:26', 'realizado', 15, '2021-07-07 07:49:26', '2021-07-07 07:49:26'),
(1430, '07-07-2021', '03:49:29', 'realizado', 15, '2021-07-07 07:49:29', '2021-07-07 07:49:29'),
(1431, '07-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1432, '07-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1433, '07-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1434, '07-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1435, '07-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1436, '07-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1437, '07-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1438, '07-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1439, '07-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1440, '07-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1441, '07-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1442, '07-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1443, '07-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1444, '07-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1445, '07-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1446, '07-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1447, '07-07-2021', '23:33:54', 'realizado', 15, '2021-07-08 03:33:54', '2021-07-08 03:33:54'),
(1448, '07-07-2021', '23:33:55', 'realizado', 15, '2021-07-08 03:33:55', '2021-07-08 03:33:55'),
(1449, '08-07-2021', '01:12:52', 'realizado', 15, '2021-07-08 05:12:52', '2021-07-08 05:12:52'),
(1450, '08-07-2021', '04:32:38', 'realizado', 15, '2021-07-08 08:32:38', '2021-07-08 08:32:38'),
(1451, '08-07-2021', '04:32:40', 'realizado', 15, '2021-07-08 08:32:40', '2021-07-08 08:32:40'),
(1452, '08-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1453, '08-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1454, '08-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1455, '08-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1456, '08-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1457, '08-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1458, '08-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1459, '08-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1460, '08-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1461, '08-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1462, '08-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1463, '08-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1464, '08-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1465, '08-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1466, '08-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1467, '08-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1468, '08-07-2021', '23:37:22', 'realizado', 15, '2021-07-09 03:37:22', '2021-07-09 03:37:22'),
(1469, '08-07-2021', '23:37:25', 'realizado', 15, '2021-07-09 03:37:25', '2021-07-09 03:37:25'),
(1470, '09-07-2021', '03:25:23', 'realizado', 15, '2021-07-09 07:25:23', '2021-07-09 07:25:23'),
(1471, '09-07-2021', '03:25:25', 'realizado', 15, '2021-07-09 07:25:25', '2021-07-09 07:25:25'),
(1472, '09-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1473, '09-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1474, '09-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1475, '09-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1476, '09-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1477, '09-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1478, '09-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1479, '09-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1480, '09-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1481, '09-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1482, '09-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1483, '09-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1484, '09-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1485, '09-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1486, '09-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1487, '09-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1488, '09-07-2021', '23:31:59', 'realizado', 15, '2021-07-10 03:31:59', '2021-07-10 03:31:59'),
(1489, '09-07-2021', '23:32:01', 'realizado', 15, '2021-07-10 03:32:01', '2021-07-10 03:32:01'),
(1490, '10-07-2021', '00:41:21', 'realizado', 15, '2021-07-10 04:41:21', '2021-07-10 04:41:21'),
(1491, '10-07-2021', '00:41:24', 'realizado', 15, '2021-07-10 04:41:24', '2021-07-10 04:41:24'),
(1492, '12-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1493, '12-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1494, '12-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1495, '12-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1496, '12-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1497, '12-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1498, '12-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1499, '12-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1500, '12-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1501, '12-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1502, '12-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1503, '12-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1504, '12-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1505, '12-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1506, '12-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1507, '12-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1508, '13-07-2021', '01:40:08', 'realizado', 15, '2021-07-13 05:40:08', '2021-07-13 05:40:08'),
(1509, '13-07-2021', '01:40:09', 'realizado', 15, '2021-07-13 05:40:09', '2021-07-13 05:40:09'),
(1510, '13-07-2021', '03:33:18', 'realizado', 15, '2021-07-13 07:33:18', '2021-07-13 07:33:18'),
(1511, '13-07-2021', '03:33:18', 'realizado', 15, '2021-07-13 07:33:18', '2021-07-13 07:33:18'),
(1512, '13-07-2021', '05:48:19', 'realizado', 15, '2021-07-13 09:48:19', '2021-07-13 09:48:19'),
(1513, '13-07-2021', '05:48:19', 'realizado', 15, '2021-07-13 09:48:19', '2021-07-13 09:48:19'),
(1514, '13-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1515, '13-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1516, '13-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1517, '13-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1518, '13-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1519, '13-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1520, '13-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1521, '13-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1522, '13-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1523, '13-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1524, '13-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1525, '13-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1526, '13-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1527, '13-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1528, '13-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1529, '13-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1530, '13-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1531, '13-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1532, '14-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1533, '14-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1534, '14-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1535, '14-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1536, '14-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1537, '14-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1538, '14-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1539, '14-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1540, '14-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1541, '14-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1542, '14-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1543, '14-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1544, '14-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1545, '14-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1546, '14-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1547, '14-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1548, '14-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1549, '14-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1550, '15-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1551, '15-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1552, '15-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1553, '15-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1554, '15-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1555, '15-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1556, '15-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1557, '15-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1558, '15-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1559, '15-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1560, '15-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1561, '15-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1562, '15-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1563, '15-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1564, '15-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1565, '15-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1566, '15-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1567, '15-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1568, '16-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1569, '16-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1570, '16-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1571, '16-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1572, '16-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1573, '16-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1574, '16-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1575, '16-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1576, '16-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1577, '16-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1578, '16-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1579, '16-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1580, '16-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1581, '16-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1582, '16-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1583, '16-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1584, '16-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1585, '16-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1586, '19-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1587, '19-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1588, '19-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1589, '19-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1590, '19-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1591, '19-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1592, '19-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1593, '19-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1594, '19-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1595, '19-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1596, '19-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1597, '19-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1598, '19-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1599, '19-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1600, '19-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1601, '19-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1602, '19-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1603, '19-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1604, '20-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1605, '20-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1606, '20-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1607, '20-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1608, '20-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1609, '20-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1610, '20-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1611, '20-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1612, '20-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1613, '20-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1614, '20-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1615, '20-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1616, '20-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1617, '20-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1618, '20-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1619, '20-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1620, '20-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1621, '20-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1622, '21-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1623, '21-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1624, '21-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1625, '21-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1626, '21-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1627, '21-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1628, '21-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1629, '21-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1630, '21-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1631, '21-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1632, '21-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1633, '21-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1634, '21-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1635, '21-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1636, '21-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1637, '21-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1638, '21-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1639, '21-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1640, '22-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1641, '22-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1642, '22-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1643, '22-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1644, '22-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1645, '22-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1646, '22-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1647, '22-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1648, '22-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1649, '22-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1650, '22-07-2021', NULL, 'no realizado', 7, NULL, NULL);
INSERT INTO `sanitizacion` (`id`, `date`, `hora`, `status`, `id_postulante`, `created_at`, `updated_at`) VALUES
(1651, '22-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1652, '22-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1653, '22-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1654, '22-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1655, '22-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1656, '22-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1657, '22-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1658, '23-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1659, '23-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1660, '23-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1661, '23-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1662, '23-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1663, '23-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1664, '23-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1665, '23-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1666, '23-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1667, '23-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1668, '23-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1669, '23-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1670, '23-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1671, '23-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1672, '23-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1673, '23-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1674, '23-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1675, '23-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1676, '26-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1677, '26-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1678, '26-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1679, '26-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1680, '26-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1681, '26-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1682, '26-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1683, '26-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1684, '26-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1685, '26-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1686, '26-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1687, '26-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1688, '26-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1689, '26-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1690, '26-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1691, '26-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1692, '26-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1693, '26-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1694, '26-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1695, '26-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1696, '27-07-2021', '00:58:48', 'realizado', 15, '2021-07-27 04:58:48', '2021-07-27 04:58:48'),
(1697, '27-07-2021', '00:58:52', 'realizado', 15, '2021-07-27 04:58:52', '2021-07-27 04:58:52'),
(1698, '27-07-2021', '03:32:37', 'realizado', 15, '2021-07-27 07:32:37', '2021-07-27 07:32:37'),
(1699, '27-07-2021', '03:32:41', 'realizado', 15, '2021-07-27 07:32:41', '2021-07-27 07:32:41'),
(1700, '27-07-2021', '04:41:41', 'realizado', 15, '2021-07-27 08:41:41', '2021-07-27 08:41:41'),
(1701, '27-07-2021', '04:41:41', 'realizado', 15, '2021-07-27 08:41:41', '2021-07-27 08:41:41'),
(1702, '27-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1703, '27-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1704, '27-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1705, '27-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1706, '27-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1707, '27-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1708, '27-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1709, '27-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1710, '27-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1711, '27-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1712, '27-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1713, '27-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1714, '27-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1715, '27-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1716, '27-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1717, '27-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1718, '27-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1719, '27-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1720, '27-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1721, '27-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1722, '27-07-2021', '23:27:31', 'realizado', 15, '2021-07-28 03:27:31', '2021-07-28 03:27:31'),
(1723, '27-07-2021', '23:27:34', 'realizado', 15, '2021-07-28 03:27:35', '2021-07-28 03:27:35'),
(1724, '28-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1725, '28-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1726, '28-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1727, '28-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1728, '28-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1729, '28-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1730, '28-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1731, '28-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1732, '28-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1733, '28-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1734, '28-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1735, '28-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1736, '28-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1737, '28-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1738, '28-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1739, '28-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1740, '28-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1741, '28-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1742, '28-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1743, '28-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1744, '29-07-2021', '00:03:24', 'realizado', 15, '2021-07-29 04:03:24', '2021-07-29 04:03:24'),
(1745, '29-07-2021', '00:03:27', 'realizado', 15, '2021-07-29 04:03:27', '2021-07-29 04:03:27'),
(1746, '29-07-2021', '04:44:11', 'realizado', 15, '2021-07-29 08:44:11', '2021-07-29 08:44:11'),
(1747, '29-07-2021', '04:44:16', 'realizado', 15, '2021-07-29 08:44:16', '2021-07-29 08:44:16'),
(1748, '29-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1749, '29-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1750, '29-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1751, '29-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1752, '29-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1753, '29-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1754, '29-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1755, '29-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1756, '29-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1757, '29-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1758, '29-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1759, '29-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1760, '29-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1761, '29-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1762, '29-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1763, '29-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1764, '29-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1765, '29-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1766, '29-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1767, '29-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1768, '29-07-2021', '23:27:42', 'realizado', 15, '2021-07-30 03:27:42', '2021-07-30 03:27:42'),
(1769, '29-07-2021', '23:27:44', 'realizado', 15, '2021-07-30 03:27:44', '2021-07-30 03:27:44'),
(1770, '30-07-2021', '04:38:27', 'realizado', 15, '2021-07-30 08:38:27', '2021-07-30 08:38:27'),
(1771, '30-07-2021', '04:38:29', 'realizado', 15, '2021-07-30 08:38:29', '2021-07-30 08:38:29'),
(1772, '30-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1773, '30-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1774, '30-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1775, '30-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1776, '30-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1777, '30-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1778, '30-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1779, '30-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1780, '30-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1781, '30-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1782, '30-07-2021', NULL, 'no realizado', 2, NULL, NULL),
(1783, '30-07-2021', NULL, 'no realizado', 7, NULL, NULL),
(1784, '30-07-2021', NULL, 'no realizado', 9, NULL, NULL),
(1785, '30-07-2021', NULL, 'no realizado', 10, NULL, NULL),
(1786, '30-07-2021', NULL, 'no realizado', 14, NULL, NULL),
(1787, '30-07-2021', NULL, 'no realizado', 15, NULL, NULL),
(1788, '30-07-2021', NULL, 'no realizado', 19, NULL, NULL),
(1789, '30-07-2021', NULL, 'no realizado', 20, NULL, NULL),
(1790, '30-07-2021', NULL, 'no realizado', 21, NULL, NULL),
(1791, '30-07-2021', NULL, 'no realizado', 22, NULL, NULL),
(1792, '31-07-2021', '04:37:05', 'realizado', 15, '2021-07-31 08:37:05', '2021-07-31 08:37:05'),
(1793, '31-07-2021', '04:37:07', 'realizado', 15, '2021-07-31 08:37:07', '2021-07-31 08:37:07'),
(1794, '31-07-2021', '05:23:15', 'realizado', 15, '2021-07-31 09:23:15', '2021-07-31 09:23:15'),
(1795, '31-07-2021', '05:23:15', 'realizado', 15, '2021-07-31 09:23:15', '2021-07-31 09:23:15'),
(1796, '02-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1797, '02-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1798, '02-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1799, '02-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1800, '02-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1801, '02-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1802, '02-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1803, '02-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1804, '02-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1805, '02-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1806, '02-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1807, '02-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1808, '02-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1809, '02-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1810, '02-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1811, '02-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1812, '02-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1813, '02-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1814, '02-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1815, '02-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1816, '03-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1817, '03-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1818, '03-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1819, '03-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1820, '03-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1821, '03-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1822, '03-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1823, '03-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1824, '03-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1825, '03-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1826, '03-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1827, '03-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1828, '03-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1829, '03-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1830, '03-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1831, '03-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1832, '03-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1833, '03-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1834, '03-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1835, '03-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1836, '03-08-2021', '22:37:22', 'realizado', 15, '2021-08-04 02:37:22', '2021-08-04 02:37:22'),
(1837, '03-08-2021', '22:37:24', 'realizado', 15, '2021-08-04 02:37:24', '2021-08-04 02:37:24'),
(1838, '04-08-2021', '00:59:20', 'realizado', 15, '2021-08-04 04:59:20', '2021-08-04 04:59:20'),
(1839, '04-08-2021', '00:59:24', 'realizado', 15, '2021-08-04 04:59:24', '2021-08-04 04:59:24'),
(1840, '04-08-2021', '02:39:41', 'realizado', 15, '2021-08-04 06:39:41', '2021-08-04 06:39:41'),
(1841, '04-08-2021', '02:39:45', 'realizado', 15, '2021-08-04 06:39:45', '2021-08-04 06:39:45'),
(1842, '04-08-2021', '04:37:25', 'realizado', 15, '2021-08-04 08:37:25', '2021-08-04 08:37:25'),
(1843, '04-08-2021', '04:37:25', 'realizado', 15, '2021-08-04 08:37:25', '2021-08-04 08:37:25'),
(1844, '04-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1845, '04-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1846, '04-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1847, '04-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1848, '04-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1849, '04-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1850, '04-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1851, '04-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1852, '04-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1853, '04-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1854, '04-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1855, '04-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1856, '04-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1857, '04-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1858, '04-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1859, '04-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1860, '04-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1861, '04-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1862, '04-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1863, '04-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1864, '04-08-2021', '23:10:58', 'realizado', 15, '2021-08-05 03:10:58', '2021-08-05 03:10:58'),
(1865, '04-08-2021', '23:10:59', 'realizado', 15, '2021-08-05 03:10:59', '2021-08-05 03:10:59'),
(1866, '04-08-2021', '23:11:03', 'realizado', 15, '2021-08-05 03:11:03', '2021-08-05 03:11:03'),
(1867, '05-08-2021', '01:50:56', 'realizado', 15, '2021-08-05 05:50:56', '2021-08-05 05:50:56'),
(1868, '05-08-2021', '03:30:27', 'realizado', 15, '2021-08-05 07:30:27', '2021-08-05 07:30:27'),
(1869, '05-08-2021', '03:30:28', 'realizado', 15, '2021-08-05 07:30:28', '2021-08-05 07:30:28'),
(1870, '05-08-2021', '04:34:50', 'realizado', 15, '2021-08-05 08:34:50', '2021-08-05 08:34:50'),
(1871, '05-08-2021', '04:34:51', 'realizado', 15, '2021-08-05 08:34:51', '2021-08-05 08:34:51'),
(1872, '05-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1873, '05-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1874, '05-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1875, '05-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1876, '05-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1877, '05-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1878, '05-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1879, '05-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1880, '05-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1881, '05-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1882, '05-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1883, '05-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1884, '05-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1885, '05-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1886, '05-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1887, '05-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1888, '05-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1889, '05-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1890, '05-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1891, '05-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1892, '05-08-2021', '23:59:48', 'realizado', 15, '2021-08-06 03:59:48', '2021-08-06 03:59:48'),
(1893, '05-08-2021', '23:59:52', 'realizado', 15, '2021-08-06 03:59:52', '2021-08-06 03:59:52'),
(1894, '06-08-2021', '03:59:39', 'realizado', 15, '2021-08-06 07:59:39', '2021-08-06 07:59:39'),
(1895, '06-08-2021', '03:59:42', 'realizado', 15, '2021-08-06 07:59:42', '2021-08-06 07:59:42'),
(1896, '06-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1897, '06-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1898, '06-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1899, '06-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1900, '06-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1901, '06-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1902, '06-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1903, '06-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1904, '06-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1905, '06-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1906, '06-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1907, '06-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1908, '06-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1909, '06-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1910, '06-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1911, '06-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1912, '06-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1913, '06-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1914, '06-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1915, '06-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1916, '06-08-2021', '22:39:02', 'realizado', 15, '2021-08-07 02:39:02', '2021-08-07 02:39:02'),
(1917, '06-08-2021', '22:39:03', 'realizado', 15, '2021-08-07 02:39:03', '2021-08-07 02:39:03'),
(1918, '06-08-2021', '23:21:52', 'realizado', 15, '2021-08-07 03:21:52', '2021-08-07 03:21:52'),
(1919, '06-08-2021', '23:21:53', 'realizado', 15, '2021-08-07 03:21:53', '2021-08-07 03:21:53'),
(1920, '07-08-2021', '05:59:13', 'realizado', 15, '2021-08-07 09:59:13', '2021-08-07 09:59:13'),
(1921, '07-08-2021', '05:59:14', 'realizado', 15, '2021-08-07 09:59:14', '2021-08-07 09:59:14'),
(1922, '07-08-2021', '05:59:20', 'realizado', 15, '2021-08-07 09:59:20', '2021-08-07 09:59:20'),
(1923, '09-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1924, '09-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1925, '09-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1926, '09-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1927, '09-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1928, '09-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1929, '09-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1930, '09-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1931, '09-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1932, '09-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1933, '09-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1934, '09-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1935, '09-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1936, '09-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1937, '09-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1938, '09-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1939, '09-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1940, '09-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1941, '09-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1942, '09-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1943, '09-08-2021', '23:37:30', 'realizado', 15, '2021-08-10 03:37:30', '2021-08-10 03:37:30'),
(1944, '09-08-2021', '23:37:31', 'realizado', 15, '2021-08-10 03:37:31', '2021-08-10 03:37:31'),
(1945, '10-08-2021', '00:36:14', 'realizado', 15, '2021-08-10 04:36:14', '2021-08-10 04:36:14'),
(1946, '10-08-2021', '00:36:16', 'realizado', 15, '2021-08-10 04:36:16', '2021-08-10 04:36:16'),
(1947, '10-08-2021', '03:38:42', 'realizado', 15, '2021-08-10 07:38:42', '2021-08-10 07:38:42'),
(1948, '10-08-2021', '03:38:43', 'realizado', 15, '2021-08-10 07:38:43', '2021-08-10 07:38:43'),
(1949, '10-08-2021', '04:34:29', 'realizado', 15, '2021-08-10 08:34:29', '2021-08-10 08:34:29'),
(1950, '10-08-2021', '04:34:30', 'realizado', 15, '2021-08-10 08:34:30', '2021-08-10 08:34:30'),
(1951, '10-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1952, '10-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1953, '10-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1954, '10-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1955, '10-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1956, '10-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1957, '10-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1958, '10-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1959, '10-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1960, '10-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1961, '10-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1962, '10-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1963, '10-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1964, '10-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1965, '10-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1966, '10-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1967, '10-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1968, '10-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1969, '10-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1970, '10-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1971, '10-08-2021', '22:46:02', 'realizado', 15, '2021-08-11 02:46:02', '2021-08-11 02:46:02'),
(1972, '10-08-2021', '22:46:05', 'realizado', 15, '2021-08-11 02:46:05', '2021-08-11 02:46:05'),
(1973, '10-08-2021', '23:39:54', 'realizado', 15, '2021-08-11 03:39:54', '2021-08-11 03:39:54'),
(1974, '11-08-2021', '02:17:10', 'realizado', 15, '2021-08-11 06:17:10', '2021-08-11 06:17:10'),
(1975, '11-08-2021', '02:17:12', 'realizado', 15, '2021-08-11 06:17:12', '2021-08-11 06:17:12'),
(1976, '11-08-2021', '04:46:44', 'realizado', 15, '2021-08-11 08:46:44', '2021-08-11 08:46:44'),
(1977, '11-08-2021', '04:46:46', 'realizado', 15, '2021-08-11 08:46:46', '2021-08-11 08:46:46'),
(1978, '11-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1979, '11-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1980, '11-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1981, '11-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1982, '11-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1983, '11-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1984, '11-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1985, '11-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1986, '11-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1987, '11-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(1988, '11-08-2021', NULL, 'no realizado', 23, NULL, NULL),
(1989, '11-08-2021', NULL, 'no realizado', 24, NULL, NULL),
(1990, '11-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(1991, '11-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(1992, '11-08-2021', NULL, 'no realizado', 9, NULL, NULL),
(1993, '11-08-2021', NULL, 'no realizado', 10, NULL, NULL),
(1994, '11-08-2021', NULL, 'no realizado', 14, NULL, NULL),
(1995, '11-08-2021', NULL, 'no realizado', 15, NULL, NULL),
(1996, '11-08-2021', NULL, 'no realizado', 19, NULL, NULL),
(1997, '11-08-2021', NULL, 'no realizado', 20, NULL, NULL),
(1998, '11-08-2021', NULL, 'no realizado', 21, NULL, NULL),
(1999, '11-08-2021', NULL, 'no realizado', 22, NULL, NULL),
(2000, '11-08-2021', NULL, 'no realizado', 23, NULL, NULL),
(2001, '11-08-2021', NULL, 'no realizado', 24, NULL, NULL),
(2002, '11-08-2021', '23:41:42', 'realizado', 15, '2021-08-12 03:41:42', '2021-08-12 03:41:42'),
(2003, '11-08-2021', '23:41:44', 'realizado', 15, '2021-08-12 03:41:44', '2021-08-12 03:41:44'),
(2004, '12-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2005, '12-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2006, '12-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2007, '12-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2008, '12-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2009, '12-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2010, '12-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2011, '12-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2012, '13-08-2021', '04:40:32', 'realizado', 15, '2021-08-13 08:40:32', '2021-08-13 08:40:32'),
(2013, '13-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2014, '13-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2015, '13-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2016, '13-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2017, '13-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2018, '13-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2019, '13-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2020, '13-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2021, '13-08-2021', '23:05:02', 'realizado', 15, '2021-08-14 03:05:02', '2021-08-14 03:05:02'),
(2022, '13-08-2021', '23:05:02', 'realizado', 15, '2021-08-14 03:05:02', '2021-08-14 03:05:02'),
(2023, '14-08-2021', '02:33:58', 'realizado', 15, '2021-08-14 06:33:58', '2021-08-14 06:33:58'),
(2024, '14-08-2021', '02:33:59', 'realizado', 15, '2021-08-14 06:33:59', '2021-08-14 06:33:59'),
(2025, '14-08-2021', '04:40:49', 'realizado', 15, '2021-08-14 08:40:49', '2021-08-14 08:40:49'),
(2026, '14-08-2021', '04:40:50', 'realizado', 15, '2021-08-14 08:40:50', '2021-08-14 08:40:50'),
(2027, '16-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2028, '16-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2029, '16-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2030, '16-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2031, '16-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2032, '16-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2033, '16-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2034, '16-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2035, '17-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2036, '17-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2037, '17-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2038, '17-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2039, '17-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2040, '17-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2041, '17-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2042, '17-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2043, '17-08-2021', '22:48:32', 'realizado', 15, '2021-08-18 02:48:32', '2021-08-18 02:48:32'),
(2044, '17-08-2021', '22:48:34', 'realizado', 15, '2021-08-18 02:48:34', '2021-08-18 02:48:34'),
(2045, '17-08-2021', '23:42:53', 'realizado', 15, '2021-08-18 03:42:53', '2021-08-18 03:42:53'),
(2046, '17-08-2021', '23:42:54', 'realizado', 15, '2021-08-18 03:42:54', '2021-08-18 03:42:54'),
(2047, '18-08-2021', '05:58:59', 'realizado', 15, '2021-08-18 09:58:59', '2021-08-18 09:58:59'),
(2048, '18-08-2021', '05:59:00', 'realizado', 15, '2021-08-18 09:59:00', '2021-08-18 09:59:00'),
(2049, '18-08-2021', '05:59:00', 'realizado', 15, '2021-08-18 09:59:00', '2021-08-18 09:59:00'),
(2050, '18-08-2021', '05:59:00', 'realizado', 15, '2021-08-18 09:59:00', '2021-08-18 09:59:00'),
(2051, '18-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2052, '18-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2053, '18-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2054, '18-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2055, '18-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2056, '18-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2057, '18-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2058, '18-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2059, '18-08-2021', '23:54:37', 'realizado', 15, '2021-08-19 03:54:37', '2021-08-19 03:54:37'),
(2060, '18-08-2021', '23:54:39', 'realizado', 15, '2021-08-19 03:54:39', '2021-08-19 03:54:39'),
(2061, '19-08-2021', '04:38:30', 'realizado', 15, '2021-08-19 08:38:30', '2021-08-19 08:38:30'),
(2062, '19-08-2021', '04:38:31', 'realizado', 15, '2021-08-19 08:38:31', '2021-08-19 08:38:31'),
(2063, '19-08-2021', '05:40:47', 'realizado', 15, '2021-08-19 09:40:47', '2021-08-19 09:40:47'),
(2064, '19-08-2021', '05:40:48', 'realizado', 15, '2021-08-19 09:40:48', '2021-08-19 09:40:48'),
(2065, '19-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2066, '19-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2067, '19-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2068, '19-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2069, '19-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2070, '19-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2071, '19-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2072, '19-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2073, '19-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2074, '19-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2075, '20-08-2021', '00:46:40', 'realizado', 15, '2021-08-20 04:46:40', '2021-08-20 04:46:40'),
(2076, '20-08-2021', '00:46:41', 'realizado', 15, '2021-08-20 04:46:41', '2021-08-20 04:46:41'),
(2077, '20-08-2021', '03:06:47', 'realizado', 15, '2021-08-20 07:06:47', '2021-08-20 07:06:47'),
(2078, '20-08-2021', '03:06:48', 'realizado', 15, '2021-08-20 07:06:48', '2021-08-20 07:06:48'),
(2079, '20-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2080, '20-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2081, '20-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2082, '20-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2083, '20-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2084, '20-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2085, '20-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2086, '20-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2087, '20-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2088, '20-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2089, '20-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2090, '20-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2091, '20-08-2021', '22:18:37', 'realizado', 15, '2021-08-21 02:18:37', '2021-08-21 02:18:37'),
(2092, '20-08-2021', '22:18:39', 'realizado', 15, '2021-08-21 02:18:39', '2021-08-21 02:18:39'),
(2093, '20-08-2021', '23:28:25', 'realizado', 15, '2021-08-21 03:28:25', '2021-08-21 03:28:25'),
(2094, '20-08-2021', '23:28:26', 'realizado', 15, '2021-08-21 03:28:26', '2021-08-21 03:28:26'),
(2095, '21-08-2021', '05:54:54', 'realizado', 15, '2021-08-21 09:54:54', '2021-08-21 09:54:54'),
(2096, '21-08-2021', '05:54:57', 'realizado', 15, '2021-08-21 09:54:57', '2021-08-21 09:54:57'),
(2097, '23-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2098, '23-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2099, '23-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2100, '23-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2101, '23-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2102, '23-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2103, '23-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2104, '23-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2105, '23-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2106, '23-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2107, '23-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2108, '23-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2109, '23-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2110, '23-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2111, '24-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2112, '24-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2113, '24-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2114, '24-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2115, '24-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2116, '24-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2117, '24-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2118, '24-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2119, '24-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2120, '24-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2121, '24-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2122, '24-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2123, '24-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2124, '24-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2125, '24-08-2021', '22:46:07', 'realizado', 15, '2021-08-25 02:46:07', '2021-08-25 02:46:07'),
(2126, '24-08-2021', '22:46:08', 'realizado', 15, '2021-08-25 02:46:08', '2021-08-25 02:46:08'),
(2127, '25-08-2021', '00:05:51', 'realizado', 15, '2021-08-25 04:05:51', '2021-08-25 04:05:51'),
(2128, '25-08-2021', '00:05:51', 'realizado', 15, '2021-08-25 04:05:51', '2021-08-25 04:05:51'),
(2129, '25-08-2021', '04:35:41', 'realizado', 15, '2021-08-25 08:35:41', '2021-08-25 08:35:41'),
(2130, '25-08-2021', '04:35:47', 'realizado', 15, '2021-08-25 08:35:47', '2021-08-25 08:35:47'),
(2131, '25-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2132, '25-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2133, '25-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2134, '25-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2135, '25-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2136, '25-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2137, '25-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2138, '25-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2139, '25-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2140, '25-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2141, '25-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2142, '25-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2143, '25-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2144, '25-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2145, '26-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2146, '26-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2147, '26-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2148, '26-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2149, '26-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2150, '26-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2151, '26-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2152, '26-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2153, '26-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2154, '26-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2155, '26-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2156, '26-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2157, '26-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2158, '26-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2159, '27-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2160, '27-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2161, '27-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2162, '27-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2163, '27-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2164, '27-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2165, '27-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2166, '27-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2167, '27-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2168, '27-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2169, '27-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2170, '27-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2171, '27-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2172, '27-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2173, '30-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2174, '30-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2175, '30-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2176, '30-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2177, '30-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2178, '30-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2179, '30-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2180, '30-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2181, '30-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2182, '30-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2183, '30-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2184, '30-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2185, '30-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2186, '30-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2187, '31-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2188, '31-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2189, '31-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2190, '31-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2191, '31-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2192, '31-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2193, '31-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2194, '31-08-2021', NULL, 'no realizado', 2, NULL, NULL),
(2195, '31-08-2021', NULL, 'no realizado', 7, NULL, NULL),
(2196, '31-08-2021', NULL, 'no realizado', 26, NULL, NULL),
(2197, '31-08-2021', NULL, 'no realizado', 27, NULL, NULL),
(2198, '31-08-2021', NULL, 'no realizado', 28, NULL, NULL),
(2199, '31-08-2021', NULL, 'no realizado', 30, NULL, NULL),
(2200, '31-08-2021', NULL, 'no realizado', 31, NULL, NULL),
(2201, '01-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2202, '01-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2203, '01-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2204, '01-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2205, '01-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2206, '01-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2207, '01-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2208, '01-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2209, '01-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2210, '01-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2211, '01-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2212, '01-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2213, '01-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2214, '01-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2215, '02-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2216, '02-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2217, '02-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2218, '02-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2219, '02-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2220, '02-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2221, '02-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2222, '02-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2223, '02-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2224, '02-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2225, '02-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2226, '02-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2227, '02-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2228, '02-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2229, '03-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2230, '03-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2231, '03-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2232, '03-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2233, '03-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2234, '03-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2235, '03-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2236, '03-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2237, '03-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2238, '03-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2239, '03-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2240, '03-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2241, '03-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2242, '03-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2243, '06-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2244, '06-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2245, '06-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2246, '06-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2247, '06-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2248, '06-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2249, '06-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2250, '06-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2251, '06-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2252, '06-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2253, '06-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2254, '06-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2255, '06-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2256, '06-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2257, '06-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2258, '06-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2259, '07-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2260, '07-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2261, '07-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2262, '07-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2263, '07-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2264, '07-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2265, '07-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2266, '07-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2267, '07-09-2021', '22:44:41', 'realizado', 33, NULL, '2021-09-08 01:44:41'),
(2268, '07-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2269, '07-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2270, '07-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2271, '07-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2272, '07-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2273, '07-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2274, '07-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2275, '07-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2276, '07-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2277, '07-09-2021', '22:22:46', 'realizado', 33, '2021-09-08 01:22:46', '2021-09-08 01:22:46'),
(2278, '07-09-2021', '22:23:07', 'realizado', 33, '2021-09-08 01:23:07', '2021-09-08 01:23:07'),
(2279, '07-09-2021', '22:23:08', 'realizado', 33, '2021-09-08 01:23:08', '2021-09-08 01:23:08'),
(2280, '08-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2281, '08-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2282, '08-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2283, '08-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2284, '08-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2285, '08-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2286, '08-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2287, '08-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2288, '08-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2289, '08-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2290, '08-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2291, '08-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2292, '08-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2293, '08-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2294, '08-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2295, '08-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2296, '08-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2297, '08-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2298, '09-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2299, '09-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2300, '09-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2301, '09-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2302, '09-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2303, '09-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2304, '09-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2305, '09-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2306, '09-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2307, '09-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2308, '09-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2309, '09-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2310, '09-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2311, '09-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2312, '09-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2313, '09-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2314, '09-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2315, '09-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2316, '10-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2317, '10-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2318, '10-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2319, '10-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2320, '10-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2321, '10-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2322, '10-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2323, '10-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2324, '10-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2325, '10-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2326, '10-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2327, '10-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2328, '10-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2329, '10-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2330, '10-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2331, '10-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2332, '10-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2333, '10-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2334, '11-09-2021', '00:00:18', 'realizado', 15, '2021-09-11 03:00:18', '2021-09-11 03:00:18'),
(2335, '11-09-2021', '00:00:20', 'realizado', 15, '2021-09-11 03:00:20', '2021-09-11 03:00:20'),
(2336, '11-09-2021', '03:35:36', 'realizado', 15, '2021-09-11 06:35:36', '2021-09-11 06:35:36'),
(2337, '11-09-2021', '03:35:36', 'realizado', 15, '2021-09-11 06:35:36', '2021-09-11 06:35:36'),
(2338, '11-09-2021', '04:43:19', 'realizado', 15, '2021-09-11 07:43:19', '2021-09-11 07:43:19'),
(2339, '11-09-2021', '04:43:24', 'realizado', 15, '2021-09-11 07:43:24', '2021-09-11 07:43:24'),
(2340, '11-09-2021', '07:52:18', 'realizado', 15, '2021-09-11 10:52:18', '2021-09-11 10:52:18'),
(2341, '11-09-2021', '07:52:23', 'realizado', 15, '2021-09-11 10:52:23', '2021-09-11 10:52:23'),
(2342, '13-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2343, '13-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2344, '13-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2345, '13-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2346, '13-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2347, '13-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2348, '13-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2349, '13-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2350, '13-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2351, '13-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2352, '13-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2353, '13-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2354, '13-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2355, '13-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2356, '13-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2357, '13-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2358, '13-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2359, '13-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2360, '14-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2361, '14-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2362, '14-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2363, '14-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2364, '14-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2365, '14-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2366, '14-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2367, '14-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2368, '14-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2369, '14-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2370, '14-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2371, '14-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2372, '14-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2373, '14-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2374, '14-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2375, '14-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2376, '14-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2377, '14-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2378, '14-09-2021', '23:41:31', 'realizado', 15, '2021-09-15 02:41:31', '2021-09-15 02:41:31'),
(2379, '14-09-2021', '23:41:32', 'realizado', 15, '2021-09-15 02:41:32', '2021-09-15 02:41:32'),
(2380, '15-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2381, '15-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2382, '15-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2383, '15-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2384, '15-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2385, '15-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2386, '15-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2387, '15-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2388, '15-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2389, '15-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2390, '15-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2391, '15-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2392, '15-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2393, '15-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2394, '15-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2395, '15-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2396, '15-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2397, '15-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2398, '16-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2399, '16-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2400, '16-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2401, '16-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2402, '16-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2403, '16-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2404, '16-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2405, '16-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2406, '16-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2407, '16-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2408, '16-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2409, '16-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2410, '16-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2411, '16-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2412, '16-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2413, '16-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2414, '16-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2415, '16-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2416, '17-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2417, '17-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2418, '17-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2419, '17-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2420, '17-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2421, '17-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2422, '17-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2423, '17-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2424, '17-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2425, '17-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2426, '17-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2427, '17-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2428, '17-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2429, '17-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2430, '17-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2431, '17-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2432, '17-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2433, '17-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2434, '20-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2435, '20-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2436, '20-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2437, '20-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2438, '20-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2439, '20-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2440, '20-09-2021', NULL, 'no realizado', 31, NULL, NULL);
INSERT INTO `sanitizacion` (`id`, `date`, `hora`, `status`, `id_postulante`, `created_at`, `updated_at`) VALUES
(2441, '20-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2442, '20-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2443, '20-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2444, '20-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2445, '20-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2446, '20-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2447, '20-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2448, '20-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2449, '20-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2450, '20-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2451, '20-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2452, '20-09-2021', '23:42:24', 'realizado', 15, '2021-09-21 02:42:24', '2021-09-21 02:42:24'),
(2453, '20-09-2021', '23:42:26', 'realizado', 15, '2021-09-21 02:42:26', '2021-09-21 02:42:26'),
(2454, '21-09-2021', '02:07:47', 'realizado', 15, '2021-09-21 05:07:47', '2021-09-21 05:07:47'),
(2455, '21-09-2021', '02:07:48', 'realizado', 15, '2021-09-21 05:07:48', '2021-09-21 05:07:48'),
(2456, '21-09-2021', '03:28:00', 'realizado', 15, '2021-09-21 06:28:00', '2021-09-21 06:28:00'),
(2457, '21-09-2021', '03:28:02', 'realizado', 15, '2021-09-21 06:28:02', '2021-09-21 06:28:02'),
(2458, '21-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2459, '21-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2460, '21-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2461, '21-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2462, '21-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2463, '21-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2464, '21-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2465, '21-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2466, '21-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2467, '21-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2468, '21-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2469, '21-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2470, '21-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2471, '21-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2472, '21-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2473, '21-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2474, '21-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2475, '21-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2476, '21-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2477, '21-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2478, '21-09-2021', '22:50:35', 'realizado', 15, '2021-09-22 01:50:35', '2021-09-22 01:50:35'),
(2479, '21-09-2021', '22:50:36', 'realizado', 15, '2021-09-22 01:50:36', '2021-09-22 01:50:36'),
(2480, '21-09-2021', '23:33:12', 'realizado', 15, '2021-09-22 02:33:12', '2021-09-22 02:33:12'),
(2481, '21-09-2021', '23:33:13', 'realizado', 15, '2021-09-22 02:33:13', '2021-09-22 02:33:13'),
(2482, '22-09-2021', '02:50:55', 'realizado', 15, '2021-09-22 05:50:55', '2021-09-22 05:50:55'),
(2483, '22-09-2021', '02:50:58', 'realizado', 15, '2021-09-22 05:50:58', '2021-09-22 05:50:58'),
(2484, '22-09-2021', '03:58:00', 'realizado', 15, '2021-09-22 06:58:00', '2021-09-22 06:58:00'),
(2485, '22-09-2021', '03:58:01', 'realizado', 15, '2021-09-22 06:58:01', '2021-09-22 06:58:01'),
(2486, '22-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2487, '22-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2488, '22-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2489, '22-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2490, '22-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2491, '22-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2492, '22-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2493, '22-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2494, '22-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2495, '22-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2496, '22-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2497, '22-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2498, '22-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2499, '22-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2500, '22-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2501, '22-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2502, '22-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2503, '22-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2504, '22-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2505, '22-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2506, '23-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2507, '23-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2508, '23-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2509, '23-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2510, '23-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2511, '23-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2512, '23-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2513, '23-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2514, '23-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2515, '23-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2516, '23-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2517, '23-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2518, '23-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2519, '23-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2520, '23-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2521, '23-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2522, '23-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2523, '23-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2524, '23-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2525, '23-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2526, '24-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2527, '24-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2528, '24-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2529, '24-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2530, '24-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2531, '24-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2532, '24-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2533, '24-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2534, '24-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2535, '24-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2536, '24-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2537, '24-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2538, '24-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2539, '24-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2540, '24-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2541, '24-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2542, '24-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2543, '24-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2544, '24-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2545, '24-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2546, '27-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2547, '27-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2548, '27-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2549, '27-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2550, '27-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2551, '27-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2552, '27-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2553, '27-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2554, '27-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2555, '27-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2556, '27-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2557, '27-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2558, '27-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2559, '27-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2560, '27-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2561, '27-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2562, '27-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2563, '27-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2564, '27-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2565, '27-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2566, '28-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2567, '28-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2568, '28-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2569, '28-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2570, '28-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2571, '28-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2572, '28-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2573, '28-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2574, '28-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2575, '28-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2576, '28-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2577, '28-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2578, '28-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2579, '28-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2580, '28-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2581, '28-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2582, '28-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2583, '28-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2584, '28-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2585, '28-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2586, '29-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2587, '29-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2588, '29-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2589, '29-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2590, '29-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2591, '29-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2592, '29-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2593, '29-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2594, '29-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2595, '29-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2596, '29-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2597, '29-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2598, '29-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2599, '29-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2600, '29-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2601, '29-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2602, '29-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2603, '29-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2604, '29-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2605, '29-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2606, '30-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2607, '30-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2608, '30-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2609, '30-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2610, '30-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2611, '30-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2612, '30-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2613, '30-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2614, '30-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2615, '30-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2616, '30-09-2021', NULL, 'no realizado', 2, NULL, NULL),
(2617, '30-09-2021', NULL, 'no realizado', 7, NULL, NULL),
(2618, '30-09-2021', NULL, 'no realizado', 26, NULL, NULL),
(2619, '30-09-2021', NULL, 'no realizado', 27, NULL, NULL),
(2620, '30-09-2021', NULL, 'no realizado', 28, NULL, NULL),
(2621, '30-09-2021', NULL, 'no realizado', 30, NULL, NULL),
(2622, '30-09-2021', NULL, 'no realizado', 31, NULL, NULL),
(2623, '30-09-2021', NULL, 'no realizado', 32, NULL, NULL),
(2624, '30-09-2021', NULL, 'no realizado', 33, NULL, NULL),
(2625, '30-09-2021', NULL, 'no realizado', 35, NULL, NULL),
(2626, '01-10-2021', NULL, 'no realizado', 2, NULL, NULL),
(2627, '01-10-2021', NULL, 'no realizado', 7, NULL, NULL),
(2628, '01-10-2021', NULL, 'no realizado', 26, NULL, NULL),
(2629, '01-10-2021', NULL, 'no realizado', 27, NULL, NULL),
(2630, '01-10-2021', NULL, 'no realizado', 28, NULL, NULL),
(2631, '01-10-2021', NULL, 'no realizado', 30, NULL, NULL),
(2632, '01-10-2021', NULL, 'no realizado', 31, NULL, NULL),
(2633, '01-10-2021', NULL, 'no realizado', 32, NULL, NULL),
(2634, '01-10-2021', NULL, 'no realizado', 33, NULL, NULL),
(2635, '01-10-2021', NULL, 'no realizado', 35, NULL, NULL),
(2636, '01-10-2021', NULL, 'no realizado', 2, NULL, NULL),
(2637, '01-10-2021', NULL, 'no realizado', 7, NULL, NULL),
(2638, '01-10-2021', NULL, 'no realizado', 26, NULL, NULL),
(2639, '01-10-2021', NULL, 'no realizado', 27, NULL, NULL),
(2640, '01-10-2021', NULL, 'no realizado', 28, NULL, NULL),
(2641, '01-10-2021', NULL, 'no realizado', 30, NULL, NULL),
(2642, '01-10-2021', NULL, 'no realizado', 31, NULL, NULL),
(2643, '01-10-2021', NULL, 'no realizado', 32, NULL, NULL),
(2644, '01-10-2021', NULL, 'no realizado', 33, NULL, NULL),
(2645, '01-10-2021', NULL, 'no realizado', 35, NULL, NULL),
(2646, '04-10-2021', NULL, 'no realizado', 2, NULL, NULL),
(2647, '04-10-2021', NULL, 'no realizado', 7, NULL, NULL),
(2648, '04-10-2021', NULL, 'no realizado', 26, NULL, NULL),
(2649, '04-10-2021', NULL, 'no realizado', 27, NULL, NULL),
(2650, '04-10-2021', NULL, 'no realizado', 28, NULL, NULL),
(2651, '04-10-2021', NULL, 'no realizado', 30, NULL, NULL),
(2652, '04-10-2021', NULL, 'no realizado', 31, NULL, NULL),
(2653, '04-10-2021', NULL, 'no realizado', 32, NULL, NULL),
(2654, '04-10-2021', NULL, 'no realizado', 33, NULL, NULL),
(2655, '04-10-2021', NULL, 'no realizado', 35, NULL, NULL),
(2656, '04-10-2021', NULL, 'no realizado', 2, NULL, NULL),
(2657, '04-10-2021', NULL, 'no realizado', 7, NULL, NULL),
(2658, '04-10-2021', NULL, 'no realizado', 26, NULL, NULL),
(2659, '04-10-2021', NULL, 'no realizado', 27, NULL, NULL),
(2660, '04-10-2021', NULL, 'no realizado', 28, NULL, NULL),
(2661, '04-10-2021', NULL, 'no realizado', 30, NULL, NULL),
(2662, '04-10-2021', NULL, 'no realizado', 31, NULL, NULL),
(2663, '04-10-2021', NULL, 'no realizado', 32, NULL, NULL),
(2664, '04-10-2021', NULL, 'no realizado', 33, NULL, NULL),
(2665, '04-10-2021', NULL, 'no realizado', 35, NULL, NULL),
(2666, '05-10-2021', '01:00:53', 'realizado', 15, '2021-10-05 04:00:53', '2021-10-05 04:00:53'),
(2667, '05-10-2021', '01:00:54', 'realizado', 15, '2021-10-05 04:00:54', '2021-10-05 04:00:54'),
(2668, '05-10-2021', NULL, 'no realizado', 2, NULL, NULL),
(2669, '05-10-2021', NULL, 'no realizado', 7, NULL, NULL),
(2670, '05-10-2021', NULL, 'no realizado', 26, NULL, NULL),
(2671, '05-10-2021', NULL, 'no realizado', 27, NULL, NULL),
(2672, '05-10-2021', NULL, 'no realizado', 28, NULL, NULL),
(2673, '05-10-2021', NULL, 'no realizado', 30, NULL, NULL),
(2674, '05-10-2021', NULL, 'no realizado', 31, NULL, NULL),
(2675, '05-10-2021', NULL, 'no realizado', 32, NULL, NULL),
(2676, '05-10-2021', NULL, 'no realizado', 33, NULL, NULL),
(2677, '05-10-2021', NULL, 'no realizado', 35, NULL, NULL),
(2678, '05-10-2021', NULL, 'no realizado', 2, NULL, NULL),
(2679, '05-10-2021', NULL, 'no realizado', 7, NULL, NULL),
(2680, '05-10-2021', NULL, 'no realizado', 26, NULL, NULL),
(2681, '05-10-2021', NULL, 'no realizado', 27, NULL, NULL),
(2682, '05-10-2021', NULL, 'no realizado', 28, NULL, NULL),
(2683, '05-10-2021', NULL, 'no realizado', 30, NULL, NULL),
(2684, '05-10-2021', NULL, 'no realizado', 31, NULL, NULL),
(2685, '05-10-2021', NULL, 'no realizado', 32, NULL, NULL),
(2686, '05-10-2021', NULL, 'no realizado', 33, NULL, NULL),
(2687, '05-10-2021', NULL, 'no realizado', 35, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento_mantencion`
--

CREATE TABLE `seguimiento_mantencion` (
  `id` int(11) NOT NULL,
  `e_taller` tinyint(1) NOT NULL,
  `e_vehiculo` tinyint(1) NOT NULL,
  `i_taller` tinyint(1) NOT NULL,
  `r_conductor` tinyint(1) NOT NULL,
  `id_mantencion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seguro`
--

INSERT INTO `seguro` (`id`, `date`, `date_end`, `name`, `id_postulante`) VALUES
(3, '2021-01-20 00:00:00', '2021-01-28 00:00:00', 'Solemne III beginner.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_entrevista`
--

CREATE TABLE `status_entrevista` (
  `id` int(11) NOT NULL,
  `id_entrevista` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `status_entrevista`
--

INSERT INTO `status_entrevista` (`id`, `id_entrevista`) VALUES
(1, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_entrevista_telefonica`
--

CREATE TABLE `status_entrevista_telefonica` (
  `id` int(11) NOT NULL,
  `id_entrevista` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `status_entrevista_telefonica`
--

INSERT INTO `status_entrevista_telefonica` (`id`, `id_entrevista`) VALUES
(1, 16),
(2, 20),
(3, 29),
(4, 29),
(5, 29),
(6, 29),
(7, 31),
(8, 31),
(9, 31),
(10, 31),
(11, 31),
(12, 31),
(13, 30),
(14, 32),
(15, 33),
(16, 34),
(17, 36),
(18, 37),
(19, 38),
(20, 39),
(21, 40),
(22, 40),
(23, 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcita_presencial`
--

CREATE TABLE `tblcita_presencial` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `email` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `comentario` text NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcita_telefonica`
--

CREATE TABLE `tblcita_telefonica` (
  `Id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `time` time NOT NULL,
  `email` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `comentario` text NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblcita_telefonica`
--

INSERT INTO `tblcita_telefonica` (`Id`, `fecha`, `time`, `email`, `link`, `id_postulante`, `status`, `comentario`, `start_date`) VALUES
(37, '2021-08-19', '12:00:00', 'felipesepulveda6976@gmail.com', 'FormatoDisc', 139, 'calificado', 'Turno de ingreso por confirmar - inducción coordina para el dia sábado 21 de Agosto ', '2021-08-23'),
(38, '2021-08-20', '18:00:00', 'danielitogomezrubio1967@gmail.com', 'FormatoDisc', 140, 'calificado', 'debe terminar de proporcionar documentos para creacion de ficha', '2021-08-23'),
(39, '2021-09-02', '18:50:00', 'Oramirez2872@gmail.com', 'FormatoDisc', 141, 'calificado', '', '2021-08-06'),
(40, '2021-09-06', '18:30:00', 'Jorge.parra30@gmail.com', 'FormatoDisc', 142, 'calificado', '', '2021-09-07'),
(41, '2021-09-20', '19:00:00', 'charrier_27@hotmail.com', 'FormatoDisc', 143, 'calificado', '', '2021-09-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_postulante`
--

CREATE TABLE `tbl_postulante` (
  `id` int(11) NOT NULL,
  `name` varchar(244) NOT NULL,
  `lastname` varchar(244) NOT NULL,
  `rut` varchar(244) NOT NULL,
  `date_born` date NOT NULL,
  `genere` varchar(244) NOT NULL,
  `email` varchar(244) NOT NULL,
  `address` varchar(244) NOT NULL,
  `phone` varchar(244) NOT NULL,
  `country` varchar(244) NOT NULL,
  `city` varchar(244) NOT NULL,
  `date_today` date NOT NULL,
  `sr` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_postulante`
--

INSERT INTO `tbl_postulante` (`id`, `name`, `lastname`, `rut`, `date_born`, `genere`, `email`, `address`, `phone`, `country`, `city`, `date_today`, `sr`) VALUES
(21, 'Rafael', 'Era', '44.231.918-9', '2020-09-08', '0', 'jose@email.com', 'eleuterio ramirez 1291', '999999', 'Ecuador', 'santiago centro', '2020-09-08', 'Jose Era'),
(22, 'rafael', 'era', '44.231.918-9', '2020-09-08', '0', 'jorfgfe@gmail.com', 'eleuterio ramirez 1291', '+351961621531', '0', 'santiago centro', '2020-09-08', 'Jose Era');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `date_end` date NOT NULL,
  `title_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `test`
--

INSERT INTO `test` (`id`, `title`, `description`, `date`, `date_end`, `title_file`) VALUES
(23, 'tesitingJose', 'This04012021', '2021-01-04', '2021-01-05', ''),
(24, 'test2', 'testing', '2021-01-05', '2021-01-14', ''),
(25, 'PRUEBA', 'PRUEBA', '2021-05-27', '2021-05-27', ''),
(26, 'TEST', 'EXAMEN CONDUCIR', '2021-09-01', '2023-12-01', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test_achs`
--

CREATE TABLE `test_achs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `date_end` date NOT NULL,
  `title_file` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `precio` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test_postulante`
--

CREATE TABLE `test_postulante` (
  `Id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `id_test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(13, 'admin', 'admin@gmail.com', '$2y$10$kDLh6KcD42S1HJsbMt5MheyYHm70Rzv7.vDPnqThmn9f2Z8mOA6mK'),
(14, 'admin', 'admin@mail.com', '$2y$10$13dFs/bmyEhb71k1hzz95.S6AcTP1Qd4FUMfA9n8M2G9HEg1gfDNC'),
(19, '10521657-2', 'bloquera2@gmail.com', '$2y$10$zZsZaQQDXWZgwxr30oHejuRD5HKzJQx7HD3hNCKsX9.hf0qHaRjHq'),
(20, 'Maria', 'maria@mail.com', '$2y$10$ouvQqpGA4JXmydAoMML4/em/WzfYvPRNgKi9m4YYTwE6R3d8.PFGy'),
(26, 'Jorge Rodolfo Edmundo Lopez Figueroa', 'claudio.alarcon.gutierrez@gmail.com', '$2y$10$OomX2bHO18LdXwNJ6B6WPOv.klF2y0PM583fipBOv1kJu9xk.b7Cu'),
(27, 'Marcela Andrea Calderon Gonzalez', 'marcela.macg1982@gmail.com', '$2y$10$AQ2MV/n6vgeazS9KFSP7kueLYnWDmcIoxwdCJn8Sj4LAE6bp0IaNC'),
(32, 'Jose Era', 'jorfgfe@gmail.com', '$2y$10$JJR072ayVrJncR6uziObH.exzjLk7ghUkL0tbez61cXrCw2Tys.l6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`, `rut`, `id_postulante`) VALUES
(2, 'admin', 'admin@mail.com', NULL, '$2y$10$PGa6rBcA.j5q99Wwf4KDz.6sWvLgORUhgIGE6AKecNKoFXOZwPui2', NULL, NULL, NULL, '2021-02-18 05:41:42', '2021-02-18 05:41:42', '1345678-8', 0),
(7, 'Jose Era', 'jorfgfe@gmail.com', NULL, '$2y$10$x67ynH.UB.5PWYbsuagwfOq1SC72bNi4HnKBaAs.nhJapiyxcmS2u', NULL, NULL, '4d8OisofXxV4WpN6TSjlNxc2cSWkjJExZGoZbVJlMrq3S5AHjRU1enH5f2g2', NULL, '2021-08-26 19:24:55', '27454293-4', 122),
(26, 'MARIA JOSE SILVA MORALES', 'maria.silva.morales@gmail.com', NULL, '$2y$10$nefbD/fmJpvTjg0rSEnVJuSTgXAKFj0K11DFlgbCV4sezMSFqRFGu', NULL, NULL, NULL, NULL, NULL, '17546221-k', 91),
(27, 'MANUEL ALFARO URZUA ARIAS', 'murzua1964@gmail.com', NULL, '$2y$10$ksfSZ5c7TEGJonuWZ6dKEeWWqcJfS/OUFsLz/aee27UmzmWI6XC7.', NULL, NULL, NULL, NULL, NULL, '09037531-8', 92),
(28, 'Prueba Prueba Prueba', 'claudio.alarcon.gutierrez@gmail.com', NULL, '$2y$10$esjc7c5Jw/gHr59NiIU0peRkAsZhmBWyAy5D1L7B6W/QRkQGHLLK.', NULL, NULL, NULL, NULL, NULL, '12345677-3', 137),
(30, 'Felipe Gerardo Sepulveda Pizarro', 'Felipesepulveda6976@gmail.com', NULL, '$2y$10$QJT7J8rSldZ1pN7ubDlmMeX1PcWIgziZZevajPLz.W7QVrrkmz716', NULL, NULL, NULL, NULL, NULL, '14143984-7', 139),
(31, 'Daniel Alejandro Gomez Rubio', 'danielitogomezrubio1967@gmail.com', NULL, '$2y$10$kTB8U5EbyoHQWKcbZr5IwOyZGvIj4dx9svxYKNnQpNfcRMdgdiS02', NULL, NULL, 'uBuvPomzjqojQKeWjOhTmNeMzIdbaI25zTrh6XEDAb2RdrAFOeyBct2hxGC1', NULL, NULL, '10799992-2', 140),
(32, 'Orlando Patricio  Ramirez Torrez', 'Oramirez2872@gmail.com', NULL, '$2y$10$JyDpLmtbHgwaCv.1WkVqEuc2qncGAFRQv6U73dCsRUAQGV36qF3i2', NULL, NULL, 'iDr6vVb3RIl8YRwr3PQsNhJPntVtcB764CaO0jMTFQGreHw4DvyNKqsLjHmK', NULL, NULL, '12287559-8', 141),
(33, 'Jorge Isidro  Parra Acevedo', 'Jorge.parra30@gmail.com', NULL, '$2y$10$aqtT4Ti5lZJKeQKVZB5Hkutx0QyZn935X46tjepri/0BtsDkWkT.W', NULL, NULL, NULL, NULL, NULL, '10462633-5', 142),
(35, 'Peter Aland Charrier MuÑoz', 'charrier_27@hotmail.com', NULL, '$2y$10$V2pZoStMdvHxBuaDQ/SoVOxihis0KZabJ.wRhJwCMGXl6QYTcVwlm', NULL, NULL, NULL, NULL, NULL, '16655929-4', 143);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_factor`
--

CREATE TABLE `user_factor` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_factor`
--

INSERT INTO `user_factor` (`id`, `id_user`, `token`, `created_at`) VALUES
(1, 1, '5403d61cd192d0681b709c73acf39ccc1080825af819b1db4f7d7f32639f1820ce0c75bdff1f99db', '2020-09-10 22:48:55'),
(2, 3, '43a45814835e9d020d4f7f20de4563dc916491a594972625f567c36d2fc8462be9997b36c6103f4e', '2020-09-10 22:50:36'),
(3, 4, '5196e88caf159cec3e4426abe1d500b0437e1b0362bdfd36928b0478d85f65a96e45d6796cff8218', '2020-09-11 00:53:43'),
(4, 4, '78101e4c7719872d10b2fce7f86eb72354ac95a7aa4eabb6b922474292824ee3155bb64a774dde57', '2020-09-11 00:58:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_test`
--

CREATE TABLE `usuario_test` (
  `id` int(11) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_postulante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validacion_persona`
--

CREATE TABLE `validacion_persona` (
  `id` int(11) NOT NULL,
  `id_vinculacion` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `nvehiculo` varchar(255) NOT NULL,
  `nplaca` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `año` date NOT NULL,
  `color` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id`, `nvehiculo`, `nplaca`, `modelo`, `año`, `color`, `marca`) VALUES
(3, 'mercedes', '123456', 'mercedes', '2021-06-01', 'azul', 'mercedes'),
(7, 'bmw', '13455', 'bmw', '2021-06-02', 'blanco', 'bmw'),
(8, 'ferrari', '999864', 'ferrari', '2021-06-09', 'rojo', 'ferrari');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vinculacion`
--

CREATE TABLE `vinculacion` (
  `id` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vincular_personal`
--

CREATE TABLE `vincular_personal` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) NOT NULL,
  `hora` varchar(255) NOT NULL,
  `trato` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `fecha_incio` date NOT NULL,
  `fecha_cierre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vincular_personal`
--

INSERT INTO `vincular_personal` (`id`, `id_postulante`, `hora`, `trato`, `file`, `status`, `fecha_incio`, `fecha_cierre`) VALUES
(2, 15, '20Hrs', 'boleta', 'Configuracion_Servidores_Linux-20151203-D.pdf', 'Firmado', '2020-10-22', '2020-11-07'),
(3, 18, '20Hrs', 'fijo', '04_Formulario_DIAT.pdf', 'Pendiente', '2020-10-31', '2020-10-30'),
(4, 15, '20Hrs', 'boleta', 'test.jpg', 'Pendiente', '2020-11-19', '2020-11-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accidente`
--
ALTER TABLE `accidente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caja_compesacion`
--
ALTER TABLE `caja_compesacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargo_postular`
--
ALTER TABLE `cargo_postular`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cc_vinculacion`
--
ALTER TABLE `cc_vinculacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios_entrevista`
--
ALTER TABLE `comentarios_entrevista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios_entrevista_telefonica`
--
ALTER TABLE `comentarios_entrevista_telefonica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunicados`
--
ALTER TABLE `comunicados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_hora`
--
ALTER TABLE `control_hora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `control_temp`
--
ALTER TABLE `control_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `convenio`
--
ALTER TABLE `convenio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `desvincular`
--
ALTER TABLE `desvincular`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentaria`
--
ALTER TABLE `documentaria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examen_extra`
--
ALTER TABLE `examen_extra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_examen` (`id_examen`),
  ADD KEY `cargo_examen` (`cargo_examen`);

--
-- Indices de la tabla `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `files_achs`
--
ALTER TABLE `files_achs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `formatodisc`
--
ALTER TABLE `formatodisc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `inductivo`
--
ALTER TABLE `inductivo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inductivo_resultado`
--
ALTER TABLE `inductivo_resultado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `informativo`
--
ALTER TABLE `informativo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `informativo_resultado`
--
ALTER TABLE `informativo_resultado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `limpieza`
--
ALTER TABLE `limpieza`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mantencion_siniestro`
--
ALTER TABLE `mantencion_siniestro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `monestacion`
--
ALTER TABLE `monestacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `postulante`
--
ALTER TABLE `postulante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `privileges_modulos`
--
ALTER TABLE `privileges_modulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_test` (`id_test`);

--
-- Indices de la tabla `question2`
--
ALTER TABLE `question2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_test` (`id_test`);

--
-- Indices de la tabla `sanitizacion`
--
ALTER TABLE `sanitizacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seguimiento_mantencion`
--
ALTER TABLE `seguimiento_mantencion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mantencion` (`id_mantencion`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `status_entrevista`
--
ALTER TABLE `status_entrevista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status_entrevista_telefonica`
--
ALTER TABLE `status_entrevista_telefonica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblcita_presencial`
--
ALTER TABLE `tblcita_presencial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante_2` (`id_postulante`);

--
-- Indices de la tabla `tblcita_telefonica`
--
ALTER TABLE `tblcita_telefonica`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `tbl_postulante`
--
ALTER TABLE `tbl_postulante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `test_achs`
--
ALTER TABLE `test_achs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `test_postulante`
--
ALTER TABLE `test_postulante`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_postulante` (`id_postulante`),
  ADD KEY `id_test` (`id_test`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_rut_unique` (`rut`),
  ADD KEY `id_postulante` (`id_postulante`),
  ADD KEY `id_postulante_2` (`id_postulante`);

--
-- Indices de la tabla `user_factor`
--
ALTER TABLE `user_factor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_test`
--
ALTER TABLE `usuario_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `validacion_persona`
--
ALTER TABLE `validacion_persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_vinculacion` (`id_vinculacion`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`,`nplaca`);

--
-- Indices de la tabla `vinculacion`
--
ALTER TABLE `vinculacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vincular_personal`
--
ALTER TABLE `vincular_personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accidente`
--
ALTER TABLE `accidente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `caja_compesacion`
--
ALTER TABLE `caja_compesacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cargo_postular`
--
ALTER TABLE `cargo_postular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `cc_vinculacion`
--
ALTER TABLE `cc_vinculacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comentarios_entrevista`
--
ALTER TABLE `comentarios_entrevista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comentarios_entrevista_telefonica`
--
ALTER TABLE `comentarios_entrevista_telefonica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `comunicados`
--
ALTER TABLE `comunicados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `control_hora`
--
ALTER TABLE `control_hora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `control_temp`
--
ALTER TABLE `control_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2437;

--
-- AUTO_INCREMENT de la tabla `convenio`
--
ALTER TABLE `convenio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `desvincular`
--
ALTER TABLE `desvincular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `documentaria`
--
ALTER TABLE `documentaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `examen_extra`
--
ALTER TABLE `examen_extra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `files_achs`
--
ALTER TABLE `files_achs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `formatodisc`
--
ALTER TABLE `formatodisc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `inductivo`
--
ALTER TABLE `inductivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `inductivo_resultado`
--
ALTER TABLE `inductivo_resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `informativo`
--
ALTER TABLE `informativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `informativo_resultado`
--
ALTER TABLE `informativo_resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `limpieza`
--
ALTER TABLE `limpieza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de la tabla `mantencion_siniestro`
--
ALTER TABLE `mantencion_siniestro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `monestacion`
--
ALTER TABLE `monestacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `postulante`
--
ALTER TABLE `postulante`
  MODIFY `id` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `privileges_modulos`
--
ALTER TABLE `privileges_modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `question2`
--
ALTER TABLE `question2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sanitizacion`
--
ALTER TABLE `sanitizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2688;

--
-- AUTO_INCREMENT de la tabla `seguimiento_mantencion`
--
ALTER TABLE `seguimiento_mantencion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `status_entrevista`
--
ALTER TABLE `status_entrevista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `status_entrevista_telefonica`
--
ALTER TABLE `status_entrevista_telefonica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tblcita_presencial`
--
ALTER TABLE `tblcita_presencial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `tblcita_telefonica`
--
ALTER TABLE `tblcita_telefonica`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `tbl_postulante`
--
ALTER TABLE `tbl_postulante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `test_achs`
--
ALTER TABLE `test_achs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `test_postulante`
--
ALTER TABLE `test_postulante`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `user_factor`
--
ALTER TABLE `user_factor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario_test`
--
ALTER TABLE `usuario_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `validacion_persona`
--
ALTER TABLE `validacion_persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `vinculacion`
--
ALTER TABLE `vinculacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vincular_personal`
--
ALTER TABLE `vincular_personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documentaria`
--
ALTER TABLE `documentaria`
  ADD CONSTRAINT `documentaria_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`);

--
-- Filtros para la tabla `examen_extra`
--
ALTER TABLE `examen_extra`
  ADD CONSTRAINT `examen_extra_ibfk_1` FOREIGN KEY (`id_examen`) REFERENCES `examenes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mantencion_siniestro`
--
ALTER TABLE `mantencion_siniestro`
  ADD CONSTRAINT `mantencion_siniestro_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `privileges_modulos`
--
ALTER TABLE `privileges_modulos`
  ADD CONSTRAINT `privileges_modulos_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `privileges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seguimiento_mantencion`
--
ALTER TABLE `seguimiento_mantencion`
  ADD CONSTRAINT `seguimiento_mantencion_ibfk_1` FOREIGN KEY (`id_mantencion`) REFERENCES `mantencion_siniestro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblcita_presencial`
--
ALTER TABLE `tblcita_presencial`
  ADD CONSTRAINT `tblcita_presencial_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblcita_telefonica`
--
ALTER TABLE `tblcita_telefonica`
  ADD CONSTRAINT `tblcita_telefonica_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `test_achs`
--
ALTER TABLE `test_achs`
  ADD CONSTRAINT `test_achs_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `test_postulante`
--
ALTER TABLE `test_postulante`
  ADD CONSTRAINT `test_postulante_ibfk_1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test_postulante_ibfk_2` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_test`
--
ALTER TABLE `usuario_test`
  ADD CONSTRAINT `usuario_test_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
