-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-05-2023 a las 18:14:53
-- Versión del servidor: 10.5.12-MariaDB-0+deb11u1
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `paugv2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `dni` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fechanacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`dni`, `nombre`, `apellido1`, `apellido2`, `email`, `fechanacimiento`) VALUES
('01023485N', 'Yun', 'Solà', 'García', 'yun@gmail.com', '2002-12-23'),
('23845755G', 'Franck', 'He', 'Kai', 'franck@gmail.com', '2000-11-11'),
('32493854K', 'Anna', 'Cuello', 'Riera', 'anna@gmail.com', '2002-10-16'),
('45678901F', 'Pau', 'Guri', 'Viura', 'pau@gmail.com', '2002-09-15'),
('60954846H', 'David', 'Pujol', 'Santander', 'david@gmail.com', '2002-09-25'),
('64985458T', 'Helena', 'Lahora', 'Núñez', 'helena@gmail.com', '2002-12-09'),
('75643284B', 'Júlia', 'Serrano', 'Marina', 'julia@gmail.com', '2002-01-12'),
('89564886G', 'Eva', 'Ruz', 'Lo', 'eva@gmail.com', '2001-04-23'),
('97432567V', 'Valeri', 'Bosch', 'Castella', 'valeri@gmail.com', '2000-07-06'),
('97644544A', 'Mònica', 'González', 'Ventura', 'monica@gmail.com', '2002-05-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `codigoassign` int(6) NOT NULL,
  `grado` int(3) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `creditos` int(3) NOT NULL,
  `curso` int(1) NOT NULL,
  `semestre` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`codigoassign`, `grado`, `titulo`, `creditos`, `curso`, `semestre`) VALUES
(804011, 1, 'Interacció Humà-Computadora', 9, 1, 0),
(804025, 1, 'Comunicació Audiovisual', 9, 2, 0),
(804036, 1, 'Programació Web Dinàmica i Bases de Dades', 6, 3, 1),
(804037, 1, 'Programació de Entorns Virtuals', 6, 3, 2),
(804100, 2, 'Indústria dels Videojocs', 6, 1, 1),
(804112, 2, 'Art Conceptual', 6, 1, 2),
(804130, 2, 'Intel·ligència Artificial', 6, 3, 1),
(804210, 3, 'Disseny de Personatges', 6, 1, 2),
(804232, 3, 'Tractament Digital', 6, 2, 2),
(804250, 3, 'Direcció d\'Art i Comunicació', 6, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `e06noticies`
--

CREATE TABLE `e06noticies` (
  `id` int(4) NOT NULL,
  `titol` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `data` date NOT NULL,
  `visible` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `e06noticies`
--

INSERT INTO `e06noticies` (`id`, `titol`, `text`, `data`, `visible`) VALUES
(1, 'ANTRO, un videojoc d’alumni CITM, es presenta al DeviCat i guanya el Best Sound & Music de l’Indie Dev Day 2022', 'El 20 d’octubre passat va tenir lloc la setena trobada mensual organitzada per DeviCat, l’associació de desenvolupadors i editors de videojocs de Catalunya. Aquesta vegada la sessió va ser especial, Devicat va unir forces amb la principal incubadora i acceleradora de videojocs de Barcelona, ​​GameBCN, oferint un espai privilegiat, el Barcelona Disseny Hub, perquè els programes i videojocs incubats poguessin realitzar els pitch davant d’un públic format per desenvolupadors, CEOS d’estudis i editors (Social Point, GameLoft, Marvelous, entre d’altres) de videojocs de renom.\r\n\r\nAquests pitch posen la cirereta a un any de col·laboració entre els projectes incubats i l’acceleradora. Entre els múltiples projectes trobem treballs d’estudis emergents argentins, polonesos i catalans, entre els quals hi ha l’estudi Gatera Studio, capitanejat per Norman Benet i Pol Ferrando, exalumnes del Centre de la Imatge i la Tecnologia Multimèdia (CITM) de la UPC, amb el seu joc ANTRO.\r\n\r\nANTRO és un projecte que va néixer al CITM, a la seva seu de Barcelona, ​​on els alumnes estudien el grau completament en anglès. La llavor de la proposta es va originar en assignatures com la de Level Design, on s’ensenya els estudiants a crear nivells de videojocs i després se’ls demana que apliquin tots els seus coneixements per fer els lliuraments finals de projectes per a l’assignatura. Més endavant, aquest projecte d’assignatura es va convertir en un Treball de Final de Grau (TFG) que Norman i Pol van dur a terme conjuntament. El treball, d’una gran qualitat, va ser proposat per optar al programa d’incubació de PlayStation Talents (PST), on va resultar elegit entre molts projectes. Després d’un any de viatge amb l’equip de PST els components de Gatera Studios, que van arribar a comptar vint-i-dos membres en moments puntuals, van decidir optar a entrar al programa de GameBCN, i van ser seleccionats d’entre més de seixanta candidatures.\r\n\r\nEl passat dijous 20 van presentar el seu videojoc i van finalitzar el període d’incubació a GameBCN, però lluny de ser un final, és un principi! Ara els espera un període molt important de desenvolupament i de finançament, per al qual sens dubte estan més que preparats, gràcies al treball de mentors com Oscar Sahún, director de GameBCN, per no esmentar el premi que es van emportar a l’Indie Dev Day, el Best Sound & Music!, i és que el joc brilla i destaca, entre moltes altres coses, pel seu disseny de nivells i la seva integració musical amb les mecàniques de parkour.\r\n\r\nGatera Studios i ANTRO són ​​un exemple de cas d’èxit d’alumnes del CITM, i ben aviat els convidarem al Centre perquè ens expliquin la seva experiència i ens ofereixin consells i detalls per a l’estudiantat CITM.', '2022-11-07', 1),
(12, 'Valery ha sido baneado de Twitter', 'Por pesao y simp, Elon Musk personalmente echó a este plasta de la plataforma.', '2022-11-21', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `e06usuaris`
--

CREATE TABLE `e06usuaris` (
  `iduser` int(4) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cognom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `e06usuaris`
--

INSERT INTO `e06usuaris` (`iduser`, `nom`, `cognom`, `email`, `password`) VALUES
(1, 'david', 'sanchez', 's@s.com', 'classe28novembre'),
(2, 'Pep', 'Llopis', 'pep@citm.upc.edu', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_contests`
--

