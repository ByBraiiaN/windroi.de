-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2018 a las 22:22:32
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chau`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_baneados`
--

CREATE TABLE `c_baneados` (
  `ban_id` int(11) NOT NULL,
  `ban_user` int(11) NOT NULL,
  `ban_comunidad` int(11) NOT NULL,
  `ban_causa` varchar(100) NOT NULL,
  `ban_fecha` int(11) NOT NULL,
  `ban_termina` int(11) NOT NULL,
  `ban_mod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_borradores`
--

CREATE TABLE `c_borradores` (
  `b_id` int(11) NOT NULL,
  `b_comunidad` int(11) NOT NULL,
  `b_autor` int(11) NOT NULL,
  `b_titulo` varchar(60) NOT NULL,
  `b_cuerpo` text NOT NULL,
  `b_cerrado` int(11) NOT NULL,
  `b_sticky` int(11) NOT NULL,
  `b_fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_categorias`
--

CREATE TABLE `c_categorias` (
  `cid` int(11) NOT NULL,
  `c_nombre` varchar(32) NOT NULL,
  `c_seo` varchar(32) NOT NULL,
  `c_img` varchar(32) NOT NULL DEFAULT 'comments.png'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c_categorias`
--

INSERT INTO `c_categorias` (`cid`, `c_nombre`, `c_seo`, `c_img`) VALUES
(1, 'Arte y Literatura', 'arte-literatura', 'c_arte-literatura.png'),
(2, 'Deportes', 'deportes', 'c_deportes.png'),
(3, 'Diversi&oacute;n y Esparcimiento', 'diversion-esparcimiento', 'c_diversion-esparcimiento.png'),
(4, 'Econom&iacute;a y Negocios', 'economia-negocios', 'c_economia-negocios.png'),
(5, 'Entretenimiento y Medios', 'entretenimiento-medios', 'c_entretenimiento-medios.png'),
(6, 'Grupos y Organizaciones', 'grupos-organizaciones', 'c_grupos-organizaciones.png'),
(7, 'Inter&eacute;s General', 'interes-general', 'c_interes-general.png'),
(8, 'Internet y Tecnolog&iacute;a', 'internet-tecnologia', 'c_internet-tecnologia.png'),
(9, 'M&uacute;sica y Bandas', 'musica-bandas', 'c_musica-bandas.png'),
(10, 'Regiones', 'regiones', 'c_regiones.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_chat_blacklist`
--

CREATE TABLE `c_chat_blacklist` (
  `ban_id` int(12) NOT NULL,
  `ban_user` int(12) NOT NULL,
  `ban_expire` int(12) NOT NULL,
  `ban_date` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_chat_messages`
--

CREATE TABLE `c_chat_messages` (
  `msg_id` int(12) NOT NULL,
  `msg_user` int(12) NOT NULL,
  `msg_text` text NOT NULL,
  `msg_date` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_comunidades`
--

CREATE TABLE `c_comunidades` (
  `c_id` int(11) NOT NULL,
  `c_autor` int(11) NOT NULL,
  `c_nombre` varchar(60) NOT NULL,
  `c_nombre_corto` varchar(250) NOT NULL,
  `c_categoria` int(11) NOT NULL,
  `c_sub_categoria` int(11) NOT NULL,
  `c_pais` varchar(3) NOT NULL,
  `c_descripcion` text NOT NULL,
  `c_acceso` int(11) NOT NULL,
  `c_permisos` int(11) NOT NULL,
  `c_back_color` varchar(6) NOT NULL,
  `c_back_repeat` int(1) NOT NULL,
  `c_estado` int(11) NOT NULL,
  `c_miembros` int(11) NOT NULL,
  `c_temas` int(11) NOT NULL,
  `c_seguidores` int(11) NOT NULL,
  `c_fecha` int(11) NOT NULL,
  `c_ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_favoritos`
--

CREATE TABLE `c_favoritos` (
  `fav_id` int(11) NOT NULL,
  `f_user` int(11) NOT NULL,
  `f_tema` int(11) NOT NULL,
  `f_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_historial`
--

CREATE TABLE `c_historial` (
  `h_id` int(11) NOT NULL,
  `h_for` int(11) NOT NULL,
  `h_mod` int(11) NOT NULL,
  `h_type` int(11) NOT NULL,
  `h_comid` int(11) NOT NULL,
  `h_razon` varchar(80) NOT NULL,
  `h_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_miembros`
--

CREATE TABLE `c_miembros` (
  `m_id` int(11) NOT NULL,
  `m_user` int(11) NOT NULL,
  `m_permisos` int(11) NOT NULL,
  `m_comunidad` int(11) NOT NULL,
  `m_fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_respuestas`
--

CREATE TABLE `c_respuestas` (
  `r_id` int(11) NOT NULL,
  `r_autor` int(11) NOT NULL,
  `r_body` text NOT NULL,
  `r_tema` int(11) NOT NULL,
  `r_votos_pos` int(11) NOT NULL,
  `r_votos_neg` int(11) NOT NULL,
  `r_fecha` int(11) NOT NULL,
  `r_estado` int(11) NOT NULL,
  `r_ip` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_subcategorias`
--

CREATE TABLE `c_subcategorias` (
  `sid` int(11) NOT NULL,
  `s_type` int(11) NOT NULL,
  `s_nombre` varchar(32) NOT NULL,
  `s_seo` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c_subcategorias`
--

INSERT INTO `c_subcategorias` (`sid`, `s_type`, `s_nombre`, `s_seo`) VALUES
(1, 1, 'Fotograf&iacute;as', 'fotografias'),
(2, 1, 'Artes Plasticas', 'artes-plasticas'),
(3, 1, 'Artes Visuales', 'artes-visuales'),
(4, 1, 'Poes&iacute;a y Narraci&oacute;n', 'poesia-narracion'),
(5, 1, 'Escritores', 'escritores'),
(6, 1, 'Pensamientos', 'internet-tecnologia'),
(7, 1, 'General y Otros', 'musica-bandas'),
(8, 1, 'Fotograf&iacute;s', 'fotografias'),
(9, 1, 'Artes Pl&aacute;sticas', 'artes-plasticas'),
(10, 2, 'Automovilismo y Carreras', 'autos-carreras'),
(11, 2, 'Ajedrez', 'ajedrez'),
(12, 2, 'Artes Marciales', 'artes-marciales'),
(13, 2, 'Futb&oacute;l', 'futbol'),
(14, 2, 'Basquet', 'basquet'),
(15, 2, 'Deportes Extremos', 'deportes-extremos'),
(16, 2, 'Deportes de Invierno', 'deportes-invierno'),
(17, 2, 'Deportes Ol&iacute;mpicos', 'deportes-olimpicos'),
(18, 2, 'Deportes Acu&aacute;ticos', 'deportes-acuaticos'),
(19, 2, 'Deportes al aire Libre', 'deporte-aire-libre'),
(20, 2, 'Golf', 'golf'),
(21, 2, 'Rugby', 'rugby'),
(22, 2, 'Boxeo', 'boxeo'),
(23, 2, 'Tenis', 'tenis'),
(24, 2, 'Atletismo y Aerobic', 'atletismo-aerobic'),
(25, 2, 'Instituciones y Clubes', 'instituciones-club'),
(26, 2, 'Ciclismo', 'ciclismo'),
(27, 3, 'Vida Nocturna', 'vida-nocturna'),
(28, 3, 'Bares y Caf&eacute;s', 'bar-cafe'),
(29, 3, 'Baile', 'baile'),
(30, 3, 'Humor', 'humor'),
(31, 3, 'Paseos', 'paseos'),
(32, 3, 'Parques', 'parques'),
(33, 3, 'Salidas', 'salidas'),
(34, 3, 'General y Otros', 'general-otros'),
(35, 4, 'Empresas y Negocios', 'empresa-negocio'),
(36, 4, 'Empleo y Trabajo', 'empleo-trabajo'),
(37, 4, 'Investigaciones Econ&oacute;nomi', 'investigacion-economica'),
(39, 4, 'Inversiones y Finanzas', 'inversion-finanza'),
(40, 4, 'Marketing y Publicidad', 'marketing-pubicidad'),
(41, 4, 'Emprendimientos', 'emprendimientos'),
(42, 4, 'Management y Administraci&oacute', 'management-admin'),
(43, 4, 'Defensa del Consumidor', 'defensa-consumidor'),
(44, 4, 'Contabilidad e Impuestos', 'contabilidad-impuestos'),
(45, 4, 'General y Otros', 'general-otros'),
(46, 5, 'Series de TV', 'series-tv'),
(47, 5, 'Televisi&oacute;n', 'television'),
(48, 5, 'Cine y Pel&iacute;culas', 'cine-peliculas'),
(49, 5, 'Espect&aacute;culos', 'espectaculos'),
(50, 5, 'Teatros', 'teatros'),
(51, 5, 'Celebridades y Famosos', 'celebridad-famosos'),
(52, 5, 'Diarios y Revistas', 'diarios-revistas'),
(53, 5, 'General y Otros', 'general-otros'),
(54, 6, 'Organizaciones sin fines de Lucr', 'organizaciones-sin-fines-de-lucr'),
(55, 6, 'Organizaciones de Profecionales', 'organizaciones-profecionales'),
(56, 6, 'Organizaciones de Voluntarios', 'organizaciones-voluntarios'),
(57, 6, 'Organizaciones de Defensas', 'organizaciones-defensas'),
(58, 6, 'Organizaciones Religiosas', 'organizaciones-religiosas'),
(59, 6, 'Organizaciones Pol&iacute;ticas', 'organizaciones-politicas'),
(60, 6, 'Grupos de Estudios', 'grupos-estudios'),
(61, 6, 'Dormitorios y Residencias', 'dormitorios-residencias'),
(62, 6, 'Estudiantes Secundarios', 'estudiantes-secundarios'),
(63, 6, 'Estudiantes de Univercidades', 'estudiantes-univercidades'),
(64, 6, 'Postgrados', 'postgrados'),
(65, 6, 'Ex-alumnos', 'ex-alumnos'),
(66, 6, 'Clubes y Sociedades', 'clubes-sociedades'),
(67, 6, 'General y Otros', 'general-otros'),
(68, 7, 'Actividades, Encuentros y Juntad', 'actividades-encuentros-juntadas'),
(69, 7, 'Actualidad', 'actualidad'),
(70, 7, 'Amantes de los Motores', 'amantes-motores'),
(71, 7, 'Cultura Retro', 'cultura-retro'),
(72, 7, 'Edades y Vivencias', 'edades-vivencias'),
(73, 7, 'Coleccionistas', 'coleccionistas'),
(74, 7, 'Manga y Anime', 'manga-anime'),
(75, 7, 'Comics e Historietas', 'comics-historietas'),
(76, 7, 'Belleza y Est&eacute;tica', 'belleza-estetica'),
(77, 7, 'Modas y Tendencias', 'modas-tendencias'),
(78, 7, 'Citas, Relaciones y Amor', 'citas-relaciones-amor'),
(79, 7, 'Familias', 'familias'),
(80, 7, 'Comidas, Recetas y Cocina', 'comidas-recetas-cocina'),
(81, 7, 'Bebidas y Vinos', 'bebidas-vino'),
(82, 7, 'Amigos', 'amigos'),
(83, 7, 'Jardiner&iacute;a', 'jardineria'),
(84, 7, 'Salud y Bienestar', 'salud-bienestar'),
(85, 7, 'Historia', 'historia'),
(86, 7, 'Pasatiempos y Manualidades', 'pasatiempos-manualidades'),
(87, 8, 'Computadoras y Hadware', 'computadoras-hadware'),
(88, 8, 'Celulares', 'celulares'),
(89, 8, 'Gadgets', 'gadgets'),
(90, 8, 'Software y Aplicaciones', 'software-aplicaciones'),
(91, 8, 'Linux y GNU', 'linux-gnu'),
(92, 8, 'Windows', 'windows'),
(93, 8, 'Mac', 'mac'),
(94, 8, 'Juegos', 'juegos'),
(95, 8, 'Multimedia', 'multimedia'),
(96, 8, 'Programaci&oacute;n y Lenguajes', 'programacion-lenguajes'),
(97, 8, 'Comunidades 2.0 y Cultura online', 'comunidades-cultura-online'),
(98, 8, 'Sitios webs y Blogs', 'sitios-webs-blogs'),
(99, 8, 'Aparatos Electr&oacute;nicos', 'aparatos-electronicos'),
(100, 8, 'Noticias y Novedades', 'noticias-novedades'),
(101, 8, 'General y Otros', 'general-otros'),
(102, 9, 'Blues', 'blues'),
(103, 9, 'Cl&aacute;sica', 'clasica'),
(104, 9, 'Compositores', 'compositores'),
(105, 9, 'Country', 'country'),
(106, 9, 'Cumbia', 'cumbia'),
(107, 9, 'Dance', 'dance'),
(108, 9, 'Electr&oacute;nica', 'electronica'),
(109, 9, 'Folklore', 'folklore'),
(110, 9, 'Indie', 'indie'),
(111, 9, 'Instrumental', 'Instrumental'),
(112, 9, 'Jazz', 'jazz'),
(113, 9, 'Latina', 'latina'),
(114, 9, 'Metal', 'metal'),
(115, 9, 'Pop', 'pop'),
(116, 9, 'R&B/Solud', 'rb-sould'),
(117, 9, 'Rap y Hip Hop', 'rap-hip-hop'),
(118, 9, 'Reggae', 'reggae'),
(119, 9, 'Reggeaton', 'reggeaton'),
(120, 9, 'Religiosa', 'religiosa'),
(121, 9, 'Rock', 'rock'),
(122, 9, 'General y Otros', 'general-otros'),
(123, 10, 'Pa&iacute;ses', 'paises'),
(124, 10, 'Provincias y Estados', 'provincias-estados'),
(125, 10, 'Barrios', 'barrios'),
(126, 10, 'Lugares', 'lugares'),
(127, 10, 'General y Otros', 'general-otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_temas`
--

CREATE TABLE `c_temas` (
  `t_id` int(11) NOT NULL,
  `t_titulo` varchar(60) NOT NULL,
  `t_cuerpo` text NOT NULL,
  `t_comunidad` int(11) NOT NULL,
  `t_autor` int(11) NOT NULL,
  `t_fecha` int(11) NOT NULL,
  `t_votos_pos` int(11) NOT NULL,
  `t_votos_neg` int(11) NOT NULL,
  `t_visitas` int(11) NOT NULL,
  `t_favoritos` int(11) NOT NULL,
  `t_respuestas` int(11) NOT NULL,
  `t_seguidores` int(11) NOT NULL,
  `t_share` int(11) NOT NULL,
  `t_sticky` int(1) NOT NULL,
  `t_cerrado` int(1) NOT NULL,
  `t_estado` int(1) NOT NULL,
  `t_ip` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_votos`
--

CREATE TABLE `c_votos` (
  `vid` int(11) NOT NULL,
  `v_user` int(11) NOT NULL,
  `v_type` int(11) NOT NULL,
  `v_obj` int(11) NOT NULL,
  `v_for` int(11) NOT NULL,
  `v_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_borradores`
--

CREATE TABLE `p_borradores` (
  `bid` int(11) NOT NULL,
  `b_user` int(11) NOT NULL,
  `b_date` int(10) NOT NULL,
  `b_title` varchar(60) NOT NULL,
  `b_imgport` varchar(180) DEFAULT NULL,
  `b_body` text,
  `b_tags` varchar(128) DEFAULT NULL,
  `b_category` int(4) NOT NULL,
  `b_private` int(1) NOT NULL DEFAULT '0',
  `b_block_comments` int(1) NOT NULL DEFAULT '0',
  `b_sponsored` int(1) NOT NULL DEFAULT '0',
  `b_sticky` int(1) NOT NULL DEFAULT '0',
  `b_smileys` int(1) NOT NULL,
  `b_visitantes` int(1) NOT NULL DEFAULT '0',
  `b_post_id` int(11) NOT NULL DEFAULT '0',
  `b_status` int(1) NOT NULL DEFAULT '1',
  `b_causa` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_categorias`
--

CREATE TABLE `p_categorias` (
  `cid` int(11) NOT NULL,
  `c_orden` int(11) NOT NULL,
  `c_nombre` varchar(32) NOT NULL,
  `c_seo` varchar(32) NOT NULL,
  `c_img` varchar(32) NOT NULL DEFAULT 'comments.png',
  `c_desc` varchar(220) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_categorias`
--

INSERT INTO `p_categorias` (`cid`, `c_orden`, `c_nombre`, `c_seo`, `c_img`, `c_desc`) VALUES
(1, 1, 'Android', 'android', 'android.png', NULL),
(16, 16, 'Windows', 'windows', 'windows.png', NULL),
(11, 11, 'Programas', 'programas', 'application.png', NULL),
(14, 14, 'Móvil', 'movil', 'smartphone.png', NULL),
(10, 10, 'Pc', 'pc', 'computer.png', NULL),
(2, 2, 'Aplicaciones', 'aplicaciones', 'package_green.png', NULL),
(15, 15, 'Tutoriales', 'tutoriales', 'ebook.png', NULL),
(12, 12, 'Reviews', 'reviews', 'cohete.png', NULL),
(13, 13, 'ROMs', 'roms', 'box_down.png', 'hola'),
(4, 4, 'Imágenes', 'imagenes', 'photo.png', NULL),
(5, 5, 'Info', 'info', 'book.png', NULL),
(6, 6, 'Juegos', 'juegos', 'controller.png', NULL),
(3, 3, 'Drivers', 'drivers', 'database_go.png', NULL),
(7, 7, 'Linux', 'linux', 'tux.png', NULL),
(17, 17, 'WinDroiDe', 'windroide', 'wd.png', NULL),
(8, 8, 'Noticias', 'noticias', 'newspaper.png', NULL),
(9, 9, 'Off Topic', 'offtopic', 'comments.png', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_comentarios`
--

CREATE TABLE `p_comentarios` (
  `cid` int(11) NOT NULL,
  `c_post_id` int(11) NOT NULL,
  `c_user` int(11) NOT NULL,
  `c_date` int(10) NOT NULL,
  `c_body` text NOT NULL,
  `c_votos` int(3) NOT NULL DEFAULT '0',
  `c_status` enum('0','1') NOT NULL DEFAULT '0',
  `c_ip` varchar(15) NOT NULL,
  `c_anon` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_favoritos`
--

CREATE TABLE `p_favoritos` (
  `fav_id` int(11) NOT NULL,
  `fav_user` int(11) NOT NULL,
  `fav_post_id` int(11) NOT NULL,
  `fav_date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_posts`
--

CREATE TABLE `p_posts` (
  `post_id` int(11) NOT NULL,
  `post_user` int(11) NOT NULL,
  `post_category` int(4) NOT NULL,
  `post_title` varchar(60) NOT NULL,
  `post_imgport` varchar(500) NOT NULL,
  `post_body` text NOT NULL,
  `post_date` int(10) NOT NULL,
  `post_tags` varchar(128) NOT NULL,
  `post_puntos` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `post_comments` int(11) NOT NULL,
  `post_seguidores` int(11) NOT NULL,
  `post_shared` int(11) NOT NULL,
  `post_favoritos` int(11) NOT NULL,
  `post_cache` int(10) NOT NULL,
  `post_hits` int(11) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL,
  `post_private` int(1) NOT NULL DEFAULT '0',
  `post_block_comments` int(1) NOT NULL DEFAULT '0',
  `post_sponsored` int(1) NOT NULL DEFAULT '0',
  `post_sticky` int(1) NOT NULL DEFAULT '0',
  `post_smileys` int(1) NOT NULL,
  `post_visitantes` int(1) NOT NULL DEFAULT '0',
  `post_status` int(1) NOT NULL DEFAULT '0',
  `post_blogoff` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_votos`
--

CREATE TABLE `p_votos` (
  `voto_id` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `tuser` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_actividad`
--

CREATE TABLE `u_actividad` (
  `ac_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `obj_uno` int(11) NOT NULL,
  `obj_dos` int(11) NOT NULL,
  `ac_type` int(2) NOT NULL,
  `ac_date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_avisos`
--

CREATE TABLE `u_avisos` (
  `av_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `av_subject` varchar(24) NOT NULL,
  `av_body` text NOT NULL,
  `av_date` int(10) NOT NULL,
  `av_read` int(1) NOT NULL DEFAULT '0',
  `av_type` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_bloqueos`
--

CREATE TABLE `u_bloqueos` (
  `bid` int(11) NOT NULL,
  `b_user` int(11) NOT NULL,
  `b_auser` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_follows`
--

CREATE TABLE `u_follows` (
  `follow_id` int(11) NOT NULL,
  `f_user` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `f_type` int(1) NOT NULL,
  `f_date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_mensajes`
--

CREATE TABLE `u_mensajes` (
  `mp_id` int(11) NOT NULL,
  `mp_to` int(11) NOT NULL,
  `mp_from` int(11) NOT NULL,
  `mp_answer` int(1) NOT NULL DEFAULT '0',
  `mp_read_to` int(1) NOT NULL DEFAULT '0',
  `mp_read_from` int(1) NOT NULL DEFAULT '1',
  `mp_read_mon_to` int(1) NOT NULL DEFAULT '0',
  `mp_read_mon_from` int(1) NOT NULL DEFAULT '1',
  `mp_del_to` int(1) NOT NULL DEFAULT '0',
  `mp_del_from` int(1) NOT NULL DEFAULT '0',
  `mp_subject` varchar(50) NOT NULL,
  `mp_preview` varchar(75) NOT NULL,
  `mp_date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_miembros`
--

CREATE TABLE `u_miembros` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(16) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(35) NOT NULL,
  `user_rango` int(3) NOT NULL DEFAULT '3',
  `user_puntos` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `user_posts` int(11) NOT NULL,
  `user_comentarios` int(11) NOT NULL,
  `user_seguidores` int(11) NOT NULL,
  `user_cache` int(10) NOT NULL,
  `user_puntosxdar` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `user_bad_hits` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `user_nextpuntos` int(10) NOT NULL DEFAULT '0',
  `user_registro` int(10) NOT NULL DEFAULT '0',
  `user_lastlogin` int(10) NOT NULL DEFAULT '0',
  `user_lastactive` int(10) NOT NULL DEFAULT '0',
  `user_lastpost` int(10) NOT NULL DEFAULT '0',
  `user_last_ip` varchar(15) NOT NULL DEFAULT '0',
  `user_name_changes` int(11) NOT NULL DEFAULT '3',
  `user_activo` int(1) NOT NULL DEFAULT '0',
  `user_baneado` int(1) NOT NULL DEFAULT '0',
  `user_chat` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_monitor`
--

CREATE TABLE `u_monitor` (
  `not_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `obj_user` int(11) NOT NULL,
  `obj_uno` int(11) NOT NULL DEFAULT '0',
  `obj_dos` int(11) NOT NULL DEFAULT '0',
  `obj_tres` int(11) NOT NULL DEFAULT '0',
  `not_type` int(2) NOT NULL,
  `not_date` int(10) NOT NULL,
  `not_total` int(2) NOT NULL DEFAULT '1',
  `not_menubar` int(1) NOT NULL DEFAULT '2',
  `not_monitor` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_muro`
--

CREATE TABLE `u_muro` (
  `pub_id` int(11) NOT NULL,
  `p_user` int(11) NOT NULL,
  `p_user_pub` int(11) NOT NULL,
  `p_date` int(10) NOT NULL,
  `p_comments` int(4) NOT NULL DEFAULT '0',
  `p_body` text NOT NULL,
  `p_likes` int(4) NOT NULL DEFAULT '0',
  `p_type` int(1) NOT NULL,
  `p_ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_muro_adjuntos`
--

CREATE TABLE `u_muro_adjuntos` (
  `adj_id` int(11) NOT NULL,
  `pub_id` int(11) NOT NULL,
  `a_title` varchar(100) NOT NULL,
  `a_url` text NOT NULL,
  `a_img` text NOT NULL,
  `a_desc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_muro_comentarios`
--

CREATE TABLE `u_muro_comentarios` (
  `cid` int(11) NOT NULL,
  `pub_id` int(11) NOT NULL,
  `c_user` int(11) NOT NULL,
  `c_date` int(10) NOT NULL,
  `c_body` text NOT NULL,
  `c_likes` int(4) NOT NULL,
  `c_ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_muro_likes`
--

CREATE TABLE `u_muro_likes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `obj_id` int(11) NOT NULL,
  `obj_type` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_nicks`
--

CREATE TABLE `u_nicks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `name_1` varchar(15) NOT NULL,
  `name_2` varchar(15) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `estado` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_perfil`
--

CREATE TABLE `u_perfil` (
  `user_id` int(11) NOT NULL,
  `user_dia` int(2) NOT NULL,
  `user_mes` int(2) NOT NULL,
  `user_ano` int(4) NOT NULL,
  `user_pais` varchar(2) NOT NULL,
  `user_estado` int(2) NOT NULL DEFAULT '1',
  `user_sexo` int(1) NOT NULL DEFAULT '1',
  `user_firma` text NOT NULL,
  `p_nombre` varchar(32) NOT NULL,
  `p_avatar` int(1) NOT NULL DEFAULT '0',
  `p_mensaje` varchar(60) NOT NULL,
  `p_sitio` varchar(60) NOT NULL,
  `p_socials` text NOT NULL,
  `p_gustos` varchar(71) NOT NULL DEFAULT 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}',
  `p_estado` int(1) NOT NULL DEFAULT '0',
  `p_hijos` int(1) NOT NULL DEFAULT '0',
  `p_vivo` int(1) NOT NULL DEFAULT '0',
  `p_altura` int(3) NOT NULL DEFAULT '0',
  `p_peso` int(3) NOT NULL DEFAULT '0',
  `p_pelo` int(1) NOT NULL DEFAULT '0',
  `p_ojos` int(1) NOT NULL DEFAULT '0',
  `p_fisico` int(1) NOT NULL DEFAULT '0',
  `p_dieta` int(1) NOT NULL DEFAULT '0',
  `p_tengo` varchar(60) NOT NULL DEFAULT 'a:2:{i:0;i:0;i:1;i:0;}',
  `p_fumo` int(1) NOT NULL DEFAULT '0',
  `p_tomo` int(1) NOT NULL DEFAULT '0',
  `p_estudios` int(1) NOT NULL DEFAULT '0',
  `p_idiomas` varchar(102) NOT NULL DEFAULT 'a:7:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;}',
  `p_profesion` varchar(32) NOT NULL,
  `p_empresa` varchar(32) NOT NULL,
  `p_sector` int(2) NOT NULL DEFAULT '0',
  `p_ingresos` int(1) NOT NULL DEFAULT '0',
  `p_int_prof` text NOT NULL,
  `p_hab_prof` text NOT NULL,
  `p_intereses` text NOT NULL,
  `p_hobbies` text NOT NULL,
  `p_tv` text NOT NULL,
  `p_musica` text NOT NULL,
  `p_deportes` text NOT NULL,
  `p_libros` text NOT NULL,
  `p_peliculas` text NOT NULL,
  `p_comida` text NOT NULL,
  `p_heroes` text NOT NULL,
  `p_configs` varchar(100) NOT NULL DEFAULT 'a:3:{s:1:"m";s:1:"5";s:2:"mf";i:5;s:3:"rmp";s:1:"5";}',
  `p_total` varchar(54) NOT NULL DEFAULT 'a:6:{i:0;i:5;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;}'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_portal`
--

CREATE TABLE `u_portal` (
  `user_id` int(11) NOT NULL,
  `last_posts_visited` text NOT NULL,
  `last_posts_shared` text NOT NULL,
  `last_posts_cats` text NOT NULL,
  `c_monitor` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_rangos`
--

CREATE TABLE `u_rangos` (
  `rango_id` int(3) NOT NULL,
  `r_name` varchar(32) NOT NULL,
  `r_color` varchar(6) NOT NULL DEFAULT '171717',
  `r_image` varchar(32) NOT NULL DEFAULT 'new.png',
  `r_cant` int(5) NOT NULL,
  `r_allows` varchar(1000) NOT NULL,
  `r_type` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `u_rangos`
--

INSERT INTO `u_rangos` (`rango_id`, `r_name`, `r_color`, `r_image`, `r_cant`, `r_allows`, `r_type`) VALUES
(1, 'Administrador', 'D6030B', 'ruby_2.png', 0, 'a:39:{s:4:\"suad\";s:2:\"on\";s:4:\"sumo\";N;s:5:\"moacp\";N;s:5:\"mocdu\";N;s:5:\"mocdp\";N;s:5:\"moadm\";N;s:5:\"mocdm\";N;s:5:\"movub\";N;s:4:\"moub\";N;s:4:\"morp\";N;s:4:\"mocp\";N;s:4:\"mocc\";N;s:4:\"most\";N;s:6:\"moayca\";N;s:6:\"movcud\";N;s:6:\"movcus\";N;s:4:\"mosu\";N;s:4:\"modu\";N;s:4:\"moep\";N;s:6:\"moedpo\";N;s:4:\"moop\";N;s:6:\"mocepc\";N;s:8:\"moedcopo\";N;s:7:\"moaydcp\";N;s:5:\"moecp\";N;s:5:\"moepm\";N;s:5:\"moecm\";N;s:4:\"godp\";N;s:4:\"gopp\";N;s:5:\"gopcp\";N;s:5:\"govpp\";N;s:5:\"govpn\";N;s:5:\"goepc\";N;s:5:\"godpc\";N;s:6:\"gorpap\";N;s:5:\"govwm\";N;s:4:\"goaf\";s:1:\"5\";s:5:\"gopfp\";s:2:\"20\";s:5:\"gopfd\";s:2:\"50\";}', 0),
(2, 'Moderador', '0066ff', 'Desarrollador.png', 0, 'a:47:{s:4:\"suad\";N;s:4:\"sumo\";s:2:\"on\";s:5:\"moacp\";N;s:5:\"mocdu\";N;s:5:\"moadf\";N;s:5:\"mocdf\";N;s:5:\"mocdp\";N;s:5:\"moadm\";N;s:5:\"mocdm\";N;s:5:\"movub\";N;s:4:\"moub\";N;s:4:\"morp\";N;s:4:\"morf\";N;s:4:\"mocp\";N;s:4:\"mocc\";N;s:4:\"most\";N;s:6:\"moayca\";N;s:6:\"movcud\";N;s:6:\"movcus\";N;s:4:\"mosu\";N;s:4:\"modu\";N;s:4:\"moep\";N;s:6:\"moedpo\";N;s:4:\"moop\";N;s:6:\"mocepc\";N;s:8:\"moedcopo\";N;s:7:\"moaydcp\";N;s:5:\"moecp\";N;s:4:\"moef\";N;s:6:\"moedfo\";N;s:5:\"moecf\";N;s:5:\"moepm\";N;s:5:\"moecm\";N;s:4:\"godp\";N;s:4:\"gopp\";N;s:5:\"gopcp\";N;s:5:\"govpp\";N;s:5:\"govpn\";N;s:5:\"goepc\";N;s:5:\"godpc\";N;s:4:\"gopf\";N;s:5:\"gopcf\";N;s:6:\"gorpap\";N;s:5:\"govwm\";N;s:4:\"goaf\";s:2:\"12\";s:5:\"gopfp\";s:2:\"15\";s:5:\"gopfd\";s:2:\"30\";}', 0),
(3, 'Novato', 'ff6633', 'novato.gif', 0, 'a:47:{s:4:\"suad\";N;s:4:\"sumo\";N;s:5:\"moacp\";N;s:5:\"mocdu\";N;s:5:\"moadf\";N;s:5:\"mocdf\";N;s:5:\"mocdp\";N;s:5:\"moadm\";N;s:5:\"mocdm\";N;s:5:\"movub\";N;s:4:\"moub\";N;s:4:\"morp\";N;s:4:\"morf\";N;s:4:\"mocp\";N;s:4:\"mocc\";N;s:4:\"most\";N;s:6:\"moayca\";N;s:6:\"movcud\";N;s:6:\"movcus\";N;s:4:\"mosu\";N;s:4:\"modu\";N;s:4:\"moep\";N;s:6:\"moedpo\";N;s:4:\"moop\";N;s:6:\"mocepc\";N;s:8:\"moedcopo\";N;s:7:\"moaydcp\";N;s:5:\"moecp\";N;s:4:\"moef\";N;s:6:\"moedfo\";N;s:5:\"moecf\";N;s:5:\"moepm\";N;s:5:\"moecm\";N;s:4:\"godp\";s:2:\"on\";s:4:\"gopp\";s:2:\"on\";s:5:\"gopcp\";s:2:\"on\";s:5:\"govpp\";s:2:\"on\";s:5:\"govpn\";N;s:5:\"goepc\";N;s:5:\"godpc\";N;s:4:\"gopf\";s:2:\"on\";s:5:\"gopcf\";s:2:\"on\";s:6:\"gorpap\";N;s:5:\"govwm\";N;s:4:\"goaf\";s:2:\"20\";s:5:\"gopfp\";s:1:\"5\";s:5:\"gopfd\";s:1:\"5\";}', 0),
(6, 'VIP', '9999ff', 'VIP.gif', 0, 'a:47:{s:4:\"suad\";N;s:4:\"sumo\";N;s:5:\"moacp\";N;s:5:\"mocdu\";N;s:5:\"moadf\";N;s:5:\"mocdf\";N;s:5:\"mocdp\";N;s:5:\"moadm\";N;s:5:\"mocdm\";N;s:5:\"movub\";N;s:4:\"moub\";N;s:4:\"morp\";N;s:4:\"morf\";N;s:4:\"mocp\";N;s:4:\"mocc\";N;s:4:\"most\";N;s:6:\"moayca\";N;s:6:\"movcud\";N;s:6:\"movcus\";N;s:4:\"mosu\";N;s:4:\"modu\";N;s:4:\"moep\";N;s:6:\"moedpo\";N;s:4:\"moop\";N;s:6:\"mocepc\";N;s:8:\"moedcopo\";N;s:7:\"moaydcp\";N;s:5:\"moecp\";N;s:4:\"moef\";N;s:6:\"moedfo\";N;s:5:\"moecf\";N;s:5:\"moepm\";N;s:5:\"moecm\";N;s:4:\"godp\";s:2:\"on\";s:4:\"gopp\";s:2:\"on\";s:5:\"gopcp\";s:2:\"on\";s:5:\"govpp\";s:2:\"on\";s:5:\"govpn\";s:2:\"on\";s:5:\"goepc\";s:2:\"on\";s:5:\"godpc\";s:2:\"on\";s:4:\"gopf\";s:2:\"on\";s:5:\"gopcf\";s:2:\"on\";s:6:\"gorpap\";N;s:5:\"govwm\";N;s:4:\"goaf\";s:2:\"15\";s:5:\"gopfp\";s:2:\"10\";s:5:\"gopfd\";s:2:\"15\";}', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_respuestas`
--

CREATE TABLE `u_respuestas` (
  `mr_id` int(11) NOT NULL,
  `mp_id` int(11) NOT NULL,
  `mr_from` int(11) NOT NULL,
  `mr_body` text NOT NULL,
  `mr_ip` varchar(15) NOT NULL,
  `mr_date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_sessions`
--

CREATE TABLE `u_sessions` (
  `session_id` varchar(32) NOT NULL,
  `session_user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `session_ip` varchar(40) NOT NULL,
  `session_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `session_autologin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_suspension`
--

CREATE TABLE `u_suspension` (
  `susp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `susp_causa` text NOT NULL,
  `susp_date` int(10) NOT NULL,
  `susp_termina` int(10) NOT NULL,
  `susp_mod` int(11) NOT NULL,
  `susp_ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_badwords`
--

CREATE TABLE `w_badwords` (
  `wid` int(11) NOT NULL,
  `word` varchar(250) NOT NULL,
  `swop` varchar(250) NOT NULL,
  `method` int(1) NOT NULL,
  `type` int(1) NOT NULL,
  `author` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_blacklist`
--

CREATE TABLE `w_blacklist` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `value` varchar(50) NOT NULL,
  `reason` varchar(120) NOT NULL,
  `author` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_configuracion`
--

CREATE TABLE `w_configuracion` (
  `tscript_id` int(11) NOT NULL,
  `titulo` varchar(24) NOT NULL,
  `slogan` varchar(34) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `url` tinytext NOT NULL,
  `email` varchar(60) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `tema_id` int(11) NOT NULL,
  `ads_300` text NOT NULL,
  `ads_468` text NOT NULL,
  `ads_160` text NOT NULL,
  `ads_728` text NOT NULL,
  `ads_search` varchar(50) NOT NULL,
  `cpost` varchar(20) NOT NULL,
  `c_last_active` int(2) NOT NULL,
  `c_allow_sess_ip` int(1) NOT NULL,
  `c_count_guests` int(1) NOT NULL,
  `c_reg_active` int(1) NOT NULL,
  `c_reg_activate` int(1) NOT NULL,
  `c_reg_rango` int(5) NOT NULL,
  `c_met_welcome` int(1) NOT NULL,
  `c_message_welcome` varchar(500) NOT NULL,
  `c_hits_guest` int(1) NOT NULL,
  `c_keep_points` int(1) NOT NULL,
  `c_allow_points` int(11) NOT NULL,
  `c_allow_edad` int(11) NOT NULL,
  `c_max_posts` int(2) NOT NULL,
  `c_max_com` int(3) NOT NULL,
  `c_max_nots` int(3) NOT NULL,
  `c_max_acts` int(3) NOT NULL,
  `c_newr_type` int(11) NOT NULL,
  `c_allow_sump` int(11) NOT NULL,
  `c_allow_firma` int(1) NOT NULL,
  `c_allow_upload` int(1) NOT NULL,
  `c_allow_portal` int(1) NOT NULL,
  `c_allow_live` int(1) NOT NULL,
  `c_see_mod` int(1) NOT NULL,
  `c_stats_cache` int(7) NOT NULL DEFAULT '15',
  `c_desapprove_post` int(1) NOT NULL,
  `offline` int(1) NOT NULL DEFAULT '0',
  `offline_message` varchar(255) NOT NULL,
  `version` varchar(16) NOT NULL,
  `version_code` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `w_configuracion`
--

INSERT INTO `w_configuracion` (`tscript_id`, `titulo`, `slogan`, `descripcion`, `url`, `email`, `banner`, `tema_id`, `ads_300`, `ads_468`, `ads_160`, `ads_728`, `ads_search`, `cpost`, `c_last_active`, `c_allow_sess_ip`, `c_count_guests`, `c_reg_active`, `c_reg_activate`, `c_reg_rango`, `c_met_welcome`, `c_message_welcome`, `c_hits_guest`, `c_keep_points`, `c_allow_points`, `c_allow_edad`, `c_max_posts`, `c_max_com`, `c_max_nots`, `c_max_acts`, `c_newr_type`, `c_allow_sump`, `c_allow_firma`, `c_allow_upload`, `c_allow_portal`, `c_allow_live`, `c_see_mod`, `c_stats_cache`, `c_desapprove_post`, `offline`, `offline_message`, `version`, `version_code`) VALUES
(1, 'WinDroide', 'slogan de la web', 'descripcion para la web', 'https://miweb.com', 'correo@gmail.com', 'http://i.imgur.com/2nEr3s.png?1', 1, '', '', '', '', '', '8', 15, 1, 1, 1, 1, 3, 0, 'Hola [usuario], [welcome] a [b][web][/b] :D', 1, 0, 10, 14, 10, 15, 99, 99, 0, 1, 0, 1, 1, 1, 0, 30, 0, 1, 'Estamos realizando algunas mejores, volvemos está noche :)', 'Risus 1.2.6.000', 'risus_1_2_6_000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_contacts`
--

CREATE TABLE `w_contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `time` int(15) NOT NULL,
  `type` int(1) NOT NULL,
  `hash` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_denuncias`
--

CREATE TABLE `w_denuncias` (
  `did` int(11) NOT NULL,
  `obj_id` int(11) NOT NULL,
  `d_user` int(11) NOT NULL,
  `d_razon` int(2) NOT NULL,
  `d_extra` text NOT NULL,
  `d_total` int(1) NOT NULL DEFAULT '1',
  `d_type` int(1) NOT NULL,
  `d_date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_historial`
--

CREATE TABLE `w_historial` (
  `id` int(11) NOT NULL,
  `pofid` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `action` int(1) NOT NULL,
  `mod` int(11) NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `date` int(11) NOT NULL,
  `mod_ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_medallas`
--

CREATE TABLE `w_medallas` (
  `medal_id` int(11) NOT NULL,
  `m_autor` int(11) NOT NULL,
  `m_title` varchar(25) NOT NULL,
  `m_description` varchar(120) NOT NULL,
  `m_image` varchar(120) NOT NULL,
  `m_cant` int(11) NOT NULL,
  `m_type` int(1) NOT NULL,
  `m_cond_user` int(11) NOT NULL,
  `m_cond_user_rango` int(11) NOT NULL,
  `m_cond_post` int(11) NOT NULL,
  `m_date` int(11) NOT NULL,
  `m_total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_medallas_assign`
--

CREATE TABLE `w_medallas_assign` (
  `id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL,
  `medal_for` int(11) NOT NULL,
  `medal_date` int(11) NOT NULL,
  `medal_ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_noticias`
--

CREATE TABLE `w_noticias` (
  `not_id` int(11) NOT NULL,
  `not_body` text NOT NULL,
  `not_autor` int(11) NOT NULL,
  `not_date` int(10) NOT NULL,
  `not_active` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `w_noticias`
--

INSERT INTO `w_noticias` (`not_id`, `not_body`, `not_autor`, `not_date`, `not_active`) VALUES
(1, '[b]Hola[/b] vengo a flotar', 1, 1520610420, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_stats`
--

CREATE TABLE `w_stats` (
  `stats_no` int(1) NOT NULL,
  `stats_max_online` int(11) NOT NULL,
  `stats_max_time` int(10) NOT NULL,
  `stats_time` int(10) NOT NULL,
  `stats_time_cache` int(10) NOT NULL,
  `stats_time_foundation` int(11) NOT NULL,
  `stats_time_upgrade` int(11) NOT NULL,
  `stats_miembros` int(11) NOT NULL,
  `stats_posts` int(11) NOT NULL,
  `stats_comments` int(11) NOT NULL,
  `stats_comunidades` int(11) NOT NULL,
  `stats_temas` int(11) NOT NULL,
  `stats_respuestas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `w_stats`
--

INSERT INTO `w_stats` (`stats_no`, `stats_max_online`, `stats_max_time`, `stats_time`, `stats_time_cache`, `stats_time_foundation`, `stats_time_upgrade`, `stats_miembros`, `stats_posts`, `stats_comments`, `stats_comunidades`, `stats_temas`, `stats_respuestas`) VALUES
(1, 83, 1522539330, 1527700410, 1527699884, 1485753060, 1504879423, 16, 32, 15, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_temas`
--

CREATE TABLE `w_temas` (
  `tid` int(11) NOT NULL,
  `t_name` tinytext NOT NULL,
  `t_url` tinytext NOT NULL,
  `t_path` tinytext NOT NULL,
  `t_copy` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `w_temas`
--

INSERT INTO `w_temas` (`tid`, `t_name`, `t_url`, `t_path`, `t_copy`) VALUES
(1, 'Default', '/themes/default', 'default', 'default');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_visitas`
--

CREATE TABLE `w_visitas` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `for` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `date` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `c_baneados`
--
ALTER TABLE `c_baneados`
  ADD PRIMARY KEY (`ban_id`);

--
-- Indices de la tabla `c_borradores`
--
ALTER TABLE `c_borradores`
  ADD PRIMARY KEY (`b_id`);

--
-- Indices de la tabla `c_categorias`
--
ALTER TABLE `c_categorias`
  ADD PRIMARY KEY (`cid`);

--
-- Indices de la tabla `c_chat_blacklist`
--
ALTER TABLE `c_chat_blacklist`
  ADD PRIMARY KEY (`ban_id`);

--
-- Indices de la tabla `c_chat_messages`
--
ALTER TABLE `c_chat_messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indices de la tabla `c_comunidades`
--
ALTER TABLE `c_comunidades`
  ADD PRIMARY KEY (`c_id`);

--
-- Indices de la tabla `c_favoritos`
--
ALTER TABLE `c_favoritos`
  ADD PRIMARY KEY (`fav_id`);

--
-- Indices de la tabla `c_historial`
--
ALTER TABLE `c_historial`
  ADD PRIMARY KEY (`h_id`);

--
-- Indices de la tabla `c_miembros`
--
ALTER TABLE `c_miembros`
  ADD PRIMARY KEY (`m_id`);

--
-- Indices de la tabla `c_respuestas`
--
ALTER TABLE `c_respuestas`
  ADD PRIMARY KEY (`r_id`);

--
-- Indices de la tabla `c_subcategorias`
--
ALTER TABLE `c_subcategorias`
  ADD PRIMARY KEY (`sid`);

--
-- Indices de la tabla `c_temas`
--
ALTER TABLE `c_temas`
  ADD PRIMARY KEY (`t_id`);

--
-- Indices de la tabla `c_votos`
--
ALTER TABLE `c_votos`
  ADD PRIMARY KEY (`vid`);

--
-- Indices de la tabla `p_borradores`
--
ALTER TABLE `p_borradores`
  ADD PRIMARY KEY (`bid`);

--
-- Indices de la tabla `p_categorias`
--
ALTER TABLE `p_categorias`
  ADD PRIMARY KEY (`cid`);

--
-- Indices de la tabla `p_comentarios`
--
ALTER TABLE `p_comentarios`
  ADD PRIMARY KEY (`cid`);

--
-- Indices de la tabla `p_favoritos`
--
ALTER TABLE `p_favoritos`
  ADD PRIMARY KEY (`fav_id`);

--
-- Indices de la tabla `p_posts`
--
ALTER TABLE `p_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indices de la tabla `p_votos`
--
ALTER TABLE `p_votos`
  ADD PRIMARY KEY (`voto_id`);

--
-- Indices de la tabla `u_actividad`
--
ALTER TABLE `u_actividad`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indices de la tabla `u_avisos`
--
ALTER TABLE `u_avisos`
  ADD PRIMARY KEY (`av_id`);

--
-- Indices de la tabla `u_bloqueos`
--
ALTER TABLE `u_bloqueos`
  ADD PRIMARY KEY (`bid`);

--
-- Indices de la tabla `u_follows`
--
ALTER TABLE `u_follows`
  ADD PRIMARY KEY (`follow_id`);

--
-- Indices de la tabla `u_mensajes`
--
ALTER TABLE `u_mensajes`
  ADD PRIMARY KEY (`mp_id`);

--
-- Indices de la tabla `u_miembros`
--
ALTER TABLE `u_miembros`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `u_monitor`
--
ALTER TABLE `u_monitor`
  ADD PRIMARY KEY (`not_id`);

--
-- Indices de la tabla `u_muro`
--
ALTER TABLE `u_muro`
  ADD PRIMARY KEY (`pub_id`);

--
-- Indices de la tabla `u_muro_adjuntos`
--
ALTER TABLE `u_muro_adjuntos`
  ADD PRIMARY KEY (`adj_id`);

--
-- Indices de la tabla `u_muro_comentarios`
--
ALTER TABLE `u_muro_comentarios`
  ADD PRIMARY KEY (`cid`);

--
-- Indices de la tabla `u_muro_likes`
--
ALTER TABLE `u_muro_likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indices de la tabla `u_nicks`
--
ALTER TABLE `u_nicks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `u_perfil`
--
ALTER TABLE `u_perfil`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `u_portal`
--
ALTER TABLE `u_portal`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `u_rangos`
--
ALTER TABLE `u_rangos`
  ADD PRIMARY KEY (`rango_id`);

--
-- Indices de la tabla `u_respuestas`
--
ALTER TABLE `u_respuestas`
  ADD PRIMARY KEY (`mr_id`);

--
-- Indices de la tabla `u_sessions`
--
ALTER TABLE `u_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `session_user_id` (`session_user_id`),
  ADD KEY `session_time` (`session_time`);

--
-- Indices de la tabla `u_suspension`
--
ALTER TABLE `u_suspension`
  ADD PRIMARY KEY (`susp_id`);

--
-- Indices de la tabla `w_badwords`
--
ALTER TABLE `w_badwords`
  ADD PRIMARY KEY (`wid`);

--
-- Indices de la tabla `w_blacklist`
--
ALTER TABLE `w_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `w_configuracion`
--
ALTER TABLE `w_configuracion`
  ADD PRIMARY KEY (`tscript_id`);

--
-- Indices de la tabla `w_contacts`
--
ALTER TABLE `w_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `w_denuncias`
--
ALTER TABLE `w_denuncias`
  ADD PRIMARY KEY (`did`);

--
-- Indices de la tabla `w_historial`
--
ALTER TABLE `w_historial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `w_medallas`
--
ALTER TABLE `w_medallas`
  ADD PRIMARY KEY (`medal_id`);

--
-- Indices de la tabla `w_medallas_assign`
--
ALTER TABLE `w_medallas_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `w_noticias`
--
ALTER TABLE `w_noticias`
  ADD PRIMARY KEY (`not_id`);

--
-- Indices de la tabla `w_stats`
--
ALTER TABLE `w_stats`
  ADD PRIMARY KEY (`stats_no`);

--
-- Indices de la tabla `w_temas`
--
ALTER TABLE `w_temas`
  ADD PRIMARY KEY (`tid`);

--
-- Indices de la tabla `w_visitas`
--
ALTER TABLE `w_visitas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `c_baneados`
--
ALTER TABLE `c_baneados`
  MODIFY `ban_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_borradores`
--
ALTER TABLE `c_borradores`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_categorias`
--
ALTER TABLE `c_categorias`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `c_chat_blacklist`
--
ALTER TABLE `c_chat_blacklist`
  MODIFY `ban_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_chat_messages`
--
ALTER TABLE `c_chat_messages`
  MODIFY `msg_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_comunidades`
--
ALTER TABLE `c_comunidades`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_favoritos`
--
ALTER TABLE `c_favoritos`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_historial`
--
ALTER TABLE `c_historial`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_miembros`
--
ALTER TABLE `c_miembros`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_respuestas`
--
ALTER TABLE `c_respuestas`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_subcategorias`
--
ALTER TABLE `c_subcategorias`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `c_temas`
--
ALTER TABLE `c_temas`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `c_votos`
--
ALTER TABLE `c_votos`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `p_borradores`
--
ALTER TABLE `p_borradores`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `p_categorias`
--
ALTER TABLE `p_categorias`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `p_comentarios`
--
ALTER TABLE `p_comentarios`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `p_favoritos`
--
ALTER TABLE `p_favoritos`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `p_posts`
--
ALTER TABLE `p_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `p_votos`
--
ALTER TABLE `p_votos`
  MODIFY `voto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_actividad`
--
ALTER TABLE `u_actividad`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_avisos`
--
ALTER TABLE `u_avisos`
  MODIFY `av_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `u_bloqueos`
--
ALTER TABLE `u_bloqueos`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_follows`
--
ALTER TABLE `u_follows`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_mensajes`
--
ALTER TABLE `u_mensajes`
  MODIFY `mp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_miembros`
--
ALTER TABLE `u_miembros`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_monitor`
--
ALTER TABLE `u_monitor`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_muro`
--
ALTER TABLE `u_muro`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_muro_adjuntos`
--
ALTER TABLE `u_muro_adjuntos`
  MODIFY `adj_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_muro_comentarios`
--
ALTER TABLE `u_muro_comentarios`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_muro_likes`
--
ALTER TABLE `u_muro_likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_nicks`
--
ALTER TABLE `u_nicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_rangos`
--
ALTER TABLE `u_rangos`
  MODIFY `rango_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `u_respuestas`
--
ALTER TABLE `u_respuestas`
  MODIFY `mr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_suspension`
--
ALTER TABLE `u_suspension`
  MODIFY `susp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `w_badwords`
--
ALTER TABLE `w_badwords`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `w_blacklist`
--
ALTER TABLE `w_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `w_contacts`
--
ALTER TABLE `w_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `w_denuncias`
--
ALTER TABLE `w_denuncias`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `w_historial`
--
ALTER TABLE `w_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `w_medallas`
--
ALTER TABLE `w_medallas`
  MODIFY `medal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `w_medallas_assign`
--
ALTER TABLE `w_medallas_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `w_noticias`
--
ALTER TABLE `w_noticias`
  MODIFY `not_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `w_temas`
--
ALTER TABLE `w_temas`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `w_visitas`
--
ALTER TABLE `w_visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
