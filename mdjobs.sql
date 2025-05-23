
CREATE TABLE IF NOT EXISTS `mdjobs_catering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  `totals` longtext NOT NULL,
  `details` longtext NOT NULL,
  `employees` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `mdjobs_closedshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` text NOT NULL,
  `label` text NOT NULL,
  `items` text NOT NULL,
  `prices` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `mdjobs_completed_catering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longtext NOT NULL,
  `receipt` longtext NOT NULL,
  `employees` longtext NOT NULL,
  `totals` longtext DEFAULT NULL,
  `customer` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
