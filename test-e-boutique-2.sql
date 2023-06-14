-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2023 at 07:05 PM
-- Server version: 8.0.32
-- PHP Version: 8.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test-e-boutique`
--

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Studio Mic', 'A microphone designed to capture and record audio with high accuracy and sensitivity in professional recording environments.'),
(2, 'Live - Wired', 'A microphone specifically designed for capturing and amplifying the vocals of a performer in real-time during live performances or events.'),
(3, 'Live - Wireless', 'A wireless microphone specifically designed for capturing and amplifying the vocals of a performer in real-time during live performances or events.');

--
-- Dumping data for table `command_line`
--

INSERT INTO `command_line` (`id`, `product_id`, `customer_order_id`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 4),
(3, 1, 3, 1);

--
-- Dumping data for table `customer_adress`
--

-- INSERT INTO `customer_adress` (`id`, `type`, `phone`, `adress`, `postal_code`, `city`, `country`, `user_id`) VALUES
-- (1, 'test', 'test', 'test', 'test', 'test', 'test', 2),
-- (2, 'home', '4A293R8', '11 Dev Street', '95740', 'DevCity', 'France', 9);

--
-- Dumping data for table `doctrine_migration_versions`
--

-- INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
-- ('DoctrineMigrations\\Version20230525144720', '2023-05-25 14:47:28', 18),
-- ('DoctrineMigrations\\Version20230607204453', '2023-06-07 20:45:19', 114),
-- ('DoctrineMigrations\\Version20230607211442', '2023-06-07 21:15:06', 50),
-- ('DoctrineMigrations\\Version20230607211456', '2023-06-08 20:39:58', 1),
-- ('DoctrineMigrations\\Version20230608203142', '2023-06-08 20:39:58', 33),
-- ('DoctrineMigrations\\Version20230610140452', '2023-06-10 14:05:00', 56),
-- ('DoctrineMigrations\\Version20230611075945', '2023-06-11 07:59:52', 46),
-- ('DoctrineMigrations\\Version20230611082037', '2023-06-11 08:20:50', 74),
-- ('DoctrineMigrations\\Version20230611213935', '2023-06-11 21:39:44', 95);

--
-- Dumping data for table `order`
--

-- INSERT INTO `order` (`id`, `number`, `datetime`, `user_id`) VALUES
-- (1, 1, '2023-06-11 21:39:49', 2),
-- (2, 2, '2023-06-11 21:40:27', 2),
-- (3, 3, '2023-06-11 21:58:03', 9);

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `price`, `available`, `image_url`) VALUES
(1, 1, 'Aston Origin', 'A high-quality, versatile condenser microphone for professional audio recording and broadcasting.', 299, 1, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/380169/10791895_800.jpg'),
(2, 1, 'Neumann U87', 'A legendary studio microphone renowned for its pristine audio quality and versatile performance across a wide range of professional recording applications.', 2900, 1, 'https://cdn.shopify.com/s/files/1/0256/2988/4462/products/U87_700x700.jpg?v=1645632052'),
(3, 1, 'Sony C800G', 'A flagship tube microphone revered for its warm, rich sound and exceptional detail, favored by top recording studios and renowned artists.', 16000, 1, 'https://images.reverb.com/image/upload/s--9NDWZNhB--/a_0/f_auto,t_large/v1678425422/nk0ompiwcuhihaff8447.jpg'),
(4, 2, 'Shure SM58', 'An industry-standard dynamic microphone renowned for its durability, versatility, and exceptional vocal performance in live sound and recording applications.', 100, 1, 'https://m.media-amazon.com/images/I/5158IqcAkhL.jpg'),
(5, 2, 'Beyerdynamic M88', 'A dynamic microphone with a precise and detailed sound reproduction, ideal for vocals and instruments in live performances and studio recordings.', 390, 1, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/129579/12700597_800.jpg'),
(6, 1, 'Sennheiser e835', 'A reliable and versatile dynamic microphone delivering clear and focused vocal reproduction, perfect for stage performances and studio recordings.', 100, 1, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/128300/9714795_800.jpg'),
(7, 3, 'Shure SM58 Wireless', 'An industry-standard dynamic microphone renowned for its durability, versatility, and exceptional vocal performance in live sound and recording applications.', 340, 1, 'https://www.woodbrass.com/images/woodbrass/SHURE+BLX24ESM58M17.JPG'),
(8, 3, 'Sennheiser e835 Wireless', 'A reliable and versatile dynamic microphone delivering clear and focused vocal reproduction, perfect for stage performances.', 320, 1, 'https://static.bax-shop.es/image/product/381757/1178505/b8983ee4/1504602052XSW%201-835_1.jpg');

--
-- Dumping data for table `user`
--

-- INSERT INTO `user` (`id`, `name`, `first_name`, `phone`, `email`, `password`, `roles`) VALUES
-- (2, 'Admin', 'Admin', '078429323', 'admin@admin.com', '$2y$13$KAdYBw7IWDCO0Sx7x4QDf.AMMBVhz8pYjf4FTNhYAUNnS2rClwUii', '[\"ROLE_USER\", \"ROLE_ADMIN\"]'),
-- (4, 'Test', 'Test', '0781834983', 'test@test.com', '$2y$13$h68GEyXd3.XbMSbSkEzLdufJyBkmYEO2WjaLlF4RqAC4eW3v6TxjS', '[]'),
-- (9, 'Gosset', 'Rody', '0902349', 'rody@gosset.com', '$2y$13$lSzXHeQnNbZmNuko0KY/vuE0c9Viq.97Ojoq.ebQ8NDa2KBPjZ1AC', '[]');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
