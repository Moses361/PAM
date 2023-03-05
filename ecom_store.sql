-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2021 at 01:07 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_county` text NOT NULL,
  `admin_about` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_job` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_county`, `admin_about`, `admin_contact`, `admin_job`) VALUES
(2, 'ojwang collins', 'collins@gmail.com', 'coll1ns2', 'img1.jpg', 'Kenya', 'Change the about description for Collins ', '+254740443536', 'System Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `second_name`, `customer_email`, `customer_pass`, `customer_county`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`) VALUES
(2, 'kevin', 'omolo', 'omolo@gmail.com', 'omolo12', 'Kiambu', '', '0758629576', 'juja', 'C-img.jpg', '127.0.0.1'),
(3, 'Linea', 'Devida', 'devida@gmail.com', 'devida', 'Mombasa', '', '0790364875', 'Mptwapa', 'bell-peppers-421087_640.jpg', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_date` date NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `order_status`) VALUES
(1, 3, 4200, 1754384297, 1, 'Small', '2021-10-25', 'pending'),
(2, 3, 3800, 1527749710, 1, 'Medium', '2021-10-26', 'pending'),
(3, 3, 4000, 1774675043, 1, 'Medium', '2021-10-26', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(10) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `size`, `order_status`) VALUES
(1, 3, 1754384297, '18', 1, '', 'pending'),
(2, 3, 1527749710, '9', 1, 'Medium', 'pending'),
(3, 3, 1774675043, '23', 1, 'Medium', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) DEFAULT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_label` text NOT NULL,
  `product_sale` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `date`, `product_title`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_keywords`, `product_desc`, `product_label`, `product_sale`) VALUES
(1, 2, 0, '2021-10-21 09:55:50', 'Air Force', '241855428_158720266412800_5437256218175581579_n (1).jpg', '241487199_3006498872941009_5751004917594370114_n.jpg', '241392311_278770373769705_6977479737050888907_n.jpg', 3000, '', '<p>SIZE 38-40</p>\r\n<p>VERY FEW PRICES AVAILABLE!</p>', '', 0),
(2, 4, 0, '2021-10-25 07:48:05', 'Customized(Unashonewa)', '246839431_1164736280719952_3239359003039358816_n.jpg', '246548309_132815832431574_4955090976351857602_n.jpg', '246839431_1164736280719952_3239359003039358816_n.jpg', 1600, '', '<p>Available on pre order</p>', '', 0),
(3, 2, 0, '2021-10-25 07:56:21', 'Low cut', '245640185_588854292264927_5634035105458663529_n.jpg', '244766401_3000740110213443_1704082327585881712_n.jpg', '245621980_937282556906674_1257547633767648522_n.jpg', 3500, '', '<p>Boxed</p>\r\n<p>SIze 37-45</p>', '', 0),
(4, 1, 0, '2021-10-25 07:59:40', 'Nike Easy Run', '242774254_4372992536128913_2030033133507759281_n - Copy (2).jpg', '242999985_267289908452660_5597168276227453051_n - Copy (2).jpg', '245512128_207047778204589_6134412250391534358_n.jpg', 2800, '', '<p>Size</p>\r\n<p>36-39</p>', '', 0),
(5, 4, 0, '2021-10-25 08:02:16', 'Customized', '246243186_832651684047691_5940903307063660327_n.jpg', '246839431_1164736280719952_3239359003039358816_n.jpg', '246243186_832651684047691_5940903307063660327_n.jpg', 1600, '', '<p>Available on pre-order</p>', '', 0),
(6, 2, 0, '2021-10-25 08:06:34', 'Dior Homme', '245565636_245317507455644_3379170318219126540_n (1).jpg', '242440573_4497716860314977_4631847715301665204_n.jpg', '242381230_592355635099784_2753104714291839654_n.jpg', 3000, '', '<p>Size</p>\r\n<p>41-45(small fitting)</p>', '', 0),
(7, 8, 0, '2021-10-25 08:11:41', '3 piece set', '243611678_122329563513854_7579394287794248832_n.jpg', '244485952_610796640113949_6529947040655855979_n.webp', '245210359_1328943477576710_7303321505161230486_n.jpg', 3500, '', '<p>Size 36 - 40</p>\r\n<p>Shoes</p>\r\n<p>Handbag</p>\r\n<p>Wallet</p>', '', 0),
(8, 2, 0, '2021-10-25 08:15:34', 'Jordan!!', '245206277_255994203207330_1416381001410546186_n.jpg', '245281831_569576471034754_1275171470816407599_n.jpg', '245495939_1024312318381995_4791559263373205726_n.jpg', 3000, '', '<p>Restocked</p>\r\n<p>Size: 36 - 45</p>\r\n<p>3800 Retail</p>\r\n<p>3000 Wholesale</p>', '', 0),
(9, 2, 0, '2021-10-25 08:18:26', 'Nike', '245855873_672989450352756_4179631970585546056_n.jpg', '245640185_588854292264927_5634035105458663529_n.jpg', '245665372_115462190906478_3531301489357592396_n.jpg', 3800, '', '<p>Size:</p>\r\n<p>37 - 44</p>', '', 0),
(10, 2, 0, '2021-10-25 08:23:11', 'Air Force', '244760292_269769881704172_4616963474857971873_n.webp', '242597174_338122004666735_3984193497009949560_n.jpg', '242539210_2961256554095687_133620045484537138_n.jpg', 2300, '', '<p>Size:</p>\r\n<p>37 - 45</p>', '', 0),
(11, 1, 0, '2021-10-25 08:29:15', 'Balenciaga', '244795547_227816925917721_8846699404092020309_n - Copy.webp', '244648228_387327989598635_7525951226368113170_n - Copy.webp', '244795547_227816925917721_8846699404092020309_n - Copy.webp', 2600, '', '<p>Assorted sizes</p>', '', 0),
(12, 4, 0, '2021-10-25 08:33:00', 'Tommy Hilfiger 3 set', '244455381_249982360395117_5894534710058864007_n - Copy.webp', '244467858_4354070764681608_1033126538826270929_n - Copy.webp', '244455381_249982360395117_5894534710058864007_n.webp', 1300, '', '<p>Colors as shown</p>', '', 0),
(13, 4, 0, '2021-10-25 08:37:40', 'Victoria Secret Set', '244587097_925019288446162_3777282642836305406_n - Copy.webp', '244587097_925019288446162_3777282642836305406_n.webp', '244587097_925019288446162_3777282642836305406_n - Copy.webp', 1300, '', '<p>Available in color black, red, grey, white</p>\r\n<p>Size:</p>\r\n<p>Small, Medium Large, Extra large</p>', '', 0),
(14, 2, 0, '2021-10-25 08:41:09', 'Double Sole Vans', '244438531_170696475248997_1549940600502157915_n - Copy.webp', '244455140_3044641545781638_8766364943109971820_n - Copy.webp', '244730538_131751615872608_5519980512127414296_n - Copy.webp', 1600, '', '<p>Size:</p>\r\n<p>37 - 44</p>', '', 0),
(15, 2, 0, '2021-10-25 08:45:10', 'Multi color Vans', '244678885_4184478401674839_2918120276407794903_n - Copy.webp', '244678885_4184478401674839_2918120276407794903_n - Copy.webp', '244678885_4184478401674839_2918120276407794903_n - Copy.webp', 1600, '', '<p>Size:</p>\r\n<p>37 - 44</p>', '', 0),
(16, 1, 0, '2021-10-25 08:59:50', 'Split into two', '244452345_224373629679759_8524274385128031125_n - Copy.webp', '244556893_1246051709230735_3185648145341970207_n - Copy.webp', '244825370_387599169508968_3394640757180043246_n - Copy.webp', 2500, '', '<p>Size:</p>\r\n<p>37 - 44</p>', '', 0),
(17, 1, 0, '2021-10-25 09:08:37', 'Low cut', '243411135_244199307658185_7763856485760641245_n - Copy (2).webp', '244540217_288478922873394_5873964123687288740_n - Copy.webp', '243411135_244199307658185_7763856485760641245_n.webp', 1500, '', '<p>LOW PRICE ALERT!!</p>\r\n<p>Size:</p>\r\n<p>36-40</p>\r\n<p>Same day delivery around Nairobi, we deliver countrywide</p>', '', 0),
(18, 8, 0, '2021-10-25 09:16:53', 'Three piece', '242865087_393806635457270_5216580785341030097_n.jpg', '242865087_393806635457270_5216580785341030097_n.jpg', '242865087_393806635457270_5216580785341030097_n.jpg', 4200, '', '<p>Size:</p>\r\n<p>36-40</p>', '', 0),
(19, 1, 0, '2021-10-25 09:21:32', 'Restocked', '246260921_397374192116190_9185034228462785701_n.jpg', '241866069_4856441251050859_2856667989212098036_n.jpg', '242000171_135137248837330_8378849701747116816_n.jpg', 4200, '', '<p>Size:</p>\r\n<p>37-42</p>', '', 0),
(20, 2, 0, '2021-10-25 09:24:14', 'Nike', '241406020_553885832396244_7649683177057471072_n.jpg', '241314217_457899848596967_5138565139718167341_n.jpg', '241448037_205677271484519_466582003530982313_n.jpg', 2800, '', '<p>Size:</p>\r\n<p>37-44</p>', '', 0),
(21, 2, 0, '2021-10-25 09:29:26', 'Jodan', '246150341_411335437278569_8080662367891662980_n.jpg', '241487199_3006498872941009_5751004917594370114_n.jpg', '241788701_273459411279642_9151598846545134627_n.jpg', 3800, '', '<p>Size:</p>\r\n<p>36-41</p>', '', 0),
(22, 1, 0, '2021-10-25 09:34:00', 'Boots', '245707545_200981708703260_5403365936153012544_n.jpg', '245707545_200981708703260_5403365936153012544_n.jpg', '245707545_200981708703260_5403365936153012544_n.jpg', 3500, '', '<p>Size:</p>\r\n<p>37-41</p>', '', 0),
(23, 1, 0, '2021-10-25 09:39:52', 'Jodan 4', '244641584_1600713216950206_6506088005398787462_n - Copy.webp', '244786341_840440753339117_2422807163606437082_n - Copy.webp', '244737275_562781525013876_3502417815860584728_n.webp', 4000, '', '<p>Size:</p>\r\n<p>40-45</p>', '', 0),
(24, 2, 0, '2021-10-25 09:42:26', 'Sports Shoes', '243123993_221482836576461_2994746307751193598_n.jpg', '243582434_303656051195721_8680818065609374885_n.jpg', '243123993_221482836576461_2994746307751193598_n.jpg', 3000, '', '<p>Size:</p>\r\n<p>36-40</p>', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_desc`) VALUES
(1, ' LADIES SHOES', ''),
(2, ' MALE SHOES', ''),
(3, ' ACCESSORIES', ''),
(4, ' LADIES WEAR', ''),
(7, 'MENS WEAR', ''),
(8, 'HAND BAGS', '');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_url`) VALUES
(8, 'Slide Number 10', '244452345_224373629679759_8524274385128031125_n.webp', 'http://localhost/m-dev-store/checkout.php'),
(9, 'Slide-2', '244556893_1246051709230735_3185648145341970207_n.webp', 'http://localhost/m-dev-store/shop.php'),
(13, 'slide-3', '244825370_387599169508968_3394640757180043246_n - Copy.webp', 'test.com'),
(14, 'Slide-4', '244481050_210771911003243_7613539732483594248_n.webp', 'https://youtube.com/c/mdevmedia'),
(15, 'Slide-5', '244626438_288669519751477_635399952630195915_n.webp', '');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_title`, `term_link`, `term_desc`) VALUES
(9, 'Rules & Regulations', 'link_1', '<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</div>'),
(10, 'Promo & Regulations', 'link_2', '<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</div>'),
(11, 'Refund Condition Policy', 'link_3', '<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem ut itaque quibusdam dolores modi natus. Enim earum laboriosam, quos error voluptatem fugiat eos? In maiores quia eligendi, ea aperiam voluptate.</p>');

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
  ADD PRIMARY KEY (`p_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