CREATE TABLE `ev_contests` (
  `year` int(4) NOT NULL,
  `country` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ev_contests`
--

INSERT INTO `ev_contests` (`year`, `country`, `city`) VALUES
(2021, 'NL', 'Rotterdam'),
(2022, 'IT', 'Turin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_countries`
--

CREATE TABLE `ev_countries` (
  `id` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ev_countries`
--

INSERT INTO `ev_countries` (`id`, `name`, `icon`) VALUES
('AD', 'Andorra', NULL),
('AE', 'United Arab Emirates', NULL),
('AF', 'Afghanistan', NULL),
('AG', 'Antigua and Barbuda', NULL),
('AI', 'Anguilla', NULL),
('AL', 'Albania', NULL),
('AM', 'Armenia', NULL),
('AO', 'Angola', NULL),
('AQ', 'Antarctica', NULL),
('AR', 'Argentina', NULL),
('AS', 'American Samoa', NULL),
('AT', 'Austria', NULL),
('AU', 'Australia', NULL),
('AW', 'Aruba', NULL),
('AX', 'Åland Islands', NULL),
('AZ', 'Azerbaijan', NULL),
('BA', 'Bosnia and Herzegovina', NULL),
('BB', 'Barbados', NULL),
('BD', 'Bangladesh', NULL),
('BE', 'Belgium', NULL),
('BF', 'Burkina Faso', NULL),
('BG', 'Bulgaria', NULL),
('BH', 'Bahrain', NULL),
('BI', 'Burundi', NULL),
('BJ', 'Benin', NULL),
('BL', 'Saint Barthélemy', NULL),
('BM', 'Bermuda', NULL),
('BN', 'Brunei Darussalam', NULL),
('BO', 'Bolivia (Plurinational State of)', NULL),
('BQ', 'Bonaire, Sint Eustatius and Saba', NULL),
('BR', 'Brazil', NULL),
('BS', 'Bahamas', NULL),
('BT', 'Bhutan', NULL),
('BV', 'Bouvet Island', NULL),
('BW', 'Botswana', NULL),
('BY', 'Belarus', NULL),
('BZ', 'Belize', NULL),
('CA', 'Canada', NULL),
('CC', 'Cocos (Keeling) Islands', NULL),
('CD', 'Congo, Democratic Republic of the', NULL),
('CF', 'Central African Republic', NULL),
('CG', 'Congo', NULL),
('CH', 'Switzerland', NULL),
('CI', 'Côte d\'Ivoire', NULL),
('CK', 'Cook Islands', NULL),
('CL', 'Chile', NULL),
('CM', 'Cameroon', NULL),
('CN', 'China', NULL),
('CO', 'Colombia', NULL),
('CR', 'Costa Rica', NULL),
('CU', 'Cuba', NULL),
('CV', 'Cabo Verde', NULL),
('CW', 'Curaçao', NULL),
('CX', 'Christmas Island', NULL),
('CY', 'Cyprus', NULL),
('CZ', 'Czech Republic', NULL),
('DE', 'Germany', NULL),
('DJ', 'Djibouti', NULL),
('DK', 'Denmark', NULL),
('DM', 'Dominica', NULL),
('DO', 'Dominican Republic', NULL),
('DZ', 'Algeria', NULL),
('EC', 'Ecuador', NULL),
('EE', 'Estonia', NULL),
('EG', 'Egypt', NULL),
('EH', 'Western Sahara', NULL),
('ER', 'Eritrea', NULL),
('ES', 'Spain', NULL),
('ET', 'Ethiopia', NULL),
('FI', 'Finland', NULL),
('FJ', 'Fiji', NULL),
('FK', 'Falkland Islands (Malvinas)', NULL),
('FM', 'Micronesia (Federated States of)', NULL),
('FO', 'Faroe Islands', NULL),
('FR', 'France', NULL),
('GA', 'Gabon', NULL),
('GB', 'United Kingdom', NULL),
('GD', 'Grenada', NULL),
('GE', 'Georgia', NULL),
('GF', 'French Guiana', NULL),
('GG', 'Guernsey', NULL),
('GH', 'Ghana', NULL),
('GI', 'Gibraltar', NULL),
('GL', 'Greenland', NULL),
('GM', 'Gambia', NULL),
('GN', 'Guinea', NULL),
('GP', 'Guadeloupe', NULL),
('GQ', 'Equatorial Guinea', NULL),
('GR', 'Greece', NULL),
('GS', 'South Georgia and the South Sandwich Islands', NULL),
('GT', 'Guatemala', NULL),
('GU', 'Guam', NULL),
('GW', 'Guinea-Bissau', NULL),
('GY', 'Guyana', NULL),
('HK', 'Hong Kong', NULL),
('HM', 'Heard Island and McDonald Islands', NULL),
('HN', 'Honduras', NULL),
('HR', 'Croatia', NULL),
('HT', 'Haiti', NULL),
('HU', 'Hungary', NULL),
('ID', 'Indonesia', NULL),
('IE', 'Ireland', NULL),
('IL', 'Israel', NULL),
('IM', 'Isle of Man', NULL),
('IN', 'India', NULL),
('IO', 'British Indian Ocean Territory', NULL),
('IQ', 'Iraq', NULL),
('IR', 'Iran (Islamic Republic of)', NULL),
('IS', 'Iceland', NULL),
('IT', 'Italy', NULL),
('JE', 'Jersey', NULL),
('JM', 'Jamaica', NULL),
('JO', 'Jordan', NULL),
('JP', 'Japan', NULL),
('KE', 'Kenya', NULL),
('KG', 'Kyrgyzstan', NULL),
('KH', 'Cambodia', NULL),
('KI', 'Kiribati', NULL),
('KM', 'Comoros', NULL),
('KN', 'Saint Kitts and Nevis', NULL),
('KP', 'Korea (Democratic People\'s Republic of)', NULL),
('KR', 'Korea, Republic of', NULL),
('KW', 'Kuwait', NULL),
('KY', 'Cayman Islands', NULL),
('KZ', 'Kazakhstan', NULL),
('LA', 'Lao People\'s Democratic Republic', NULL),
('LB', 'Lebanon', NULL),
('LC', 'Saint Lucia', NULL),
('LI', 'Liechtenstein', NULL),
('LK', 'Sri Lanka', NULL),
('LR', 'Liberia', NULL),
('LS', 'Lesotho', NULL),
('LT', 'Lithuania', NULL),
('LU', 'Luxembourg', NULL),
('LV', 'Latvia', NULL),
('LY', 'Libya', NULL),
('MA', 'Morocco', NULL),
('MC', 'Monaco', NULL),
('MD', 'Moldova', NULL),
('ME', 'Montenegro', NULL),
('MF', 'Saint Martin (French part)', NULL),
('MG', 'Madagascar', NULL),
('MH', 'Marshall Islands', NULL),
('MK', 'North Macedonia', NULL),
('ML', 'Mali', NULL),
('MM', 'Myanmar', NULL),
('MN', 'Mongolia', NULL),
('MO', 'Macao', NULL),
('MP', 'Northern Mariana Islands', NULL),
('MQ', 'Martinique', NULL),
('MR', 'Mauritania', NULL),
('MS', 'Montserrat', NULL),
('MT', 'Malta', NULL),
('MU', 'Mauritius', NULL),
('MV', 'Maldives', NULL),
('MW', 'Malawi', NULL),
('MX', 'Mexico', NULL),
('MY', 'Malaysia', NULL),
('MZ', 'Mozambique', NULL),
('NA', 'Namibia', NULL),
('NC', 'New Caledonia', NULL),
('NE', 'Niger', NULL),
('NF', 'Norfolk Island', NULL),
('NG', 'Nigeria', NULL),
('NI', 'Nicaragua', NULL),
('NL', 'Netherlands', NULL),
('NO', 'Norway', NULL),
('NP', 'Nepal', NULL),
('NR', 'Nauru', NULL),
('NU', 'Niue', NULL),
('NZ', 'New Zealand', NULL),
('OM', 'Oman', NULL),
('PA', 'Panama', NULL),
('PE', 'Peru', NULL),
('PF', 'French Polynesia', NULL),
('PG', 'Papua New Guinea', NULL),
('PH', 'Philippines', NULL),
('PK', 'Pakistan', NULL),
('PL', 'Poland', NULL),
('PM', 'Saint Pierre and Miquelon', NULL),
('PN', 'Pitcairn', NULL),
('PR', 'Puerto Rico', NULL),
('PS', 'Palestine, State of', NULL),
('PT', 'Portugal', NULL),
('PW', 'Palau', NULL),
('PY', 'Paraguay', NULL),
('QA', 'Qatar', NULL),
('RE', 'Réunion', NULL),
('RO', 'Romania', NULL),
('RS', 'Serbia', NULL),
('RU', 'Russian Federation', NULL),
('RW', 'Rwanda', NULL),
('SA', 'Saudi Arabia', NULL),
('SB', 'Solomon Islands', NULL),
('SC', 'Seychelles', NULL),
('SD', 'Sudan', NULL),
('SE', 'Sweden', NULL),
('SG', 'Singapore', NULL),
('SH', 'Saint Helena, Ascension and Tristan da Cunha', NULL),
('SI', 'Slovenia', NULL),
('SJ', 'Svalbard and Jan Mayen', NULL),
('SK', 'Slovakia', NULL),
('SL', 'Sierra Leone', NULL),
('SM', 'San Marino', NULL),
('SN', 'Senegal', NULL),
('SO', 'Somalia', NULL),
('SR', 'Suriname', NULL),
('SS', 'South Sudan', NULL),
('ST', 'Sao Tome and Principe', NULL),
('SV', 'El Salvador', NULL),
('SX', 'Sint Maarten (Dutch part)', NULL),
('SY', 'Syrian Arab Republic', NULL),
('SZ', 'Eswatini', NULL),
('TC', 'Turks and Caicos Islands', NULL),
('TD', 'Chad', NULL),
('TF', 'French Southern Territories', NULL),
('TG', 'Togo', NULL),
('TH', 'Thailand', NULL),
('TJ', 'Tajikistan', NULL),
('TK', 'Tokelau', NULL),
('TL', 'Timor-Leste', NULL),
('TM', 'Turkmenistan', NULL),
('TN', 'Tunisia', NULL),
('TO', 'Tonga', NULL),
('TR', 'Turkey', NULL),
('TT', 'Trinidad and Tobago', NULL),
('TV', 'Tuvalu', NULL),
('TW', 'Taiwan, Province of China', NULL),
('TZ', 'Tanzania, United Republic of', NULL),
('UA', 'Ukraine', NULL),
('UG', 'Uganda', NULL),
('UM', 'United States Minor Outlying Islands', NULL),
('US', 'United States of America', NULL),
('UY', 'Uruguay', NULL),
('UZ', 'Uzbekistan', NULL),
('VA', 'Holy See', NULL),
('VC', 'Saint Vincent and the Grenadines', NULL),
('VE', 'Venezuela (Bolivarian Republic of)', NULL),
('VG', 'Virgin Islands (British)', NULL),
('VI', 'Virgin Islands (U.S.)', NULL),
('VN', 'Viet Nam', NULL),
('VU', 'Vanuatu', NULL),
('WF', 'Wallis and Futuna', NULL),
('WS', 'Samoa', NULL),
('YE', 'Yemen', NULL),
('YT', 'Mayotte', NULL),
('ZA', 'South Africa', NULL),
('ZM', 'Zambia', NULL),
('ZW', 'Zimbabwe', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_joined_rooms`
--

CREATE TABLE `ev_joined_rooms` (
  `user` int(10) NOT NULL,
  `room` char(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ev_joined_rooms`
--

INSERT INTO `ev_joined_rooms` (`user`, `room`) VALUES
(28, 'nuxo'),
(28, 'zxby'),
(33, 'qpic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_rooms`
--

CREATE TABLE `ev_rooms` (
  `id` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `contest` int(4) NOT NULL,
  `owner` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ev_rooms`
--

INSERT INTO `ev_rooms` (`id`, `contest`, `owner`) VALUES
('nuxo', 2022, 28),
('qpic', 2022, 33),
('zxby', 2021, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_songs`
--

CREATE TABLE `ev_songs` (
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `artist` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contest` int(4) NOT NULL,
  `country` char(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ev_songs`
--

INSERT INTO `ev_songs` (`title`, `artist`, `link`, `contest`, `country`) VALUES
('Sekret', 'Ronela Hajati', NULL, 2022, 'AL'),
('Snap', 'Rosa Linn', NULL, 2022, 'AM'),
('Halo', 'LUM!X feat. Pia Maria', NULL, 2022, 'AT'),
('Not The Same', 'Sheldon Riley', NULL, 2022, 'AU'),
('Fade To Black', 'Nadir Rustamli', NULL, 2022, 'AZ'),
('Miss You', 'Jérémie Makiese', NULL, 2022, 'BE'),
('Intention', 'Intelligent Music Project', NULL, 2022, 'BG'),
('Boys Do Cry', 'Marius Bear', NULL, 2022, 'CH'),
('Ela', 'Andromache', NULL, 2022, 'CY'),
('Lights Off', 'We Are Domi', NULL, 2022, 'CZ'),
('Rockstars', 'Malik Harris', NULL, 2022, 'DE'),
('The Show', 'REDDI', NULL, 2022, 'DK'),
('Hope', 'Stefan', NULL, 2022, 'EE'),
('SloMo', 'Chanel', NULL, 2022, 'ES'),
('Jezebel', 'The Rasmus', NULL, 2022, 'FI'),
('Fulenn', 'Alvan & Ahez', NULL, 2022, 'FR'),
('SPACE MAN', 'Sam Ryder', NULL, 2022, 'GB'),
('Lock Me In', 'Circus Mircus', NULL, 2022, 'GE'),
('Die Together', 'Amanda Georgiadi Tenfjord', NULL, 2022, 'GR'),
('Guilty Pleasure', 'Mia Dimšić', NULL, 2022, 'HR'),
('That\'s Rich', 'Brooke', NULL, 2022, 'IE'),
('I.M', 'Michael Ben David', NULL, 2022, 'IL'),
('Með Hækkandi Sól', 'Systur', NULL, 2022, 'IS'),
('Brividi', 'Mahmood & Blanco', NULL, 2022, 'IT'),
('Sentimentai', 'Monika Liu', NULL, 2022, 'LT'),
('Eat Your Salad', 'Citi Zēni', NULL, 2022, 'LV'),
('Trenulețul', 'Zdob şi Zdub & Fraţii Advahov', NULL, 2022, 'MD'),
('Breathe', 'Vladana', NULL, 2022, 'ME'),
('Circles', 'Andrea', NULL, 2022, 'MK'),
('I Am What I Am', 'Emma Muscat', NULL, 2022, 'MT'),
('De Diepte', 'S10', NULL, 2022, 'NL'),
('Give That Wolf A Banana', 'Subwoolfer', NULL, 2022, 'NO'),
('River', 'Ochman', NULL, 2022, 'PL'),
('Saudade, Saudade', 'MARO', NULL, 2022, 'PT'),
('Llámame', 'WRS', NULL, 2022, 'RO'),
('In Corpore Sano', 'Konstrakta', NULL, 2022, 'RS'),
('Hold Me Closer', 'Cornelia Jakobs', NULL, 2022, 'SE'),
('Disko', 'LPS', NULL, 2022, 'SI'),
('Stripper', 'Achille Lauro', NULL, 2022, 'SM'),
('Stefania', 'Kalush Orchestra', NULL, 2022, 'UA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_users`
--

CREATE TABLE `ev_users` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ev_users`
--

INSERT INTO `ev_users` (`id`, `name`) VALUES
(28, 'Pau'),
(33, 'ddd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_votes`
--

CREATE TABLE `ev_votes` (
  `room` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(10) NOT NULL,
  `country` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `points` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ev_votes`
--

INSERT INTO `ev_votes` (`room`, `user`, `country`, `points`) VALUES
('qpic', 33, 'MK', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f23fils`
--

CREATE TABLE `f23fils` (
  `id` int(11) NOT NULL,
  `titol` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `f23fils`
--

INSERT INTO `f23fils` (`id`, `titol`, `data`) VALUES
(3, 'No sé com fer una truita de patates!', '2023-01-17 10:45:18'),
(4, 'Algú te una recepta de gasptxo?', '2023-01-18 12:45:18'),
(5, 'Com cuinar un pollastre?!!', '2023-01-10 16:34:04'),
(6, 'Per què el lluç em queda sec?', '2023-01-12 18:46:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f23missatges`
--

CREATE TABLE `f23missatges` (
  `idmsg` int(11) NOT NULL,
  `missatge` text COLLATE utf8_unicode_ci NOT NULL,
  `moment` datetime NOT NULL,
  `autor` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `f23missatges`
--

INSERT INTO `f23missatges` (`idmsg`, `missatge`, `moment`, `autor`, `fil`) VALUES
(1, 'Algú em podria passar una recepta? Amb ceba o sense?!!!', '2023-01-17 11:05:00', 'david', 3),
(2, 'Aqui en va una!\r\n\r\nIngredients per a 4 persones\r\n\r\n6 ous ecològics\r\n2 cebes\r\n2 patates mitjanes per fregir tipus Agra, Kennebec, Monalisa (uns 500 g aprox)\r\nSal\r\nOli d’oliva verge extra\r\n\r\nPreparació de la truita de patates i ceba\r\n- Pelar la ceba i tallar-la en juliana fina.\r\n- Netejar i pelar les patates. Tallar-les per la meitat, després un altre cop per la meitat i finalment tallar-les a làmines fines. Han de quedar trossos més aviat petits i fins.\r\n- Posar abundant oli d’oliva en una paella d’uns 20-25 cm de diàmetre. Quan aquest comenci estar calent, però no gaire, afegir la patata i ceba i coure a foc lent amb la paella tapada, remenant de tant en tant. Coure durant uns 30 minuts, fins que la patata estigui cuita i veiem que es desfà fàcilment quan la toquem. Hem de confitar la patata, no fregir-la.\r\n- Quan quedin un parell de minuts per acabar la cocció de les patates i ceba, batre els ous suaument en un bol. No s’han de batre gaire, el punt just perquè es barregin bé els rovells i les clares.\r\n- Quan les patates i la ceba estiguin prou cuites, apagar el foc i colar-ho per retirar l’excés d’oli.\r\n- Afegir les patates i la ceba al bol dels ous i remenar, pressionant lleugerament les patates perquè es trenquin una mica. Deixar reposar la mescla 10 minuts. D’aquesta manera l’escalfor de les patates i la ceba començarà a quallar l’ou i ens servirà perquè l’interior de la nostra truita de patates i ceba quedi més cremós i sucós.\r\n- Passat aquest temps, salar al gust la barreja d’ous, patates i ceba.\r\n- Posar la paella de nou al foc amb una mica d’oli d’oliva. Quan estigui ben calenta, incorporar la barreja.\r\n- Coure la truita de patates i ceba 2 minuts a foc suau si la voleu sucosa (si la voleu més feta, coure-la 1 o 2 minuts més). Donar-li la volta amb l’ajuda d’un gira-truites i acabar de coure-la 2 minuts més. Vigilar la intensitat del foc: si és massa potent ens cremarà la truita de seguida i si és massa baix quedarà una truita sense gaire color. El temps final de cocció de la truita dependrà de les mesures que haguem fet servir (si hem fet servir més o menys quantitat), la mida de la paella i la intensitat del foc.\r\n- Per servir la truita de patates i ceba es pot acompanyar d’un parell de llesques de pa torrat amb tomàquet, oli i sal.', '2023-01-18 07:32:16', 'Lluis', 3),
(3, 'gràcies!!!', '2023-01-18 15:11:17', 'david', 3),
(4, 'M\'agradaria fer un pollastre per una celebració, alguna idea?', '2023-01-10 16:34:05', 'Anna', 5),
(5, 'Podries fer pollastre amb prunes i pinyons!', '2023-01-13 11:12:05', 'Clara', 5),
(6, 'Bona idea! gràcies!', '2023-01-15 14:21:33', 'anna', 5),
(7, 'Agú em pot passar una recepta de gaspatxo sense ceba??', '2023-01-18 12:45:20', 'Sònia', 4),
(8, 'No se per que, però sempre que faig llluça la forn sempre em queda sec...', '2023-01-13 11:22:59', 'Marc', 6),
(9, 'Quant de temps el cuines?', '2023-01-13 16:22:59', 'Lluiset', 6),
(10, '3 hores', '2023-01-15 11:24:27', 'Marc', 6),
(11, 'L\'hi tens una mica massa de temps :) Amb 45 minuts suficient per que quedi cuit i sucós ', '2023-01-17 04:35:27', 'Aina', 6),
(12, 'No, el gaspatxo sense ceba no és gaspatxo.', '2023-01-19 13:04:16', 'Pau', 4),
(13, 'Estic d\'acord.', '2023-01-19 13:05:07', 'Antonia', 4),
(14, 'No tindries pas una versió resumida, no Lluis? XD', '2023-01-19 13:31:54', 'Pau', 3),
(15, 'Bé depèn de la temperatura també no?', '2023-01-19 13:32:38', 'Pau', 6),
(16, 'me la copio també', '2023-01-19 13:33:15', 'Pau', 5),
(17, 'Bueno, massa tard, ja la he buscat por ahí.', '2023-01-19 13:57:48', 'Pau', 3),
(18, 'Ahi te veo Antoniaa', '2023-01-19 14:01:45', 'Pau', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `codigogrado` int(3) NOT NULL,
  `nombregrado` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`codigogrado`, `nombregrado`) VALUES
(1, 'Multimèdia'),
(2, 'Disseny i Desenvolupament de Videojocs'),
(3, 'Disseny, Animació i Art Digital'),
(4, 'Fotografia'),
(5, 'Enginyeria Informàtica'),
(6, 'Enginyeria Audiovisual'),
(7, 'Enginyeria de Telecomunicacions'),
(8, 'Belles Arts'),
(9, 'Física'),
(10, 'Matemàtiques');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `idmatricula` int(10) NOT NULL,
  `dnialumno` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `codigoasignatura` int(6) NOT NULL,
  `anyoacademico` varchar(7) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`idmatricula`, `dnialumno`, `codigoasignatura`, `anyoacademico`) VALUES
(1, '45678901F', 804025, '2020-21'),
(2, '45678901F', 804036, '2021-22'),
(3, '45678901F', 804037, '2021-22'),
(4, '97432567V', 804025, '2020-21'),
(5, '01023485N', 804036, '2021-22'),
(6, '60954846H', 804036, '2020-21'),
(7, '32493854K', 804112, '2020-21'),
(8, '32493854K', 804130, '2021-22'),
(9, '75643284B', 804232, '2020-21'),
(10, '97644544A', 804025, '2021-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `P02anuncios`
--

CREATE TABLE `P02anuncios` (
  `id` int(10) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `precio` float(6,2) NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `vendido` tinyint(1) NOT NULL,
  `fechahora` datetime NOT NULL,
  `categoria` int(4) NOT NULL,
  `propietario` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `P02anuncios`
--

INSERT INTO `P02anuncios` (`id`, `titulo`, `precio`, `descripcion`, `ip`, `vendido`, `fechahora`, `categoria`, `propietario`) VALUES
(1, 'Balón de futbol', 0.00, 'Balón no incluido', '123.166.189.55', 1, '1895-10-26 19:00:00', 1, 'a@gmail.com'),
(2, 'Chupete', 3.00, 'Chupete bastante lamido', '190.118.119.173', 1, '2022-09-01 04:00:00', 2, 'a@gmail.com'),
(3, 'Pala', 29.00, 'Una pala to wapa', '250.234.100.126', 0, '2022-10-01 12:00:00', 3, 'b@gmail.com'),
(4, 'Martillo', 30.00, 'Para clavar clavos y similares', '251.162.11.126', 1, '2020-07-07 04:08:59', 4, 'b@gmail.com'),
(5, 'Papel', 30.00, 'Hecho de papel se supone', '94.17.126.190', 0, '2020-07-09 16:08:59', 5, 'c@gmail.com'),
(6, 'Muñeca', 50.00, 'En principio no contiene ningún espíritu', '238.201.32.150', 1, '2020-11-06 05:07:59', 1, 'c@gmail.com'),
(7, 'Mobil LG', 255.00, 'Está nuevo, solo tiene la pantalla completamente destrozada', '38.131.43.44', 1, '2020-11-07 05:08:59', 2, 'd@gmail.com'),
(8, 'Cocina induccion', 300.00, 'Calienta cosas', '14.247.69.141', 1, '2020-06-07 15:08:59', 3, 'd@gmail.com'),
(9, 'Nintendo Switch', 499.99, 'Switch edición limitada', '145.96.243.114', 1, '2022-11-01 14:30:00', 4, 'e@gmail.com'),
(10, 'Pistola', 1260.45, 'A veces dispara cosas', '198.213.128.178', 0, '1990-03-23 00:10:44', 5, 'e@gmail.com'),
(31, 'Test', 0.00, 'Descripcion hahah', '93.176.184.125', 0, '2022-12-05 17:09:23', 5, 'pauguvi@gmail.com'),
(34, 'Testtttttt', 456.00, 'ttrtrterte', '147.83.144.2', 0, '2022-12-09 13:03:35', 4, 'pauguvi@gmail.com'),
(35, 'Ojo', 12.00, '<img src=\"https://images3.memedroid.com/images/UPLOADED98/5e89539dd4c47.jpeg\" width=\"100\" height=\"100\"/>', '147.83.144.2', 0, '2022-12-13 11:58:27', 2, 'pauguvi@gmail.com'),
(36, 'Hack', 0.00, '<script>window.location.href = \"https://www.youtube.com/watch?v=dQw4w9WgXcQ\";</script>', '147.83.144.2', 0, '2022-12-13 12:03:29', 1, 'pauguvi@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `P02categorias`
--

CREATE TABLE `P02categorias` (
  `id` int(4) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `orden` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `P02categorias`
--

INSERT INTO `P02categorias` (`id`, `nombre`, `orden`) VALUES
(1, 'Videojuegos', 1),
(2, 'Muebles', 2),
(3, 'Tecnología', 3),
(4, 'Papelería', 4),
(5, 'Téxtil', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `P02usuarios`
--

CREATE TABLE `P02usuarios` (
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `P02usuarios`
--

INSERT INTO `P02usuarios` (`email`, `nombre`) VALUES
('a@gmail.com', 'Andrea'),
('b@gmail.com', 'Beatriz'),
('c@gmail.com', 'Carlos'),
('d@gmail.com', 'David'),
('e@gmail.com', 'Erica'),
('pauguvi@gmail.com', 'Pau Guri');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `P02visualizaciones`
--

CREATE TABLE `P02visualizaciones` (
  `id` int(15) NOT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `fechahora` datetime NOT NULL,
  `useragent` text COLLATE utf8_unicode_ci NOT NULL,
  `anuncio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `P02visualizaciones`
--

INSERT INTO `P02visualizaciones` (`id`, `ip`, `fechahora`, `useragent`, `anuncio`) VALUES
(1, '252.208.130.59', '2022-12-01 23:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 1),
(2, '101.138.173.36', '2022-12-01 23:56:00', 'Mozilla/5.0 (Linux; Android 7.1.2; AFTMM \r\nBuild/NS6264; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36', 2),
(3, '139.47.172.36', '2022-12-04 07:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 3),
(4, '151.218.108.242', '2022-12-10 15:45:00', 'Mozilla/5.0 (Linux; Android 7.1.2; AFTMM \r\nBuild/NS6264; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36', 4),
(5, '181.132.19.40', '2023-02-02 14:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 5),
(6, '49.51.116.91', '2022-10-27 13:45:00', 'Mozilla/5.0 (Linux; Android 7.1.2; AFTMM \r\nBuild/NS6264; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36', 6),
(7, '252.208.130.59', '2022-05-01 23:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 7),
(8, '101.138.173.36', '2022-02-01 23:56:00', 'Mozilla/5.0 (Linux; Android 7.1.2; AFTMM \r\nBuild/NS6264; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36', 8),
(9, '139.47.172.36', '2022-10-04 07:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 9),
(10, '151.218.108.242', '2022-08-10 15:45:00', 'Mozilla/5.0 (Linux; Android 7.1.2; AFTMM \r\nBuild/NS6264; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36', 10),
(23, '93.176.184.125', '2022-12-05 13:32:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(24, '93.176.184.125', '2022-12-05 13:32:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(25, '93.176.184.125', '2022-12-05 13:36:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(26, '93.176.184.125', '2022-12-05 13:36:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(27, '93.176.184.125', '2022-12-05 13:36:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(28, '93.176.184.125', '2022-12-05 13:37:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(29, '93.176.184.125', '2022-12-05 13:37:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(30, '93.176.184.125', '2022-12-05 13:37:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(31, '93.176.184.125', '2022-12-05 13:38:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(32, '93.176.184.125', '2022-12-05 13:38:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(33, '93.176.184.125', '2022-12-05 13:38:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(34, '93.176.184.125', '2022-12-05 13:41:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(35, '93.176.184.125', '2022-12-05 13:41:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(36, '93.176.184.125', '2022-12-05 13:41:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(37, '93.176.184.125', '2022-12-05 13:41:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(38, '93.176.184.125', '2022-12-05 17:12:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(41, '93.176.184.125', '2022-12-05 17:20:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(42, '93.176.184.125', '2022-12-05 17:20:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(44, '93.176.184.125', '2022-12-05 17:24:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(45, '93.176.184.125', '2022-12-06 11:23:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(46, '93.176.184.125', '2022-12-06 11:24:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(47, '93.176.184.125', '2022-12-06 11:25:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(48, '93.176.184.125', '2022-12-06 11:53:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(49, '93.176.184.125', '2022-12-06 11:53:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(50, '93.176.184.125', '2022-12-06 12:30:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(51, '147.83.144.2', '2022-12-07 14:21:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(52, '147.83.144.2', '2022-12-07 14:21:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(53, '147.83.144.2', '2022-12-07 15:35:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(54, '147.83.144.2', '2022-12-07 15:35:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(55, '147.83.144.2', '2022-12-07 15:35:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(56, '147.83.144.2', '2022-12-07 15:46:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(57, '147.83.144.2', '2022-12-07 15:46:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(58, '147.83.144.2', '2022-12-07 15:47:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(59, '147.83.144.2', '2022-12-07 15:47:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(60, '147.83.144.2', '2022-12-07 15:49:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(61, '147.83.144.2', '2022-12-09 13:03:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(62, '147.83.144.2', '2022-12-09 13:03:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(63, '147.83.144.2', '2022-12-09 13:03:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(64, '147.83.144.2', '2022-12-09 13:03:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(65, '147.83.144.2', '2022-12-09 13:03:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(66, '147.83.144.2', '2022-12-09 13:03:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(67, '147.83.144.2', '2022-12-09 13:03:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(68, '147.83.144.2', '2022-12-09 13:03:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(69, '147.83.144.2', '2022-12-09 13:04:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(70, '147.83.144.2', '2022-12-09 13:04:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(71, '147.83.144.2', '2022-12-09 13:04:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(72, '147.83.144.2', '2022-12-09 13:26:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(73, '147.83.144.2', '2022-12-12 08:30:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(74, '147.83.144.2', '2022-12-12 08:30:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(75, '147.83.144.2', '2022-12-12 08:30:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(76, '147.83.144.2', '2022-12-12 08:30:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(77, '147.83.144.2', '2022-12-12 08:30:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(78, '147.83.144.2', '2022-12-12 08:30:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(79, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(80, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(81, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(82, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(83, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(84, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(85, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(86, '147.83.144.2', '2022-12-12 08:30:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(87, '147.83.144.2', '2022-12-12 08:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(88, '147.83.144.2', '2022-12-12 08:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(89, '147.83.144.2', '2022-12-12 08:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(90, '147.83.144.2', '2022-12-12 08:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(91, '147.83.144.2', '2022-12-12 08:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(92, '147.83.144.2', '2022-12-12 08:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(93, '147.83.144.2', '2022-12-12 08:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(94, '147.83.144.2', '2022-12-12 08:30:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(95, '147.83.144.2', '2022-12-12 08:30:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(96, '147.83.144.2', '2022-12-12 08:30:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(97, '147.83.144.2', '2022-12-12 08:30:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(98, '147.83.144.2', '2022-12-12 08:30:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(99, '147.83.144.2', '2022-12-12 08:30:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(100, '147.83.144.2', '2022-12-12 08:30:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(101, '147.83.144.2', '2022-12-12 08:30:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(102, '147.83.144.2', '2022-12-12 08:30:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(103, '147.83.144.2', '2022-12-12 08:30:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(104, '147.83.144.2', '2022-12-12 08:30:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(105, '147.83.144.2', '2022-12-12 08:30:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(106, '147.83.144.2', '2022-12-12 08:30:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(107, '147.83.144.2', '2022-12-12 08:30:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(108, '147.83.144.2', '2022-12-12 08:30:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(109, '147.83.144.2', '2022-12-12 08:30:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(110, '147.83.144.2', '2022-12-12 08:30:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(111, '147.83.144.2', '2022-12-12 08:30:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(112, '147.83.144.2', '2022-12-12 08:30:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(113, '147.83.144.2', '2022-12-12 08:30:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(114, '147.83.144.2', '2022-12-12 08:30:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(115, '147.83.144.2', '2022-12-12 08:30:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(116, '147.83.144.2', '2022-12-12 08:30:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(117, '147.83.144.2', '2022-12-12 08:30:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(118, '147.83.144.2', '2022-12-12 08:30:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(119, '147.83.144.2', '2022-12-12 08:30:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(120, '147.83.144.2', '2022-12-12 08:31:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(121, '147.83.144.2', '2022-12-12 08:31:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(122, '147.83.144.2', '2022-12-12 08:31:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(123, '147.83.144.2', '2022-12-12 08:31:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(124, '147.83.144.2', '2022-12-12 08:31:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(125, '147.83.144.2', '2022-12-12 08:31:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(126, '147.83.144.2', '2022-12-12 08:31:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(127, '147.83.144.2', '2022-12-12 08:31:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(128, '147.83.144.2', '2022-12-12 08:31:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(129, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(130, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(131, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(132, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(133, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(134, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(135, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(136, '147.83.144.2', '2022-12-12 08:31:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(137, '147.83.144.2', '2022-12-12 08:31:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(138, '147.83.144.2', '2022-12-12 08:31:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(139, '147.83.144.2', '2022-12-12 08:31:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(140, '147.83.144.2', '2022-12-12 08:31:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(141, '147.83.144.2', '2022-12-12 08:31:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(142, '147.83.144.2', '2022-12-12 08:31:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(143, '147.83.144.2', '2022-12-12 08:31:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(144, '147.83.144.2', '2022-12-12 08:31:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(145, '147.83.144.2', '2022-12-12 08:31:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(146, '147.83.144.2', '2022-12-12 08:31:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(147, '147.83.144.2', '2022-12-12 08:31:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(148, '147.83.144.2', '2022-12-12 08:31:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(149, '147.83.144.2', '2022-12-12 08:31:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(150, '147.83.144.2', '2022-12-12 08:31:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(151, '147.83.144.2', '2022-12-12 08:31:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(152, '147.83.144.2', '2022-12-12 08:31:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(153, '147.83.144.2', '2022-12-12 08:31:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(154, '147.83.144.2', '2022-12-12 08:31:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(155, '147.83.144.2', '2022-12-12 08:31:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(156, '147.83.144.2', '2022-12-12 08:31:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(157, '147.83.144.2', '2022-12-12 08:31:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(158, '147.83.144.2', '2022-12-12 08:31:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(159, '147.83.144.2', '2022-12-12 08:31:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(160, '147.83.144.2', '2022-12-12 08:31:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(161, '147.83.144.2', '2022-12-12 08:31:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(162, '147.83.144.2', '2022-12-12 08:31:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(163, '147.83.144.2', '2022-12-12 08:31:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(164, '147.83.144.2', '2022-12-12 08:31:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(165, '147.83.144.2', '2022-12-12 08:31:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(166, '147.83.144.2', '2022-12-12 08:31:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(167, '147.83.144.2', '2022-12-12 08:31:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(168, '147.83.144.2', '2022-12-12 08:31:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(169, '147.83.144.2', '2022-12-12 08:31:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(170, '147.83.144.2', '2022-12-12 08:31:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(171, '147.83.144.2', '2022-12-12 08:31:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(172, '147.83.144.2', '2022-12-12 08:31:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(173, '147.83.144.2', '2022-12-12 08:31:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(174, '147.83.144.2', '2022-12-12 08:31:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(175, '147.83.144.2', '2022-12-12 08:31:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(176, '147.83.144.2', '2022-12-12 08:31:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(177, '147.83.144.2', '2022-12-12 08:31:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(178, '147.83.144.2', '2022-12-12 08:31:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(179, '147.83.144.2', '2022-12-12 08:31:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(180, '147.83.144.2', '2022-12-12 08:31:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(181, '147.83.144.2', '2022-12-12 08:31:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(182, '147.83.144.2', '2022-12-12 08:31:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(183, '147.83.144.2', '2022-12-12 08:31:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(184, '147.83.144.2', '2022-12-12 08:31:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(185, '147.83.144.2', '2022-12-12 08:31:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(186, '147.83.144.2', '2022-12-12 08:31:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(187, '147.83.144.2', '2022-12-12 08:31:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(188, '147.83.144.2', '2022-12-12 08:31:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(189, '147.83.144.2', '2022-12-12 08:31:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(190, '147.83.144.2', '2022-12-12 08:31:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(191, '147.83.144.2', '2022-12-12 08:31:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(192, '147.83.144.2', '2022-12-12 08:31:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(193, '147.83.144.2', '2022-12-12 08:31:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(194, '147.83.144.2', '2022-12-12 08:31:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(195, '147.83.144.2', '2022-12-12 08:31:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(196, '147.83.144.2', '2022-12-12 08:31:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(197, '147.83.144.2', '2022-12-12 08:31:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(198, '147.83.144.2', '2022-12-12 08:31:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(199, '147.83.144.2', '2022-12-12 08:31:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(200, '147.83.144.2', '2022-12-12 08:31:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(201, '147.83.144.2', '2022-12-12 08:31:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(202, '147.83.144.2', '2022-12-12 08:31:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(203, '147.83.144.2', '2022-12-12 08:31:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(204, '147.83.144.2', '2022-12-12 08:31:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(205, '147.83.144.2', '2022-12-12 08:31:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(206, '147.83.144.2', '2022-12-12 08:31:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(207, '147.83.144.2', '2022-12-12 08:31:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(208, '147.83.144.2', '2022-12-12 08:31:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(209, '147.83.144.2', '2022-12-12 08:31:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(210, '147.83.144.2', '2022-12-12 08:31:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(211, '147.83.144.2', '2022-12-12 08:31:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(212, '147.83.144.2', '2022-12-12 08:31:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(213, '147.83.144.2', '2022-12-12 08:31:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(214, '147.83.144.2', '2022-12-12 08:31:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(215, '147.83.144.2', '2022-12-12 08:31:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(216, '147.83.144.2', '2022-12-12 08:31:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(217, '147.83.144.2', '2022-12-12 08:31:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(218, '147.83.144.2', '2022-12-12 08:31:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(219, '147.83.144.2', '2022-12-12 08:31:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(220, '147.83.144.2', '2022-12-12 08:31:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(221, '147.83.144.2', '2022-12-12 08:31:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(222, '147.83.144.2', '2022-12-12 08:31:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(223, '147.83.144.2', '2022-12-12 08:31:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(224, '147.83.144.2', '2022-12-12 08:31:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(225, '147.83.144.2', '2022-12-12 08:31:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(226, '147.83.144.2', '2022-12-12 08:31:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(227, '147.83.144.2', '2022-12-12 08:31:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(228, '147.83.144.2', '2022-12-12 08:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(229, '147.83.144.2', '2022-12-12 08:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(230, '147.83.144.2', '2022-12-12 08:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(231, '147.83.144.2', '2022-12-12 08:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(232, '147.83.144.2', '2022-12-12 08:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(233, '147.83.144.2', '2022-12-12 08:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(234, '147.83.144.2', '2022-12-12 08:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(235, '147.83.144.2', '2022-12-12 08:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(236, '147.83.144.2', '2022-12-12 08:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(237, '147.83.144.2', '2022-12-12 08:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(238, '147.83.144.2', '2022-12-12 08:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(239, '147.83.144.2', '2022-12-12 08:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(240, '147.83.144.2', '2022-12-12 08:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(241, '147.83.144.2', '2022-12-12 08:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(242, '147.83.144.2', '2022-12-12 08:31:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(243, '147.83.144.2', '2022-12-12 08:31:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(244, '147.83.144.2', '2022-12-12 08:31:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(245, '147.83.144.2', '2022-12-12 08:31:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(246, '147.83.144.2', '2022-12-12 08:31:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(247, '147.83.144.2', '2022-12-12 08:31:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(248, '147.83.144.2', '2022-12-12 08:31:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(249, '147.83.144.2', '2022-12-12 08:31:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(250, '147.83.144.2', '2022-12-12 08:31:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(251, '147.83.144.2', '2022-12-12 08:31:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(252, '147.83.144.2', '2022-12-12 08:31:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(253, '147.83.144.2', '2022-12-12 08:31:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(254, '147.83.144.2', '2022-12-12 08:31:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(255, '147.83.144.2', '2022-12-12 08:31:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(256, '147.83.144.2', '2022-12-12 08:31:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(257, '147.83.144.2', '2022-12-12 08:31:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(258, '147.83.144.2', '2022-12-12 08:31:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(259, '147.83.144.2', '2022-12-12 08:31:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(260, '147.83.144.2', '2022-12-12 08:31:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(261, '147.83.144.2', '2022-12-12 08:31:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(262, '147.83.144.2', '2022-12-12 08:31:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(263, '147.83.144.2', '2022-12-12 08:31:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(264, '147.83.144.2', '2022-12-12 08:31:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(265, '147.83.144.2', '2022-12-12 08:31:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(266, '147.83.144.2', '2022-12-12 08:31:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(267, '147.83.144.2', '2022-12-12 08:31:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(268, '147.83.144.2', '2022-12-12 08:31:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(269, '147.83.144.2', '2022-12-12 08:31:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(270, '147.83.144.2', '2022-12-12 08:31:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(271, '147.83.144.2', '2022-12-12 08:31:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(272, '147.83.144.2', '2022-12-12 08:31:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(273, '147.83.144.2', '2022-12-12 08:31:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(274, '147.83.144.2', '2022-12-12 08:31:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(275, '147.83.144.2', '2022-12-12 08:31:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(276, '147.83.144.2', '2022-12-12 08:31:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(277, '147.83.144.2', '2022-12-12 08:31:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(278, '147.83.144.2', '2022-12-12 08:31:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(279, '147.83.144.2', '2022-12-12 08:31:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(280, '147.83.144.2', '2022-12-12 08:31:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(281, '147.83.144.2', '2022-12-12 08:31:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(282, '147.83.144.2', '2022-12-12 08:31:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(283, '147.83.144.2', '2022-12-12 08:31:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(284, '147.83.144.2', '2022-12-12 08:31:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(285, '147.83.144.2', '2022-12-12 08:31:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(286, '147.83.144.2', '2022-12-12 08:31:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(287, '147.83.144.2', '2022-12-12 08:31:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(288, '147.83.144.2', '2022-12-12 08:31:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(289, '147.83.144.2', '2022-12-12 08:31:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(290, '147.83.144.2', '2022-12-12 08:31:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(291, '147.83.144.2', '2022-12-12 08:31:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(292, '147.83.144.2', '2022-12-12 08:31:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(293, '147.83.144.2', '2022-12-12 08:31:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(294, '147.83.144.2', '2022-12-12 08:31:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(295, '147.83.144.2', '2022-12-12 08:31:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(296, '147.83.144.2', '2022-12-12 08:31:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(297, '147.83.144.2', '2022-12-12 08:31:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(298, '147.83.144.2', '2022-12-12 08:31:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(299, '147.83.144.2', '2022-12-12 08:31:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(300, '147.83.144.2', '2022-12-12 08:31:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(301, '147.83.144.2', '2022-12-12 08:31:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(302, '147.83.144.2', '2022-12-12 08:31:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(303, '147.83.144.2', '2022-12-12 08:31:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(304, '147.83.144.2', '2022-12-12 08:31:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(305, '147.83.144.2', '2022-12-12 08:31:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(306, '147.83.144.2', '2022-12-12 08:31:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(307, '147.83.144.2', '2022-12-12 08:31:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(308, '147.83.144.2', '2022-12-12 08:31:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(309, '147.83.144.2', '2022-12-12 08:31:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(310, '147.83.144.2', '2022-12-12 08:31:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34),
(311, '147.83.144.2', '2022-12-12 08:31:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(312, '147.83.144.2', '2022-12-12 08:31:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(313, '147.83.144.2', '2022-12-12 08:31:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(314, '147.83.144.2', '2022-12-12 08:31:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(315, '147.83.144.2', '2022-12-12 08:31:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(316, '147.83.144.2', '2022-12-12 08:31:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(317, '147.83.144.2', '2022-12-12 08:31:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(318, '147.83.144.2', '2022-12-12 08:31:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(319, '147.83.144.2', '2022-12-12 08:31:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(320, '147.83.144.2', '2022-12-12 08:31:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5);
INSERT INTO `P02visualizaciones` (`id`, `ip`, `fechahora`, `useragent`, `anuncio`) VALUES
(321, '147.83.144.2', '2022-12-12 08:31:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(322, '147.83.144.2', '2022-12-12 08:31:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(323, '147.83.144.2', '2022-12-12 08:31:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(324, '147.83.144.2', '2022-12-12 08:31:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(325, '147.83.144.2', '2022-12-12 08:31:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(326, '147.83.144.2', '2022-12-12 08:31:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(327, '147.83.144.2', '2022-12-12 08:31:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(328, '147.83.144.2', '2022-12-12 08:31:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(329, '147.83.144.2', '2022-12-12 08:31:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(330, '147.83.144.2', '2022-12-12 08:31:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(331, '147.83.144.2', '2022-12-12 08:31:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(332, '147.83.144.2', '2022-12-12 08:31:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(333, '147.83.144.2', '2022-12-12 08:31:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(334, '147.83.144.2', '2022-12-12 08:31:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(335, '147.83.144.2', '2022-12-12 08:31:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(336, '147.83.144.2', '2022-12-12 08:31:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(337, '147.83.144.2', '2022-12-12 08:31:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(338, '147.83.144.2', '2022-12-12 08:31:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(339, '147.83.144.2', '2022-12-12 08:31:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(340, '147.83.144.2', '2022-12-12 08:31:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(341, '147.83.144.2', '2022-12-12 08:31:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(342, '147.83.144.2', '2022-12-12 08:31:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(343, '147.83.144.2', '2022-12-12 08:31:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(344, '147.83.144.2', '2022-12-12 08:31:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(345, '147.83.144.2', '2022-12-12 08:31:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(346, '147.83.144.2', '2022-12-12 08:31:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(347, '147.83.144.2', '2022-12-12 08:31:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(348, '147.83.144.2', '2022-12-12 08:31:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(349, '147.83.144.2', '2022-12-12 08:31:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(350, '147.83.144.2', '2022-12-12 08:31:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(351, '147.83.144.2', '2022-12-12 08:31:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(352, '147.83.144.2', '2022-12-12 08:31:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(353, '147.83.144.2', '2022-12-12 08:31:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(354, '147.83.144.2', '2022-12-12 08:31:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(355, '147.83.144.2', '2022-12-12 08:31:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(356, '147.83.144.2', '2022-12-12 08:31:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(357, '147.83.144.2', '2022-12-12 08:31:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(358, '147.83.144.2', '2022-12-12 08:31:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(359, '147.83.144.2', '2022-12-12 08:31:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(360, '147.83.144.2', '2022-12-12 08:31:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(361, '147.83.144.2', '2022-12-12 08:31:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(362, '147.83.144.2', '2022-12-12 08:31:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(363, '147.83.144.2', '2022-12-12 08:31:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(364, '147.83.144.2', '2022-12-12 08:31:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(365, '147.83.144.2', '2022-12-12 08:31:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(366, '147.83.144.2', '2022-12-12 08:31:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(367, '147.83.144.2', '2022-12-12 08:31:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(368, '147.83.144.2', '2022-12-12 08:31:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(369, '147.83.144.2', '2022-12-12 08:32:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(370, '147.83.144.2', '2022-12-12 08:32:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(371, '147.83.144.2', '2022-12-12 08:32:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(372, '147.83.144.2', '2022-12-12 08:32:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(373, '147.83.144.2', '2022-12-12 08:32:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(374, '147.83.144.2', '2022-12-12 08:32:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(375, '147.83.144.2', '2022-12-12 08:32:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(376, '147.83.144.2', '2022-12-12 08:32:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(377, '147.83.144.2', '2022-12-12 08:32:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(378, '147.83.144.2', '2022-12-12 08:32:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(379, '147.83.144.2', '2022-12-12 08:32:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(380, '147.83.144.2', '2022-12-12 08:32:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(381, '147.83.144.2', '2022-12-12 08:32:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(382, '147.83.144.2', '2022-12-12 08:32:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(383, '147.83.144.2', '2022-12-12 08:32:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(384, '147.83.144.2', '2022-12-12 08:32:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(385, '147.83.144.2', '2022-12-12 08:32:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(386, '147.83.144.2', '2022-12-12 08:32:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(387, '147.83.144.2', '2022-12-12 08:32:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(388, '147.83.144.2', '2022-12-12 08:32:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(389, '147.83.144.2', '2022-12-12 08:32:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(390, '147.83.144.2', '2022-12-12 08:32:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(391, '147.83.144.2', '2022-12-12 08:32:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(392, '147.83.144.2', '2022-12-12 08:32:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(393, '147.83.144.2', '2022-12-12 08:32:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(394, '147.83.144.2', '2022-12-12 08:32:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(395, '147.83.144.2', '2022-12-12 08:32:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(396, '147.83.144.2', '2022-12-12 08:32:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(397, '147.83.144.2', '2022-12-12 08:32:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(398, '147.83.144.2', '2022-12-12 08:32:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(399, '147.83.144.2', '2022-12-13 10:17:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 31),
(400, '147.83.144.2', '2022-12-13 10:17:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 5),
(401, '147.83.144.2', '2022-12-13 10:17:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 10),
(402, '147.83.144.2', '2022-12-13 10:17:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 3),
(403, '147.83.144.2', '2022-12-13 11:58:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 35),
(404, '147.83.144.2', '2022-12-13 12:01:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 35),
(405, '147.83.144.2', '2022-12-13 12:03:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 36),
(406, '147.83.144.2', '2022-12-13 12:04:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 36),
(407, '147.83.144.2', '2022-12-13 12:04:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p1empreses`
--

CREATE TABLE `p1empreses` (
  `nif` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `adreca` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `poblacio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `provincia` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` int(4) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `p1empreses`
--

INSERT INTO `p1empreses` (`nif`, `nom`, `adreca`, `poblacio`, `provincia`, `telefon`, `email`) VALUES
('44455666F', 'Sociality games', 'Igualtat 33', 'Terrassa', 'Barcelona', 931112233, 'sky@skygames.com'),
('7778899G', 'TaxiApp', 'Volta 232', 'Terrassa', 'Barcelona', 936688877, 'info@taxiapp.cat'),
('77885522X', 'Menjar a casa', 'Plaça Catalunya 7', 'Banyoles', 'Girona', 9725566, 'menjar@acasa.cat'),
('986354678G', 'Fotolog', 'Vinyals 76', 'Tarragona', 'Tarragona', 97156565, 'fotolog@historic.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p1ofertes`
--

CREATE TABLE `p1ofertes` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `descripcio` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dedicacio` int(4) NOT NULL,
  `places` int(4) NOT NULL,
  `empresa` varchar(12) COLLATE utf8_bin NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `p1ofertes`
--

INSERT INTO `p1ofertes` (`id`, `nom`, `descripcio`, `dedicacio`, `places`, `empresa`, `data`) VALUES
(1, 'Necessitem artista digital', 'Amb interès pel disseny d\'escenaris', 300, 1, '44455666F', '2022-10-17'),
(2, 'Programador Unity', 'Que li agradi desenvolupar eines', 1000, 2, '44455666F', '2022-11-01'),
(4, 'Busquem dissenyadors d\'interficie', 'Que tingui interès en disseny UI i UX.', 100, 5, '7778899G', '2022-10-24'),
(5, 'Busquem dissenyadors de dades', 'Per redissenyar la nostra app', 500, 3, '77885522X', '2022-11-04'),
(6, 'Perfil programador Unity', 'Busquem un programador de Unity que ens ajudi a programar en Unity.', 400, 1, '44455666F', '2022-11-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s7noticias`
--

CREATE TABLE `s7noticias` (
  `id` int(4) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `resumen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `s7noticias`
--

INSERT INTO `s7noticias` (`id`, `titulo`, `imagen`, `link`, `fecha`, `resumen`) VALUES
(4, 'Kai Caire, Elena Fernández i Aamna Noor Syed guanyen la Beca CITM a l’Excel·lència Acadèmica', 'https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/GuanyadorsBeca-5.jpg', 'https://www.citm.upc.edu/blog/kai-caire-elena-fernandez-i-aamna-noor-syed-guanyadors-de-la-beca-citm-a-lexcel%c2%b7lencia-academica/?lang=ca', '2022-10-22', 'Kai Caire, Elena Fernández i Aamna Noor Syed són els tres joves estudiants que han rebut la beca CITM a l’excel·lència acadèmica per iniciar els seus estudis al Centre de la Imatge i la Tecnologia Multimèdia aquest curs 2022-2023. Kai Caire Castellsegué comença el grau en Disseny i Desenvolupament de Videojocs a Barcelona, Elena Fernández León el grau en Multimèdia i Aamna Noor Syed Shahzadi inicia el grau en Disseny, Animació i Art Digital.'),
(5, 'Eva Villegas i Maria Pagès, noves professores PDI del CITM', 'https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/ProfessoresCITM-2048x1323.jpg', 'https://www.citm.upc.edu/blog/eva-villegas-i-maria-pages-noves-professores-pdi-del-citm/?lang=ca', '2022-10-24', 'El Centre de la Imatge i la Tecnologia Multimèdia continua treballant per incorporar cada nou curs el millor talent al seu equip docent. Aquest curs acadèmic 2022-2023, Eva Villegas i Maria Pagès són les noves professores que s’integren a l’equip de Personal Docent i Investigador (PDI) per donar una nova empenta a les àrees de coordinació acadèmica i de recerca del Centre.'),
(6, 'La professora Carolina López, comissària del festival internacional ANIMARIO 2022', 'https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/Animario-1.jpg', 'https://www.citm.upc.edu/blog/la-professora-carolina-lopez-comissaria-del-festival-internacional-animario-2022/?lang=ca', '2022-10-20', 'Carolina López és professora i investigadora del CITM, a més d’una de les especialistes més respectades del món de l’animació. Des de la seva creació, fa 5 anys, és la comissària d’ANIMARIO, el Festival Internacional d’Animació Contemporània de Madrid, que se celebrarà del 20 al 23 d’octubre al centre cultural Matadero Madrid.'),
(7, 'Gerard Pasqual apropa els projectes de Marvel als estudiants del CITM', 'https://www.citm.upc.edu/blog/wp-content/uploads/2022/10/Pasqual.jpg', 'https://www.citm.upc.edu/blog/gerard-pasqual-apropa-els-projectes-de-marvel-als-estudiants-del-citm-2/?lang=ca', '2022-10-06', 'El 3 d’octubre, els estudiants de l’assignatura Animació Avançada van tenir el plaer d’assistir a una ponència de Gerard Pasqual Gill, creature FX a Trixter.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `S7_anuncios`
--

CREATE TABLE `S7_anuncios` (
  `id` int(10) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `precio` float(9,2) NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ip` bit(32) NOT NULL,
  `vendido` tinyint(1) NOT NULL,
  `fechahora` datetime NOT NULL,
  `categoria` int(10) NOT NULL,
  `propietario` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `S7_anuncios`
--

INSERT INTO `S7_anuncios` (`id`, `titulo`, `precio`, `descripcion`, `ip`, `vendido`, `fechahora`, `categoria`, `propietario`) VALUES
(1, 'Pala', 29.00, 'Una pala to wapa', b'01001011001001101111001101101100', 0, '2022-10-01 12:00:00', 10, 'b@gmail.com'),
(2, 'Nintendo Switch', 499.99, 'Switch edición limitada', b'01111111111111111111111111111111', 1, '2022-11-01 14:30:00', 1, 'e@gmail.com'),
(4, 'Chupete', 3.00, 'Chupete bastante lamido', b'00100110101101101001010011010011', 1, '2022-09-01 04:00:00', 8, 'a@gmail.com'),
(5, 'Pistola', 1260.45, 'A veces dispara cosas', b'01101001011111011000101101100101', 0, '1990-03-23 00:10:44', 2, 'd@gmail.com'),
(6, 'Balón de futbol', 0.00, 'Balón no incluido', b'01110001110001110001110001110001', 1, '1895-10-26 19:00:00', 9, 'f@gmail.com'),
(7, 'Mobil LG', 255.00, 'Bring a spring upon blow the man down spanker Shiverooo uuu', b'00001010000000000000010000000001', 1, '2020-11-07 05:08:59', 3, 'b@gmail.com'),
(8, 'Muñeca rosa', 50.00, 'Bring a spring upon blow hiverooo uuu', b'00001010000000000000010000000001', 1, '2020-11-06 05:07:59', 8, 'b@gmail.com'),
(9, 'Martillo', 30.00, 'Prow scuttle parrel provost', b'00001010000000000000001000000000', 1, '2020-07-07 04:08:59', 6, 'e@gmail.com'),
(10, 'Papel', 30.00, 'Prow scuttle parrel', b'00001010000000000000001000000000', 0, '2020-07-09 16:08:59', 4, 'e@gmail.com'),
(11, 'Cocina induccion', 300.00, 'Unuhvyg sexzyerzr', b'00001010000000000000100000000000', 1, '2020-06-07 15:08:59', 2, 'a@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `S7_categorias`
--

CREATE TABLE `S7_categorias` (
  `id` int(10) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `S7_categorias`
--

INSERT INTO `S7_categorias` (`id`, `nombre`) VALUES
(1, 'Videojuegos'),
(2, 'Hogar'),
(3, 'Tecnología'),
(4, 'Papelería'),
(5, 'Téxtil'),
(6, 'Muebles'),
(7, 'Automóviles'),
(8, 'Bebés'),
(9, 'Deportes'),
(10, 'Jardinería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `S7_usuarios`
--

CREATE TABLE `S7_usuarios` (
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `S7_usuarios`
--

INSERT INTO `S7_usuarios` (`email`, `nombre`) VALUES
('a@gmail.com', 'Antonio'),
('b@gmail.com', 'Beatriz'),
('c@gmail.com', 'Carlos'),
('d@gmail.com', 'David Poyol'),
('e@gmail.com', 'Erica'),
('f@gmail.com', 'Félix'),
('g@gmail.com', 'Gloria'),
('h@gmail.com', 'Helena'),
('i@gmail.com', 'Ignacio'),
('j@gmail.com', 'José');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `S7_visualizaciones`
--

CREATE TABLE `S7_visualizaciones` (
  `id` int(10) NOT NULL,
  `ip` bit(32) NOT NULL,
  `fechahora` datetime NOT NULL,
  `useragent` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `anuncio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `S7_visualizaciones`
--

INSERT INTO `S7_visualizaciones` (`id`, `ip`, `fechahora`, `useragent`, `anuncio`) VALUES
(1, b'01111111111111111111111111111111', '2022-12-01 23:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 5),
(2, b'01111111111111111111111111111111', '2022-12-01 23:56:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 4),
(3, b'01111111111111111111111111111111', '2022-12-04 07:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 1),
(4, b'01111111111111111111111111111111', '2022-12-10 15:45:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 5),
(5, b'01111111111111111111111111111111', '2023-02-02 14:00:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 2),
(6, b'00100100101110011010010011101111', '2022-10-27 13:45:00', 'Mozilla/5.0 (Linux; Android 7.1.2; AFTMM \r\nBuild/NS6264; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s13archivos`
--

CREATE TABLE `s13archivos` (
  `idarchivo` int(4) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tamano` int(11) NOT NULL,
  `mime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fechahora` datetime NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `s13archivos`
--

INSERT INTO `s13archivos` (`idarchivo`, `nombre`, `tamano`, `mime`, `fechahora`, `descripcion`, `email`) VALUES
(2, 'upload/20221215140831.jpeg', 22844, 'image/jpeg', '2022-12-15 14:08:31', 'Mucho Queso', 'pauguvi@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s14comandes`
--

CREATE TABLE `s14comandes` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `propietari` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s14prodscoms`
--

CREATE TABLE `s14prodscoms` (
  `id` int(11) NOT NULL,
  `comanda` int(11) NOT NULL,
  `producte` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s14prodspacks`
--

CREATE TABLE `s14prodspacks` (
  `id` int(4) NOT NULL,
  `productes` int(4) NOT NULL,
  `quantitat` int(4) NOT NULL,
  `preu` float(5,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `s14prodspacks`
--

INSERT INTO `s14prodspacks` (`id`, `productes`, `quantitat`, `preu`) VALUES
(1, 1, 6, 11.00),
(2, 1, 12, 19.00),
(3, 2, 6, 15.00),
(4, 2, 12, 27.00),
(5, 3, 6, 8.00),
(6, 3, 12, 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s14productes`
--

CREATE TABLE `s14productes` (
  `id` int(4) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `descripcio` text NOT NULL,
  `preu` float(5,2) DEFAULT NULL,
  `imatge` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `s14productes`
--

INSERT INTO `s14productes` (`id`, `nom`, `descripcio`, `preu`, `imatge`) VALUES
(1, 'Blood Orange', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum, enim itaque. Nihil adipisci dolor odit incidunt in quas cumque doloribus corrupti voluptatem error, numquam, sapiente iste repellat, hic amet veritatis.', 1.99, 'assets/orange.png'),
(2, 'Banana', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum, enim itaque. Nihil adipisci dolor odit incidunt in quas cumque doloribus corrupti voluptatem error, numquam, sapiente iste repellat, hic amet veritatis.', 2.59, 'assets/banana.png'),
(3, 'Apple', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum, enim itaque. Nihil adipisci dolor odit incidunt in quas cumque doloribus corrupti voluptatem error, numquam, sapiente iste repellat, hic amet veritatis.', 1.59, 'assets/apple.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s14usuaris`
--

CREATE TABLE `s14usuaris` (
  `correu` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contrassenya` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `s14usuaris`
--

INSERT INTO `s14usuaris` (`correu`, `contrassenya`, `nom`) VALUES
('anna@citm.com', '12345', 'Anna'),
('d@d.com', 'classedesembre22', 'David');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ss_concursants`
--

CREATE TABLE `ss_concursants` (
  `id` int(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `punts` int(10) NOT NULL DEFAULT 0,
  `eliminat` tinyint(1) NOT NULL DEFAULT 0,
  `programa` int(5) NOT NULL,
  `ordre` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ss_concursants`
--

INSERT INTO `ss_concursants` (`id`, `nom`, `punts`, `eliminat`, `programa`, `ordre`) VALUES
(1, 'Ester', 450, 0, 1, 1),
(2, 'Marina', 505, 0, 1, 2),
(3, 'Ernest', 320, 1, 1, 3),
(4, 'Ariadna', 250, 1, 1, 4),
(13, 'Àngel', 300, 0, 5, 1),
(14, 'Violeta', 325, 0, 5, 2),
(15, 'David', 245, 1, 5, 3),
(16, 'Sergi', 80, 1, 5, 4),
(17, 'Sílvia', 125, 1, 6, 1),
(18, 'Dani', 320, 0, 6, 2),
(19, 'Joan', 310, 1, 6, 3),
(20, 'Ramon', 365, 0, 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ss_ponderacions`
--

CREATE TABLE `ss_ponderacions` (
  `id` int(5) NOT NULL,
  `valor` int(5) NOT NULL,
  `prova` int(5) NOT NULL,
  `hint` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ss_ponderacions`
--

INSERT INTO `ss_ponderacions` (`id`, `valor`, `prova`, `hint`) VALUES
(1, 15, 1, 'Encert'),
(2, 15, 2, 'Encert'),
(3, 10, 3, 'Encert'),
(4, 10, 4, 'Artista'),
(5, 15, 4, 'Títol'),
(6, -10, 4, 'Error'),
(7, 20, 5, 'Encert');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ss_programes`
--

CREATE TABLE `ss_programes` (
  `id` int(5) NOT NULL,
  `nom` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `data` datetime NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ss_programes`
--

INSERT INTO `ss_programes` (`id`, `nom`, `data`, `visible`) VALUES
(1, 'T2 Programa 6', '2023-01-21 12:00:00', 1),
(5, 'T2 Programa 7', '2023-03-18 10:00:00', 1),
(6, 'T2 Programa 8', '2023-04-22 09:30:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ss_proves`
--

CREATE TABLE `ss_proves` (
  `id` int(5) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `agrupable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ss_proves`
--

INSERT INTO `ss_proves` (`id`, `nom`, `agrupable`) VALUES
(1, 'Pim pam', 0),
(2, 'No t\'encallis', 0),
(3, 'Fes o digues', 1),
(4, 'No t\'encantis', 0),
(5, 'No te\'n refiis', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ss_puntsxprova`
--

CREATE TABLE `ss_puntsxprova` (
  `concursant` int(10) NOT NULL,
  `prova` int(5) NOT NULL,
  `punts` int(10) NOT NULL DEFAULT 0,
  `bloquejat` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ss_puntsxprova`
--

INSERT INTO `ss_puntsxprova` (`concursant`, `prova`, `punts`, `bloquejat`) VALUES
(1, 1, 15, 1),
(1, 2, 195, 1),
(1, 3, 60, 1),
(1, 4, 0, 1),
(1, 5, 180, 1),
(2, 1, 45, 1),
(2, 2, 105, 1),
(2, 3, 80, 1),
(2, 4, 35, 1),
(2, 5, 240, 1),
(3, 1, 45, 1),
(3, 2, 150, 1),
(3, 3, 80, 1),
(3, 4, 25, 1),
(3, 5, 20, 1),
(4, 1, 30, 1),
(4, 2, 135, 1),
(4, 3, 60, 1),
(4, 4, 25, 1),
(4, 5, 0, 1),
(13, 1, 45, 1),
(13, 2, 135, 1),
(13, 3, 110, 1),
(13, 4, 10, 1),
(13, 5, 0, 1),
(14, 1, 45, 1),
(14, 2, 105, 1),
(14, 3, 110, 1),
(14, 4, 25, 1),
(14, 5, 40, 1),
(15, 1, 75, 1),
(15, 2, 90, 1),
(15, 3, 20, 1),
(15, 4, 0, 1),
(15, 5, 60, 1),
(16, 1, 30, 1),
(16, 2, 30, 1),
(16, 3, 20, 1),
(16, 4, 0, 1),
(16, 5, 0, 1),
(17, 1, 15, 1),
(17, 2, 90, 1),
(17, 3, 10, 1),
(17, 4, 10, 1),
(17, 5, 0, 1),
(18, 1, 60, 1),
(18, 2, 105, 1),
(18, 3, 30, 1),
(18, 4, 25, 1),
(18, 5, 100, 1),
(19, 1, 30, 1),
(19, 2, 120, 1),
(19, 3, 10, 1),
(19, 4, -10, 1),
(19, 5, 160, 1),
(20, 1, 30, 1),
(20, 2, 105, 1),
(20, 3, 30, 1),
(20, 4, 0, 1),
(20, 5, 200, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xuleta`
--

CREATE TABLE `xuleta` (
  `id` int(3) NOT NULL,
  `text` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `xuleta`
--

INSERT INTO `xuleta` (`id`, `text`) VALUES
(1, 'ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`codigoassign`),
  ADD KEY `grado` (`grado`);

--
-- Indices de la tabla `e06noticies`
--
ALTER TABLE `e06noticies`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `e06noticies` ADD FULLTEXT KEY `titol` (`titol`,`text`);

--
-- Indices de la tabla `e06usuaris`
--
ALTER TABLE `e06usuaris`
  ADD PRIMARY KEY (`iduser`);

--
-- Indices de la tabla `ev_contests`
--
ALTER TABLE `ev_contests`
  ADD PRIMARY KEY (`year`),
  ADD KEY `country` (`country`);

--
-- Indices de la tabla `ev_countries`
--
ALTER TABLE `ev_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ev_joined_rooms`
--
ALTER TABLE `ev_joined_rooms`
  ADD PRIMARY KEY (`user`,`room`),
  ADD KEY `room` (`room`);

--
-- Indices de la tabla `ev_rooms`
--
ALTER TABLE `ev_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contest` (`contest`),
  ADD KEY `owner` (`owner`);

--
-- Indices de la tabla `ev_songs`
--
ALTER TABLE `ev_songs`
  ADD PRIMARY KEY (`contest`,`country`),
  ADD KEY `country` (`country`);

--
-- Indices de la tabla `ev_users`
--
ALTER TABLE `ev_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ev_votes`
--
ALTER TABLE `ev_votes`
  ADD PRIMARY KEY (`room`,`user`,`country`),
  ADD KEY `user` (`user`),
  ADD KEY `country` (`country`);

--
-- Indices de la tabla `f23fils`
--
ALTER TABLE `f23fils`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `f23missatges`
--
ALTER TABLE `f23missatges`
  ADD PRIMARY KEY (`idmsg`),
  ADD KEY `fil` (`fil`);
ALTER TABLE `f23missatges` ADD FULLTEXT KEY `missatge` (`missatge`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`codigogrado`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`idmatricula`),
  ADD KEY `dnialumno` (`dnialumno`),
  ADD KEY `codigoasignatura` (`codigoasignatura`);

--
-- Indices de la tabla `P02anuncios`
--
ALTER TABLE `P02anuncios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `propietario` (`propietario`);

--
-- Indices de la tabla `P02categorias`
--
ALTER TABLE `P02categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `P02usuarios`
--
ALTER TABLE `P02usuarios`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `P02visualizaciones`
--
ALTER TABLE `P02visualizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anuncio` (`anuncio`);

--
-- Indices de la tabla `p1empreses`
--
ALTER TABLE `p1empreses`
  ADD PRIMARY KEY (`nif`);

--
-- Indices de la tabla `p1ofertes`
--
ALTER TABLE `p1ofertes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `s7noticias`
--
ALTER TABLE `s7noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `S7_anuncios`
--
ALTER TABLE `S7_anuncios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `propietario` (`propietario`);

--
-- Indices de la tabla `S7_categorias`
--
ALTER TABLE `S7_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `S7_usuarios`
--
ALTER TABLE `S7_usuarios`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `S7_visualizaciones`
--
ALTER TABLE `S7_visualizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anuncio` (`anuncio`);

--
-- Indices de la tabla `s13archivos`
--
ALTER TABLE `s13archivos`
  ADD PRIMARY KEY (`idarchivo`);

--
-- Indices de la tabla `s14comandes`
--
ALTER TABLE `s14comandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propietari` (`propietari`);

--
-- Indices de la tabla `s14prodscoms`
--
ALTER TABLE `s14prodscoms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `s14prodspacks`
--
ALTER TABLE `s14prodspacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productes` (`productes`);

--
-- Indices de la tabla `s14productes`
--
ALTER TABLE `s14productes`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `s14productes` ADD FULLTEXT KEY `nom` (`nom`,`descripcio`);

--
-- Indices de la tabla `s14usuaris`
--
ALTER TABLE `s14usuaris`
  ADD PRIMARY KEY (`correu`);

--
-- Indices de la tabla `ss_concursants`
--
ALTER TABLE `ss_concursants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa` (`programa`);

--
-- Indices de la tabla `ss_ponderacions`
--
ALTER TABLE `ss_ponderacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prova` (`prova`);

--
-- Indices de la tabla `ss_programes`
--
ALTER TABLE `ss_programes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ss_proves`
--
ALTER TABLE `ss_proves`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ss_puntsxprova`
--
ALTER TABLE `ss_puntsxprova`
  ADD PRIMARY KEY (`concursant`,`prova`),
  ADD KEY `prova` (`prova`);

--
-- Indices de la tabla `xuleta`
--
ALTER TABLE `xuleta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `e06noticies`
--
ALTER TABLE `e06noticies`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `e06usuaris`
--
ALTER TABLE `e06usuaris`
  MODIFY `iduser` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ev_users`
--
ALTER TABLE `ev_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `f23fils`
--
ALTER TABLE `f23fils`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `f23missatges`
--
ALTER TABLE `f23missatges`
  MODIFY `idmsg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `codigogrado` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `idmatricula` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `P02anuncios`
--
ALTER TABLE `P02anuncios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `P02categorias`
--
ALTER TABLE `P02categorias`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `P02visualizaciones`
--
ALTER TABLE `P02visualizaciones`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;

--
-- AUTO_INCREMENT de la tabla `p1ofertes`
--
ALTER TABLE `p1ofertes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `s7noticias`
--
ALTER TABLE `s7noticias`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `S7_anuncios`
--
ALTER TABLE `S7_anuncios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `S7_categorias`
--
ALTER TABLE `S7_categorias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `S7_visualizaciones`
--
ALTER TABLE `S7_visualizaciones`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `s13archivos`
--
ALTER TABLE `s13archivos`
  MODIFY `idarchivo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `s14comandes`
--
ALTER TABLE `s14comandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `s14prodscoms`
--
ALTER TABLE `s14prodscoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `s14prodspacks`
--
ALTER TABLE `s14prodspacks`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `s14productes`
--
ALTER TABLE `s14productes`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ss_concursants`
--
ALTER TABLE `ss_concursants`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ss_ponderacions`
--
ALTER TABLE `ss_ponderacions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ss_programes`
--
ALTER TABLE `ss_programes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `xuleta`
--
ALTER TABLE `xuleta`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`grado`) REFERENCES `grado` (`codigogrado`);

--
-- Filtros para la tabla `ev_contests`
--
ALTER TABLE `ev_contests`
  ADD CONSTRAINT `ev_contests_ibfk_1` FOREIGN KEY (`country`) REFERENCES `ev_countries` (`id`);

--
-- Filtros para la tabla `ev_joined_rooms`
--
ALTER TABLE `ev_joined_rooms`
  ADD CONSTRAINT `ev_joined_rooms_ibfk_1` FOREIGN KEY (`user`) REFERENCES `ev_users` (`id`),
  ADD CONSTRAINT `ev_joined_rooms_ibfk_2` FOREIGN KEY (`room`) REFERENCES `ev_rooms` (`id`);

--
-- Filtros para la tabla `ev_rooms`
--
ALTER TABLE `ev_rooms`
  ADD CONSTRAINT `ev_rooms_ibfk_2` FOREIGN KEY (`contest`) REFERENCES `ev_contests` (`year`),
  ADD CONSTRAINT `ev_rooms_ibfk_3` FOREIGN KEY (`owner`) REFERENCES `ev_users` (`id`);

--
-- Filtros para la tabla `ev_songs`
--
ALTER TABLE `ev_songs`
  ADD CONSTRAINT `ev_songs_ibfk_1` FOREIGN KEY (`contest`) REFERENCES `ev_contests` (`year`),
  ADD CONSTRAINT `ev_songs_ibfk_2` FOREIGN KEY (`country`) REFERENCES `ev_countries` (`id`);

--
-- Filtros para la tabla `ev_votes`
--
ALTER TABLE `ev_votes`
  ADD CONSTRAINT `ev_votes_ibfk_1` FOREIGN KEY (`room`) REFERENCES `ev_rooms` (`id`),
  ADD CONSTRAINT `ev_votes_ibfk_2` FOREIGN KEY (`user`) REFERENCES `ev_users` (`id`),
  ADD CONSTRAINT `ev_votes_ibfk_3` FOREIGN KEY (`country`) REFERENCES `ev_countries` (`id`);

--
-- Filtros para la tabla `f23missatges`
--
ALTER TABLE `f23missatges`
  ADD CONSTRAINT `f23missatges_ibfk_1` FOREIGN KEY (`fil`) REFERENCES `f23fils` (`id`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`dnialumno`) REFERENCES `alumno` (`dni`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`codigoasignatura`) REFERENCES `asignatura` (`codigoassign`);

--
-- Filtros para la tabla `P02anuncios`
--
ALTER TABLE `P02anuncios`
  ADD CONSTRAINT `P02anuncios_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `P02categorias` (`id`),
  ADD CONSTRAINT `P02anuncios_ibfk_2` FOREIGN KEY (`propietario`) REFERENCES `P02usuarios` (`email`);

--
-- Filtros para la tabla `P02visualizaciones`
--
ALTER TABLE `P02visualizaciones`
  ADD CONSTRAINT `P02visualizaciones_ibfk_1` FOREIGN KEY (`anuncio`) REFERENCES `P02anuncios` (`id`);

--
-- Filtros para la tabla `S7_anuncios`
--
ALTER TABLE `S7_anuncios`
  ADD CONSTRAINT `S7_anuncios_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `S7_categorias` (`id`),
  ADD CONSTRAINT `S7_anuncios_ibfk_2` FOREIGN KEY (`propietario`) REFERENCES `S7_usuarios` (`email`);

--
-- Filtros para la tabla `S7_visualizaciones`
--
ALTER TABLE `S7_visualizaciones`
  ADD CONSTRAINT `S7_visualizaciones_ibfk_1` FOREIGN KEY (`anuncio`) REFERENCES `S7_anuncios` (`id`);

--
-- Filtros para la tabla `s14comandes`
--
ALTER TABLE `s14comandes`
  ADD CONSTRAINT `s14comandes_ibfk_1` FOREIGN KEY (`propietari`) REFERENCES `s14usuaris` (`correu`);

--
-- Filtros para la tabla `ss_concursants`
--
ALTER TABLE `ss_concursants`
  ADD CONSTRAINT `ss_concursants_ibfk_1` FOREIGN KEY (`programa`) REFERENCES `ss_programes` (`id`);

--
-- Filtros para la tabla `ss_ponderacions`
--
ALTER TABLE `ss_ponderacions`
  ADD CONSTRAINT `ss_ponderacions_ibfk_1` FOREIGN KEY (`prova`) REFERENCES `ss_proves` (`id`);

--
-- Filtros para la tabla `ss_puntsxprova`
--
ALTER TABLE `ss_puntsxprova`
  ADD CONSTRAINT `ss_puntsxprova_ibfk_1` FOREIGN KEY (`prova`) REFERENCES `ss_proves` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
