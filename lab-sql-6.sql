DROP TABLE IF EXISTS films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` YEAR DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

SELECT * FROM films_2020;

SET SQL_SAFE_UPDATES = 0;

UPDATE films_2020
SET
  rental_duration = 3,
  rental_rate = 2.99,
  replacement_cost = 8.99
WHERE
  release_year = 2020 AND film_id IS NOT NULL;
