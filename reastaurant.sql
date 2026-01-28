-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.5.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table restaurant.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` text NOT NULL,
  `descr` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Dumping data for table restaurant.categories: ~3 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `photo`, `descr`) VALUES
	(1, 'Dessert', 'https://res.cloudinary.com/myblog2024/image/upload/v1743597199/reataurant/6o0j0maw_mjaiyo.png', 'Dessert is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. In some parts of the world, such as much of central and western Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.'),
	(2, 'Pasta', 'https://res.cloudinary.com/myblog2024/image/upload/v1743597307/reataurant/3io25rkj_st03a8.png', 'Pasta is a staple food of traditional Italian cuisine, with the first reference dating to 1154 in Sicily.\r\n\r\nAlso commonly used to refer to the variety of pasta dishes, pasta is typically a noodle made from an unleavened dough of a durum wheat flour mixed with water or eggs and formed into sheets or various shapes, then cooked by boiling or baking. As an alternative for those wanting a different taste, or who need to avoid products containing gluten, some pastas can be made using rice flour in place of wheat.'),
	(3, 'Breakfast', 'https://res.cloudinary.com/myblog2024/image/upload/v1743597368/reataurant/fc67vvjr_ojibml.png', 'Breakfast is the first meal of a day. The word in English refers to breaking the fasting period of the previous night. There is a strong likelihood for one or more "typical", or "traditional", breakfast menus to exist in most places, but their composition varies widely from place to place, and has varied over time, so that globally a very wide range of preparations and ingredients are now associated with breakfast.');

-- Dumping structure for table restaurant.foods
CREATE TABLE IF NOT EXISTS `foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `photo` text NOT NULL,
  `categId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `Column 6` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categId` (`categId`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`categId`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- Dumping data for table restaurant.foods: ~23 rows (approximately)
INSERT INTO `foods` (`id`, `title`, `photo`, `categId`, `price`, `Column 6`) VALUES
	(1, 'Bakewell tart', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598126/reataurant/mhooav0n_qrpqfa.png', 1, 20, NULL),
	(2, 'Apple Frangipan Tart', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598099/reataurant/h5d2btnk_yswnyb.png', 1, 11, NULL),
	(3, 'Grilled Mac and Cheese Sandwich', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598725/reataurant/yqsycsd6_p1njmo.png', 2, 14, NULL),
	(4, 'Fettucine alfredo', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598691/reataurant/c95e3iz0_u8hdjb.png', 2, 16, NULL),
	(5, 'Pilchard puttanesca', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598811/reataurant/a2ven7l7_lsbp4m.png', 2, 17, NULL),
	(6, 'Venetian Duck Ragu', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598871/reataurant/0qoaoc6d_zdrssw.png', 2, 19, NULL),
	(7, 'Chilli prawn linguine', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598641/reataurant/h415dwdf_kt3qq7.png', 2, 12, NULL),
	(8, 'Lasagne', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598750/reataurant/ef95my8n_cf7fxd.png', 2, 20, NULL),
	(9, 'Banana Pancakes', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598157/reataurant/kvlich1f_xwvpgv.png', 1, 16, NULL),
	(10, 'Apple & Blackberry Crumble', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598069/reataurant/ymgnh7z1_dyzb6e.png', 1, 12, NULL),
	(11, 'Battenberg Cake', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598189/reataurant/kmyxy1dz_o4niqz.png', 1, 14, NULL),
	(12, 'English Breakfast', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599158/reataurant/ekqz26q9_thafxo.png', 3, 13, NULL),
	(13, 'Full English Breakfast', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599209/reataurant/ytxtrc2s_j2xurr.png', 3, 11, NULL),
	(14, 'Fruit and Cream Cheese Breakfast Pastries', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599184/reataurant/v4ub8sgl_tok1k4.png', 3, 19, NULL),
	(15, 'Salmon Eggs Eggs Benedict', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599257/reataurant/908u9i11_p3pbue.png', 3, 11, NULL),
	(16, 'Smoked Haddock Kedgeree', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599283/reataurant/czh4b73d_dctyag.png', 3, 19, NULL),
	(17, 'Breakfast Potatoes', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599129/reataurant/w2srfbj8_tdof9e.png', 3, 13, NULL),
	(18, 'Home-made Mandazi', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599234/reataurant/njqpov3q_hegcvf.png', 3, 15, NULL),
	(19, 'Spaghetti alla Carbonara', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598846/reataurant/6yc2m74y_uq9ar2.png', 2, 18, NULL),
	(20, 'Lasagna Sandwiches', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598750/reataurant/ef95my8n_cf7fxd.png', 2, 16, NULL),
	(21, 'Apam balik', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598011/reataurant/lielyx3k_q2rztd.png', 1, 15, NULL),
	(22, 'Fettuccine Alfredo', 'https://res.cloudinary.com/myblog2024/image/upload/v1743598666/reataurant/zka7vx9a_n5rpda.png', 2, 16, NULL),
	(23, 'Bread omelette', 'https://res.cloudinary.com/myblog2024/image/upload/v1743599103/reataurant/lzewz2lj_epiv7t.png', 3, 17, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
