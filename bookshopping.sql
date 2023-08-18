-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 10:53 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add inquiry', 8, 'add_inquiry'),
(30, 'Can change inquiry', 8, 'change_inquiry'),
(31, 'Can delete inquiry', 8, 'delete_inquiry'),
(32, 'Can view inquiry', 8, 'view_inquiry'),
(33, 'Can add feedback', 9, 'add_feedback'),
(34, 'Can change feedback', 9, 'change_feedback'),
(35, 'Can delete feedback', 9, 'delete_feedback'),
(36, 'Can view feedback', 9, 'view_feedback'),
(37, 'Can add shippingaddress', 10, 'add_shippingaddress'),
(38, 'Can change shippingaddress', 10, 'change_shippingaddress'),
(39, 'Can delete shippingaddress', 10, 'delete_shippingaddress'),
(40, 'Can view shippingaddress', 10, 'view_shippingaddress'),
(41, 'Can add role', 11, 'add_role'),
(42, 'Can change role', 11, 'change_role'),
(43, 'Can delete role', 11, 'delete_role'),
(44, 'Can view role', 11, 'view_role'),
(45, 'Can add orderitem', 12, 'add_orderitem'),
(46, 'Can change orderitem', 12, 'change_orderitem'),
(47, 'Can delete orderitem', 12, 'delete_orderitem'),
(48, 'Can view orderitem', 12, 'view_orderitem'),
(49, 'Can add product', 13, 'add_product'),
(50, 'Can change product', 13, 'change_product'),
(51, 'Can delete product', 13, 'delete_product'),
(52, 'Can view product', 13, 'view_product'),
(53, 'Can add wishlist', 14, 'add_wishlist'),
(54, 'Can change wishlist', 14, 'change_wishlist'),
(55, 'Can delete wishlist', 14, 'delete_wishlist'),
(56, 'Can view wishlist', 14, 'view_wishlist'),
(57, 'Can add profile', 15, 'add_profile'),
(58, 'Can change profile', 15, 'change_profile'),
(59, 'Can delete profile', 15, 'delete_profile'),
(60, 'Can view profile', 15, 'view_profile'),
(61, 'Can add subcategory', 16, 'add_subcategory'),
(62, 'Can change subcategory', 16, 'change_subcategory'),
(63, 'Can delete subcategory', 16, 'delete_subcategory'),
(64, 'Can view subcategory', 16, 'view_subcategory'),
(65, 'Can add order', 17, 'add_order'),
(66, 'Can change order', 17, 'change_order'),
(67, 'Can delete order', 17, 'delete_order'),
(68, 'Can view order', 17, 'view_order'),
(69, 'Can add billingaddress', 18, 'add_billingaddress'),
(70, 'Can change billingaddress', 18, 'change_billingaddress'),
(71, 'Can delete billingaddress', 18, 'delete_billingaddress'),
(72, 'Can view billingaddress', 18, 'view_billingaddress'),
(73, 'Can add cart', 19, 'add_cart'),
(74, 'Can change cart', 19, 'change_cart'),
(75, 'Can delete cart', 19, 'delete_cart'),
(76, 'Can view cart', 19, 'view_cart');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$320000$No5Yy457yOY596mIVa4U6F$elc9TtJi05o1BDxwqtWEdcZyDme35ZlHPfzeTzhWxVI=', '2022-02-15 06:13:32.195326', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-02-15 04:42:32.430937'),
(9, 'pbkdf2_sha256$320000$vAn58KDmRBPL7FBYEbdNCO$ONNybd/Yk1ADwimJ5qYJ28iEmKJpmVrDYI/tlbGnGyQ=', '2022-02-15 08:33:31.929255', 0, 'user', '', '', 'user@gmail.com', 0, 1, '2022-02-15 08:33:10.327436'),
(10, 'pbkdf2_sha256$320000$ThX4JOBasvgCOSynL7LBOv$PUDYZH3JCXrdwaFkmK1xS426EfiMWV5p6RTu7/AIbHg=', '2022-02-15 09:23:50.147989', 0, 'user1', '', '', 'user1@gmail.com', 0, 1, '2022-02-15 09:23:36.482674');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billingaddress`
--

CREATE TABLE `billingaddress` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact` bigint(20) UNSIGNED NOT NULL CHECK (`contact` >= 0),
  `address` varchar(1000) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(5, 'Comic Book'),
