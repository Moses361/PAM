-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2023 at 08:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pam`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_county` text NOT NULL,
  `admin_about` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_job` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_county`, `admin_about`, `admin_contact`, `admin_job`) VALUES
(2, 'Moses Odhiambo', 'odhismoses20@gmail.com', 'Moseso570', 'mose.jpg', 'Kenya', ' Change the about description for Moses', '+254759930912', 'System Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(11) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL,
  `id` int(11) NOT NULL,
  `transport_cost` int(12) NOT NULL DEFAULT 0,
  `origin` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_county` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `second_name`, `customer_email`, `customer_pass`, `customer_county`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`) VALUES
(3, 'Linea', 'Devida', 'devida@gmail.com', 'devida', 'Mombasa', '', '0790364875', 'Mptwapa', 'bell-peppers-421087_640.jpg', '127.0.0.1'),
(4, 'Moses', 'Odhiambo', 'odhismoses20@gmail.com', '1234', 'Kiambu', '', '0759930912', 'P.o Box 126, Kosele.', 'mose.jpg', '::1'),
(5, 'oses', 'Odhiambo', 'odhismoses20@gmail.com', '0759930921', 'vihiga', '', '0759930912', 'po box 126 vihiga', 'mose.jpg', '::1'),
(6, 'Moses ', 'Odhiambo ', 'moses@gmail.com', 'Moseso570', 'Homabay', '', '0790102001', 'po box 126 Kosele', 'moses.jpg', '::1'),
(7, 'name', 'name', 'test@gmail.com', '1234', 'kenya', 'nairobi', '1234', '1234', 'Ganji.png', '127.0.0.1'),
(8, 'pam', 'testy', 'will@gmail.com', 'test', 'Homabay', 'nairobi', '0790102001', 'none', 'chili-664635_640.jpg', '::1'),
(9, 'linky', 'link', 'linky@gmail.com', '1234', 'nairobi', 'nairobi', '0790102001', 'link', 'bell-peppers-421087_640.jpg', '::1'),
(10, 'Maureen', 'Mbugua', 'maureen@gmail.com', '1234', 'Kiambu', 'nairobi', '0768062331', 'Kiambu', 'BingWallpaper (24).jpg', '::1'),
(11, 'Faith', 'Atieno', 'faith@gmail.com', '1234', 'Kajiado', 'nairobi', '0792071075', 'Kajiado', 'BingWallpaper (23).jpg', '::1'),
(12, 'Roony', 'Odhiambo', 'ronny@gmail.com', '1234', 'Homabya', 'nairobi', '0759930912', 'Kiambu', 'movers.jfif', '::1'),
(13, 'Vivian', 'Akinyi', 'vivian@gmail.com', '1234', 'Homabya', 'nairobi', '0703258308', 'Homabay ', 'laptops.jpg', '::1'),
(14, 'muteti', 'john', 'johniekyalo001@gmail.com', '1998000', 'kitui', 'nairobi', '0112831777', 'p.o box 52, mwingi', '2023-02-26 (1).png', '::1'),
(15, 'Tonny', 'Victor', 'tonny@gmail.com', '1234', 'Kiambu', 'nairobi', '0790102001', 'Nairobi ', 'download.jpg', '::1'),
(16, 'tony', 'tony3', 'tony@gmail.com', '1234', 'kitui', 'nairobi', '0790102001', 'None', 'farm 1.jfif', '::1'),
(17, 'edwin', 'ochieng', 'edwinochieng@gmail.com', '1234', 'Siaya', 'nairobi', '0746482121', 'Kiambu', 'movers.jpg', '::1'),
(18, 'Joseph ', 'Kariuki', 'jose@gmail.com', '1234', 'Nyeri', 'nairobi', '0758826552', 'Nyeri', 'farm.jfif', '::1'),
(19, 'Kodondi', 'Shadrack', 'kodondi@gmail.com', '1234', 'Nairobi', 'nairobi', '0759930912', 'Juja', 'admin side.png', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `size` text NOT NULL,
  `order_date` date NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `order_status`) VALUES
