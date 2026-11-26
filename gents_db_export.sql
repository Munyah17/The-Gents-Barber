-- The Gents Barber DB export 2026-11-26 16:27:11
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `admin_users` VALUES ('1','Munyah','munyah777@gmail.com','$2y$10$pAvHeJjntdYUkt3uybkovetqykQf8zlR.3sVTrMKPwQ9DIjK.KID6','2026-11-23 18:43:18','2026-11-23 18:43:18');

-- admin_users: 1 rows

DROP TABLE IF EXISTS `barber_services`;
CREATE TABLE `barber_services` (
  `barber_id` varchar(50) NOT NULL,
  `service_id` varchar(50) NOT NULL,
  PRIMARY KEY (`barber_id`,`service_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `barber_services_ibfk_1` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barber_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `barber_services` VALUES ('brian','beard-dye');
INSERT INTO `barber_services` VALUES ('brian','beard-nodye');
INSERT INTO `barber_services` VALUES ('brian','clean-shave');
INSERT INTO `barber_services` VALUES ('brian','color-tint');
INSERT INTO `barber_services` VALUES ('brian','hot-towels');
INSERT INTO `barber_services` VALUES ('brian','ladies-cut');
INSERT INTO `barber_services` VALUES ('brian','white-tint');
INSERT INTO `barber_services` VALUES ('charmaine','beard-nodye');
INSERT INTO `barber_services` VALUES ('charmaine','clean-shave');
INSERT INTO `barber_services` VALUES ('charmaine','kids-cut');
INSERT INTO `barber_services` VALUES ('charmaine','ladies-cut');
INSERT INTO `barber_services` VALUES ('charmaine','low-fade');
INSERT INTO `barber_services` VALUES ('charmaine','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('charmaine','taper-fade');
INSERT INTO `barber_services` VALUES ('kuda','beard-nodye');
INSERT INTO `barber_services` VALUES ('kuda','clean-shave');
INSERT INTO `barber_services` VALUES ('kuda','high-fade');
INSERT INTO `barber_services` VALUES ('kuda','kids-cut');
INSERT INTO `barber_services` VALUES ('kuda','low-fade');
INSERT INTO `barber_services` VALUES ('kuda','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('kuda','taper-fade');
INSERT INTO `barber_services` VALUES ('kudakwashe','beard-dye');
INSERT INTO `barber_services` VALUES ('kudakwashe','beard-nodye');
INSERT INTO `barber_services` VALUES ('kudakwashe','burst-fade');
INSERT INTO `barber_services` VALUES ('kudakwashe','clean-shave');
INSERT INTO `barber_services` VALUES ('kudakwashe','high-fade');
INSERT INTO `barber_services` VALUES ('kudakwashe','low-fade');
INSERT INTO `barber_services` VALUES ('kudakwashe','skin-fade-dye');
INSERT INTO `barber_services` VALUES ('kudakwashe','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('kudakwashe','taper-fade');
INSERT INTO `barber_services` VALUES ('panashe','beard-dye');
INSERT INTO `barber_services` VALUES ('panashe','beard-nodye');
INSERT INTO `barber_services` VALUES ('panashe','clean-shave');
INSERT INTO `barber_services` VALUES ('panashe','high-fade');
INSERT INTO `barber_services` VALUES ('panashe','kids-cut');
INSERT INTO `barber_services` VALUES ('panashe','low-fade');
INSERT INTO `barber_services` VALUES ('panashe','skin-fade-dye');
INSERT INTO `barber_services` VALUES ('panashe','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('panashe','taper-fade');
INSERT INTO `barber_services` VALUES ('prince','beard-dye');
INSERT INTO `barber_services` VALUES ('prince','beard-nodye');
INSERT INTO `barber_services` VALUES ('prince','burst-fade');
INSERT INTO `barber_services` VALUES ('prince','clean-shave');
INSERT INTO `barber_services` VALUES ('prince','color-tint');
INSERT INTO `barber_services` VALUES ('prince','high-fade');
INSERT INTO `barber_services` VALUES ('prince','hot-towels');
INSERT INTO `barber_services` VALUES ('prince','kids-cut');
INSERT INTO `barber_services` VALUES ('prince','ladies-cut');
INSERT INTO `barber_services` VALUES ('prince','low-fade');
INSERT INTO `barber_services` VALUES ('prince','skin-fade-dye');
INSERT INTO `barber_services` VALUES ('prince','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('prince','taper-fade');
INSERT INTO `barber_services` VALUES ('prince','white-tint');
INSERT INTO `barber_services` VALUES ('takudzwa','beard-dye');
INSERT INTO `barber_services` VALUES ('takudzwa','beard-nodye');
INSERT INTO `barber_services` VALUES ('takudzwa','burst-fade');
INSERT INTO `barber_services` VALUES ('takudzwa','clean-shave');
INSERT INTO `barber_services` VALUES ('takudzwa','high-fade');
INSERT INTO `barber_services` VALUES ('takudzwa','low-fade');
INSERT INTO `barber_services` VALUES ('takudzwa','skin-fade-dye');
INSERT INTO `barber_services` VALUES ('takudzwa','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('takudzwa','taper-fade');
INSERT INTO `barber_services` VALUES ('tawanda','beard-dye');
INSERT INTO `barber_services` VALUES ('tawanda','beard-nodye');
INSERT INTO `barber_services` VALUES ('tawanda','burst-fade');
INSERT INTO `barber_services` VALUES ('tawanda','clean-shave');
INSERT INTO `barber_services` VALUES ('tawanda','color-tint');
INSERT INTO `barber_services` VALUES ('tawanda','high-fade');
INSERT INTO `barber_services` VALUES ('tawanda','hot-towels');
INSERT INTO `barber_services` VALUES ('tawanda','low-fade');
INSERT INTO `barber_services` VALUES ('tawanda','skin-fade-dye');
INSERT INTO `barber_services` VALUES ('tawanda','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('tawanda','taper-fade');
INSERT INTO `barber_services` VALUES ('tawanda','white-tint');
INSERT INTO `barber_services` VALUES ('wesley','beard-dye');
INSERT INTO `barber_services` VALUES ('wesley','beard-nodye');
INSERT INTO `barber_services` VALUES ('wesley','burst-fade');
INSERT INTO `barber_services` VALUES ('wesley','clean-shave');
INSERT INTO `barber_services` VALUES ('wesley','high-fade');
INSERT INTO `barber_services` VALUES ('wesley','low-fade');
INSERT INTO `barber_services` VALUES ('wesley','skin-fade-dye');
INSERT INTO `barber_services` VALUES ('wesley','skin-fade-nodye');
INSERT INTO `barber_services` VALUES ('wesley','taper-fade');

-- barber_services: 83 rows

DROP TABLE IF EXISTS `barbers`;
CREATE TABLE `barbers` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT 'Barber',
  `branch_id` varchar(50) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `barbers_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `barbers` VALUES ('brian','Brian T.','Grooming Specialist','borrowdale','','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('charmaine','Charmaine Gwaze','Barber','borrowdale','/uploads/charmaine-gwaze.jpg','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('kuda','Kuda N.','Barber','fife','','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('kudakwashe','Kudakwashe Mudonhi','Barber','fife','/uploads/kudakwashe-mudonhi.jpg','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('panashe','Panashe Dlamini','Barber','borrowdale','/uploads/panashe-dlamini.jpg','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('prince','Prince C.','Master Barber','fife','','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('takudzwa','Takudzwa Saruchera','Barber','fife','/uploads/takudzwa-saruchera.jpg','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('tawanda','Tawanda M.','Senior Barber','borrowdale','','2026-11-23 18:43:19');
INSERT INTO `barbers` VALUES ('wesley','Wesley Enock','Barber','fife','/uploads/wesley-enock.jpg','2026-11-23 18:43:19');

-- barbers: 9 rows

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `id` varchar(20) NOT NULL,
  `client_name` varchar(120) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `branch_id` varchar(50) NOT NULL,
  `service_id` varchar(50) NOT NULL,
  `barber_id` varchar(50) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `status` enum('Pending','Confirmed','Cancelled','Declined','Completed') NOT NULL DEFAULT 'Pending',
  `source` enum('Online','Walk-in') NOT NULL DEFAULT 'Online',
  `notes` text DEFAULT NULL,
  `client_created` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  KEY `service_id` (`service_id`),
  KEY `barber_id` (`barber_id`),
  KEY `idx_bookings_date` (`booking_date`),
  KEY `idx_bookings_status` (`status`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- bookings: 0 rows

DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `place` varchar(150) NOT NULL,
  `hours` varchar(100) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `branches` VALUES ('borrowdale','Kudu Corner','Kudu Corner, Harare','Mon–Sat · 08:00–17:30 · Sun by booking','/uploads/site/a10a0723.jpg','2026-11-23 18:43:19');
INSERT INTO `branches` VALUES ('fife','Five Avenue','Five Avenue, Harare','Mon–Sat · 08:00–18:00 · Sun · 08:00–15:00','/uploads/site/a10a0724.jpg','2026-11-23 18:43:19');

-- branches: 2 rows

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `fav_branch_id` varchar(50) DEFAULT NULL,
  `fav_barber_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_clients_phone` (`phone`),
  KEY `fav_branch_id` (`fav_branch_id`),
  KEY `fav_barber_id` (`fav_barber_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`fav_branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`fav_barber_id`) REFERENCES `barbers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- clients: 0 rows

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `branch_id` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- contacts: 0 rows

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `booking_id` varchar(20) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- notifications: 0 rows

DROP TABLE IF EXISTS `service_branches`;
CREATE TABLE `service_branches` (
  `service_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  PRIMARY KEY (`service_id`,`branch_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `service_branches_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_branches_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `service_branches` VALUES ('beard-dye','borrowdale');
INSERT INTO `service_branches` VALUES ('beard-dye','fife');
INSERT INTO `service_branches` VALUES ('beard-nodye','borrowdale');
INSERT INTO `service_branches` VALUES ('beard-nodye','fife');
INSERT INTO `service_branches` VALUES ('burst-fade','borrowdale');
INSERT INTO `service_branches` VALUES ('burst-fade','fife');
INSERT INTO `service_branches` VALUES ('clean-shave','borrowdale');
INSERT INTO `service_branches` VALUES ('clean-shave','fife');
INSERT INTO `service_branches` VALUES ('color-tint','borrowdale');
INSERT INTO `service_branches` VALUES ('color-tint','fife');
INSERT INTO `service_branches` VALUES ('high-fade','borrowdale');
INSERT INTO `service_branches` VALUES ('high-fade','fife');
INSERT INTO `service_branches` VALUES ('hot-towels','borrowdale');
INSERT INTO `service_branches` VALUES ('hot-towels','fife');
INSERT INTO `service_branches` VALUES ('kids-cut','borrowdale');
INSERT INTO `service_branches` VALUES ('kids-cut','fife');
INSERT INTO `service_branches` VALUES ('ladies-cut','borrowdale');
INSERT INTO `service_branches` VALUES ('ladies-cut','fife');
INSERT INTO `service_branches` VALUES ('low-fade','borrowdale');
INSERT INTO `service_branches` VALUES ('low-fade','fife');
INSERT INTO `service_branches` VALUES ('skin-fade-dye','borrowdale');
INSERT INTO `service_branches` VALUES ('skin-fade-dye','fife');
INSERT INTO `service_branches` VALUES ('skin-fade-nodye','borrowdale');
INSERT INTO `service_branches` VALUES ('skin-fade-nodye','fife');
INSERT INTO `service_branches` VALUES ('taper-fade','borrowdale');
INSERT INTO `service_branches` VALUES ('taper-fade','fife');
INSERT INTO `service_branches` VALUES ('white-tint','borrowdale');
INSERT INTO `service_branches` VALUES ('white-tint','fife');

-- service_branches: 28 rows

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duration` smallint(5) unsigned NOT NULL DEFAULT 30,
  `icon` varchar(20) DEFAULT 'Γ£é',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `services` VALUES ('beard-dye','Beard Shave — With Dye','Beard sculpting finished with dye.','10.00','15','♜','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('beard-nodye','Beard Shave — No Dye','A clean beard line-up, no colour.','5.00','5','♜','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('burst-fade','Burst Fade','A curved burst fade around the ears.','15.00','30','◎','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('clean-shave','Clean Shave','A close, smooth clean shave.','10.00','10','⌁','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('color-tint','Color Tint — Other Colors','Custom colour tint in any shade.','25.00','60','✧','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('high-fade','High Fade','A bold, defined high fade.','15.00','30','◑','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('hot-towels','Hot Towels Cut & Shave','Precision cut and shave finished with warm towels.','15.00','25','♨','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('kids-cut','Kids Cut','A patient, quality cut for the little gents.','10.00','30','★','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('ladies-cut','Ladies Cut','A tailored cut, finished to perfection.','15.00','30','❀','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('low-fade','Low Fade','A subtle, blended low fade.','15.00','30','◔','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('skin-fade-dye','Skin Fade — With Dye','Skin fade finished with colour dye.','15.00','30','✂','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('skin-fade-nodye','Skin Fade — No Dye','A seamless skin fade, no colour added.','10.00','20','✂','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('taper-fade','Taper Fade','A clean taper that blends naturally.','15.00','30','◐','2026-11-23 18:43:19');
INSERT INTO `services` VALUES ('white-tint','White Tint','A crisp white colour tint.','30.00','60','❆','2026-11-23 18:43:19');

-- services: 14 rows

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `salon_name` varchar(120) NOT NULL DEFAULT 'The Gent''s',
  `phone` varchar(40) DEFAULT '+263 77 601 1938',
  `email` varchar(150) DEFAULT 'admin@thegents.co.zw',
  `address` varchar(255) DEFAULT 'Fife Avenue & Borrowdale, Harare',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  CONSTRAINT `chk_settings_singleton` CHECK (`id` = 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `settings` VALUES ('1','The Gent’s','+263 79 052 0449','admin@thegents.co.zw','Kudu Corner & Five Avenue, Harare','2026-11-23 18:43:19');

-- settings: 1 rows

DROP TABLE IF EXISTS `site_data`;
CREATE TABLE `site_data` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `payload` mediumtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  CONSTRAINT `chk_site_data_singleton` CHECK (`id` = 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `site_data` VALUES ('1','{\"branches\":[{\"id\":\"borrowdale\",\"name\":\"Kudu Corner\",\"place\":\"Kudu Corner, Harare\",\"hours\":\"Mon–Sat · 08:00–17:30 · Sun by booking\",\"photo\":\"/uploads/site/a10a0723.jpg\",\"phone\":\"079 052 0449\"},{\"id\":\"fife\",\"name\":\"Five Avenue\",\"place\":\"Five Avenue, Harare\",\"hours\":\"Mon–Sat · 08:00–18:00 · Sun · 08:00–15:00\",\"photo\":\"/uploads/site/a10a0724.jpg\",\"phone\":\"078 766 6753\"}],\"services\":[{\"id\":\"hot-towels\",\"name\":\"Hot Towels Cut & Shave\",\"desc\":\"Precision cut and shave finished with warm towels.\",\"price\":15,\"duration\":25,\"icon\":\"♨\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"skin-fade-nodye\",\"name\":\"Skin Fade — No Dye\",\"desc\":\"A seamless skin fade, no colour added.\",\"price\":10,\"duration\":20,\"icon\":\"✂\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"skin-fade-dye\",\"name\":\"Skin Fade — With Dye\",\"desc\":\"Skin fade finished with colour dye.\",\"price\":15,\"duration\":30,\"icon\":\"✂\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"taper-fade\",\"name\":\"Taper Fade\",\"desc\":\"A clean taper that blends naturally.\",\"price\":15,\"duration\":30,\"icon\":\"◐\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"burst-fade\",\"name\":\"Burst Fade\",\"desc\":\"A curved burst fade around the ears.\",\"price\":15,\"duration\":30,\"icon\":\"◎\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"low-fade\",\"name\":\"Low Fade\",\"desc\":\"A subtle, blended low fade.\",\"price\":15,\"duration\":30,\"icon\":\"◔\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"high-fade\",\"name\":\"High Fade\",\"desc\":\"A bold, defined high fade.\",\"price\":15,\"duration\":30,\"icon\":\"◑\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"ladies-cut\",\"name\":\"Ladies Cut\",\"desc\":\"A tailored cut, finished to perfection.\",\"price\":15,\"duration\":30,\"icon\":\"❀\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"kids-cut\",\"name\":\"Kids Cut\",\"desc\":\"A patient, quality cut for the little gents.\",\"price\":10,\"duration\":30,\"icon\":\"★\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"beard-nodye\",\"name\":\"Beard Shave — No Dye\",\"desc\":\"A clean beard line-up, no colour.\",\"price\":5,\"duration\":5,\"icon\":\"♜\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"beard-dye\",\"name\":\"Beard Shave — With Dye\",\"desc\":\"Beard sculpting finished with dye.\",\"price\":10,\"duration\":15,\"icon\":\"♜\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"clean-shave\",\"name\":\"Clean Shave\",\"desc\":\"A close, smooth clean shave.\",\"price\":10,\"duration\":10,\"icon\":\"⌁\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"white-tint\",\"name\":\"White Tint\",\"desc\":\"A crisp white colour tint.\",\"price\":30,\"duration\":60,\"icon\":\"❆\",\"branches\":[\"borrowdale\",\"fife\"]},{\"id\":\"color-tint\",\"name\":\"Color Tint — Other Colors\",\"desc\":\"Custom colour tint in any shade.\",\"price\":25,\"duration\":60,\"icon\":\"✧\",\"branches\":[\"borrowdale\",\"fife\"]}],\"barbers\":[{\"id\":\"panashe\",\"name\":\"Panashe Dlamini\",\"role\":\"Barber\",\"branch\":\"borrowdale\",\"photo\":\"/uploads/panashe-dlamini.jpg\",\"bio\":\"\",\"services\":[\"skin-fade-nodye\",\"skin-fade-dye\",\"taper-fade\",\"low-fade\",\"high-fade\",\"kids-cut\",\"beard-nodye\",\"beard-dye\",\"clean-shave\"]},{\"id\":\"charmaine\",\"name\":\"Charmaine Gwaze\",\"role\":\"Barber\",\"branch\":\"borrowdale\",\"photo\":\"/uploads/charmaine-gwaze.jpg\",\"bio\":\"\",\"services\":[\"ladies-cut\",\"kids-cut\",\"skin-fade-nodye\",\"taper-fade\",\"low-fade\",\"beard-nodye\",\"clean-shave\"]},{\"id\":\"takudzwa\",\"name\":\"Takudzwa Saruchera\",\"role\":\"Barber\",\"branch\":\"fife\",\"photo\":\"/uploads/takudzwa-saruchera.jpg\",\"bio\":\"\",\"services\":[\"skin-fade-nodye\",\"skin-fade-dye\",\"taper-fade\",\"burst-fade\",\"low-fade\",\"high-fade\",\"beard-nodye\",\"beard-dye\",\"clean-shave\"]},{\"id\":\"kudakwashe\",\"name\":\"Kudakwashe Mudonhi\",\"role\":\"Barber\",\"branch\":\"fife\",\"photo\":\"/uploads/kudakwashe-mudonhi.jpg\",\"bio\":\"\",\"services\":[\"skin-fade-nodye\",\"skin-fade-dye\",\"taper-fade\",\"burst-fade\",\"low-fade\",\"high-fade\",\"beard-nodye\",\"beard-dye\",\"clean-shave\"]},{\"id\":\"wesley\",\"name\":\"Wesley Enock\",\"role\":\"Barber\",\"branch\":\"fife\",\"photo\":\"/uploads/wesley-enock.jpg\",\"bio\":\"\",\"services\":[\"skin-fade-nodye\",\"skin-fade-dye\",\"taper-fade\",\"burst-fade\",\"low-fade\",\"high-fade\",\"beard-nodye\",\"beard-dye\",\"clean-shave\"]}],\"bookings\":[],\"contacts\":[],\"notifications\":[],\"membership\":false,\"seeded\":true,\"hero\":[{\"title\":\"Modern Grooming for the Gentleman\",\"desc\":\"Precision cuts, expert grooming and a premium lounge experience.\",\"photo\":\"/uploads/site/a10a0712.jpg\"},{\"title\":\"Your Style. Our Craft.\",\"desc\":\"Thoughtful details and precision barbering for every gentleman.\",\"photo\":\"/uploads/site/a10a0713.jpg\"},{\"title\":\"A Cut Above the Ordinary.\",\"desc\":\"A relaxed space, skilled hands and a fresh look.\",\"photo\":\"/uploads/site/a10a0714.jpg\"},{\"title\":\"Made for the Modern Gent.\",\"desc\":\"Discover signature haircuts, shaves and personal grooming.\",\"photo\":\"/uploads/site/a10a0715.jpg\"},{\"title\":\"Find Your Perfect Barber.\",\"desc\":\"Choose your branch, barber and preferred time in minutes.\",\"photo\":\"/uploads/site/a10a0716.jpg\"}],\"gallery\":[{\"url\":\"/uploads/site/a10a0717.jpg\",\"alt\":\"The Gent\'s salon\",\"category\":\"Salon\"},{\"url\":\"/uploads/site/a10a0723.jpg\",\"alt\":\"The Gent\'s salon\",\"category\":\"Salon\"},{\"url\":\"/uploads/site/a10a0724.jpg\",\"alt\":\"The Gent\'s salon\",\"category\":\"Salon\"},{\"url\":\"/uploads/site/a10a0725.jpg\",\"alt\":\"The Gent\'s salon\",\"category\":\"Salon\"},{\"url\":\"/uploads/site/a10a0726.jpg\",\"alt\":\"The Gent\'s salon\",\"category\":\"Salon\"},{\"url\":\"/uploads/site/a10a0727.jpg\",\"alt\":\"The Gent\'s salon\",\"category\":\"Salon\"},{\"url\":\"/uploads/site/a10a0718.jpg\",\"alt\":\"The Gent’s barbers at work\",\"category\":\"Haircuts\"},{\"url\":\"/uploads/site/a10a0719.jpg\",\"alt\":\"The Gent’s barbers at work\",\"category\":\"Haircuts\"},{\"url\":\"/uploads/site/a10a0720.jpg\",\"alt\":\"The Gent’s barbers at work\",\"category\":\"Haircuts\"},{\"url\":\"/uploads/site/a10a0721.jpg\",\"alt\":\"The Gent’s barbers at work\",\"category\":\"Haircuts\"},{\"url\":\"/uploads/site/a10a0722.jpg\",\"alt\":\"The Gent’s barbers at work\",\"category\":\"Haircuts\"}],\"settings\":{\"name\":\"The Gent’s\",\"phone\":\"+263 79 052 0449\",\"email\":\"admin@thegents.co.zw\",\"whatsapp\":\"+263 79 052 0449\",\"address\":\"Kudu Corner & Five Avenue, Harare\",\"logo\":\"/uploads/logo-the-gents.jpg\",\"social\":{\"facebook\":\"https://www.facebook.com/share/1E9i4XqKWj/\",\"instagram\":\"https://www.instagram.com/gents_cut_and_shaves\",\"tiktok\":\"https://www.tiktok.com/@thegentscutandshaves\"}},\"membershipTiers\":[{\"id\":\"basic\",\"name\":\"Basic\",\"price\":5,\"color\":\"#9aa3ad\",\"perks\":\"Member rates · 50 pts per visit\"},{\"id\":\"gold\",\"name\":\"Gold\",\"price\":10,\"color\":\"#d4af37\",\"perks\":\"10% off retail · priority booking · 100 pts per visit\"},{\"id\":\"diamond\",\"name\":\"Diamond\",\"price\":15,\"color\":\"#67e8f9\",\"perks\":\"15% off · free beard trim monthly · 150 pts per visit\"},{\"id\":\"platinum\",\"name\":\"Platinum\",\"price\":25,\"color\":\"#e5e4e2\",\"perks\":\"20% off · dedicated barber · early access · 250 pts per visit\"}],\"members\":[],\"wallets\":[],\"giftCards\":[],\"walletTxns\":[],\"rewards\":[],\"rewardConfig\":{\"perVisit\":100},\"staff\":[{\"id\":\"admin1\",\"username\":\"Munyah\",\"name\":\"Munyah\",\"email\":\"munyah777@gmail.com\",\"role\":\"Super Admin\",\"permissions\":\"*\",\"protected\":true,\"status\":\"active\",\"salary\":0,\"createdAt\":\"2026-01-01\"},{\"id\":\"staff4dfdc079bf06b31f\",\"createdAt\":\"2026-11-26\",\"name\":\"Admin 2\",\"email\":\"info@thegents.co.zw\",\"username\":\"Admin2\",\"roleId\":\"\",\"role\":\"Administrator\",\"permissions\":\"*\",\"status\":\"active\"},{\"id\":\"admin-gents\",\"createdAt\":\"2026-11-26\",\"name\":\"Admin\",\"email\":\"admin@thegents.co.zw\",\"username\":\"Admin\",\"roleId\":\"\",\"role\":\"Administrator\",\"permissions\":\"*\",\"status\":\"active\"},{\"id\":\"staff-test2\",\"createdAt\":\"2026-11-26\",\"name\":\"Test\",\"email\":\"testguy@test.com\",\"username\":\"Test\",\"roleId\":\"\",\"role\":\"\",\"permissions\":[],\"status\":\"active\"}],\"roles\":[{\"id\":\"rol-recep\",\"name\":\"Receptionist\",\"perms\":[\"bookings.view\",\"bookings.create\",\"bookings.approve\",\"bookings.decline\",\"requests.view\",\"calendar.view\",\"clients.view\"],\"createdAt\":\"2026-01-01\"}],\"clientProfile\":{\"name\":\"\",\"phone\":\"\",\"email\":\"\",\"favBranch\":\"\",\"favBarber\":\"\"}}','2026-11-26 17:47:57');

-- site_data: 1 rows

DROP TABLE IF EXISTS `staff_users`;
CREATE TABLE `staff_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_key` varchar(60) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_key` (`staff_key`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `staff_users` VALUES ('1','admin1','munyah777@gmail.com','$2y$10$UMbtExHbdqebfDBcJhBROu.n0WNQBzWtv8LreTIZ0y1XICRFant6q','2026-11-12 17:41:21','2026-11-12 17:41:21');
INSERT INTO `staff_users` VALUES ('2','staff-test2','testguy@test.com','$2y$10$nB4TshzMAGwEXFB9QXGqQe.fkm64OoBJuhuuxL4ZmR7c5hC.Uxw86','2026-11-12 17:43:00','2026-11-12 17:44:20');
INSERT INTO `staff_users` VALUES ('3','admin-gents','admin@thegents.co.zw','$2y$10$5LE3E7lH5Bgui6yP89u9SOvobXJ6c0uwcsn5IAVfptgKHrPqvQo9a','2026-11-12 17:43:00','2026-11-12 17:43:00');
INSERT INTO `staff_users` VALUES ('8','staff4dfdc079bf06b31f','info@thegents.co.zw','$2y$10$unod0aw2mAM88YrWv34RaejeA3c9YpzNB78HiWg6.BJL/XgoaojtW','2026-11-26 17:16:08','2026-11-26 17:16:08');

-- staff_users: 4 rows

SET FOREIGN_KEY_CHECKS=1;