(6, 'Historical Fiction.'),
(7, 'Horror.');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(18, 'myadmin', 'billingaddress'),
(19, 'myadmin', 'cart'),
(7, 'myadmin', 'category'),
(9, 'myadmin', 'feedback'),
(8, 'myadmin', 'inquiry'),
(17, 'myadmin', 'order'),
(12, 'myadmin', 'orderitem'),
(13, 'myadmin', 'product'),
(15, 'myadmin', 'profile'),
(11, 'myadmin', 'role'),
(10, 'myadmin', 'shippingaddress'),
(16, 'myadmin', 'subcategory'),
(14, 'myadmin', 'wishlist'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-15 04:23:39.868369'),
(2, 'auth', '0001_initial', '2022-02-15 04:23:50.735988'),
(3, 'admin', '0001_initial', '2022-02-15 04:23:52.917782'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-15 04:23:52.988412'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-15 04:23:53.034702'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-15 04:23:54.691662'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-15 04:23:55.725171'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-02-15 04:23:55.908374'),
(9, 'auth', '0004_alter_user_username_opts', '2022-02-15 04:23:55.976972'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-02-15 04:23:56.630079'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-02-15 04:23:56.677276'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-15 04:23:56.731847'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-02-15 04:23:56.900593'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-15 04:23:57.041615'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-02-15 04:23:57.219231'),
(16, 'auth', '0011_update_proxy_permissions', '2022-02-15 04:23:57.355337'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-15 04:23:57.511081'),
(18, 'sessions', '0001_initial', '2022-02-15 04:23:58.256209'),
(19, 'myadmin', '0001_initial', '2022-02-15 04:28:00.063622'),
(20, 'myadmin', '0002_subcategory', '2022-02-15 04:28:01.362052'),
(21, 'myadmin', '0003_product', '2022-02-15 04:28:05.559529'),
(22, 'myadmin', '0004_inquiry', '2022-02-15 04:28:05.847400'),
(23, 'myadmin', '0005_feedback', '2022-02-15 04:28:06.371519'),
(24, 'myadmin', '0006_role', '2022-02-15 04:28:06.615704'),
(25, 'myadmin', '0007_profile', '2022-02-15 04:28:08.774456'),
(26, 'myadmin', '0008_wishlist', '2022-02-15 04:28:12.601863'),
(27, 'myadmin', '0009_cart', '2022-02-15 04:28:15.558445'),
(28, 'myadmin', '0010_order', '2022-02-15 04:28:16.703176'),
(29, 'myadmin', '0011_orderitem', '2022-02-15 04:28:18.826305'),
(30, 'myadmin', '0012_shippingaddress', '2022-02-15 04:28:21.366537'),
(31, 'myadmin', '0013_billingaddress', '2022-02-15 04:28:23.688187'),
(32, 'myadmin', '0014_alter_product_user', '2022-02-15 04:28:27.959513'),
(33, 'myadmin', '0015_alter_product_user', '2022-02-15 05:03:24.232947'),
(34, 'myadmin', '0016_profile_dob_profile_gender', '2022-02-15 05:22:41.048058');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('eececo8r6wfn03xrewdzovozfi4b6ie9', '.eJxVjEEOwiAQRe_C2hBmitC6dN8zkGEYpGpoUtqV8e7apAvd_vfef6lA21rC1mQJU1IXBUadfsdI_JC6k3Sneps1z3Vdpqh3RR-06XFO8rwe7t9BoVa-NaOFxLEXQ9GgIwDPAhYHHITlnCxS50wWydy57IEx-T6idZIjsHXq_QEaODis:1nJu3q:rFvjX98JWhMi08X1TKFm1kWceSOdH1DP0TO8zm0iUAk', '2022-03-01 09:23:50.238398'),
('rcxa68o83949t2v1fzgpk37cplr0qrwp', '.eJxVjMsOwiAURP-FtSHAFRSX7v0Gch9UqoYmpV0Z_92SdKHLmXNm3irhupS0tjynUdRFOXX47Qj5mWsH8sB6nzRPdZlH0l3RO236Nkl-XXf376BgK31tEIbj2RMwhRhsDsjGuRMRWBsdQAS0tAlBYEss3kJw6AcWw5mc-nwB0a83fg:1nJr5g:yPw9CAhwHbeHdzXefM1VtPH7fmUnnX6gKe1gv1ZNroQ', '2022-03-01 06:13:32.230456'),
('yrc5jufqqoky4pko5qhxd14djy1q0afs', 'e30:1nJpg0:vSN23odUGmK7NRdBCJICn7sX67xW91cU5yEi56vb5Qs', '2022-03-01 04:42:56.872120');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) NOT NULL,
  `customer` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `total_amount` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `prices` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `subcategory_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `description`, `price`, `image`, `quantity`, `date`, `category_id`, `subcategory_id`, `user_id`) VALUES
(9, 'Spawn', 'In 1992 a group of Marvel\'s top artists, frustrated with having their work exploited, walked out to form Image Comics, a place where creators would retain the rights to the characters they created. Among their numerous launch titles, Spawn would prove to be by far the most popular', 799, 'admin/book1.jpeg', 1, '2022-02-15', 5, 5, 9),
(10, 'Caption haddock', 'Tintin\'s most enduring sidekick turned up in the ninth of the young reporter\'s adventures, and became more and more prominent thereafter – eventually becoming practically the main character.', 899, 'admin/book2.jpg', 1, '2022-02-15', 5, 5, 9),
(11, 'Collected Ghost', 'His Collected Ghost Stories includes a whopping 30 tales, most of which involve a mild-mannered academic stumbling upon an artifact that calls forth some malevolent, otherworldly presence.', 999, 'admin/book3.jpg', 1, '2022-02-15', 7, 7, 9),
(12, 'The inteligent Invester', 'Best Book Finance', 499, 'admin/book4.jpg', 1, '2022-02-15', 6, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `date` date NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `contact`, `address`, `date`, `role_id`, `user_id`, `dob`, `gender`) VALUES
(2, NULL, NULL, '2022-02-15', 1, 2, NULL, NULL),
(7, '9656576544', 'rajkot', '2022-02-15', 2, 9, NULL, NULL),
(8, '1234567890', 'surat', '2022-02-15', 2, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'myadmin'),
(2, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `shippingaddress`
--

CREATE TABLE `shippingaddress` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `contact` bigint(20) UNSIGNED NOT NULL CHECK (`contact` >= 0),
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` bigint(20) NOT NULL,
  `subcategory_name` varchar(200) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `subcategory_name`, `category_id`) VALUES
(5, 'Graphic Novels', 5),
(6, 'finance', 6),
(7, 'Movies', 7);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `billingaddress`
--
ALTER TABLE `billingaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billingaddress_order_id_d38aab57_fk_order_id` (`order_id`),
  ADD KEY `billingaddress_user_id_e3c16e71_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_product_id_508e72da_fk_product_id` (`product_id`),
  ADD KEY `cart_user_id_1361a739_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_id_e323497c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderitem_order_id_e716e9f7_fk_order_id` (`order_id`),
  ADD KEY `orderitem_product_id_dd00a492_fk_product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_id_640030a0_fk_category_id` (`category_id`),
  ADD KEY `product_subcategory_id_5651b678_fk_subcategory_id` (`subcategory_id`),
  ADD KEY `product_user_id_091f6d86_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `profile_role_id_9bb7f33b_fk_role_id` (`role_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippingaddress_order_id_6245dc00_fk_order_id` (`order_id`),
  ADD KEY `shippingaddress_user_id_ca19d8bc_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategory_category_id_4b55556d_fk_category_id` (`category_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_customer_id_bb9fb388_fk_auth_user_id` (`customer_id`),
  ADD KEY `wishlist_product_id_fbf2a693_fk_product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billingaddress`
--
ALTER TABLE `billingaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `billingaddress`
--
ALTER TABLE `billingaddress`
  ADD CONSTRAINT `billingaddress_order_id_d38aab57_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `billingaddress_user_id_e3c16e71_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_product_id_508e72da_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_user_id_1361a739_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_user_id_e323497c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_order_id_e716e9f7_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `orderitem_product_id_dd00a492_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id_640030a0_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_subcategory_id_5651b678_fk_subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`),
  ADD CONSTRAINT `product_user_id_091f6d86_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_role_id_9bb7f33b_fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `profile_user_id_2aeb6f6b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  ADD CONSTRAINT `shippingaddress_order_id_6245dc00_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `shippingaddress_user_id_ca19d8bc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_category_id_4b55556d_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_customer_id_bb9fb388_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `wishlist_product_id_fbf2a693_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