(1, 3, 4200, 1754384297, 1, 'Small', '2021-10-25', 'pending'),
(2, 3, 3800, 1527749710, 1, 'Medium', '2021-10-26', 'pending'),
(3, 3, 4000, 1774675043, 1, 'Medium', '2021-10-26', 'pending'),
(4, 3, 5500, 1814567015, 1, '', '2023-03-02', 'Complete'),
(5, 3, 20000, 1832173183, 1, '', '2023-03-03', 'Complete'),
(6, 2, 16000, 1645751042, 1, '', '2023-03-03', 'pending'),
(7, 2, 8300, 1645751042, 1, '', '2023-03-03', 'pending'),
(8, 2, 20000, 1645751042, 1, '', '2023-03-03', 'pending'),
(9, 2, 8000, 1645751042, 1, '', '2023-03-03', 'Complete'),
(10, 4, 5500, 1161203515, 1, '', '2023-03-03', 'Complete'),
(11, 4, 8300, 51086434, 1, '', '2023-03-04', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'muteti', 'johniekyalo001@gmail.com', 'feedback', 'nice services! ');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `origin` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer`, `order_id`, `payment_status`, `amount`, `origin`, `destination`, `order_date`) VALUES
(68, 'moses@gmail.com', '714940', 'pending', '27100', 'Nairobi', 'Coast', '2023-03-31 21:00:00'),
(69, 'moses@gmail.com', '295482', 'pending', '27100', 'Rift valley', 'Nairobi', '2023-03-27 21:00:00'),
(70, 'johniekyalo001@gmail.com', '619841', 'pending', '25500', 'Nairobi', 'Western', '2023-04-05 21:00:00'),
(71, 'johniekyalo001@gmail.com', '314756', 'pending', '25500', 'Rift valley', 'Nairobi', '2023-03-29 21:00:00'),
(72, 'moses@gmail.com', '824238', 'pending', '60000', 'Nairobi', 'Coast', '2023-04-04 21:00:00'),
(89, 'jose@gmail.com', '670899', 'pending', '66500', 'Nairobi', 'Nairobi', '2023-03-29 16:40:15'),
(90, 'jose@gmail.com', '670899', 'pending', '66500', 'Nairobi', 'Nairobi', '2023-03-29 16:40:15'),
(91, 'jose@gmail.com', '670899', 'pending', '66500', 'Nairobi', 'Nairobi', '2023-03-29 16:40:16'),
(92, 'jose@gmail.com', '690138', 'pending', '13500', 'Nairobi', 'Nairobi', '2023-03-29 16:43:48'),
(93, 'jose@gmail.com', '690138', 'pending', '13500', 'Nairobi', 'Thika', '2023-03-29 16:43:48'),
(94, 'jose@gmail.com', '556681', 'pending', '55000', 'Nairobi', 'Nairobi', '2023-03-29 18:12:43'),
(95, 'jose@gmail.com', '556681', 'pending', '55000', 'Nairobi', 'Nairobi', '2023-03-29 18:12:43'),
(96, 'jose@gmail.com', '541780', 'pending', '16000', 'Nairobi', 'Lodwar', '2023-03-29 18:23:13'),
(97, 'jose@gmail.com', '541780', 'pending', '16000', 'Nairobi', 'Kendu Bay', '2023-03-29 18:23:14'),
(98, 'jose@gmail.com', '504036', 'pending', '5500', 'Nairobi', 'Nairobi', '2023-03-29 19:21:07'),
(99, 'moses@gmail.com', '941646', 'pending', '20000', 'Kendu Bay', 'Nairobi', '2023-03-29 19:31:36'),
(100, 'jose@gmail.com', '760854', 'pending', '5500', 'Nairobi', 'Kisumu', '2023-03-29 21:00:00'),
(101, 'jose@gmail.com', '797391', 'pending', '5500', 'Nairobi', 'Kisumu', '2023-03-29 21:00:00'),
(102, 'jose@gmail.com', '957053', 'Paid', '8300', 'Nairobi', 'Nairobi', '2023-03-29 21:00:00'),
(103, 'jose@gmail.com', '361128', 'Paid', '5500', 'Kakamega', 'Nairobi', '2023-03-31 21:00:00'),
(104, 'jose@gmail.com', '236304', 'Paid', '5500', 'Nairobi', 'Sotik', '2023-03-31 21:00:00'),
(105, 'jose@gmail.com', '424038', 'Cancelled', '20000', 'Nairobi', 'Nyeri', '2023-03-30 21:00:00'),
(106, 'moses@gmail.com', '171670', 'pending', '75390', 'Nairobi', 'Kisumu', '2023-04-12 21:00:00'),
(107, 'moses@gmail.com', '171670', 'pending', '75390', 'Nairobi', 'Kisumu', '2023-04-12 21:00:00'),
(108, 'moses@gmail.com', '778279', 'pending', '8066', 'Nairobi', 'Malindi', '2023-04-12 10:03:33'),
(109, 'kodondi@gmail.com', '855252', 'pending', '32295', 'Kisumu', 'Nairobi', '2023-04-12 12:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `order_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(1, 47548, 5500, 'Paypall', 2147483647, 0, '23/04/2023'),
(2, 47548, 20000, 'Paypall', 2147483647, 0, '23/04/2023'),
(3, 47548, 20000, 'Paypall', 2147483647, 0, '23/04/2023'),
(4, 1358727648, 5500, 'Paypall', 2147483647, 0, '23/04/2023'),
(5, 47548, 5500, 'Paypall', 2147483647, 0, '23/04/2023');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(11) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `size`, `order_status`) VALUES
(10, 4, 1161203515, '26', 1, '', 'Complete'),
(11, 4, 51086434, '30', 1, '', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `p_cat_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_label` text NOT NULL,
  `product_sale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `date`, `product_title`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_keywords`, `product_desc`, `product_label`, `product_sale`) VALUES
