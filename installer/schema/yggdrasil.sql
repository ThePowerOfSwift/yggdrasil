
-- --------------------------------------------------------

--
-- Table structure for table `action_logs`
--

CREATE TABLE `{DBPREFIX}action_logs` (
`id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- split --

CREATE TABLE `{DBPREFIX}groups` (
`id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- split --

INSERT INTO `{DBPREFIX}groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- split --

CREATE TABLE `{DBPREFIX}hidden_notifications` (
  `user_id` int(11) NOT NULL,
  `notification_id` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- split --

CREATE TABLE `{DBPREFIX}ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

CREATE TABLE `{DBPREFIX}itdatas` (
`cdn_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_mb` decimal(20,2) NOT NULL,
  `m95_mbps` decimal(20,2) NOT NULL,
  `peak_mbps` decimal(20,2) NOT NULL,
  `total_hits` int(20) NOT NULL,
  `http_total_mb` decimal(20,2) NOT NULL,
  `stream_total_mb` decimal(10,2) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}itdatas` (`cdn_id`, `date`, `total_mb`, `m95_mbps`, `peak_mbps`, `total_hits`, `http_total_mb`, `stream_total_mb`, `last_modified`) VALUES
(3, '2013-01-07', 0.00, 0.00, 0.00, 0, 0.00, 0.00, '2013-03-04 09:21:06'),
(4, '2013-01-14', 1828978.86, 29.48, 54.73, 99690523, 1828978.64, 0.22, '2013-03-04 09:21:10'),
(7, '2013-01-21', 0.00, 0.00, 0.00, 0, 0.00, 0.00, '2013-03-04 09:21:13'),
(8, '2013-01-28', 0.00, 0.00, 0.00, 0, 0.00, 0.00, '2013-03-04 09:21:16'),
(9, '2013-02-04', 6149798.08, 29.79, 55.24, 350329649, 6149797.76, 0.32, '2013-03-04 09:21:22'),
(10, '2013-02-11', 6149798.08, 29.79, 55.24, 350329649, 6149797.76, 0.32, '2013-03-04 09:21:27'),
(11, '2013-02-18', 3219117.40, 28.78, 54.73, 175909290, 3219117.04, 0.36, '2013-03-04 09:21:35'),
(12, '2013-02-25', 4658994.77, 28.66, 54.73, 259806964, 4658994.35, 0.42, '2013-03-04 09:21:43'),
(15, '2013-03-04', 5901064.81, 30.53, 54.73, 330050825, 5901064.32, 0.49, '2013-03-04 09:22:22'),
(17, '2013-03-12', 2014310.13, 31.80, 44.86, 115340997, 2014310.07, 0.06, '2013-04-02 14:18:29'),
(18, '2013-03-18', 3629066.79, 32.02, 72.06, 208571313, 3629066.64, 0.15, '2013-04-02 14:18:34'),
(19, '2013-03-27', 5326333.71, 33.37, 72.06, 304247873, 5326333.51, 0.20, '2013-04-02 14:18:39'),
(20, '2013-04-02', 7115643.96, 33.08, 72.06, 400698553, 7115643.72, 0.24, '2013-04-02 14:24:16'),
(21, '2013-04-07', 1534720.01, 33.64, 116.74, 86310802, 1534719.98, 0.04, '2013-04-09 15:36:56'),
(22, '2013-04-15', 3555991.40, 38.53, 125.54, 203382436, 3555991.31, 0.01, '2013-04-22 10:05:23'),
(23, '2013-04-22', 7605889.95, 39.08, 125.54, 434241802, 7605889.74, 0.21, '2013-05-01 12:15:53'),
(24, '2013-05-13', 2472781.26, 28.60, 37.31, 139730024, 2472781.20, 0.06, '2013-05-13 10:39:46'),
(25, '2013-05-06', 538537.75, 26.64, 35.71, 31124830, 538537.73, 0.02, '2013-05-13 10:39:50'),
(26, '2013-05-02', 8348503.14, 38.59, 125.54, 477515454, 8348502.92, 0.22, '2013-05-13 10:41:17'),
(27, '2013-05-20', 4244402.47, 31.72, 51.13, 244886430, 4244411.68, 0.09, '2013-05-21 09:29:26'),
(28, '2013-05-27', 6048725.86, 32.97, 92.60, 347314553, 6048725.74, 0.12, '2013-06-03 13:29:41'),
(29, '2013-06-04', 7613647.19, 33.42, 92.60, 444099475, 7613647.04, 0.15, '2013-06-07 08:25:23'),
(30, '2013-06-06', 190200.10, 22.01, 29.87, 10857416, 190200.10, 0.00, '2013-06-07 08:29:28'),
(31, '2013-06-17', 3548001.29, 31.76, 89.49, 206115606, 3548001.21, 0.08, '2013-06-17 09:44:18'),
(32, '2013-06-10', 1972716.32, 33.55, 89.49, 116982446, 1972716.29, 0.04, '2013-06-17 09:44:54'),
(33, '2013-06-24', 5.00, 32.85, 89.49, 298, 5258192.00, 0.11, '2013-07-01 15:28:57'),
(34, '2013-07-02', 7033254.91, 31.85, 116.38, 409793786, 7033254.76, 0.15, '2013-07-11 13:37:02'),
(35, '2013-07-11', 1335385.63, 30.11, 46.11, 82418015, 1335385.60, 0.04, '2013-07-11 13:33:53'),
(36, '2013-07-15', 2725214.19, 28.42, 52.62, 159267770, 2725214.12, 0.07, '2013-07-22 14:40:55'),
(37, '2013-07-22', 4088537.99, 27.62, 52.62, 240976484, 4088537.87, 0.12, '2013-07-22 14:46:59'),
(38, '2013-07-29', 5586506.78, 28.19, 52.62, 316737261, 5586506.58, 0.19, '2013-08-01 14:33:47'),
(39, '2013-08-02', 6427820.89, 28.07, 52.62, 361849053, 6427820.67, 0.22, '2013-08-05 08:39:48'),
(40, '2013-08-09', 620152.88, 27.81, 33.72, 31609719, 620152.86, 0.01, '2013-08-09 11:11:09'),
(41, '2013-10-02', 9283490.09, 48.00, 215.82, 485236576, 9283489.95, 0.14, '2013-10-08 07:49:09'),
(42, '2013-10-07', 1974691.75, 61.66, 81.77, 121094600, 1974691.73, 0.02, '2013-10-08 07:49:28'),
(43, '2013-09-30', 8970161.26, 48.00, 215.82, 467561730, 8881811.71, 0.14, '2013-10-08 09:48:33'),
(44, '2013-10-21', 6519657.19, 51.22, 81.77, 385146415, 6519657.09, 0.01, '2013-11-18 10:50:35'),
(45, '2013-10-28', 9422621.32, 57.36, 162.10, 522321286, 9422621.19, 0.13, '2013-11-18 10:52:53'),
(46, '2013-11-05', 532012.28, 35.01, 40.40, 29852973, 532012.27, 0.01, '2013-11-18 10:55:23'),
(47, '2013-11-13', 2774211.20, 43.32, 118.38, 157884034, 2774211.15, 0.05, '2013-11-18 10:57:01'),
(48, '2013-11-18', 4644108.20, 40.37, 118.38, 262446389, 4644108.13, 0.06, '2013-11-18 10:58:49'),
(49, '2013-11-25', 7910598.35, 49.57, 118.38, 450890351, 7910598.24, 0.11, '2013-11-25 14:03:42'),
(50, '2013-12-03', 10154537.99, 48.53, 118.38, 578274430, 10084107.06, 0.12, '2013-12-13 14:10:48'),
(51, '2013-12-09', 1991710.34, 35.67, 45.46, 105646914, 1991710.30, 0.04, '2013-12-13 14:12:18'),
(52, '2014-01-28', 7329111.21, 47.52, 135.78, 299697433, 7329111.13, 0.08, '2014-01-28 14:31:06');

-- split --

CREATE TABLE `{DBPREFIX}it_servicedesk_data` (
`servicedesk_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `asset_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `asset_type` int(11) NOT NULL,
  `asset_price` decimal(20,2) NOT NULL,
  `asset_serial_no` int(20) NOT NULL,
  `asset_vendor` int(11) NOT NULL,
  `asset_department` int(11) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}it_servicedesk_data` (`servicedesk_id`, `date`, `asset_name`, `asset_type`, `asset_price`, `asset_serial_no`, `asset_vendor`, `asset_department`, `last_modified`) VALUES
(3, '2013-01-07', 'Macbook Air', 2, 800.00, 0, 1, 2, '2014-03-29 11:47:16'),
(4, '2014-03-24', 'HP Laptop', 2, 400.00, 2147483647, 1, 2, '2014-03-29 11:45:01');

-- split --

CREATE TABLE `{DBPREFIX}keys` (
`id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- split --

INSERT INTO `{DBPREFIX}keys` (`id`, `key`, `level`, `note`, `date_created`) VALUES
(1, 'ixZePbqTLpCfiVvkTwLPEHb8kmekJeGJiQRAIAoQ', 0, 'test', 1427753576);

-- split --

CREATE TABLE `{DBPREFIX}keywords` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

CREATE TABLE `{DBPREFIX}login_attempts` (
`id` mediumint(8) unsigned NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- split --

CREATE TABLE `{DBPREFIX}logs` (
`id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- split --

CREATE TABLE `{DBPREFIX}meta` (
`id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `last_name` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `company` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT '',
  `last_visited_version` varchar(48) CHARACTER SET utf8 DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}meta` (`id`, `user_id`, `first_name`, `last_name`, `company`, `phone`, `last_visited_version`) VALUES
(1, 1, 'mis', 'demo', '', '', '');

-- split --

CREATE TABLE `{DBPREFIX}migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- split --

INSERT INTO `{DBPREFIX}migrations` (`version`) VALUES
(0);

-- split --

CREATE TABLE `{DBPREFIX}modules` (
`id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(1, 'a:1:{s:2:"en";s:6:"Apikey";}', 'apikey', '1.0', NULL, 'a:1:{s:2:"en";s:25:"Module to get an API Key.";}', 0, 1, 1, 'admin', 1, 1, 1, 1490712870),
(2, 'a:1:{s:2:"en";s:8:"Calendar";}', 'calendar', '1.0', NULL, 'a:1:{s:2:"en";s:8:"Calendar";}', 0, 0, 1, '0', 1, 1, 1, 1490712870),
(3, 'a:25:{s:2:"en";s:7:"Contact";s:2:"ar";s:14:"الإتصال";s:2:"br";s:7:"Contato";s:2:"pt";s:8:"Contacto";s:2:"cs";s:7:"Kontakt";s:2:"da";s:7:"Kontakt";s:2:"de";s:7:"Kontakt";s:2:"el";s:22:"Επικοινωνία";s:2:"es";s:8:"Contacto";s:2:"fa";s:18:"تماس با ما";s:2:"fi";s:13:"Ota yhteyttä";s:2:"fr";s:7:"Contact";s:2:"he";s:17:"יצירת קשר";s:2:"id";s:6:"Kontak";s:2:"it";s:10:"Contattaci";s:2:"lt";s:18:"Kontaktinė formą";s:2:"nl";s:7:"Contact";s:2:"pl";s:7:"Kontakt";s:2:"ru";s:27:"Обратная связь";s:2:"sl";s:7:"Kontakt";s:2:"tw";s:12:"聯絡我們";s:2:"cn";s:12:"联络我们";s:2:"hu";s:9:"Kapcsolat";s:2:"th";s:18:"ติดต่อ";s:2:"se";s:7:"Kontakt";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:"en";s:112:"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.";s:2:"ar";s:157:"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.";s:2:"br";s:139:"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.";s:2:"pt";s:116:"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.";s:2:"cs";s:149:"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.";s:2:"da";s:123:"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse";s:2:"de";s:119:"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.";s:2:"el";s:273:"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.";s:2:"fa";s:239:"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.";s:2:"es";s:156:"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.";s:2:"fi";s:128:"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.";s:2:"fr";s:122:"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.";s:2:"he";s:155:"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות";s:2:"id";s:149:"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka";s:2:"it";s:119:"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.";s:2:"lt";s:124:"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.";s:2:"nl";s:125:"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.";s:2:"pl";s:126:"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.";s:2:"ru";s:234:"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.";s:2:"sl";s:113:"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.";s:2:"tw";s:147:"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。";s:2:"cn";s:147:"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。";s:2:"th";s:316:"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา";s:2:"hu";s:156:"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.";s:2:"se";s:53:"Lägger till ett kontaktformulär till din webbplats.";}', 0, 0, 0, '0', 1, 1, 1, 1490712870),
(4, 'a:1:{s:2:"en";s:9:"Dashboard";}', 'dashboard', '1.0', NULL, 'a:1:{s:2:"en";s:9:"Dashboard";}', 0, 0, 1, '0', 1, 1, 1, 1490712870),
(5, 'a:23:{s:2:"en";s:6:"Groups";s:2:"ar";s:18:"المجموعات";s:2:"br";s:6:"Grupos";s:2:"pt";s:6:"Grupos";s:2:"cs";s:7:"Skupiny";s:2:"da";s:7:"Grupper";s:2:"de";s:7:"Gruppen";s:2:"el";s:12:"Ομάδες";s:2:"es";s:6:"Grupos";s:2:"fi";s:7:"Ryhmät";s:2:"fr";s:7:"Groupes";s:2:"he";s:12:"קבוצות";s:2:"id";s:4:"Grup";s:2:"it";s:6:"Gruppi";s:2:"lt";s:7:"Grupės";s:2:"nl";s:7:"Groepen";s:2:"ru";s:12:"Группы";s:2:"sl";s:7:"Skupine";s:2:"tw";s:6:"群組";s:2:"cn";s:6:"群组";s:2:"hu";s:9:"Csoportok";s:2:"th";s:15:"กลุ่ม";s:2:"se";s:7:"Grupper";}', 'groups', '1.0.0', NULL, 'a:23:{s:2:"en";s:54:"Users can be placed into groups to manage permissions.";s:2:"ar";s:100:"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.";s:2:"br";s:72:"Usuários podem ser inseridos em grupos para gerenciar suas permissões.";s:2:"pt";s:74:"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.";s:2:"cs";s:77:"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.";s:2:"da";s:49:"Brugere kan inddeles i grupper for adgangskontrol";s:2:"de";s:85:"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.";s:2:"el";s:168:"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.";s:2:"es";s:75:"Los usuarios podrán ser colocados en grupos para administrar sus permisos.";s:2:"fi";s:84:"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.";s:2:"fr";s:82:"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.";s:2:"he";s:62:"נותן אפשרות לאסוף משתמשים לקבוצות";s:2:"id";s:68:"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.";s:2:"it";s:69:"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.";s:2:"lt";s:67:"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.";s:2:"nl";s:73:"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.";s:2:"ru";s:134:"Пользователей можно объединять в группы, для управления правами доступа.";s:2:"sl";s:64:"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj";s:2:"tw";s:45:"用戶可以依群組分類並管理其權限";s:2:"cn";s:45:"用户可以依群组分类并管理其权限";s:2:"hu";s:73:"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.";s:2:"th";s:84:"สามารถวางผู้ใช้ลงในกลุ่มเพื่";s:2:"se";s:76:"Användare kan delas in i grupper för att hantera roller och behörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1490712870),
(6, 'a:1:{s:2:"en";s:10:"It Reports";}', 'itreports', '1.0.0', NULL, 'a:1:{s:2:"en";s:46:"Exprimental Module for IT Dashboards & Reports";}', 0, 0, 1, '0', 1, 1, 1, 1422891927),
(7, 'a:17:{s:2:"en";s:8:"Keywords";s:2:"ar";s:21:"كلمات البحث";s:2:"br";s:14:"Palavras-chave";s:2:"pt";s:14:"Palavras-chave";s:2:"da";s:9:"Nøgleord";s:2:"el";s:27:"Λέξεις Κλειδιά";s:2:"fa";s:21:"کلمات کلیدی";s:2:"fr";s:10:"Mots-Clés";s:2:"id";s:10:"Kata Kunci";s:2:"nl";s:14:"Sleutelwoorden";s:2:"tw";s:6:"鍵詞";s:2:"cn";s:6:"键词";s:2:"hu";s:11:"Kulcsszavak";s:2:"fi";s:10:"Avainsanat";s:2:"sl";s:15:"Ključne besede";s:2:"th";s:15:"คำค้น";s:2:"se";s:9:"Nyckelord";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:"en";s:71:"Maintain a central list of keywords to label and organize your content.";s:2:"ar";s:124:"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.";s:2:"br";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"pt";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"da";s:72:"Vedligehold en central liste af nøgleord for at organisere dit indhold.";s:2:"el";s:181:"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.";s:2:"fa";s:110:"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا";s:2:"fr";s:87:"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.";s:2:"id";s:71:"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.";s:2:"nl";s:91:"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.";s:2:"tw";s:64:"集中管理可用於標題與內容的鍵詞(keywords)列表。";s:2:"cn";s:64:"集中管理可用于标题与内容的键词(keywords)列表。";s:2:"hu";s:65:"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.";s:2:"fi";s:92:"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.";s:2:"sl";s:82:"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.";s:2:"th";s:189:"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ";s:2:"se";s:61:"Hantera nyckelord för att organisera webbplatsens innehåll.";}', 0, 0, 1, 'data', 1, 1, 1, 1490712870),
(8, 'N;', 'modules', '1.0', NULL, 'N;', 0, 0, 0, '0', 1, 1, 1, 1490712870),
(9, 'a:25:{s:2:"en";s:11:"Permissions";s:2:"ar";s:18:"الصلاحيات";s:2:"br";s:11:"Permissões";s:2:"pt";s:11:"Permissões";s:2:"cs";s:12:"Oprávnění";s:2:"da";s:14:"Adgangskontrol";s:2:"de";s:14:"Zugriffsrechte";s:2:"el";s:20:"Δικαιώματα";s:2:"es";s:8:"Permisos";s:2:"fa";s:15:"اجازه ها";s:2:"fi";s:16:"Käyttöoikeudet";s:2:"fr";s:11:"Permissions";s:2:"he";s:12:"הרשאות";s:2:"id";s:9:"Perizinan";s:2:"it";s:8:"Permessi";s:2:"lt";s:7:"Teisės";s:2:"nl";s:15:"Toegangsrechten";s:2:"pl";s:11:"Uprawnienia";s:2:"ru";s:25:"Права доступа";s:2:"sl";s:10:"Dovoljenja";s:2:"tw";s:6:"權限";s:2:"cn";s:6:"权限";s:2:"hu";s:14:"Jogosultságok";s:2:"th";s:18:"สิทธิ์";s:2:"se";s:13:"Behörigheter";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:"en";s:68:"Control what type of users can see certain sections within the site.";s:2:"ar";s:127:"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.";s:2:"br";s:68:"Controle quais tipos de usuários podem ver certas seções no site.";s:2:"pt";s:75:"Controle quais os tipos de utilizadores podem ver certas secções no site.";s:2:"cs";s:93:"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.";s:2:"da";s:72:"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.";s:2:"de";s:70:"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.";s:2:"el";s:180:"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.";s:2:"es";s:81:"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.";s:2:"fa";s:59:"مدیریت اجازه های گروه های کاربری";s:2:"fi";s:72:"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.";s:2:"fr";s:104:"Permet de définir les autorisations des groupes d''utilisateurs pour afficher les différentes sections.";s:2:"he";s:75:"ניהול הרשאות כניסה לאיזורים מסוימים באתר";s:2:"id";s:76:"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.";s:2:"it";s:78:"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.";s:2:"lt";s:72:"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.";s:2:"nl";s:71:"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.";s:2:"pl";s:79:"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.";s:2:"ru";s:209:"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.";s:2:"sl";s:85:"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.";s:2:"tw";s:81:"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。";s:2:"cn";s:81:"用来控制不同类别的用户，设定其浏览特定网站内容的权限。";s:2:"hu";s:129:"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.";s:2:"th";s:117:"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง";s:2:"se";s:27:"Hantera gruppbehörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1490712870),
(10, 'a:23:{s:2:"en";s:8:"Settings";s:2:"ar";s:18:"الإعدادات";s:2:"br";s:15:"Configurações";s:2:"pt";s:15:"Configurações";s:2:"cs";s:10:"Nastavení";s:2:"da";s:13:"Indstillinger";s:2:"de";s:13:"Einstellungen";s:2:"el";s:18:"Ρυθμίσεις";s:2:"es";s:15:"Configuraciones";s:2:"fi";s:9:"Asetukset";s:2:"fr";s:11:"Paramètres";s:2:"he";s:12:"הגדרות";s:2:"id";s:10:"Pengaturan";s:2:"it";s:12:"Impostazioni";s:2:"lt";s:10:"Nustatymai";s:2:"nl";s:12:"Instellingen";s:2:"pl";s:10:"Ustawienia";s:2:"ru";s:18:"Настройки";s:2:"sl";s:10:"Nastavitve";s:2:"zh";s:12:"網站設定";s:2:"hu";s:14:"Beállítások";s:2:"th";s:21:"ตั้งค่า";s:2:"se";s:14:"Inställningar";}', 'settings', '1.0', NULL, 'a:23:{s:2:"en";s:89:"Allows administrators to update settings like Site Name, messages and email address, etc.";s:2:"ar";s:161:"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.";s:2:"br";s:120:"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.";s:2:"pt";s:113:"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.";s:2:"cs";s:102:"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.";s:2:"da";s:90:"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.";s:2:"de";s:92:"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.";s:2:"el";s:230:"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.";s:2:"es";s:131:"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.";s:2:"fi";s:105:"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.";s:2:"fr";s:105:"Permet aux admistrateurs et au personnel de modifier les paramètres du site : nom du site et description";s:2:"he";s:116:"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו";s:2:"id";s:112:"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.";s:2:"it";s:109:"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.";s:2:"lt";s:104:"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.";s:2:"nl";s:114:"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.";s:2:"pl";s:103:"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.";s:2:"ru";s:135:"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.";s:2:"sl";s:98:"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.";s:2:"zh";s:99:"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。";s:2:"hu";s:125:"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...";s:2:"th";s:232:"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น";s:2:"se";s:84:"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.";}', 1, 0, 1, 'settings', 1, 1, 1, 1490712870),
(11, 'a:12:{s:2:"en";s:6:"System";s:2:"pt";s:12:"Manutenção";s:2:"ar";s:14:"الصيانة";s:2:"el";s:18:"Συντήρηση";s:2:"hu";s:13:"Karbantartás";s:2:"fi";s:9:"Ylläpito";s:2:"fr";s:6:"system";s:2:"id";s:12:"Pemeliharaan";s:2:"se";s:10:"Underhåll";s:2:"sl";s:12:"Vzdrževanje";s:2:"th";s:39:"การบำรุงรักษา";s:2:"zh";s:6:"維護";}', 'system', '1.0', NULL, 'a:12:{s:2:"en";s:63:"Manage the site cache and export information from the database.";s:2:"pt";s:68:"Gerir o cache do seu site e exportar informações da base de dados.";s:2:"ar";s:81:"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.";s:2:"el";s:142:"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.";s:2:"id";s:60:"Mengatur cache situs dan mengexport informasi dari database.";s:2:"fr";s:71:"Gérer le cache du site et exporter les contenus de la base de données";s:2:"fi";s:59:"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.";s:2:"hu";s:66:"Az oldal gyorsítótár kezelése és az adatbázis exportálása.";s:2:"se";s:76:"Underhåll webbplatsens cache och exportera data från webbplatsens databas.";s:2:"sl";s:69:"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.";s:2:"th";s:150:"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล";s:2:"zh";s:45:"經由管理介面手動刪除暫存資料。";}', 0, 0, 1, 'utilities', 1, 1, 1, 1490712870),
(12, 'a:2:{s:2:"en";s:6:"Themes";s:2:"se";s:5:"Teman";}', 'themes', '1.0', NULL, 'a:2:{s:2:"en";s:66:"Allows admins and staff to switch themes and manage theme options.";s:2:"se";s:73:"Hantera webbplatsens utseende genom teman och hantera temainställningar.";}', 0, 0, 1, 'design', 1, 1, 1, 1490712870),
(13, 'a:23:{s:2:"en";s:5:"Users";s:2:"ar";s:20:"المستخدمون";s:2:"br";s:9:"Usuários";s:2:"pt";s:12:"Utilizadores";s:2:"cs";s:11:"Uživatelé";s:2:"da";s:7:"Brugere";s:2:"de";s:8:"Benutzer";s:2:"el";s:14:"Χρήστες";s:2:"es";s:8:"Usuarios";s:2:"fi";s:12:"Käyttäjät";s:2:"fr";s:12:"Utilisateurs";s:2:"he";s:14:"משתמשים";s:2:"id";s:8:"Pengguna";s:2:"it";s:6:"Utenti";s:2:"lt";s:10:"Vartotojai";s:2:"nl";s:10:"Gebruikers";s:2:"pl";s:12:"Użytkownicy";s:2:"ru";s:24:"Пользователи";s:2:"sl";s:10:"Uporabniki";s:2:"zh";s:6:"用戶";s:2:"hu";s:14:"Felhasználók";s:2:"th";s:27:"ผู้ใช้งาน";s:2:"se";s:10:"Användare";}', 'users', '1.0', NULL, 'a:23:{s:2:"en";s:81:"Let users register and log in to the site, and manage them via the control panel.";s:2:"ar";s:133:"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.";s:2:"br";s:125:"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.";s:2:"pt";s:125:"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.";s:2:"cs";s:103:"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.";s:2:"da";s:89:"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.";s:2:"de";s:108:"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.";s:2:"el";s:208:"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.";s:2:"es";s:138:"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.";s:2:"fi";s:126:"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.";s:2:"fr";s:112:"Permet aux utilisateurs de s''enregistrer et de se connecter au site et de les gérer via le panneau de contrôle";s:2:"he";s:62:"ניהול משתמשים: רישום, הפעלה ומחיקה";s:2:"id";s:102:"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.";s:2:"it";s:95:"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.";s:2:"lt";s:106:"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.";s:2:"nl";s:88:"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.";s:2:"pl";s:87:"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.";s:2:"ru";s:155:"Управление зарегистрированными пользователями, активирование новых пользователей.";s:2:"sl";s:96:"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče";s:2:"zh";s:87:"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。";s:2:"th";s:210:"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม";s:2:"hu";s:120:"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.";s:2:"se";s:111:"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.";}', 0, 0, 1, '0', 1, 1, 1, 1490712870),
(14, 'a:1:{s:2:"en";s:9:"Frontpage";}', 'frontpage', '1.0', NULL, 'a:1:{s:2:"en";s:20:"The Static Home Page";}', 0, 0, 0, '0', 1, 1, 1, 1490712870),
(15, 'a:2:{s:2:"en";s:11:"Search News";s:2:"se";s:11:"Sok Nyheter";}', 'newssearch', '1.0.0', NULL, 'a:2:{s:2:"en";s:11:"Search News";s:2:"se";s:11:"Sok Nyheter";}', 0, 0, 0, '0', 1, 1, 1, 1490712870),
(16, 'a:1:{s:2:"en";s:18:"Ships location Map";}', 'maps', '1.0', NULL, 'a:1:{s:2:"en";s:18:"Ships location map";}', 0, 0, 1, 'users', 1, 1, 1, 1490864460);

-- split --

CREATE TABLE `{DBPREFIX}permissions` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

CREATE TABLE `{DBPREFIX}settings` (
  `slug` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') CHARACTER SET utf8 NOT NULL,
  `default` text CHARACTER SET utf8 NOT NULL,
  `value` text CHARACTER SET utf8,
  `options` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 NOT NULL,
  `order` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}settings` (`slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `is_gui`, `module`, `order`) VALUES
('activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'radio', '1', '0', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
('admin_force_https', 'Force HTTPS for admin?', 'Allow only the HTTPS protocol when using the admin functions?', 'radio', '0', '0', '1=Yes|0=No', 1, 1, '', 0),
('admin_name', 'Administrator Name', 'The Administrators Name', 'text', '', 'Torbjorn Zetterlund', '', 0, 0, '', 0),
('admin_theme', 'Backend Theme', 'Select the theme for the backend.', '', 'default', 'bootstrap', 'func:get_themes', 1, 1, '', 0),
('alchemy', 'Alchemy ', 'Do you want to use Alchemy', 'radio', '0', '1', '0=Disabled|1=Enabled', 0, 1, 'API', 1),
('alchemy_get_news', 'Alchemy API Get News', 'The specific Alchemy API function ', 'text', '', 'calls/data/GetNews', '', 1, 1, 'API', 5),
('alchemy_news_api', 'Alchemy', 'The API key for Alchemy', 'text', '', '', '', 0, 1, 'API', 2),
('alchemy_url', 'Alchemy URL', 'The URL of the Alchemy service', 'text', '', 'http://access.alchemyapi.com/', '', 0, 1, 'API', 3),
('allowed_extensions', 'Allowed extensions', '', '', '', 'pdf,png,psd,jpg,jpeg,bmp,ai,txt,zip,rar,7z,gzip,bzip,gz,gif,doc,docx,ppt,pptx,xls,xlsx,csv', '', 0, 0, '', 0),
('application_debug', 'Application Debug', 'Debug Application - requires - $this->output->enable_profiler($this->settings->application_debug) in your controller', 'radio', '0', '0', '1=True|0=False', 0, 1, '', 0),
('auto_update', '', '', '', '', '0', '', 0, 0, '', 0),
('auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '1', '1=Enabled|0=Disabled', 0, 1, 'users', 964),
('backend_css', '', '', '', '', '', '', 0, 0, '', 0),
('custom_css', 'Custom CSS', '', '', '', '', '', 0, 0, '', 0),
('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target="_blank" href="http://php.net/manual/en/function.date.php">date format</a> from PHP - OR - Using the format of <a target="_blank" href="http://php.net/manual/en/function.strftime.php">strings formatted as date</a> from PHP.', 'text', 'Y-m-d', 'Y/m/d', '', 1, 1, '', 995),
('default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'totta', 'func:get_themes', 1, 0, '', 0),
('default_user_group', 'Default User Group', 'Here you set the default user group', 'text', 'regular', 'regular', '', 1, 1, 'users', 0),
('enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'users', 963),
('enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '0', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
('frontend_css', 'Frontend CSS', 'Add additional CSS', 'textarea', ' ', ' ', '', 0, 0, '', 0),
('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '1', '1=Open|0=Closed', 1, 1, '', 988),
('items_per_page', 'Items per page', '', '', '', '10', '', 0, 0, '', 0),
('language', '', '', '', '', 'english', '', 0, 0, '', 0),
('latest_version', '', '', '', '', '1.0.1', '', 0, 0, '', 0),
('latest_version_fetch', '', '', '', '', '1354438437', '', 0, 0, '', 0),
('local_auth', 'Local Auth', 'Enable to allow for local autherisation', 'select', '1', '1', '0=Disabled|1=Enabled', 1, 1, 'authentication', 0),
('logo_url', 'Logo URL', '', '', '', 'http://localhost/yggdrasil/assets/img/yggdrasil.jpg', '', 0, 0, '', 0),
('mail_protocol', 'Mail Protocol', 'All e-mails will be sent with this method.', 'text', 'sendmail', 'sendmail', '', 1, 1, 'email', 950),
('mail_sendmail_path', 'Mail Sendmail Path', 'All e-mails will be sent with this method.', 'text', '', '', '', 0, 1, 'email', 951),
('mail_smtp_host', 'SMTP Host', 'All e-mails will be sent with this method.', 'text', 'sendmail', 'sendmail', '', 1, 1, 'email', 952),
('mail_smtp_pass', 'SMTP Password', 'All e-mails will be sent with this method.', 'text', '', '', '', 0, 1, 'email', 954),
('mail_smtp_port', 'SMTP port number', 'All e-mails will be sent with this method.', 'text', '', '', '', 0, 1, 'email', 955),
('mail_smtp_user', 'SMTP username', 'All e-mails will be sent with this method.', 'text', '', '', '', 0, 1, 'email', 953),
('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Add your slogan here', '', 0, 1, '', 998),
('notify_email', '', '', '', '', 'tzetter@thunderbeardesign.com', '', 0, 0, '', 0),
('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '10', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '25', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
('rss_password', 'RSS Password', 'RSS Password', 'text', '', '6Ohh44pWRsuz', '', 0, 0, '', 1001),
('send_multipart', '', '', '', '', '1', '', 0, 0, '', 0),
('send_x_days_before', '', '', '', '', '7', '', 0, 0, '', 0),
('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', 1, 1, 'email', 978),
('set_time_limit', 'Set Time Limit', 'Set time limit to retrieve html page from originated url or a pdf screenshoot from originated url- the value is in seconds', 'text', '120', '120', '120 ', 0, 1, 'Media', 0),
('show_text', 'Text to show', 'How many characters of main text to show', 'text', '100', '10', '', 0, 1, 'Feed', 0),
('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 997),
('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'Yggdrasil', '', 1, 1, '', 1000),
('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 996),
('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'One news at time', '', 0, 1, '', 999),
('smtp_host', '', '', '', '', '', '', 0, 0, '', 0),
('smtp_pass', '', '', '', '', '', '', 0, 0, '', 0),
('smtp_port', '', '', '', '', '25', '', 0, 0, '', 0),
('theme', 'Front End Theme', 'Select the theme you want users to see on the front end.', '', '', 'totta', 'func:get_themes', 1, 1, '', 0),
('timezone', 'Time Zone', 'Select your timezone', '', '', 'Europe/Berlin', '', 1, 1, '', 997),
('time_format', 'Time Format', 'How should time be displayed', '', '', 'H:i', '', 1, 1, '', 996),
('version', '', '', '', '', '1.0.1', '', 0, 0, '', 0);

-- split --

CREATE TABLE `{DBPREFIX}theme_options` (
`id` int(11) NOT NULL,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}theme_options` (`id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `theme`) VALUES
(1, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'Yes', 'no', 'yes=Yes|no=No', 1, 'totta'),
(3, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'Yes', 'Yes', 'yes=Yes|no=No', 1, 'bootstrap');

-- --------------------------------------------------------

-- split --

CREATE TABLE `{DBPREFIX}updates` (
  `version` varchar(255) NOT NULL,
  `hashes` longtext NOT NULL,
  `suzip` longtext NOT NULL,
  `changed_files` longtext NOT NULL,
  `processed_changelog` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- split --

CREATE TABLE `{DBPREFIX}update_files` (
`id` int(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `filename` text NOT NULL,
  `data` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- split --

CREATE TABLE `{DBPREFIX}users` (
  `id` mediumint(8) unsigned NOT NULL,
  `client_id` int(10) NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  `ip_address` char(16) CHARACTER SET utf8 NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 NOT NULL,
  `salt` varchar(40) CHARACTER SET utf8 DEFAULT '',
  `email` varchar(40) CHARACTER SET utf8 NOT NULL,
  `activation_code` varchar(40) CHARACTER SET utf8 DEFAULT '',
  `forgotten_password_code` varchar(40) CHARACTER SET utf8 DEFAULT '',
  `remember_code` varchar(40) CHARACTER SET utf8 DEFAULT '',
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '1',
  `office` int(10) NOT NULL,
  `via_ldap` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `ldap_data` text CHARACTER SET utf8 NOT NULL,
  `tw_user_id` bigint(25) NOT NULL,
  `gmt` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `gmt_zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Europe/Amsterdam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}users` (`id`, `client_id`, `group_id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `remember_code`, `created_on`, `last_login`, `active`, `office`, `via_ldap`, `ldap_data`, `tw_user_id`, `gmt`, `gmt_zone`) VALUES
(1, 0, 1, '0.0.0.0', '{USERNAME}', '{PASSWORD}', '{SALT}', '{EMAIL}', '', '', '', 1360925298, 1432045467, 1, 0, 'local', '', 0, '', '');

-- split --

CREATE TABLE `{DBPREFIX}news_item_country` (
  `id` int(10) unsigned NOT NULL,
  `news_item` int(10) unsigned NOT NULL,
  `country` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_created` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1088 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}news_item_country` (`id`, `news_item`, `country`, `user`, `date_created`) VALUES
(1078, 1037, 16, 1, 1490280675),
(1079, 1038, 17, 1, 1490280677),
(1080, 1039, 18, 1, 1490280678),
(1081, 1040, 18, 1, 1490280680),
(1082, 1041, 39, 0, 1490280682),
(1083, 1042, 39, 0, 1490280683),
(1084, 1043, 39, 0, 1490280685),
(1085, 1044, 199, 0, 1490280688),
(1086, 1045, 199, 0, 1490280690),
(1087, 1046, 199, 0, 1490280692);

-- split --

CREATE TABLE `{DBPREFIX}news_items` (
  `id` int(10) unsigned NOT NULL,
  `feed` int(10) unsigned NOT NULL,
  `feed_checked` int(10) unsigned NOT NULL,
  `keywords` int(10) unsigned NOT NULL,
  `keywords_link` int(10) unsigned NOT NULL DEFAULT '0',
  `campaign` int(10) unsigned NOT NULL DEFAULT '0',
  `wires` int(10) unsigned NOT NULL DEFAULT '0',
  `journalists` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` int(10) unsigned NOT NULL DEFAULT '0',
  `country` int(10) unsigned NOT NULL DEFAULT '0',
  `language` int(10) unsigned NOT NULL DEFAULT '0',
  `data` int(10) unsigned NOT NULL DEFAULT '0',
  `options` int(10) unsigned NOT NULL DEFAULT '0',
  `advanced` int(10) unsigned NOT NULL DEFAULT '0',
  `media` int(10) NOT NULL DEFAULT '0',
  `tagged` tinyint(4) NOT NULL DEFAULT '0',
  `rss_id` text CHARACTER SET utf8 NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `imgurl` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_item` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created` int(10) unsigned NOT NULL DEFAULT '0',
  `date_modified` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}news_items` (`id`, `feed`, `feed_checked`, `keywords`, `keywords_link`, `campaign`, `wires`, `journalists`, `weight`, `comment`, `country`, `language`, `data`, `options`, `advanced`, `media`, `tagged`, `rss_id`, `url`, `imgurl`, `status`, `date_item`, `date_created`, `date_modified`, `deleted`) VALUES
(1037, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1078, 1037, 1037, 0, 0, 663, 1, 'f46bf49d-cf2b-47e5-b07c-c71a60ac3526', 'http://www.greenpeace.orghttp//grnpc.org/IgOs0', '', 1, '2016-10-18 07:30:00', 1490280675, 1490280675, 0),
(1038, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1079, 1038, 1038, 0, 0, 664, 1, '459f3160-1f39-428d-acb7-52ea6d524dd7', 'http://www.greenpeace.orghttps//heartoftheamazon.org', '', 1, '2016-06-15 09:00:00', 1490280677, 1490280677, 0),
(1039, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1080, 1039, 1039, 0, 0, 664, 1, 'cea6e6c4-6f69-4802-81ba-a9fc9d307481', 'http://www.greenpeace.orghttps//act.greenpeace.org/ea-action/action?ea.client.id=1844&ea.campaign.id=51574', '', 1, '2016-05-28 11:50:00', 1490280678, 1490280678, 0),
(1040, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1081, 1040, 1040, 0, 0, 664, 1, 'eaba181b-36b7-4da6-8278-bb1bbda4a124', 'http://www.greenpeace.orghttps//act.greenpeace.org/ea-action/action?ea.client.id=1844&ea.campaign.id=51294', '', 1, '2016-05-19 15:00:00', 1490280680, 1490280680, 0),
(1041, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1082, 1041, 1041, 0, 0, 664, 1, 'd0de2797-aa09-47df-99a0-bbccfe9aecc5', 'http://www.greenpeace.orghttps//act.greenpeace.org/ea-action/action?ea.client.id=1844&ea.campaign.id=50199', '', 1, '2016-04-22 08:30:00', 1490280682, 1490280682, 0),
(1042, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1083, 1042, 1042, 0, 0, 664, 1, 'd78d0f90-12d3-4970-80a8-87942fd7c9a0', 'http://www.greenpeace.orghttps//act.greenpeace.org/ea-action/action?ea.client.id=1844&ea.campaign.id=49719', '', 1, '2016-04-06 11:30:00', 1490280683, 1490280683, 0),
(1043, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1084, 1043, 1043, 0, 0, 664, 1, 'ec450cf9-66b8-4b11-8080-77edcf7d9316', 'http://www.greenpeace.orghttps//act.greenpeace.org/ea-action/action?ea.client.id=1844&ea.campaign.id=55928', '', 1, '2016-03-03 01:00:00', 1490280685, 1490280685, 0),
(1044, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1085, 1044, 1044, 0, 0, 663, 1, '78cb39e8-54fc-4cb7-8692-beffe8b912c3', 'http://www.greenpeace.orghttp//grnpc.org/Ig2Ub', '', 1, '2015-10-15 05:00:00', 1490280688, 1490280688, 0),
(1045, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1086, 1045, 1045, 0, 0, 664, 1, 'abdc863f-5202-49a8-ba7c-10b8f48a4806', 'http://www.greenpeace.orghttps//act.greenpeace.org/ea-action/action?ea.client.id=1844&ea.campaign.id=42721', '', 1, '2015-10-04 16:00:00', 1490280690, 1490280690, 0),
(1046, 143, 0, 0, 0, 0, 0, 0, 0, 0, 1087, 1046, 1046, 0, 0, 663, 1, 'ceb76f3e-4a68-42ff-aaf4-7e270b3fd52f', 'http://www.greenpeace.orghttp//detox-outdoor.org/en', '', 1, '2015-09-07 20:56:00', 1490280692, 1490280692, 0);

-- split --

CREATE TABLE `{DBPREFIX}geo_country` (
  `id` int(10) unsigned NOT NULL,
  `iso` varchar(2) CHARACTER SET latin1 NOT NULL,
  `iso3` varchar(3) CHARACTER SET latin1 NOT NULL,
  `iso_numeric` smallint(6) NOT NULL,
  `fips` varchar(8) CHARACTER SET latin1 NOT NULL,
  `flag` varchar(8) CHARACTER SET latin1 NOT NULL,
  `country` varchar(64) CHARACTER SET latin1 NOT NULL,
  `capital` varchar(64) CHARACTER SET latin1 NOT NULL,
  `area` int(10) unsigned NOT NULL,
  `population` int(10) unsigned NOT NULL,
  `continent` varchar(32) CHARACTER SET latin1 NOT NULL,
  `continent_code` varchar(64) CHARACTER SET latin1 NOT NULL,
  `tld` varchar(8) CHARACTER SET latin1 NOT NULL,
  `currency_code` varchar(8) CHARACTER SET latin1 NOT NULL,
  `currency_name` varchar(16) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(8) CHARACTER SET latin1 NOT NULL,
  `postal_code_format` varchar(64) CHARACTER SET latin1 NOT NULL,
  `postal_code_regexp` varchar(64) CHARACTER SET latin1 NOT NULL,
  `languages` varchar(64) CHARACTER SET latin1 NOT NULL,
  `geonameid` int(10) unsigned NOT NULL,
  `neighbours` varchar(64) CHARACTER SET latin1 NOT NULL,
  `equivalent_fips_code` varchar(16) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- split --

INSERT INTO `{DBPREFIX}geo_country` (`id`, `iso`, `iso3`, `iso_numeric`, `fips`, `flag`, `country`, `capital`, `area`, `population`, `continent`, `continent_code`, `tld`, `currency_code`, `currency_name`, `phone`, `postal_code_format`, `postal_code_regexp`, `languages`, `geonameid`, `neighbours`, `equivalent_fips_code`) VALUES
(1, '', '', 0, '', '', 'Unknown', 'Unknown', 0, 0, '', 'Unknown', '', '', '', '', '', '', '', 0, '', ''),
(2, 'AD', 'AND', 20, 'AN', 'ad', 'Andorra', 'Andorra la Vella', 468, 84000, 'Europe', 'EU', '.ad', 'EUR', 'Euro', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 3041565, 'ES,FR', ''),
(3, 'AE', 'ARE', 784, 'AE', 'ae', 'United Arab Emirates', 'Abu Dhabi', 82880, 4975593, 'Asia', 'AS', '.ae', 'AED', 'Dirham', '971', '', '', 'ar-AE,fa,en,hi,ur', 290557, 'SA,OM', ''),
(4, 'AF', 'AFG', 4, 'AF', 'af', 'Afghanistan', 'Kabul', 647500, 29121286, 'Asia', 'AS', '.af', 'AFN', 'Afghani', '93', '', '', 'fa-AF,ps,uz-AF,tk', 1149361, 'TM,CN,IR,TJ,PK,UZ', ''),
(5, 'AG', 'ATG', 28, 'AC', 'ag', 'Antigua and Barbuda', 'St. John''s', 443, 86754, 'North America', 'NA', '.ag', 'XCD', 'Dollar', '+1-268', '', '', 'en-AG', 3576396, '', ''),
(6, 'AI', 'AIA', 660, 'AV', 'ai', 'Anguilla', 'The Valley', 102, 13254, 'North America', 'NA', '.ai', 'XCD', 'Dollar', '+1-264', '', '', 'en-AI', 3573511, '', ''),
(7, 'AL', 'ALB', 8, 'AL', 'al', 'Albania', 'Tirana', 28748, 2986952, 'Europe', 'EU', '.al', 'ALL', 'Lek', '355', '', '', 'sq,el', 783754, 'MK,GR,CS,ME,RS,XK', ''),
(8, 'AM', 'ARM', 51, 'AM', 'am', 'Armenia', 'Yerevan', 29800, 2968000, 'Asia', 'AS', '.am', 'AMD', 'Dram', '374', '######', '^(d{6})$', 'hy', 174982, 'GE,IR,AZ,TR', ''),
(9, 'AO', 'AGO', 24, 'AO', 'ao', 'Angola', 'Luanda', 1246700, 13068161, 'Africa', 'AF', '.ao', 'AOA', 'Kwanza', '244', '', '', 'pt-AO', 3351879, 'CD,NA,ZM,CG', ''),
(10, 'AQ', 'ATA', 10, 'AY', 'aq', 'Antarctica', '', 14000000, 0, '', 'AN', '.aq', '', '', '', '', '', '', 6697173, '', ''),
(11, 'AR', 'ARG', 32, 'AR', 'ar', 'Argentina', 'Buenos Aires', 2766890, 41343201, 'South America', 'SA', '.ar', 'ARS', 'Peso', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 3865483, 'CL,BO,UY,PY,BR', ''),
(12, 'AS', 'ASM', 16, 'AQ', 'as', 'American Samoa', 'Pago Pago', 199, 57881, 'Oceania', 'OC', '.as', 'USD', 'Dollar', '+1-684', '', '', 'en-AS,sm,to', 5880801, '', ''),
(13, 'AT', 'AUT', 40, 'AU', 'at', 'Austria', 'Vienna', 83858, 8205000, 'Europe', 'EU', '.at', 'EUR', 'Euro', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 2782113, 'CH,DE,HU,SK,CZ,IT,SI,LI', ''),
(14, 'AU', 'AUS', 36, 'AS', 'au', 'Australia', 'Canberra', 7686850, 21515754, 'Oceania', 'OC', '.au', 'AUD', 'Dollar', '61', '####', '^(d{4})$', 'en-AU', 2077456, '', ''),
(15, 'AW', 'ABW', 533, 'AA', 'aw', 'Aruba', 'Oranjestad', 193, 71566, 'North America', 'NA', '.aw', 'AWG', 'Guilder', '297', '', '', 'nl-AW,es,en', 3577279, '', ''),
(16, 'AX', 'ALA', 248, '', 'ax', 'Aland Islands', 'Mariehamn', 0, 26711, 'Europe', 'EU', '.ax', 'EUR', 'Euro', '+358-18', '', '', 'sv-AX', 661882, '', 'FI'),
(17, 'AZ', 'AZE', 31, 'AJ', 'az', 'Azerbaijan', 'Baku', 86600, 8303512, 'Asia', 'AS', '.az', 'AZN', 'Manat', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 587116, 'GE,IR,AM,TR,RU', ''),
(18, 'BA', 'BIH', 70, 'BK', 'ba', 'Bosnia and Herzegovina', 'Sarajevo', 51129, 4590000, 'Europe', 'EU', '.ba', 'BAM', 'Marka', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 3277605, 'CS,HR,ME,RS', ''),
(19, 'BB', 'BRB', 52, 'BB', 'bb', 'Barbados', 'Bridgetown', 431, 285653, 'North America', 'NA', '.bb', 'BBD', 'Dollar', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', 3374084, '', ''),
(20, 'BD', 'BGD', 50, 'BG', 'bd', 'Bangladesh', 'Dhaka', 144000, 156118464, 'Asia', 'AS', '.bd', 'BDT', 'Taka', '880', '####', '^(d{4})$', 'bn-BD,en', 1210997, 'MM,IN', ''),
(21, 'BE', 'BEL', 56, 'BE', 'be', 'Belgium', 'Brussels', 30510, 10403000, 'Europe', 'EU', '.be', 'EUR', 'Euro', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 2802361, 'DE,NL,LU,FR', ''),
(22, 'BF', 'BFA', 854, 'UV', 'bf', 'Burkina Faso', 'Ouagadougou', 274200, 16241811, 'Africa', 'AF', '.bf', 'XOF', 'Franc', '226', '', '', 'fr-BF', 2361809, 'NE,BJ,GH,CI,TG,ML', ''),
(23, 'BG', 'BGR', 100, 'BU', 'bg', 'Bulgaria', 'Sofia', 110910, 7148785, 'Europe', 'EU', '.bg', 'BGN', 'Lev', '359', '####', '^(d{4})$', 'bg,tr-BG', 732800, 'MK,GR,RO,CS,TR,RS', ''),
(24, 'BH', 'BHR', 48, 'BA', 'bh', 'Bahrain', 'Manama', 665, 738004, 'Asia', 'AS', '.bh', 'BHD', 'Dinar', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', 290291, '', ''),
(25, 'BI', 'BDI', 108, 'BY', 'bi', 'Burundi', 'Bujumbura', 27830, 9863117, 'Africa', 'AF', '.bi', 'BIF', 'Franc', '257', '', '', 'fr-BI,rn', 433561, 'TZ,CD,RW', ''),
(26, 'BJ', 'BEN', 204, 'BN', 'bj', 'Benin', 'Porto-Novo', 112620, 9056010, 'Africa', 'AF', '.bj', 'XOF', 'Franc', '229', '', '', 'fr-BJ', 2395170, 'NE,TG,BF,NG', ''),
(27, 'BL', 'BLM', 652, 'TB', 'bl', 'Saint Barthélemy', 'Gustavia', 21, 8450, 'North America', 'NA', '.gp', 'EUR', 'Euro', '590', '### ###', '', 'fr', 3578476, '', ''),
(28, 'BM', 'BMU', 60, 'BD', 'bm', 'Bermuda', 'Hamilton', 53, 65365, 'North America', 'NA', '.bm', 'BMD', 'Dollar', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', 3573345, '', ''),
(29, 'BN', 'BRN', 96, 'BX', 'bn', 'Brunei', 'Bandar Seri Begawan', 5770, 395027, 'Asia', 'AS', '.bn', 'BND', 'Dollar', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 1820814, 'MY', ''),
(30, 'BO', 'BOL', 68, 'BL', 'bo', 'Bolivia', 'La Paz', 1098580, 9947418, 'South America', 'SA', '.bo', 'BOB', 'Boliviano', '591', '', '', 'es-BO,qu,ay', 3923057, 'PE,CL,PY,BR,AR', ''),
(31, 'BQ', 'BES', 535, '', 'bq', 'Bonaire, Saint Eustatius and Saba ', '', 0, 18012, 'North America', 'NA', '.bq', 'USD', 'Dollar', '599', '', '', 'nl,pap,en', 7626844, '', ''),
(32, 'BR', 'BRA', 76, 'BR', 'br', 'Brazil', 'Brasília', 8511965, 201103330, 'South America', 'SA', '.br', 'BRL', 'Real', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 3469034, 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', ''),
(33, 'BS', 'BHS', 44, 'BF', 'bs', 'Bahamas', 'Nassau', 13940, 301790, 'North America', 'NA', '.bs', 'BSD', 'Dollar', '+1-242', '', '', 'en-BS', 3572887, '', ''),
(34, 'BT', 'BTN', 64, 'BT', 'bt', 'Bhutan', 'Thimphu', 47000, 699847, 'Asia', 'AS', '.bt', 'BTN', 'Ngultrum', '975', '', '', 'dz', 1252634, 'CN,IN', ''),
(35, 'BV', 'BVT', 74, 'BV', 'bv', 'Bouvet Island', '', 0, 0, '', 'AN', '.bv', 'NOK', 'Krone', '', '', '', '', 3371123, '', ''),
(36, 'BW', 'BWA', 72, 'BC', 'bw', 'Botswana', 'Gaborone', 600370, 2029307, 'Africa', 'AF', '.bw', 'BWP', 'Pula', '267', '', '', 'en-BW,tn-BW', 933860, 'ZW,ZA,NA', ''),
(37, 'BY', 'BLR', 112, 'BO', 'by', 'Belarus', 'Minsk', 207600, 9685000, 'Europe', 'EU', '.by', 'BYR', 'Ruble', '375', '######', '^(d{6})$', 'be,ru', 630336, 'PL,LT,UA,RU,LV', ''),
(38, 'BZ', 'BLZ', 84, 'BH', 'bz', 'Belize', 'Belmopan', 22966, 314522, 'North America', 'NA', '.bz', 'BZD', 'Dollar', '501', '', '', 'en-BZ,es', 3582678, 'GT,MX', ''),
(39, 'CA', 'CAN', 124, 'CA', 'ca', 'Canada', 'Ottawa', 9984670, 33679000, 'North America', 'NA', '.ca', 'CAD', 'Dollar', '1', '@#@ #@#', '^([a-zA-Z]d[a-zA-Z]d[a-zA-Z]d)$', 'en-CA,fr-CA,iu', 6251999, 'US', ''),
(40, 'CC', 'CCK', 166, 'CK', 'cc', 'Cocos Islands', 'West Island', 14, 628, 'Asia', 'AS', '.cc', 'AUD', 'Dollar', '61', '', '', 'ms-CC,en', 1547376, '', ''),
(41, 'CD', 'COD', 180, 'CG', 'cd', 'Democratic Republic of the Congo', 'Kinshasa', 2345410, 70916439, 'Africa', 'AF', '.cd', 'CDF', 'Franc', '243', '', '', 'fr-CD,ln,kg', 203312, 'TZ,CF,SD,RW,ZM,BI,UG,CG,AO', ''),
(42, 'CF', 'CAF', 140, 'CT', 'cf', 'Central African Republic', 'Bangui', 622984, 4844927, 'Africa', 'AF', '.cf', 'XAF', 'Franc', '236', '', '', 'fr-CF,sg,ln,kg', 239880, 'TD,SD,CD,CM,CG', ''),
(43, 'CG', 'COG', 178, 'CF', 'cg', 'Republic of the Congo', 'Brazzaville', 342000, 3039126, 'Africa', 'AF', '.cg', 'XAF', 'Franc', '242', '', '', 'fr-CG,kg,ln-CG', 2260494, 'CF,GA,CD,CM,AO', ''),
(44, 'CH', 'CHE', 756, 'SZ', 'ch', 'Switzerland', 'Berne', 41290, 7581000, 'Europe', 'EU', '.ch', 'CHF', 'Franc', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 2658434, 'DE,IT,LI,FR,AT', ''),
(45, 'CI', 'CIV', 384, 'IV', 'ci', 'Ivory Coast', 'Yamoussoukro', 322460, 21058798, 'Africa', 'AF', '.ci', 'XOF', 'Franc', '225', '', '', 'fr-CI', 2287781, 'LR,GH,GN,BF,ML', ''),
(46, 'CK', 'COK', 184, 'CW', 'ck', 'Cook Islands', 'Avarua', 240, 21388, 'Oceania', 'OC', '.ck', 'NZD', 'Dollar', '682', '', '', 'en-CK,mi', 1899402, '', ''),
(47, 'CL', 'CHL', 152, 'CI', 'cl', 'Chile', 'Santiago', 756950, 16746491, 'South America', 'SA', '.cl', 'CLP', 'Peso', '56', '#######', '^(d{7})$', 'es-CL', 3895114, 'PE,BO,AR', ''),
(48, 'CM', 'CMR', 120, 'CM', 'cm', 'Cameroon', 'Yaoundé', 475440, 19294149, 'Africa', 'AF', '.cm', 'XAF', 'Franc', '237', '', '', 'en-CM,fr-CM', 2233387, 'TD,CF,GA,GQ,CG,NG', ''),
(49, 'CN', 'CHN', 156, 'CH', 'cn', 'China', 'Beijing', 9596960, 1330044000, 'Asia', 'AS', '.cn', 'CNY', 'Yuan Renminbi', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 1814991, 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', ''),
(50, 'CO', 'COL', 170, 'CO', 'co', 'Colombia', 'Bogotá', 1138910, 44205293, 'South America', 'SA', '.co', 'COP', 'Peso', '57', '', '', 'es-CO', 3686110, 'EC,PE,PA,BR,VE', ''),
(51, 'CR', 'CRI', 188, 'CS', 'cr', 'Costa Rica', 'San José', 51100, 4516220, 'North America', 'NA', '.cr', 'CRC', 'Colon', '506', '####', '^(d{4})$', 'es-CR,en', 3624060, 'PA,NI', ''),
(52, 'CU', 'CUB', 192, 'CU', 'cu', 'Cuba', 'Havana', 110860, 11423000, 'North America', 'NA', '.cu', 'CUP', 'Peso', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 3562981, 'US', ''),
(53, 'CV', 'CPV', 132, 'CV', 'cv', 'Cape Verde', 'Praia', 4033, 508659, 'Africa', 'AF', '.cv', 'CVE', 'Escudo', '238', '####', '^(d{4})$', 'pt-CV', 3374766, '', ''),
(54, 'CW', 'CUW', 531, 'UC', 'cw', 'Curacao', ' Willemstad', 0, 141766, 'North America', 'NA', '.cw', 'ANG', 'Guilder', '599', '', '', 'nl,pap', 7626836, '', ''),
(55, 'CX', 'CXR', 162, 'KT', 'cx', 'Christmas Island', 'Flying Fish Cove', 135, 1500, 'Asia', 'AS', '.cx', 'AUD', 'Dollar', '61', '####', '^(d{4})$', 'en,zh,ms-CC', 2078138, '', ''),
(56, 'CY', 'CYP', 196, 'CY', 'cy', 'Cyprus', 'Nicosia', 9250, 1102677, 'Europe', 'EU', '.cy', 'EUR', 'Euro', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', 146669, '', ''),
(57, 'CZ', 'CZE', 203, 'EZ', 'cz', 'Czech Republic', 'Prague', 78866, 10476000, 'Europe', 'EU', '.cz', 'CZK', 'Koruna', '420', '### ##', '^(d{5})$', 'cs,sk', 3077311, 'PL,DE,SK,AT', ''),
(58, 'DE', 'DEU', 276, 'GM', 'de', 'Germany', 'Berlin', 357021, 81802257, 'Europe', 'EU', '.de', 'EUR', 'Euro', '49', '#####', '^(d{5})$', 'de', 2921044, 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', ''),
(59, 'DJ', 'DJI', 262, 'DJ', 'dj', 'Djibouti', 'Djibouti', 23000, 740528, 'Africa', 'AF', '.dj', 'DJF', 'Franc', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 223816, 'ER,ET,SO', ''),
(60, 'DK', 'DNK', 208, 'DA', 'dk', 'Denmark', 'Copenhagen', 43094, 5484000, 'Europe', 'EU', '.dk', 'DKK', 'Krone', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 2623032, 'DE', ''),
(61, 'DM', 'DMA', 212, 'DO', 'dm', 'Dominica', 'Roseau', 754, 72813, 'North America', 'NA', '.dm', 'XCD', 'Dollar', '+1-767', '', '', 'en-DM', 3575830, '', ''),
(62, 'DO', 'DOM', 214, 'DR', 'do', 'Dominican Republic', 'Santo Domingo', 48730, 9823821, 'North America', 'NA', '.do', 'DOP', 'Peso', '+1-809 a', '#####', '^(d{5})$', 'es-DO', 3508796, 'HT', ''),
(63, 'DZ', 'DZA', 12, 'AG', 'dz', 'Algeria', 'Algiers', 2381740, 34586184, 'Africa', 'AF', '.dz', 'DZD', 'Dinar', '213', '#####', '^(d{5})$', 'ar-DZ', 2589581, 'NE,EH,LY,MR,TN,MA,ML', ''),
(64, 'EC', 'ECU', 218, 'EC', 'ec', 'Ecuador', 'Quito', 283560, 14790608, 'South America', 'SA', '.ec', 'USD', 'Dollar', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 3658394, 'PE,CO', ''),
(65, 'EE', 'EST', 233, 'EN', 'ee', 'Estonia', 'Tallinn', 45226, 1291170, 'Europe', 'EU', '.ee', 'EUR', 'Kroon', '372', '#####', '^(d{5})$', 'et,ru', 453733, 'RU,LV', ''),
(66, 'EG', 'EGY', 818, 'EG', 'eg', 'Egypt', 'Cairo', 1001450, 80471869, 'Africa', 'AF', '.eg', 'EGP', 'Pound', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 357994, 'LY,SD,IL', ''),
(67, 'EH', 'ESH', 732, 'WI', 'eh', 'Western Sahara', 'El-Aaiun', 266000, 273008, 'Africa', 'AF', '.eh', 'MAD', 'Dirham', '212', '', '', 'ar,mey', 2461445, 'DZ,MR,MA', ''),
(68, 'ER', 'ERI', 232, 'ER', 'er', 'Eritrea', 'Asmara', 121320, 5792984, 'Africa', 'AF', '.er', 'ERN', 'Nakfa', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 338010, 'ET,SD,DJ', ''),
(69, 'ES', 'ESP', 724, 'SP', 'es', 'Spain', 'Madrid', 504782, 46505963, 'Europe', 'EU', '.es', 'EUR', 'Euro', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 2510769, 'AD,PT,GI,FR,MA', ''),
(70, 'ET', 'ETH', 231, 'ET', 'et', 'Ethiopia', 'Addis Ababa', 1127127, 88013491, 'Africa', 'AF', '.et', 'ETB', 'Birr', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 337996, 'ER,KE,SD,SO,DJ', ''),
(71, 'FI', 'FIN', 246, 'FI', 'fi', 'Finland', 'Helsinki', 337030, 5244000, 'Europe', 'EU', '.fi', 'EUR', 'Euro', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 660013, 'NO,RU,SE', ''),
(72, 'FJ', 'FJI', 242, 'FJ', 'fj', 'Fiji', 'Suva', 18270, 875983, 'Oceania', 'OC', '.fj', 'FJD', 'Dollar', '679', '', '', 'en-FJ,fj', 2205218, '', ''),
(73, 'FK', 'FLK', 238, 'FK', 'fk', 'Falkland Islands', 'Stanley', 12173, 2638, 'South America', 'SA', '.fk', 'FKP', 'Pound', '500', '', '', 'en-FK', 3474414, '', ''),
(74, 'FM', 'FSM', 583, 'FM', 'fm', 'Micronesia', 'Palikir', 702, 107708, 'Oceania', 'OC', '.fm', 'USD', 'Dollar', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', 2081918, '', ''),
(75, 'FO', 'FRO', 234, 'FO', 'fo', 'Faroe Islands', 'Tórshavn', 1399, 48228, 'Europe', 'EU', '.fo', 'DKK', 'Krone', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', 2622320, '', ''),
(76, 'FR', 'FRA', 250, 'FR', 'fr', 'France', 'Paris', 547030, 64768389, 'Europe', 'EU', '.fr', 'EUR', 'Euro', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 3017382, 'CH,DE,BE,LU,IT,AD,MC,ES', ''),
(77, 'GA', 'GAB', 266, 'GB', 'ga', 'Gabon', 'Libreville', 267667, 1545255, 'Africa', 'AF', '.ga', 'XAF', 'Franc', '241', '', '', 'fr-GA', 2400553, 'CM,GQ,CG', ''),
(78, 'GB', 'GBR', 826, 'UK', 'gb', 'United Kingdom', 'London', 244820, 62348447, 'Europe', 'EU', '.uk', 'GBP', 'Pound', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|GIR0AA', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})', 'en-GB,cy-GB,gd', 2635167, 'IE', ''),
(79, 'GD', 'GRD', 308, 'GJ', 'gd', 'Grenada', 'St. George''s', 344, 107818, 'North America', 'NA', '.gd', 'XCD', 'Dollar', '+1-473', '', '', 'en-GD', 3580239, '', ''),
(80, 'GE', 'GEO', 268, 'GG', 'ge', 'Georgia', 'Tbilisi', 69700, 4630000, 'Asia', 'AS', '.ge', 'GEL', 'Lari', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 614540, 'AM,AZ,TR,RU', ''),
(81, 'GF', 'GUF', 254, 'FG', 'gf', 'French Guiana', 'Cayenne', 91000, 195506, 'South America', 'SA', '.gf', 'EUR', 'Euro', '594', '#####', '^((97)|(98)3d{2})$', 'fr-GF', 3381670, 'SR,BR', ''),
(82, 'GG', 'GGY', 831, 'GK', 'gg', 'Guernsey', 'St Peter Port', 78, 65228, 'Europe', 'EU', '.gg', 'GBP', 'Pound', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|GIR0AA', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})', 'en,fr', 3042362, '', ''),
(83, 'GH', 'GHA', 288, 'GH', 'gh', 'Ghana', 'Accra', 239460, 24339838, 'Africa', 'AF', '.gh', 'GHS', 'Cedi', '233', '', '', 'en-GH,ak,ee,tw', 2300660, 'CI,TG,BF', ''),
(84, 'GI', 'GIB', 292, 'GI', 'gi', 'Gibraltar', 'Gibraltar', 7, 27884, 'Europe', 'EU', '.gi', 'GIP', 'Pound', '350', '', '', 'en-GI,es,it,pt', 2411586, 'ES', ''),
(85, 'GL', 'GRL', 304, 'GL', 'gl', 'Greenland', 'Nuuk', 2166086, 56375, 'North America', 'NA', '.gl', 'DKK', 'Krone', '299', '####', '^(d{4})$', 'kl,da-GL,en', 3425505, '', ''),
(86, 'GM', 'GMB', 270, 'GA', 'gm', 'Gambia', 'Banjul', 11300, 1593256, 'Africa', 'AF', '.gm', 'GMD', 'Dalasi', '220', '', '', 'en-GM,mnk,wof,wo,ff', 2413451, 'SN', ''),
(87, 'GN', 'GIN', 324, 'GV', 'gn', 'Guinea', 'Conakry', 245857, 10324025, 'Africa', 'AF', '.gn', 'GNF', 'Franc', '224', '', '', 'fr-GN', 2420477, 'LR,SN,SL,CI,GW,ML', ''),
(88, 'GP', 'GLP', 312, 'GP', 'gp', 'Guadeloupe', 'Basse-Terre', 1780, 443000, 'North America', 'NA', '.gp', 'EUR', 'Euro', '590', '#####', '^((97)|(98)d{3})$', 'fr-GP', 3579143, 'AN', ''),
(89, 'GQ', 'GNQ', 226, 'EK', 'gq', 'Equatorial Guinea', 'Malabo', 28051, 1014999, 'Africa', 'AF', '.gq', 'XAF', 'Franc', '240', '', '', 'es-GQ,fr', 2309096, 'GA,CM', ''),
(90, 'GR', 'GRC', 300, 'GR', 'gr', 'Greece', 'Athens', 131940, 11000000, 'Europe', 'EU', '.gr', 'EUR', 'Euro', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 390903, 'AL,MK,TR,BG', ''),
(91, 'GS', 'SGS', 239, 'SX', 'gs', 'South Georgia and the South Sandwich Islands', 'Grytviken', 3903, 30, '', 'AN', '.gs', 'GBP', 'Pound', '', '', '', 'en', 3474415, '', ''),
(92, 'GT', 'GTM', 320, 'GT', 'gt', 'Guatemala', 'Guatemala City', 108890, 13550440, 'North America', 'NA', '.gt', 'GTQ', 'Quetzal', '502', '#####', '^(d{5})$', 'es-GT', 3595528, 'MX,HN,BZ,SV', ''),
(93, 'GU', 'GUM', 316, 'GQ', 'gu', 'Guam', 'Hagåtña', 549, 168564, 'Oceania', 'OC', '.gu', 'USD', 'Dollar', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', 4043988, '', ''),
(94, 'GW', 'GNB', 624, 'PU', 'gw', 'Guinea-Bissau', 'Bissau', 36120, 1565126, 'Africa', 'AF', '.gw', 'XOF', 'Franc', '245', '####', '^(d{4})$', 'pt-GW,pov', 2372248, 'SN,GN', ''),
(95, 'GY', 'GUY', 328, 'GY', 'gy', 'Guyana', 'Georgetown', 214970, 748486, 'South America', 'SA', '.gy', 'GYD', 'Dollar', '592', '', '', 'en-GY', 3378535, 'SR,BR,VE', ''),
(96, 'HK', 'HKG', 344, 'HK', 'hk', 'Hong Kong', 'Hong Kong', 1092, 6898686, 'Asia', 'AS', '.hk', 'HKD', 'Dollar', '852', '', '', 'zh-HK,yue,zh,en', 1819730, '', ''),
(97, 'HM', 'HMD', 334, 'HM', 'hm', 'Heard Island and McDonald Islands', '', 412, 0, '', 'AN', '.hm', 'AUD', 'Dollar', ' ', '', '', '', 1547314, '', ''),
(98, 'HN', 'HND', 340, 'HO', 'hn', 'Honduras', 'Tegucigalpa', 112090, 7989415, 'North America', 'NA', '.hn', 'HNL', 'Lempira', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 3608932, 'GT,NI,SV', ''),
(99, 'HR', 'HRV', 191, 'HR', 'hr', 'Croatia', 'Zagreb', 56542, 4491000, 'Europe', 'EU', '.hr', 'HRK', 'Kuna', '385', 'HR-#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 3202326, 'HU,SI,CS,BA,ME,RS', ''),
(100, 'HT', 'HTI', 332, 'HA', 'ht', 'Haiti', 'Port-au-Prince', 27750, 9648924, 'North America', 'NA', '.ht', 'HTG', 'Gourde', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 3723988, 'DO', ''),
(101, 'HU', 'HUN', 348, 'HU', 'hu', 'Hungary', 'Budapest', 93030, 9930000, 'Europe', 'EU', '.hu', 'HUF', 'Forint', '36', '####', '^(d{4})$', 'hu-HU', 719819, 'SK,SI,RO,UA,CS,HR,AT,RS', ''),
(102, 'ID', 'IDN', 360, 'ID', 'id', 'Indonesia', 'Jakarta', 1919440, 242968342, 'Asia', 'AS', '.id', 'IDR', 'Rupiah', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 1643084, 'PG,TL,MY', ''),
(103, 'IE', 'IRL', 372, 'EI', 'ie', 'Ireland', 'Dublin', 70280, 4622917, 'Europe', 'EU', '.ie', 'EUR', 'Euro', '353', '', '', 'en-IE,ga-IE', 2963597, 'GB', ''),
(104, 'IL', 'ISR', 376, 'IS', 'il', 'Israel', 'Jerusalem', 20770, 7353985, 'Asia', 'AS', '.il', 'ILS', 'Shekel', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 294640, 'SY,JO,LB,EG,PS', ''),
(105, 'IM', 'IMN', 833, 'IM', 'im', 'Isle of Man', 'Douglas, Isle of Man', 572, 75049, 'Europe', 'EU', '.im', 'GBP', 'Pound', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|GIR0AA', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})', 'en,gv', 3042225, '', ''),
(106, 'IN', 'IND', 356, 'IN', 'in', 'India', 'New Delhi', 3287590, 1173108018, 'Asia', 'AS', '.in', 'INR', 'Rupee', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,ks,ne,sd,kok,do', 1269750, 'CN,NP,MM,BT,PK,BD', ''),
(107, 'IO', 'IOT', 86, 'IO', 'io', 'British Indian Ocean Territory', 'Diego Garcia', 60, 4000, 'Asia', 'AS', '.io', 'USD', 'Dollar', '246', '', '', 'en-IO', 1282588, '', ''),
(108, 'IQ', 'IRQ', 368, 'IZ', 'iq', 'Iraq', 'Baghdad', 437072, 29671605, 'Asia', 'AS', '.iq', 'IQD', 'Dinar', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 99237, 'SY,SA,IR,JO,TR,KW', ''),
(109, 'IR', 'IRN', 364, 'IR', 'ir', 'Iran', 'Tehran', 1648000, 76923300, 'Asia', 'AS', '.ir', 'IRR', 'Rial', '98', '##########', '^(d{10})$', 'fa-IR,ku', 130758, 'TM,AF,IQ,AM,PK,AZ,TR', ''),
(110, 'IS', 'ISL', 352, 'IC', 'is', 'Iceland', 'Reykjavík', 103000, 308910, 'Europe', 'EU', '.is', 'ISK', 'Krona', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', 2629691, '', ''),
(111, 'IT', 'ITA', 380, 'IT', 'it', 'Italy', 'Rome', 301230, 60340328, 'Europe', 'EU', '.it', 'EUR', 'Euro', '39', '#####', '^(d{5})$', 'it-IT,de-IT,fr-IT,sc,ca,co,sl', 3175395, 'CH,VA,SI,SM,FR,AT', ''),
(112, 'JE', 'JEY', 832, 'JE', 'je', 'Jersey', 'Saint Helier', 116, 90812, 'Europe', 'EU', '.je', 'GBP', 'Pound', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|GIR0AA', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})', 'en,pt', 3042142, '', ''),
(113, 'JM', 'JAM', 388, 'JM', 'jm', 'Jamaica', 'Kingston', 10991, 2847232, 'North America', 'NA', '.jm', 'JMD', 'Dollar', '+1-876', '', '', 'en-JM', 3489940, '', ''),
(114, 'JO', 'JOR', 400, 'JO', 'jo', 'Jordan', 'Amman', 92300, 6407085, 'Asia', 'AS', '.jo', 'JOD', 'Dinar', '962', '#####', '^(d{5})$', 'ar-JO,en', 248816, 'SY,SA,IQ,IL,PS', ''),
(115, 'JP', 'JPN', 392, 'JA', 'jp', 'Japan', 'Tokyo', 377835, 127288000, 'Asia', 'AS', '.jp', 'JPY', 'Yen', '81', '###-####', '^(d{7})$', 'ja', 1861060, '', ''),
(116, 'KE', 'KEN', 404, 'KE', 'ke', 'Kenya', 'Nairobi', 582650, 40046566, 'Africa', 'AF', '.ke', 'KES', 'Shilling', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 192950, 'ET,TZ,SD,SO,UG', ''),
(117, 'KG', 'KGZ', 417, 'KG', 'kg', 'Kyrgyzstan', 'Bishkek', 198500, 5508626, 'Asia', 'AS', '.kg', 'KGS', 'Som', '996', '######', '^(d{6})$', 'ky,uz,ru', 1527747, 'CN,TJ,UZ,KZ', ''),
(118, 'KH', 'KHM', 116, 'CB', 'kh', 'Cambodia', 'Phnom Penh', 181040, 14453680, 'Asia', 'AS', '.kh', 'KHR', 'Riels', '855', '#####', '^(d{5})$', 'km,fr,en', 1831722, 'LA,TH,VN', ''),
(119, 'KI', 'KIR', 296, 'KR', 'ki', 'Kiribati', 'Tarawa', 811, 92533, 'Oceania', 'OC', '.ki', 'AUD', 'Dollar', '686', '', '', 'en-KI,gil', 4030945, '', ''),
(120, 'KM', 'COM', 174, 'CN', 'km', 'Comoros', 'Moroni', 2170, 773407, 'Africa', 'AF', '.km', 'KMF', 'Franc', '269', '', '', 'ar,fr-KM', 921929, '', ''),
(121, 'KN', 'KNA', 659, 'SC', 'kn', 'Saint Kitts and Nevis', 'Basseterre', 261, 49898, 'North America', 'NA', '.kn', 'XCD', 'Dollar', '+1-869', '', '', 'en-KN', 3575174, '', ''),
(122, 'KP', 'PRK', 408, 'KN', 'kp', 'North Korea', 'Pyongyang', 120540, 22912177, 'Asia', 'AS', '.kp', 'KPW', 'Won', '850', '###-###', '^(d{6})$', 'ko-KP', 1873107, 'CN,KR,RU', ''),
(123, 'KR', 'KOR', 410, 'KS', 'kr', 'South Korea', 'Seoul', 98480, 48422644, 'Asia', 'AS', '.kr', 'KRW', 'Won', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 1835841, 'KP', ''),
(124, 'XK', 'XKX', 0, 'KV', 'xk', 'Kosovo', 'Pristina', 0, 1800000, 'Europe', 'EU', '', 'EUR', 'Euro', '', '', '', 'sq,sr', 831053, 'RS,AL,MK,ME', ''),
(125, 'KW', 'KWT', 414, 'KU', 'kw', 'Kuwait', 'Kuwait City', 17820, 2789132, 'Asia', 'AS', '.kw', 'KWD', 'Dinar', '965', '#####', '^(d{5})$', 'ar-KW,en', 285570, 'SA,IQ', ''),
(126, 'KY', 'CYM', 136, 'CJ', 'ky', 'Cayman Islands', 'George Town', 262, 44270, 'North America', 'NA', '.ky', 'KYD', 'Dollar', '+1-345', '', '', 'en-KY', 3580718, '', ''),
(127, 'KZ', 'KAZ', 398, 'KZ', 'kz', 'Kazakhstan', 'Astana', 2717300, 15340000, 'Asia', 'AS', '.kz', 'KZT', 'Tenge', '7', '######', '^(d{6})$', 'kk,ru', 1522867, 'TM,CN,KG,UZ,RU', ''),
(128, 'LA', 'LAO', 418, 'LA', 'la', 'Laos', 'Vientiane', 236800, 6368162, 'Asia', 'AS', '.la', 'LAK', 'Kip', '856', '#####', '^(d{5})$', 'lo,fr,en', 1655842, 'CN,MM,KH,TH,VN', ''),
(129, 'LB', 'LBN', 422, 'LE', 'lb', 'Lebanon', 'Beirut', 10400, 4125247, 'Asia', 'AS', '.lb', 'LBP', 'Pound', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 272103, 'SY,IL', ''),
(130, 'LC', 'LCA', 662, 'ST', 'lc', 'Saint Lucia', 'Castries', 616, 160922, 'North America', 'NA', '.lc', 'XCD', 'Dollar', '+1-758', '', '', 'en-LC', 3576468, '', ''),
(131, 'LI', 'LIE', 438, 'LS', 'li', 'Liechtenstein', 'Vaduz', 160, 35000, 'Europe', 'EU', '.li', 'CHF', 'Franc', '423', '####', '^(d{4})$', 'de-LI', 3042058, 'CH,AT', ''),
(132, 'LK', 'LKA', 144, 'CE', 'lk', 'Sri Lanka', 'Colombo', 65610, 21513990, 'Asia', 'AS', '.lk', 'LKR', 'Rupee', '94', '#####', '^(d{5})$', 'si,ta,en', 1227603, '', ''),
(133, 'LR', 'LBR', 430, 'LI', 'lr', 'Liberia', 'Monrovia', 111370, 3685076, 'Africa', 'AF', '.lr', 'LRD', 'Dollar', '231', '####', '^(d{4})$', 'en-LR', 2275384, 'SL,CI,GN', ''),
(134, 'LS', 'LSO', 426, 'LT', 'ls', 'Lesotho', 'Maseru', 30355, 1919552, 'Africa', 'AF', '.ls', 'LSL', 'Loti', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 932692, 'ZA', ''),
(135, 'LT', 'LTU', 440, 'LH', 'lt', 'Lithuania', 'Vilnius', 65200, 3565000, 'Europe', 'EU', '.lt', 'LTL', 'Litas', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 597427, 'PL,BY,RU,LV', ''),
(136, 'LU', 'LUX', 442, 'LU', 'lu', 'Luxembourg', 'Luxembourg', 2586, 497538, 'Europe', 'EU', '.lu', 'EUR', 'Euro', '352', '####', '^(d{4})$', 'lb,de-LU,fr-LU', 2960313, 'DE,BE,FR', ''),
(137, 'LV', 'LVA', 428, 'LG', 'lv', 'Latvia', 'Riga', 64589, 2217969, 'Europe', 'EU', '.lv', 'LVL', 'Lat', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 458258, 'LT,EE,BY,RU', ''),
(138, 'LY', 'LBY', 434, 'LY', 'ly', 'Libya', 'Tripolis', 1759540, 6461454, 'Africa', 'AF', '.ly', 'LYD', 'Dinar', '218', '', '', 'ar-LY,it,en', 2215636, 'TD,NE,DZ,SD,TN,EG', ''),
(139, 'MA', 'MAR', 504, 'MO', 'ma', 'Morocco', 'Rabat', 446550, 31627428, 'Africa', 'AF', '.ma', 'MAD', 'Dirham', '212', '#####', '^(d{5})$', 'ar-MA,fr', 2542007, 'DZ,EH,ES', ''),
(140, 'MC', 'MCO', 492, 'MN', 'mc', 'Monaco', 'Monaco', 2, 32965, 'Europe', 'EU', '.mc', 'EUR', 'Euro', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 2993457, 'FR', ''),
(141, 'MD', 'MDA', 498, 'MD', 'md', 'Moldova', 'Chi?in?u', 33843, 4324000, 'Europe', 'EU', '.md', 'MDL', 'Leu', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 617790, 'RO,UA', ''),
(142, 'ME', 'MNE', 499, 'MJ', 'me', 'Montenegro', 'Podgorica', 14026, 666730, 'Europe', 'EU', '.me', 'EUR', 'Euro', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 3194884, 'AL,HR,BA,RS,XK', ''),
(143, 'MF', 'MAF', 663, 'RN', 'mf', 'Saint Martin', 'Marigot', 53, 35925, 'North America', 'NA', '.gp', 'EUR', 'Euro', '590', '### ###', '', 'fr', 3578421, 'SX', ''),
(144, 'MG', 'MDG', 450, 'MA', 'mg', 'Madagascar', 'Antananarivo', 587040, 21281844, 'Africa', 'AF', '.mg', 'MGA', 'Ariary', '261', '###', '^(d{3})$', 'fr-MG,mg', 1062947, '', ''),
(145, 'MH', 'MHL', 584, 'RM', 'mh', 'Marshall Islands', 'Majuro', 181, 65859, 'Oceania', 'OC', '.mh', 'USD', 'Dollar', '692', '', '', 'mh,en-MH', 2080185, '', ''),
(146, 'MK', 'MKD', 807, 'MK', 'mk', 'Macedonia', 'Skopje', 25333, 2061000, 'Europe', 'EU', '.mk', 'MKD', 'Denar', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 718075, 'AL,GR,CS,BG,RS,XK', ''),
(147, 'ML', 'MLI', 466, 'ML', 'ml', 'Mali', 'Bamako', 1240000, 13796354, 'Africa', 'AF', '.ml', 'XOF', 'Franc', '223', '', '', 'fr-ML,bm', 2453866, 'SN,NE,DZ,CI,GN,MR,BF', ''),
(148, 'MM', 'MMR', 104, 'BM', 'mm', 'Myanmar', 'Nay Pyi Taw', 678500, 53414374, 'Asia', 'AS', '.mm', 'MMK', 'Kyat', '95', '#####', '^(d{5})$', 'my', 1327865, 'CN,LA,TH,BD,IN', ''),
(149, 'MN', 'MNG', 496, 'MG', 'mn', 'Mongolia', 'Ulan Bator', 1565000, 3086918, 'Asia', 'AS', '.mn', 'MNT', 'Tugrik', '976', '######', '^(d{6})$', 'mn,ru', 2029969, 'CN,RU', ''),
(150, 'MO', 'MAC', 446, 'MC', 'mo', 'Macao', 'Macao', 254, 449198, 'Asia', 'AS', '.mo', 'MOP', 'Pataca', '853', '', '', 'zh,zh-MO,pt', 1821275, '', ''),
(151, 'MP', 'MNP', 580, 'CQ', 'mp', 'Northern Mariana Islands', 'Saipan', 477, 86000, 'Oceania', 'OC', '.mp', 'USD', 'Dollar', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', 4041468, '', ''),
(152, 'MQ', 'MTQ', 474, 'MB', 'mq', 'Martinique', 'Fort-de-France', 1100, 432900, 'North America', 'NA', '.mq', 'EUR', 'Euro', '596', '#####', '^(d{5})$', 'fr-MQ', 3570311, '', ''),
(153, 'MR', 'MRT', 478, 'MR', 'mr', 'Mauritania', 'Nouakchott', 1030700, 3205060, 'Africa', 'AF', '.mr', 'MRO', 'Ouguiya', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 2378080, 'SN,DZ,EH,ML', ''),
(154, 'MS', 'MSR', 500, 'MH', 'ms', 'Montserrat', 'Plymouth', 102, 9341, 'North America', 'NA', '.ms', 'XCD', 'Dollar', '+1-664', '', '', 'en-MS', 3578097, '', ''),
(155, 'MT', 'MLT', 470, 'MT', 'mt', 'Malta', 'Valletta', 316, 403000, 'Europe', 'EU', '.mt', 'EUR', 'Euro', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', 2562770, '', ''),
(156, 'MU', 'MUS', 480, 'MP', 'mu', 'Mauritius', 'Port Louis', 2040, 1294104, 'Africa', 'AF', '.mu', 'MUR', 'Rupee', '230', '', '', 'en-MU,bho,fr', 934292, '', ''),
(157, 'MV', 'MDV', 462, 'MV', 'mv', 'Maldives', 'Malé', 300, 395650, 'Asia', 'AS', '.mv', 'MVR', 'Rufiyaa', '960', '#####', '^(d{5})$', 'dv,en', 1282028, '', ''),
(158, 'MW', 'MWI', 454, 'MI', 'mw', 'Malawi', 'Lilongwe', 118480, 15447500, 'Africa', 'AF', '.mw', 'MWK', 'Kwacha', '265', '', '', 'ny,yao,tum,swk', 927384, 'TZ,MZ,ZM', ''),
(159, 'MX', 'MEX', 484, 'MX', 'mx', 'Mexico', 'Mexico City', 1972550, 112468855, 'North America', 'NA', '.mx', 'MXN', 'Peso', '52', '#####', '^(d{5})$', 'es-MX', 3996063, 'GT,US,BZ', ''),
(160, 'MY', 'MYS', 458, 'MY', 'my', 'Malaysia', 'Kuala Lumpur', 329750, 28274729, 'Asia', 'AS', '.my', 'MYR', 'Ringgit', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 1733045, 'BN,TH,ID', ''),
(161, 'MZ', 'MOZ', 508, 'MZ', 'mz', 'Mozambique', 'Maputo', 801590, 22061451, 'Africa', 'AF', '.mz', 'MZN', 'Meticail', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 1036973, 'ZW,TZ,SZ,ZA,ZM,MW', ''),
(162, 'NA', 'NAM', 516, 'WA', 'na', 'Namibia', 'Windhoek', 825418, 2128471, 'Africa', 'AF', '.na', 'NAD', 'Dollar', '264', '', '', 'en-NA,af,de,hz,naq', 3355338, 'ZA,BW,ZM,AO', ''),
(163, 'NC', 'NCL', 540, 'NC', 'nc', 'New Caledonia', 'Nouméa', 19060, 216494, 'Oceania', 'OC', '.nc', 'XPF', 'Franc', '687', '#####', '^(d{5})$', 'fr-NC', 2139685, '', ''),
(164, 'NE', 'NER', 562, 'NG', 'ne', 'Niger', 'Niamey', 1267000, 15878271, 'Africa', 'AF', '.ne', 'XOF', 'Franc', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 2440476, 'TD,BJ,DZ,LY,BF,NG,ML', ''),
(165, 'NF', 'NFK', 574, 'NF', 'nf', 'Norfolk Island', 'Kingston', 35, 1828, 'Oceania', 'OC', '.nf', 'AUD', 'Dollar', '672', '', '', 'en-NF', 2155115, '', ''),
(166, 'NG', 'NGA', 566, 'NI', 'ng', 'Nigeria', 'Abuja', 923768, 154000000, 'Africa', 'AF', '.ng', 'NGN', 'Naira', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 2328926, 'TD,NE,BJ,CM', ''),
(167, 'NI', 'NIC', 558, 'NU', 'ni', 'Nicaragua', 'Managua', 129494, 5995928, 'North America', 'NA', '.ni', 'NIO', 'Cordoba', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 3617476, 'CR,HN', ''),
(168, 'NL', 'NLD', 528, 'NL', 'nl', 'Netherlands', 'Amsterdam', 41526, 16645000, 'Europe', 'EU', '.nl', 'EUR', 'Euro', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 2750405, 'DE,BE', ''),
(169, 'NO', 'NOR', 578, 'NO', 'no', 'Norway', 'Oslo', 324220, 4907000, 'Europe', 'EU', '.no', 'NOK', 'Krone', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 3144096, 'FI,RU,SE', ''),
(170, 'NP', 'NPL', 524, 'NP', 'np', 'Nepal', 'Kathmandu', 140800, 28951852, 'Asia', 'AS', '.np', 'NPR', 'Rupee', '977', '#####', '^(d{5})$', 'ne,en', 1282988, 'CN,IN', ''),
(171, 'NR', 'NRU', 520, 'NR', 'nr', 'Nauru', 'Yaren', 21, 10065, 'Oceania', 'OC', '.nr', 'AUD', 'Dollar', '674', '', '', 'na,en-NR', 2110425, '', ''),
(172, 'NU', 'NIU', 570, 'NE', 'nu', 'Niue', 'Alofi', 260, 2166, 'Oceania', 'OC', '.nu', 'NZD', 'Dollar', '683', '', '', 'niu,en-NU', 4036232, '', ''),
(173, 'NZ', 'NZL', 554, 'NZ', 'nz', 'New Zealand', 'Wellington', 268680, 4252277, 'Oceania', 'OC', '.nz', 'NZD', 'Dollar', '64', '####', '^(d{4})$', 'en-NZ,mi', 2186224, '', ''),
(174, 'OM', 'OMN', 512, 'MU', 'om', 'Oman', 'Muscat', 212460, 2967717, 'Asia', 'AS', '.om', 'OMR', 'Rial', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 286963, 'SA,YE,AE', ''),
(175, 'PA', 'PAN', 591, 'PM', 'pa', 'Panama', 'Panama City', 78200, 3410676, 'North America', 'NA', '.pa', 'PAB', 'Balboa', '507', '', '', 'es-PA,en', 3703430, 'CR,CO', ''),
(176, 'PE', 'PER', 604, 'PE', 'pe', 'Peru', 'Lima', 1285220, 29907003, 'South America', 'SA', '.pe', 'PEN', 'Sol', '51', '', '', 'es-PE,qu,ay', 3932488, 'EC,CL,BO,BR,CO', ''),
(177, 'PF', 'PYF', 258, 'FP', 'pf', 'French Polynesia', 'Papeete', 4167, 270485, 'Oceania', 'OC', '.pf', 'XPF', 'Franc', '689', '#####', '^((97)|(98)7d{2})$', 'fr-PF,ty', 4030656, '', ''),
(178, 'PG', 'PNG', 598, 'PP', 'pg', 'Papua New Guinea', 'Port Moresby', 462840, 6064515, 'Oceania', 'OC', '.pg', 'PGK', 'Kina', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 2088628, 'ID', ''),
(179, 'PH', 'PHL', 608, 'RP', 'ph', 'Philippines', 'Manila', 300000, 99900177, 'Asia', 'AS', '.ph', 'PHP', 'Peso', '63', '####', '^(d{4})$', 'tl,en-PH,fil', 1694008, '', ''),
(180, 'PK', 'PAK', 586, 'PK', 'pk', 'Pakistan', 'Islamabad', 803940, 184404791, 'Asia', 'AS', '.pk', 'PKR', 'Rupee', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 1168579, 'CN,AF,IR,IN', ''),
(181, 'PL', 'POL', 616, 'PL', 'pl', 'Poland', 'Warsaw', 312685, 38500000, 'Europe', 'EU', '.pl', 'PLN', 'Zloty', '48', '##-###', '^(d{5})$', 'pl', 798544, 'DE,LT,SK,CZ,BY,UA,RU', ''),
(182, 'PM', 'SPM', 666, 'SB', 'pm', 'Saint Pierre and Miquelon', 'Saint-Pierre', 242, 7012, 'North America', 'NA', '.pm', 'EUR', 'Euro', '508', '#####', '^(97500)$', 'fr-PM', 3424932, '', ''),
(183, 'PN', 'PCN', 612, 'PC', 'pn', 'Pitcairn', 'Adamstown', 47, 46, 'Oceania', 'OC', '.pn', 'NZD', 'Dollar', '870', '', '', 'en-PN', 4030699, '', ''),
(184, 'PR', 'PRI', 630, 'RQ', 'pr', 'Puerto Rico', 'San Juan', 9104, 3916632, 'North America', 'NA', '.pr', 'USD', 'Dollar', '+1-787 a', '#####-####', '^(d{9})$', 'en-PR,es-PR', 4566966, '', ''),
(185, 'PS', 'PSE', 275, 'WE', 'ps', 'Palestinian Territory', 'East Jerusalem', 5970, 3800000, 'Asia', 'AS', '.ps', 'ILS', 'Shekel', '970', '', '', 'ar-PS', 6254930, 'JO,IL', ''),
(186, 'PT', 'PRT', 620, 'PO', 'pt', 'Portugal', 'Lisbon', 92391, 10676000, 'Europe', 'EU', '.pt', 'EUR', 'Euro', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 2264397, 'ES', ''),
(187, 'PW', 'PLW', 585, 'PS', 'pw', 'Palau', 'Melekeok', 458, 19907, 'Oceania', 'OC', '.pw', 'USD', 'Dollar', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', 1559582, '', ''),
(188, 'PY', 'PRY', 600, 'PA', 'py', 'Paraguay', 'Asunción', 406750, 6375830, 'South America', 'SA', '.py', 'PYG', 'Guarani', '595', '####', '^(d{4})$', 'es-PY,gn', 3437598, 'BO,BR,AR', ''),
(189, 'QA', 'QAT', 634, 'QA', 'qa', 'Qatar', 'Doha', 11437, 840926, 'Asia', 'AS', '.qa', 'QAR', 'Rial', '974', '', '', 'ar-QA,es', 289688, 'SA', ''),
(190, 'RE', 'REU', 638, 'RE', 're', 'Reunion', 'Saint-Denis', 2517, 776948, 'Africa', 'AF', '.re', 'EUR', 'Euro', '262', '#####', '^((97)|(98)(4|7|8)d{2})$', 'fr-RE', 935317, '', ''),
(191, 'RO', 'ROU', 642, 'RO', 'ro', 'Romania', 'Bucharest', 237500, 21959278, 'Europe', 'EU', '.ro', 'RON', 'Leu', '40', '######', '^(d{6})$', 'ro,hu,rom', 798549, 'MD,HU,UA,CS,BG,RS', ''),
(192, 'RS', 'SRB', 688, 'RI', 'rs', 'Serbia', 'Belgrade', 88361, 7344847, 'Europe', 'EU', '.rs', 'RSD', 'Dinar', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 6290252, 'AL,HU,MK,RO,HR,BA,BG,ME,XK', ''),
(193, 'RU', 'RUS', 643, 'RS', 'ru', 'Russia', 'Moscow', 17100000, 140702000, 'Europe', 'EU', '.ru', 'RUB', 'Ruble', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv,mdf,chm,ba,in', 2017370, 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', ''),
(194, 'RW', 'RWA', 646, 'RW', 'rw', 'Rwanda', 'Kigali', 26338, 11055976, 'Africa', 'AF', '.rw', 'RWF', 'Franc', '250', '', '', 'rw,en-RW,fr-RW,sw', 49518, 'TZ,CD,BI,UG', ''),
(195, 'SA', 'SAU', 682, 'SA', 'sa', 'Saudi Arabia', 'Riyadh', 1960582, 25731776, 'Asia', 'AS', '.sa', 'SAR', 'Rial', '966', '#####', '^(d{5})$', 'ar-SA', 102358, 'QA,OM,IQ,YE,JO,AE,KW', ''),
(196, 'SB', 'SLB', 90, 'BP', 'sb', 'Solomon Islands', 'Honiara', 28450, 559198, 'Oceania', 'OC', '.sb', 'SBD', 'Dollar', '677', '', '', 'en-SB,tpi', 2103350, '', ''),
(197, 'SC', 'SYC', 690, 'SE', 'sc', 'Seychelles', 'Victoria', 455, 88340, 'Africa', 'AF', '.sc', 'SCR', 'Rupee', '248', '', '', 'en-SC,fr-SC', 241170, '', ''),
(198, 'SD', 'SDN', 736, 'SU', 'sd', 'Sudan', 'Khartoum', 2505810, 43939598, 'Africa', 'AF', '.sd', 'SDG', 'Dinar', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 366755, 'TD,ER,ET,LY,KE,CF,CD,UG,EG', ''),
(199, 'SE', 'SWE', 752, 'SW', 'se', 'Sweden', 'Stockholm', 449964, 9045000, 'Europe', 'EU', '.se', 'SEK', 'Krona', '46', 'SE-### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 2661886, 'NO,FI', ''),
(200, 'SG', 'SGP', 702, 'SN', 'sg', 'Singapore', 'Singapur', 693, 4701069, 'Asia', 'AS', '.sg', 'SGD', 'Dollar', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', 1880251, '', ''),
(201, 'SH', 'SHN', 654, 'SH', 'sh', 'Saint Helena', 'Jamestown', 410, 7460, 'Africa', 'AF', '.sh', 'SHP', 'Pound', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', 3370751, '', ''),
(202, 'SI', 'SVN', 705, 'SI', 'si', 'Slovenia', 'Ljubljana', 20273, 2007000, 'Europe', 'EU', '.si', 'EUR', 'Euro', '386', 'SI- ####', '^(?:SI)*(d{4})$', 'sl,sh', 3190538, 'HU,IT,HR,AT', ''),
(203, 'SJ', 'SJM', 744, 'SV', 'sj', 'Svalbard and Jan Mayen', 'Longyearbyen', 62049, 2550, 'Europe', 'EU', '.sj', 'NOK', 'Krone', '47', '', '', 'no,ru', 607072, '', ''),
(204, 'SK', 'SVK', 703, 'LO', 'sk', 'Slovakia', 'Bratislava', 48845, 5455000, 'Europe', 'EU', '.sk', 'EUR', 'Euro', '421', '###  ##', '^(d{5})$', 'sk,hu', 3057568, 'PL,HU,CZ,UA,AT', ''),
(205, 'SL', 'SLE', 694, 'SL', 'sl', 'Sierra Leone', 'Freetown', 71740, 5245695, 'Africa', 'AF', '.sl', 'SLL', 'Leone', '232', '', '', 'en-SL,men,tem', 2403846, 'LR,GN', ''),
(206, 'SM', 'SMR', 674, 'SM', 'sm', 'San Marino', 'San Marino', 61, 31477, 'Europe', 'EU', '.sm', 'EUR', 'Euro', '378', '4789#', '^(4789d)$', 'it-SM', 3168068, 'IT', ''),
(207, 'SN', 'SEN', 686, 'SG', 'sn', 'Senegal', 'Dakar', 196190, 12323252, 'Africa', 'AF', '.sn', 'XOF', 'Franc', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 2245662, 'GN,MR,GW,GM,ML', ''),
(208, 'SO', 'SOM', 706, 'SO', 'so', 'Somalia', 'Mogadishu', 637657, 10112453, 'Africa', 'AF', '.so', 'SOS', 'Shilling', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 51537, 'ET,KE,DJ', ''),
(209, 'SR', 'SUR', 740, 'NS', 'sr', 'Suriname', 'Paramaribo', 163270, 492829, 'South America', 'SA', '.sr', 'SRD', 'Dollar', '597', '', '', 'nl-SR,en,srn,hns,jv', 3382998, 'GY,BR,GF', ''),
(210, 'ST', 'STP', 678, 'TP', 'st', 'Sao Tome and Principe', 'São Tomé', 1001, 175808, 'Africa', 'AF', '.st', 'STD', 'Dobra', '239', '', '', 'pt-ST', 2410758, '', ''),
(211, 'SV', 'SLV', 222, 'ES', 'sv', 'El Salvador', 'San Salvador', 21040, 6052064, 'North America', 'NA', '.sv', 'USD', 'Dollar', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 3585968, 'GT,HN', ''),
(212, 'SX', 'SXM', 534, 'NN', 'sx', 'Sint Maarten', 'Philipsburg', 0, 37429, 'North America', 'NA', '.sx', 'ANG', 'Guilder', '599', '', '', 'nl,en', 7609695, 'MF', ''),
(213, 'SY', 'SYR', 760, 'SY', 'sy', 'Syria', 'Damascus', 185180, 22198110, 'Asia', 'AS', '.sy', 'SYP', 'Pound', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 163843, 'IQ,JO,IL,TR,LB', ''),
(214, 'SZ', 'SWZ', 748, 'WZ', 'sz', 'Swaziland', 'Mbabane', 17363, 1354051, 'Africa', 'AF', '.sz', 'SZL', 'Lilangeni', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 934841, 'ZA,MZ', ''),
(215, 'TC', 'TCA', 796, 'TK', 'tc', 'Turks and Caicos Islands', 'Cockburn Town', 430, 20556, 'North America', 'NA', '.tc', 'USD', 'Dollar', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', 3576916, '', ''),
(216, 'TD', 'TCD', 148, 'CD', 'td', 'Chad', 'N''Djamena', 1284000, 10543464, 'Africa', 'AF', '.td', 'XAF', 'Franc', '235', '', '', 'fr-TD,ar-TD,sre', 2434508, 'NE,LY,CF,SD,CM,NG', ''),
(217, 'TF', 'ATF', 260, 'FS', 'tf', 'French Southern Territories', 'Port-aux-Français', 7829, 140, '', 'AN', '.tf', 'EUR', 'Euro  ', '', '', '', 'fr', 1546748, '', ''),
(218, 'TG', 'TGO', 768, 'TO', 'tg', 'Togo', 'Lomé', 56785, 6587239, 'Africa', 'AF', '.tg', 'XOF', 'Franc', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 2363686, 'BJ,GH,BF', ''),
(219, 'TH', 'THA', 764, 'TH', 'th', 'Thailand', 'Bangkok', 514000, 67089500, 'Asia', 'AS', '.th', 'THB', 'Baht', '66', '#####', '^(d{5})$', 'th,en', 1605651, 'LA,MM,KH,MY', ''),
(220, 'TJ', 'TJK', 762, 'TI', 'tj', 'Tajikistan', 'Dushanbe', 143100, 7487489, 'Asia', 'AS', '.tj', 'TJS', 'Somoni', '992', '######', '^(d{6})$', 'tg,ru', 1220409, 'CN,AF,KG,UZ', ''),
(221, 'TK', 'TKL', 772, 'TL', 'tk', 'Tokelau', '', 10, 1466, 'Oceania', 'OC', '.tk', 'NZD', 'Dollar', '690', '', '', 'tkl,en-TK', 4031074, '', ''),
(222, 'TL', 'TLS', 626, 'TT', 'tl', 'East Timor', 'Dili', 15007, 1154625, 'Oceania', 'OC', '.tp', 'USD', 'Dollar', '670', '', '', 'tet,pt-TL,id,en', 1966436, 'ID', ''),
(223, 'TM', 'TKM', 795, 'TX', 'tm', 'Turkmenistan', 'Ashgabat', 488100, 4940916, 'Asia', 'AS', '.tm', 'TMT', 'Manat', '993', '######', '^(d{6})$', 'tk,ru,uz', 1218197, 'AF,IR,UZ,KZ', ''),
(224, 'TN', 'TUN', 788, 'TS', 'tn', 'Tunisia', 'Tunis', 163610, 10589025, 'Africa', 'AF', '.tn', 'TND', 'Dinar', '216', '####', '^(d{4})$', 'ar-TN,fr', 2464461, 'DZ,LY', ''),
(225, 'TO', 'TON', 776, 'TN', 'to', 'Tonga', 'Nuku''alofa', 748, 122580, 'Oceania', 'OC', '.to', 'TOP', 'Pa''anga', '676', '', '', 'to,en-TO', 4032283, '', ''),
(226, 'TR', 'TUR', 792, 'TU', 'tr', 'Turkey', 'Ankara', 780580, 77804122, 'Asia', 'AS', '.tr', 'TRY', 'Lira', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 298795, 'SY,GE,IQ,IR,GR,AM,AZ,BG', ''),
(227, 'TT', 'TTO', 780, 'TD', 'tt', 'Trinidad and Tobago', 'Port of Spain', 5128, 1228691, 'North America', 'NA', '.tt', 'TTD', 'Dollar', '+1-868', '', '', 'en-TT,hns,fr,es,zh', 3573591, '', ''),
(228, 'TV', 'TUV', 798, 'TV', 'tv', 'Tuvalu', 'Funafuti', 26, 10472, 'Oceania', 'OC', '.tv', 'AUD', 'Dollar', '688', '', '', 'tvl,en,sm,gil', 2110297, '', ''),
(229, 'TW', 'TWN', 158, 'TW', 'tw', 'Taiwan', 'Taipei', 35980, 22894384, 'Asia', 'AS', '.tw', 'TWD', 'Dollar', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', 1668284, '', ''),
(230, 'TZ', 'TZA', 834, 'TZ', 'tz', 'Tanzania', 'Dodoma', 945087, 41892895, 'Africa', 'AF', '.tz', 'TZS', 'Shilling', '255', '', '', 'sw-TZ,en,ar', 149590, 'MZ,KE,CD,RW,ZM,BI,UG,MW', ''),
(231, 'UA', 'UKR', 804, 'UP', 'ua', 'Ukraine', 'Kiev', 603700, 45415596, 'Europe', 'EU', '.ua', 'UAH', 'Hryvnia', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 690791, 'PL,MD,HU,SK,BY,RO,RU', ''),
(232, 'UG', 'UGA', 800, 'UG', 'ug', 'Uganda', 'Kampala', 236040, 33398682, 'Africa', 'AF', '.ug', 'UGX', 'Shilling', '256', '', '', 'en-UG,lg,sw,ar', 226074, 'TZ,KE,SD,CD,RW', ''),
(233, 'UM', 'UMI', 581, '', 'um', 'United States Minor Outlying Islands', '', 0, 0, 'Oceania', 'OC', '.um', 'USD', 'Dollar ', '1', '', '', 'en-UM', 5854968, '', ''),
(234, 'US', 'USA', 840, 'US', 'us', 'United States', 'Washington', 9629091, 310232863, 'North America', 'NA', '.us', 'USD', 'Dollar', '1', '#####-####', '^(d{9})$', 'en-US,es-US,haw,fr', 6252001, 'CA,MX,CU', ''),
(235, 'UY', 'URY', 858, 'UY', 'uy', 'Uruguay', 'Montevideo', 176220, 3477000, 'South America', 'SA', '.uy', 'UYU', 'Peso', '598', '#####', '^(d{5})$', 'es-UY', 3439705, 'BR,AR', ''),
(236, 'UZ', 'UZB', 860, 'UZ', 'uz', 'Uzbekistan', 'Tashkent', 447400, 27865738, 'Asia', 'AS', '.uz', 'UZS', 'Som', '998', '######', '^(d{6})$', 'uz,ru,tg', 1512440, 'TM,AF,KG,TJ,KZ', ''),
(237, 'VA', 'VAT', 336, 'VT', 'va', 'Vatican', 'Vatican City', 0, 921, 'Europe', 'EU', '.va', 'EUR', 'Euro', '379', '', '', 'la,it,fr', 3164670, 'IT', ''),
(238, 'VC', 'VCT', 670, 'VC', 'vc', 'Saint Vincent and the Grenadines', 'Kingstown', 389, 104217, 'North America', 'NA', '.vc', 'XCD', 'Dollar', '+1-784', '', '', 'en-VC,fr', 3577815, '', ''),
(239, 'VE', 'VEN', 862, 'VE', 've', 'Venezuela', 'Caracas', 912050, 27223228, 'South America', 'SA', '.ve', 'VEF', 'Bolivar', '58', '####', '^(d{4})$', 'es-VE', 3625428, 'GY,BR,CO', ''),
(240, 'VG', 'VGB', 92, 'VI', 'vg', 'British Virgin Islands', 'Road Town', 153, 21730, 'North America', 'NA', '.vg', 'USD', 'Dollar', '+1-284', '', '', 'en-VG', 3577718, '', ''),
(241, 'VI', 'VIR', 850, 'VQ', 'vi', 'U.S. Virgin Islands', 'Charlotte Amalie', 352, 108708, 'North America', 'NA', '.vi', 'USD', 'Dollar', '+1-340', '', '', 'en-VI', 4796775, '', ''),
(242, 'VN', 'VNM', 704, 'VM', 'vn', 'Vietnam', 'Hanoi', 329560, 89571130, 'Asia', 'AS', '.vn', 'VND', 'Dong', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 1562822, 'CN,LA,KH', ''),
(243, 'VU', 'VUT', 548, 'NH', 'vu', 'Vanuatu', 'Port Vila', 12200, 221552, 'Oceania', 'OC', '.vu', 'VUV', 'Vatu', '678', '', '', 'bi,en-VU,fr-VU', 2134431, '', ''),
(244, 'WF', 'WLF', 876, 'WF', 'wf', 'Wallis and Futuna', 'Matâ''Utu', 274, 16025, 'Oceania', 'OC', '.wf', 'XPF', 'Franc', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', 4034749, '', ''),
(245, 'WS', 'WSM', 882, 'WS', 'ws', 'Samoa', 'Apia', 2944, 192001, 'Oceania', 'OC', '.ws', 'WST', 'Tala', '685', '', '', 'sm,en-WS', 4034894, '', ''),
(246, 'YE', 'YEM', 887, 'YM', 'ye', 'Yemen', 'San‘a’', 527970, 23495361, 'Asia', 'AS', '.ye', 'YER', 'Rial', '967', '', '', 'ar-YE', 69543, 'SA,OM', ''),
(247, 'YT', 'MYT', 175, 'MF', 'yt', 'Mayotte', 'Mamoudzou', 374, 159042, 'Africa', 'AF', '.yt', 'EUR', 'Euro', '262', '#####', '^(d{5})$', 'fr-YT', 1024031, '', ''),
(248, 'ZA', 'ZAF', 710, 'SF', 'za', 'South Africa', 'Pretoria', 1219912, 49000000, 'Africa', 'AF', '.za', 'ZAR', 'Rand', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 953987, 'ZW,SZ,MZ,BW,NA,LS', ''),
(249, 'ZM', 'ZMB', 894, 'ZA', 'zm', 'Zambia', 'Lusaka', 752614, 13460305, 'Africa', 'AF', '.zm', 'ZMK', 'Kwacha', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 895949, 'ZW,TZ,MZ,CD,NA,MW,AO', ''),
(250, 'ZW', 'ZWE', 716, 'ZI', 'zw', 'Zimbabwe', 'Harare', 390580, 11651858, 'Africa', 'AF', '.zw', 'ZWL', 'Dollar', '263', '', '', 'en-ZW,sn,nr,nd', 878675, 'ZA,MZ,BW,ZM', ''),
(251, 'CS', 'SCG', 891, 'YI', 'cs', 'Serbia and Montenegro', 'Belgrade', 102350, 10829175, 'Europe', 'EU', '.cs', 'RSD', 'Dinar', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 0, 'AL,HU,MK,RO,HR,BA,BG', ''),
(252, 'AN', 'ANT', 530, 'NT', 'an', 'Netherlands Antilles', 'Willemstad', 960, 136197, 'North America', 'NA', '.an', 'ANG', 'Guilder', '599', '', '', 'nl-AN,en,es', 0, 'GP', '');

-- split --

ALTER TABLE `{DBPREFIX}geo_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

-- split --

ALTER TABLE `{DBPREFIX}news_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feed` (`feed`),
  ADD KEY `feed_checked` (`feed_checked`,`keywords`,`campaign`,`wires`,`country`,`data`),
  ADD KEY `journalist` (`journalists`,`weight`),
  ADD KEY `keywords_link` (`keywords_link`),
  ADD KEY `comment` (`comment`),
  ADD KEY `options` (`options`),
  ADD KEY `advanced` (`advanced`),
  ADD KEY `date_item` (`date_item`);

-- split --

ALTER TABLE `{DBPREFIX}news_items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1047;

-- split --

ALTER TABLE `{DBPREFIX}news_item_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_item` (`news_item`,`country`,`user`);

-- split --

ALTER TABLE `{DBPREFIX}news_item_country`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1088;

-- split --

ALTER TABLE `{DBPREFIX}users`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}action_logs`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}ci_sessions`
 ADD PRIMARY KEY (`id`), ADD KEY `last_activity_idx` (`timestamp`);
 
-- split --

ALTER TABLE `{DBPREFIX}groups`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}hidden_notifications`
 ADD KEY `user_id` (`user_id`,`notification_id`);

-- split --

ALTER TABLE `{DBPREFIX}itdatas`
 ADD PRIMARY KEY (`cdn_id`);

-- split --

ALTER TABLE `{DBPREFIX}it_servicedesk_data`
 ADD PRIMARY KEY (`servicedesk_id`);

-- split --

ALTER TABLE `{DBPREFIX}keys`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}keywords`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}login_attempts`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}logs`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}meta`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}modules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `slug` (`slug`), ADD KEY `enabled` (`enabled`);

-- split --

ALTER TABLE `{DBPREFIX}permissions`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}settings`
 ADD PRIMARY KEY (`slug`), ADD KEY `slug` (`slug`);

-- split --

ALTER TABLE `{DBPREFIX}theme_options`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}updates`
 ADD PRIMARY KEY (`version`);

-- split --

ALTER TABLE `{DBPREFIX}update_files`
 ADD PRIMARY KEY (`id`);

-- split --

ALTER TABLE `{DBPREFIX}action_logs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}groups`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}itdatas`
MODIFY `cdn_id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}it_servicedesk_data`
MODIFY `servicedesk_id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}keys`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}keywords`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}login_attempts`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}logs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}meta`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}modules`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}theme_options`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- split --

ALTER TABLE `{DBPREFIX}update_files`
MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;