(25, 2, 0, '2023-03-04 11:36:50', 'Home relocation', 'movers.jpg', 'home.jpg', 'hotel.jpg', 5500, '', '<p>Affordable to comrades</p>', '', 0),
(26, 4, 0, '2023-03-09 12:45:20', 'Warehousing ', 'warehouse 2.jpg', 'store.jpg', 'warehouse b.jpg', 5500, '', '<p>Affordable</p>', '', 0),
(27, 7, 0, '2023-03-09 12:46:08', 'Commercial Shifting ', 'commercial moving.jpg', 'commercial 2.jpg', 'commercial.jpg', 10500, '', '<p>Book and enjoy the service</p>', '', 0),
(28, 8, 0, '2023-03-09 18:21:22', 'Hotel Relocation ', 'hotel 1.jpg', 'hotel.jpg', 'hotel 2.jpg', 15000, '', '<p>This service has discounted cost</p>', '', 0),
(29, 3, 0, '2023-03-02 21:09:51', 'Office Relocation ', 'offisi.jpg', 'office 2.jpg', 'office 3.jpg', 16000, '', '<p>We take good care of your office items</p>', '', 0),
(30, 9, 0, '2023-03-09 18:21:54', 'Decluttering and Arrangement', 'Arrangement.jpg', 'Arrangement.jpg', 'decluttering.jpg', 8300, '', '<p>Neat and well organise office office at affordable price</p>', '', 0),
(31, 1, 0, '2023-03-09 12:44:00', 'Car Transport ', 'car transport a.jpg', 'car b.jpg', 'car 3.jpg', 20000, '', '<p>One among the best services you can trust</p>', '', 0),
(33, 3, 0, '2023-03-09 12:40:25', 'Computers and Electronics Relocation ', 'computers.jpg', 'computers 3.jpg', 'laptops.jpg', 8000, '', '<p>Experience professional service</p>', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(11) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_desc`) VALUES
(1, '  VEHICLE TRANSPORTATION  ', 'We move your vehicle from one place to another'),
(2, '  OFFICE RELOCATION ', '\r\n\r\n\r\n\r\nOffice relocation refers to the process of moving an existing workplace or business to a new physical location.\r\n\r\n\r\n\r\n\r\n'),
(3, ' COMPUTERS AND ELECTRONICS RELOCATION', 'The process of moving and transporting electronic equipment and devices, such as computers, servers, and other electronics, from one location to another.'),
(4, ' WAREHOUSING ', 'The process of storing and managing goods or products in a designated facility or storage space until they are ready to be distributed or shipped to their final destination.'),
(7, 'COMMERCIAL AND INDUSTRIAL SHIFTING', ' Relocating business operations, equipment, and facilities from one location to another,'),
(8, ' HOTEL RELOCATION ', 'Changes physical location, including furniture, equipment, and other assets, to a new property.'),
(9, 'DECLUTTERING AND ARRANGEMENT ', 'Organizing and optimizing a living or working space by removing unnecessary or unwanted items and arranging them');

-- --------------------------------------------------------

--
-- Table structure for table `referals`
--

CREATE TABLE `referals` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `link_code` varchar(50) DEFAULT NULL,
  `initiator` varchar(200) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `redeemed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referals`
--

INSERT INTO `referals` (`id`, `username`, `date`, `link_code`, `initiator`, `discount`, `redeemed`) VALUES
(1, 'colls', '12-12-2023', 'rtyu88', 'devida@gmail.com', 200, 0),
(2, 'test@gmail.com', '2023-03-07 09:00:02', 'test@gmail.com', 'devida@gmail.com', 200, 0),
(3, 'will@gmail.com', '2023-03-07 07:24:20', 'will@gmail.com', 'moses@gmail.com', 200, 1),
(4, 'linky@gmail.com', '2023-03-07 07:27:12', 'linky@gmail.com', 'moses@gmail.com', 200, 1),
(5, 'maureen@gmail.com', '2023-03-08 11:08:37', 'maureen@gmail.com', 'moses@gmail.com', 200, 1),
(6, 'faith@gmail.com', '2023-03-08 11:10:55', 'faith@gmail.com', 'maureen@gmail.com', 200, 0),
(7, 'ronny@gmail.com', '2023-03-09 07:15:09', 'ronny@gmail.com', 'moses@gmail.com', 200, 1),
(8, 'vivian@gmail.com', '2023-03-09 19:30:54', 'vivian@gmail.com', 'maureen@gmail.com', 200, 0),
(9, 'johniekyalo001@gmail.com', '2023-03-09 19:42:13', 'johniekyalo001@gmail.com', 'odhismose20@gmail.com', 200, 0),
(10, 'tonny@gmail.com', '2023-03-10 13:30:41', 'tonny@gmail.com', 'moses@gmail.com', 200, 1),
(11, 'tony@gmail.com', '2023-03-12 07:33:32', 'tony@gmail.com', 'odhismose20@gmail.com', 200, 0),
(12, 'edwinochieng@gmail.com', '2023-03-17 15:55:14', 'edwinochieng@gmail.com', 'moses@gmail.com', 200, 1),
(13, 'jose@gmail.com', '2023-03-27 20:05:03', 'moses@gmail.com', 'jose@gmail.com', 200, 1),
(14, 'kodondi@gmail.com', '2023-04-12 14:17:33', 'kodondi@gmail.com', 'moses@gmail.com', 200, 0);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(11) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_url`) VALUES
(16, 'slide1', 'movers.jpg', ''),
(17, 'slide2', 'car transport a.jpg', ''),
(18, 'slide 3', 'commercial moving.jpg', ''),
(19, 'slide 4', 'warehouse b.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(11) NOT NULL,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_title`, `term_link`, `term_desc`) VALUES
(9, 'Rules & Regulations', 'link_1', '<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</div>'),
(10, 'Promo & Regulations', 'link_2', '<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</div>'),
(11, 'Refund Condition Policy', 'link_3', '<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_id` varchar(70) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `transaction_id`, `checked`) VALUES
(3, 364950, 'ws_CO_30032023101232946114662464', 1),
(4, 289172, 'ws_CO_30032023101903945114662464', 1),
(5, 957053, '', 1),
(6, 361128, '', 1),
(7, 236304, 'ws_CO_30032023110203044114662464', 1),
(8, 424038, 'ws_CO_30032023111235831114662464', 1),
(9, 171670, '', 0),
(10, 778279, '', 0),
(11, 855252, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `referals`
--
ALTER TABLE `referals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `referals`
--
ALTER TABLE `referals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
