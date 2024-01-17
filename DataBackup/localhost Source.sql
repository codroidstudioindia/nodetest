-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 02, 2024 at 02:22 AM
-- Server version: 5.7.44-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_app`
--
CREATE DATABASE IF NOT EXISTS `db_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_app`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_games_type`
--

CREATE TABLE `lst_games_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(20) NOT NULL,
  `code` varchar(5) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_games_type`
--

INSERT INTO `lst_games_type` (`id`, `label`, `code`, `createdon`) VALUES
(2, 'CARROM ARENA', 'CR01', '2022-12-03 13:21:09'),
(1, 'LUDO SUPREME', 'LD01', '2022-12-03 13:21:09'),
(3, 'RUMMY POINT', 'RY01', '2022-12-03 13:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `lst_server_state`
--

CREATE TABLE `lst_server_state` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_server_state`
--

INSERT INTO `lst_server_state` (`id`, `label`, `createdon`) VALUES
(1, 'ONLINE', '2022-12-02 19:23:54'),
(2, 'OFFLINE', '2022-12-02 19:23:54'),
(3, 'MAINTENANCE', '2022-12-02 19:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `lst_vip_pack_list`
--

CREATE TABLE `lst_vip_pack_list` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `period_days` smallint(6) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `hashkey` varchar(100) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_vip_pack_list`
--

INSERT INTO `lst_vip_pack_list` (`id`, `label`, `period_days`, `amount`, `hashkey`, `createdon`) VALUES
(1, '1 MONTH', 30, 199.00, '2', '2022-10-12 08:36:00'),
(2, '3 MONTH', 90, 499.00, '3', '2022-10-12 08:36:00'),
(3, '6 MONTH', 180, 999.00, '4', '2022-10-12 08:36:00'),
(4, '1 YEAR', 365, 1499.00, '5', '2022-10-12 08:36:00');

-- --------------------------------------------------------

--
-- Table structure for table `t_refferal_reedem`
--

CREATE TABLE `t_refferal_reedem` (
  `userid` varchar(45) NOT NULL,
  `refferalfrom` varchar(12) NOT NULL,
  `createdon` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_register_devices`
--

CREATE TABLE `t_register_devices` (
  `device_id` varchar(45) NOT NULL,
  `token` varchar(45) DEFAULT NULL,
  `dtype` varchar(20) NOT NULL,
  `model` varchar(100) NOT NULL,
  `imei` varchar(45) DEFAULT NULL,
  `srno` varchar(45) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_register_devices`
--

INSERT INTO `t_register_devices` (`device_id`, `token`, `dtype`, `model`, `imei`, `srno`, `createdon`) VALUES
('0d3d5a9770b62a2d50e1c1b1ab617920ff20674c', 'aa23eb5b47764709321270f4d18085af', 'Desktop', 'ASUS TUF Gaming A17 FA706II_FA706II (ASUSTeK COMPUTER INC.)', NULL, NULL, '2023-07-21 07:34:16'),
('37b41dd00f05f31a10c5d401c210787a', '11108648e1d1209fe81cc01c6862dd7b', 'Handheld', 'Xiaomi 2201116SI', NULL, NULL, '2023-07-13 17:31:26'),
('3cba78c8a6abd0bcba5f98b92e32be9b', '899cfba3ab3158692242e7061a1d5e40', 'Handheld', 'motorola moto g62 5G', NULL, NULL, '2023-07-24 04:20:15'),
('436e1db665e7a056ede91525648c24fa', '4aa607b02fd0f17050ffc8af5089ff3d', 'Handheld', 'motorola moto g62 5G', NULL, NULL, '2023-07-14 07:12:22'),
('559d4be87cee460f246e011308fb4548', 'ed6210151933187d587fd99c575d7d7b', 'Handheld', 'Xiaomi 2201116SI', NULL, NULL, '2023-07-24 19:11:05'),
('630d92b5be27a41615f7b95c514d3ce260c6a98c', 'a5e1d48e5a483c67553fb2de8d6427a4', 'Desktop', 'ASUS TUF Gaming A17 FA706II_FA706II (ASUSTeK COMPUTER INC.)', NULL, NULL, '2023-07-23 04:04:23'),
('71114f7ed0796bff1b1d6e95b7cf46c3', '9c29cb86d8c4e7d680c5ee451633fa8d', 'Handheld', 'Google sdk_gphone64_x86_64', NULL, NULL, '2023-07-23 03:55:06'),
('ad16c076b493adf9f272bcd12c034a3d', 'ba64faedc7c225b88854ab64713a920c', 'Handheld', 'OnePlus CPH2381', NULL, NULL, '2023-07-13 10:02:54'),
('c16d700ef005dcbebde4d2d14b99df9c', 'a8d6f7663009f1f21b8860fe92cf1d6d', 'Handheld', 'realme RMX3241', NULL, NULL, '2023-07-20 08:35:17'),
('d1409ef8b703223670bfd61e89cbbf5c397535f1', '2d28db52628017e77a8b003c6df81d92', 'Desktop', 'B450M DS3H (Gigabyte Technology Co., Ltd.)', NULL, NULL, '2023-11-29 06:39:15'),
('da63246cee942db4507ecdde3e076915', '37406149c7213cc22c8e6c70b11eec98', 'Handheld', 'vivo V2050', NULL, NULL, '2023-07-13 15:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `t_sever_info`
--

CREATE TABLE `t_sever_info` (
  `platform_key` varchar(45) NOT NULL,
  `server_state` tinyint(4) NOT NULL,
  `version` varchar(10) NOT NULL,
  `update_url` text NOT NULL,
  `maintainence_message` text,
  `maintainence_scheduledon` varchar(45) DEFAULT NULL,
  `maintainence_expireson` varchar(45) DEFAULT NULL,
  `modifiedon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sever_info`
--

INSERT INTO `t_sever_info` (`platform_key`, `server_state`, `version`, `update_url`, `maintainence_message`, `maintainence_scheduledon`, `maintainence_expireson`, `modifiedon`) VALUES
('09721ab88e0a552087391be1ef0c6826', 1, '2.0.0', 'bhdsbfsdv', NULL, NULL, NULL, '2023-07-01 05:26:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lst_games_type`
--
ALTER TABLE `lst_games_type`
  ADD UNIQUE KEY `label` (`label`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `lst_server_state`
--
ALTER TABLE `lst_server_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label_UNIQUE` (`label`);

--
-- Indexes for table `lst_vip_pack_list`
--
ALTER TABLE `lst_vip_pack_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `period_days_UNIQUE` (`period_days`),
  ADD UNIQUE KEY `title_UNIQUE` (`label`),
  ADD UNIQUE KEY `hashkey_UNIQUE` (`hashkey`);

--
-- Indexes for table `t_register_devices`
--
ALTER TABLE `t_register_devices`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `t_sever_info`
--
ALTER TABLE `t_sever_info`
  ADD PRIMARY KEY (`platform_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lst_server_state`
--
ALTER TABLE `lst_server_state`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lst_vip_pack_list`
--
ALTER TABLE `lst_vip_pack_list`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `db_bounty`
--
CREATE DATABASE IF NOT EXISTS `db_bounty` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_bounty`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_bounty_value_type`
--

CREATE TABLE `lst_bounty_value_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `amount` smallint(6) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_bounty_value_type`
--

INSERT INTO `lst_bounty_value_type` (`id`, `amount`, `createdon`) VALUES
(1, 1, '2022-11-29 15:06:06'),
(2, 2, '2022-11-29 15:06:06'),
(3, 5, '2022-11-29 15:06:06'),
(4, 10, '2022-11-29 15:06:06'),
(5, 20, '2022-11-29 15:06:06'),
(6, 50, '2022-11-29 15:06:06'),
(7, 100, '2022-11-29 15:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `t_live_bounty`
--

CREATE TABLE `t_live_bounty` (
  `roomid` varchar(45) NOT NULL,
  `gamecode` varchar(10) NOT NULL,
  `state` varchar(20) NOT NULL,
  `value_type` tinyint(4) NOT NULL,
  `pricepool` decimal(8,2) NOT NULL DEFAULT '0.00',
  `initiator_player_id` varchar(45) NOT NULL,
  `targethash` varchar(100) NOT NULL,
  `achiever_player_id` varchar(45) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `achievedon` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_live_players_in_bounty`
--

CREATE TABLE `t_live_players_in_bounty` (
  `room_id` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `target` varchar(100) NOT NULL,
  `joinon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lst_bounty_value_type`
--
ALTER TABLE `lst_bounty_value_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_live_bounty`
--
ALTER TABLE `t_live_bounty`
  ADD PRIMARY KEY (`roomid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lst_bounty_value_type`
--
ALTER TABLE `lst_bounty_value_type`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `db_enduser`
--
CREATE DATABASE IF NOT EXISTS `db_enduser` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_enduser`;

-- --------------------------------------------------------

--
-- Table structure for table `t_active_logged_in`
--

CREATE TABLE `t_active_logged_in` (
  `userid` varchar(45) NOT NULL,
  `auth_token` varchar(45) NOT NULL,
  `device_token` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_active_logged_in`
--

INSERT INTO `t_active_logged_in` (`userid`, `auth_token`, `device_token`, `createdon`) VALUES
('28331260329852929', 'aa0bdcff8c855e0bfa8facb83d5db9e3', 'a5e1d48e5a483c67553fb2de8d6427a4', '2023-07-26 05:14:32'),
('28331260329852931', 'b4268249ca22f6131e56649a8737e7f1', '4aa607b02fd0f17050ffc8af5089ff3d', '2023-07-14 07:12:31'),
('28331260329852932', 'd050e8d612d05ecada8ac5fd8f6e77fc', 'aa23eb5b47764709321270f4d18085af', '2023-07-21 07:34:23'),
('28378932604567552', 'b32561c14fa385192f67d890c709d7e8', 'ed6210151933187d587fd99c575d7d7b', '2023-08-21 09:03:54'),
('28423899972632577', '135abad6796da8938b1368a01d6b7f57', '899cfba3ab3158692242e7061a1d5e40', '2023-09-29 05:34:38'),
('28511039507136512', 'ebbe7d3f92ff5c82a8f0d011450be38f', '37406149c7213cc22c8e6c70b11eec98', '2023-11-14 10:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `t_purchase_order`
--

CREATE TABLE `t_purchase_order` (
  `orderid` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `ordertype` varchar(10) NOT NULL,
  `orderstatus` varchar(20) NOT NULL DEFAULT 'ORDER_CREATED',
  `amount` int(11) NOT NULL,
  `iscompleted` bit(1) NOT NULL DEFAULT b'0',
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `concludeon` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_purchase_order`
--

INSERT INTO `t_purchase_order` (`orderid`, `userid`, `ordertype`, `orderstatus`, `amount`, `iscompleted`, `createdon`, `concludeon`) VALUES
('PB1691206820217', '28331260329852934', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-08-05 03:40:20', NULL),
('PB1691207487729', '28331260329852934', 'ADDMONEY', 'SUCCESS', 10, b'0', '2023-08-05 03:51:27', '2023-08-05 03:52:09'),
('PB1691207770724', '28331260329852934', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-08-05 03:56:10', NULL),
('PB1691207829562', '28331260329852934', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-08-05 03:57:09', NULL),
('PB1691207987173', '28331260329852934', 'ADDMONEY', 'SUCCESS', 10, b'0', '2023-08-05 03:59:47', '2023-08-05 04:00:04'),
('PB1692609025588', '28378932604567552', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-08-21 09:10:25', NULL),
('PB1692609028135', '28378932604567552', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-08-21 09:10:28', NULL),
('PB1692609274663', '28378932604567552', 'ADDMONEY', 'ORDER_CREATED', 88, b'0', '2023-08-21 09:14:34', NULL),
('PB1692697165270', '28378932604567552', 'ADDMONEY', 'ORDER_CREATED', 55, b'0', '2023-08-22 09:39:25', NULL),
('PB1692697248246', '28378932604567552', 'ADDMONEY', 'ORDER_CREATED', 60, b'0', '2023-08-22 09:40:48', NULL),
('PB1692697471382', '28378932604567552', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-08-22 09:44:31', NULL),
('PB1693818171277', '28378932604567552', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-04 09:02:51', NULL),
('PB1695965867307', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:37:47', NULL),
('PB1695965878296', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:37:58', NULL),
('PB1695965883844', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:38:03', NULL),
('PB1695965895375', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:15', NULL),
('PB1695965907549', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:27', NULL),
('PB1695965907897', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:27', NULL),
('PB1695965908064', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:28', NULL),
('PB1695965908385', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:28', NULL),
('PB1695965908394', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:28', NULL),
('PB1695965909678', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:29', NULL),
('PB1695965910477', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 50, b'0', '2023-09-29 05:38:30', NULL),
('PB1695966596799', '28423899972632577', 'ADDMONEY', 'SUCCESS', 25, b'0', '2023-09-29 05:49:56', '2023-09-29 05:51:41'),
('PB1695966783729', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:53:03', NULL),
('PB1695966787461', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:53:07', NULL),
('PB1695966787829', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:53:07', NULL),
('PB1695966788025', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:53:08', NULL),
('PB1695966788193', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:53:08', NULL),
('PB1695966788359', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 10, b'0', '2023-09-29 05:53:08', NULL),
('PB1695966789471', '28423899972632577', 'ADDMONEY', 'SUCCESS', 10, b'0', '2023-09-29 05:53:09', '2023-09-29 05:53:25'),
('PB1695968027559', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 5000, b'0', '2023-09-29 06:13:47', NULL),
('PB1695968027830', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 5000, b'0', '2023-09-29 06:13:47', NULL),
('PB1695968028166', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 5000, b'0', '2023-09-29 06:13:48', NULL),
('PB1695968028592', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 5000, b'0', '2023-09-29 06:13:48', NULL),
('PB1695968029142', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 5000, b'0', '2023-09-29 06:13:49', NULL),
('PB1695968029291', '28423899972632577', 'ADDMONEY', 'ORDER_CREATED', 5000, b'0', '2023-09-29 06:13:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_user_acc`
--

CREATE TABLE `t_user_acc` (
  `id` varchar(45) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `authtoken` varchar(45) DEFAULT NULL,
  `game_name` varchar(45) DEFAULT NULL,
  `emailid` varchar(60) DEFAULT NULL,
  `avatar_name` varchar(20) DEFAULT NULL,
  `dp_image_url` text,
  `isblocked` bit(1) NOT NULL DEFAULT b'0',
  `referalcode` varchar(12) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_acc`
--

INSERT INTO `t_user_acc` (`id`, `phone_number`, `authtoken`, `game_name`, `emailid`, `avatar_name`, `dp_image_url`, `isblocked`, `referalcode`, `createdon`) VALUES
('28423899972632577', '5565665655', '135abad6796da8938b1368a01d6b7f57', 'ghsjbbd', 'codroidstudioindia@gmail.com', '1', 'userpersistent/28423899972632577/dp_avatar/', b'0', '99972632577', '2023-09-29 05:34:37'),
('28511039507136512', '9450028553', 'ebbe7d3f92ff5c82a8f0d011450be38f', 'pb_1699956606960357', NULL, NULL, 'userpersistent/28511039507136512/dp_avatar/', b'0', '39507136512', '2023-11-14 10:10:05'),
('28423899972632576', '9700005623', NULL, 'pb_1695965622335285', NULL, NULL, 'userpersistent/28423899972632576/dp_avatar/', b'0', '99972632576', '2023-09-29 05:33:42'),
('28331260329852934', '9702225858', NULL, 'fhcvbvh', 'rakeshsharma.live@gmail.com', '1', 'userpersistent/28331260329852934/dp_avatar/', b'0', '60329852934', '2023-07-24 04:20:51'),
('28378932604567552', '9964727733', 'b32561c14fa385192f67d890c709d7e8', 'pb_1692608623861990', NULL, NULL, 'userpersistent/28378932604567552/dp_avatar/', b'0', '32604567552', '2023-08-21 09:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_otp`
--

CREATE TABLE `t_user_otp` (
  `phone_number` varchar(20) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expireon` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_otp`
--

INSERT INTO `t_user_otp` (`phone_number`, `otp`, `createdon`, `expireon`) VALUES
('9700005623', '1943', '2023-09-29 05:33:42', '2023-09-29 05:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `t_vip_user`
--

CREATE TABLE `t_vip_user` (
  `userid` varchar(45) NOT NULL,
  `expiredon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_wallets`
--

CREATE TABLE `t_wallets` (
  `userid` varchar(45) NOT NULL,
  `deposit_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `bonus_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `winning_amount` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_wallets`
--

INSERT INTO `t_wallets` (`userid`, `deposit_amount`, `bonus_amount`, `winning_amount`) VALUES
('28331260329852929', 265.00, 0.00, 0.00),
('28331260329852930', 140.00, 0.00, 0.00),
('28331260329852931', 10.00, 0.00, 0.00),
('28331260329852932', 10.00, 0.00, 0.00),
('28331260329852933', 10.00, 0.00, 0.00),
('28331260329852934', 245.00, 0.00, 0.00),
('28331260329852935', 60.00, 0.00, 0.00),
('28378932604567552', 10.00, 0.00, 0.00),
('28423899972632576', 10.00, 0.00, 0.00),
('28423899972632577', 45.00, 0.00, 0.00),
('28511039507136512', 10.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `t_withdrawal_order`
--

CREATE TABLE `t_withdrawal_order` (
  `idt_withdrawal_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_user_profile`
-- (See below for the actual view)
--
CREATE TABLE `vw_user_profile` (
`id` varchar(45)
,`phone_number` varchar(20)
,`authtoken` varchar(45)
,`game_name` varchar(45)
,`emailid` varchar(60)
,`avatar_name` varchar(20)
,`dp_image_url` text
,`bonus_amount` decimal(8,2)
,`deposit_amount` decimal(8,2)
,`winning_amount` decimal(8,2)
,`isblocked` bit(1)
,`referalcode` varchar(12)
,`createdon` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `vw_user_profile`
--
DROP TABLE IF EXISTS `vw_user_profile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_user_profile`  AS SELECT `t_user_acc`.`id` AS `id`, `t_user_acc`.`phone_number` AS `phone_number`, `t_user_acc`.`authtoken` AS `authtoken`, `t_user_acc`.`game_name` AS `game_name`, `t_user_acc`.`emailid` AS `emailid`, `t_user_acc`.`avatar_name` AS `avatar_name`, `t_user_acc`.`dp_image_url` AS `dp_image_url`, `t_wallets`.`bonus_amount` AS `bonus_amount`, `t_wallets`.`deposit_amount` AS `deposit_amount`, `t_wallets`.`winning_amount` AS `winning_amount`, `t_user_acc`.`isblocked` AS `isblocked`, `t_user_acc`.`referalcode` AS `referalcode`, `t_user_acc`.`createdon` AS `createdon` FROM (`t_user_acc` join `t_wallets` on((`t_user_acc`.`id` = `t_wallets`.`userid`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_active_logged_in`
--
ALTER TABLE `t_active_logged_in`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `auth_token_UNIQUE` (`auth_token`),
  ADD UNIQUE KEY `device_token_UNIQUE` (`device_token`);

--
-- Indexes for table `t_purchase_order`
--
ALTER TABLE `t_purchase_order`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `t_user_acc`
--
ALTER TABLE `t_user_acc`
  ADD PRIMARY KEY (`phone_number`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `referalcode_UNIQUE` (`referalcode`),
  ADD UNIQUE KEY `authtoken_UNIQUE` (`authtoken`);

--
-- Indexes for table `t_user_otp`
--
ALTER TABLE `t_user_otp`
  ADD PRIMARY KEY (`phone_number`);

--
-- Indexes for table `t_vip_user`
--
ALTER TABLE `t_vip_user`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `t_wallets`
--
ALTER TABLE `t_wallets`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `id_UNIQUE` (`userid`);

--
-- Indexes for table `t_withdrawal_order`
--
ALTER TABLE `t_withdrawal_order`
  ADD PRIMARY KEY (`idt_withdrawal_order`);
--
-- Database: `db_enduser_complaint`
--
CREATE DATABASE IF NOT EXISTS `db_enduser_complaint` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_enduser_complaint`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_issue_list`
--

CREATE TABLE `lst_issue_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `issue_type_id` tinyint(3) UNSIGNED NOT NULL,
  `topic` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_issue_list`
--

INSERT INTO `lst_issue_list` (`id`, `issue_type_id`, `topic`, `description`, `createdon`) VALUES
(1, 1, 'My game Automatically ended midway', '1. Please note that you need to maintain high bandwidth mobile data to play skill-based games on playbee.\n2.If you already have high bandwidth mobile data and you still face any issues while playing the game, please wait for 60 minutes for an auto Refund to happen before raising a ticket\n3.Itâ€™s strongly recommended that you don\'t navigate on multiple apps while playing game \n4.Leaving a game due for any reason is considered a disqualification\n5.In case you left the table, your game will end, also no refund will be issued.', '2022-08-03 12:17:57'),
(2, 1, 'Money Deducted For entry but the game didnâ€™t start, I didnâ€™t get a refund.', '1. Please note that you need to maintain high bandwidth mobile data to play skill-based games on playbee.\n2.If you already have high bandwidth mobile data and you still face any issues while playing the game, please wait for 60 minutes for an auto Refund to happen before raising a ticket\n3.Itâ€™s strongly recommended that you don\'t navigate on multiple apps while playing game \n4.In any other circumstance, Go to the wallet and check for a transaction and raise a dispute for a particular transaction.', '2022-08-03 12:17:57'),
(3, 1, 'Money Deducted For entry but the game didnâ€™t start, I didnâ€™t get a refund.', '1. Each player gets an equal number of moves while playing a game.\n2.Please note that you need to maintain high bandwidth mobile data to play skill - based games on playbee.\n3.If you already have high bandwidth mobile data and you still face any issues while playing the game, please wait for 60 minutes for an auto Refund to happen before raising a ticket\n4.Itâ€™s strongly recommended that you don\'t navigate on multiple apps while playing the game.', '2022-08-03 12:17:57'),
(4, 2, 'My game did not end after the full duration of the game.', 'Though we have instant withdrawals, sometimes it may take 5â€“7 working days to reflect back into your bank account.\n2.Please do not worry. In case your withdrawal fails, the amount will be credited into your game wallet within 3-5 working days from the date of failure.\n3.In any other circumstance, Go to the wallet and check for a transaction, then raise a dispute for that particular transaction.', '2022-08-03 12:17:57'),
(5, 2, 'UPI withdrawal is still pending', '1. Though we have instant withdrawals, sometime it may take 5 - 7 working days to reflect into your bank account \n2.Please do not worry. In case your withdrawal fails, the amount will be credited into your game wallet within 3-5 working days from the date of failure. \n3. In any other circumstance, Go to the wallet and check for a transaction and raise a dispute for a particular transaction.', '2022-08-03 12:17:57'),
(6, 2, 'I added Money in my Playbee Wallet but the amount is not showing ', '1. Please check the status of the deposit transaction from the transaction history in the wallet section.\n2.If a transaction is pending, please wait for 3 - 5 working days.\n3.If a transaction fails, the bank will refund it within 5 - 6 working days from the date the deposit failed.\n4.In any other circumstance, Go to the wallet and check for a transaction and raise a dispute for a particular transaction.', '2022-08-03 12:17:57'),
(7, 2, 'I am not able to see my Bank / UPI details which I added earlier', '1.Please make sure that the name registered with your UPI id / bank account is the same as that of the KYC document submitted.\n2.You may re - renter the UPI id or bank account details that are consistent with your KYC document', '2022-08-03 12:17:57'),
(8, 3, 'I referred my friends they joined but I didnâ€™t receive my money referral Bonus', '1. Please make sure that the person you referred joined through your shared link or entered your referral code while registering on the app. 2.Visit The refer and earn policy section for more details on the referral benefits.', '2022-08-03 12:17:57'),
(9, 4, 'I got kicked out of the Next round of the tournament even though I won', '1. Please note that you need to maintain high bandwidth mobile data to play skill-based games on playbee.\n2.If you already have high bandwidth mobile data and you still face any issues while playing the game, please wait for 60 minutes for an auto-refund to happen before raising a ticket\n3.Itâ€™s strongly recommended that you don\'t navigate on multiple apps while playing game', '2022-08-03 12:17:57'),
(10, 4, 'I won a Few rounds but I didn\'t win any money', '1. Rewards for the event depending on your rank in tournament \n2.Please view the tournament details for the prize distribution details.\n3.Please note that you need to maintain high bandwidth mobile data to play skill - based games on playbee.\n4.If you already have high bandwidth mobile data and you still face any issues while playing the game, please wait for 60 minutes for an auto Refund to happen before raising a ticket\n5.Itâ€™s strongly recommended that you don\'t navigate on multiple apps while playing game.', '2022-08-03 12:17:57'),
(11, 4, 'I signed up for Tournament but the tournament started without me', '1. Please note that you need to maintain high bandwidth mobile data to play skill-based games on playbee.\n2.If you already have high bandwidth mobile data and you still face any issues while playing the game, please wait for 60 minutes for an auto Refund to happen before raising a ticket\n3.Itâ€™s strongly recommended that you don\'t navigate on multiple apps while playing game \n4.Leaving a game due for any reason is considered a disqualification\n5.In case you left the table, your game will end, also no refund will be issued', '2022-08-03 12:17:57'),
(12, 5, 'I submitted a copy of my identification (Driving license/pan card / Voter ID / Adhar card), But it got rejected.', '1. You must Be 18 years or above as minors are not allowed the play real money Games \n2.A clear and correct image of the documents is required for KYC approval.\n3.The bank account holder\'s name should be matched with the KYC document Submitted \n4.For security reasons, we do NOT Allow Our users to edit/Change KYC', '2022-08-03 12:17:57'),
(13, 5, 'My KYC is pending For a long time', 'Raise a ticket to resolve this issue quickly', '2022-08-03 12:17:57'),
(14, 6, 'I am unable to Sign-Up and I am getting login failure', '1.You can only sign-up With one account on your device. \n2.Make sure that your mobile number has active incomings of OTPs for login', '2022-08-03 12:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `lst_issue_status`
--

CREATE TABLE `lst_issue_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_issue_status`
--

INSERT INTO `lst_issue_status` (`id`, `label`, `createdon`) VALUES
(1, 'PENDING', '2022-10-09 11:20:58'),
(2, 'RESOLVED', '2022-10-09 11:20:58'),
(3, 'REJECTED', '2022-10-09 11:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `lst_issue_type`
--

CREATE TABLE `lst_issue_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_issue_type`
--

INSERT INTO `lst_issue_type` (`id`, `label`, `createdon`) VALUES
(1, 'GAME PLAY', '2022-10-09 11:20:37'),
(2, 'WALLET & PAYMENTS', '2022-10-09 11:20:37'),
(3, 'REFERRALS', '2022-10-09 11:20:37'),
(4, 'KYC', '2022-10-09 11:20:37'),
(5, 'LOGIN ISSUE', '2022-10-09 11:20:37'),
(6, 'NOT SPECIFIED', '2022-10-09 11:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_issue_tickets`
--

CREATE TABLE `t_user_issue_tickets` (
  `tid` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `issue_list_id` int(11) NOT NULL,
  `topic` varchar(60) NOT NULL,
  `subtopic` varchar(250) NOT NULL,
  `issue_status` varchar(45) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `attachment_url` text NOT NULL,
  `createdon` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_issue_tickets`
--

INSERT INTO `t_user_issue_tickets` (`tid`, `userid`, `issue_list_id`, `topic`, `subtopic`, `issue_status`, `message`, `attachment_url`, `createdon`) VALUES
('PBT1695967105938026', '28423899972632577', 1, 'GAME PLAY', 'My game Automatically ended midway', 'PENDING', 'cbvb', 'userpersistent/Images/28423899972632577/tickets/PBT1695967105938026/', '2023-09-29 05:58:24');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_get_all_issue_entities`
-- (See below for the actual view)
--
CREATE TABLE `vw_get_all_issue_entities` (
`id` int(10) unsigned
,`topic` varchar(45)
,`subtopic` varchar(500)
,`description` text
);

-- --------------------------------------------------------

--
-- Structure for view `vw_get_all_issue_entities`
--
DROP TABLE IF EXISTS `vw_get_all_issue_entities`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_get_all_issue_entities`  AS SELECT `lst_issue_list`.`id` AS `id`, `lst_issue_type`.`label` AS `topic`, `lst_issue_list`.`topic` AS `subtopic`, `lst_issue_list`.`description` AS `description` FROM (`lst_issue_list` join `lst_issue_type` on((`lst_issue_list`.`issue_type_id` = `lst_issue_type`.`id`))) ORDER BY `lst_issue_type`.`label` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lst_issue_list`
--
ALTER TABLE `lst_issue_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lst_issue_status`
--
ALTER TABLE `lst_issue_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label_UNIQUE` (`label`);

--
-- Indexes for table `lst_issue_type`
--
ALTER TABLE `lst_issue_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label_UNIQUE` (`label`);

--
-- Indexes for table `t_user_issue_tickets`
--
ALTER TABLE `t_user_issue_tickets`
  ADD PRIMARY KEY (`tid`);
--
-- Database: `db_history_activity`
--
CREATE DATABASE IF NOT EXISTS `db_history_activity` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_history_activity`;

-- --------------------------------------------------------

--
-- Table structure for table `t_history_logging_activity`
--

CREATE TABLE `t_history_logging_activity` (
  `userid` varchar(45) NOT NULL,
  `device_token` varchar(45) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_history_logging_activity`
--

INSERT INTO `t_history_logging_activity` (`userid`, `device_token`, `status`, `createdon`) VALUES
('28331260329852929', '', 'IN', '2023-07-13 10:03:06'),
('28331260329852930', '', 'IN', '2023-07-13 17:31:34'),
('28331260329852931', '', 'IN', '2023-07-14 07:12:31'),
('28331260329852929', '', 'IN', '2023-07-20 08:35:23'),
('28331260329852932', '', 'IN', '2023-07-21 07:34:23'),
('28331260329852929', '', 'IN', '2023-07-23 03:55:13'),
('28331260329852933', '', 'IN', '2023-07-23 04:04:30'),
('28331260329852934', '', 'IN', '2023-07-24 04:20:52'),
('28331260329852934', '', 'IN', '2023-07-24 04:34:12'),
('28331260329852934', '', 'IN', '2023-07-24 04:34:13'),
('28331260329852934', '', 'IN', '2023-07-24 06:26:57'),
('28331260329852930', '', 'IN', '2023-07-24 19:11:13'),
('28331260329852930', '', 'IN', '2023-07-24 19:15:18'),
('28331260329852930', '', 'IN', '2023-07-25 05:13:15'),
('28331260329852935', '', 'IN', '2023-07-25 11:14:35'),
('28331260329852929', '', 'IN', '2023-07-26 05:14:32'),
('28331260329852934', '', 'IN', '2023-07-26 05:51:15'),
('28331260329852930', '', 'IN', '2023-07-26 06:28:49'),
('28331260329852930', '', 'IN', '2023-07-27 16:51:53'),
('28378932604567552', '', 'IN', '2023-08-21 09:03:54'),
('28423899972632577', '', 'IN', '2023-09-29 05:34:38'),
('28511039507136512', '', 'IN', '2023-11-14 10:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `t_history_player_matches`
--

CREATE TABLE `t_history_player_matches` (
  `userid` varchar(45) NOT NULL,
  `roomid` varchar(45) NOT NULL,
  `last_state` varchar(45) NOT NULL,
  `score` smallint(6) NOT NULL,
  `wonamount` varchar(20) NOT NULL,
  `player_joinon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `player_leaveon` timestamp NULL DEFAULT NULL,
  `tourid` varchar(45) DEFAULT NULL,
  `gamecode` varchar(20) NOT NULL,
  `match_last_state` varchar(20) DEFAULT NULL,
  `match_createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `match_endon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_match_history`
--

CREATE TABLE `t_match_history` (
  `roomid` varchar(45) NOT NULL,
  `tourid` varchar(45) NOT NULL,
  `gamecode` varchar(20) NOT NULL,
  `matchstate` varchar(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endon` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `db_kyc`
--
CREATE DATABASE IF NOT EXISTS `db_kyc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_kyc`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_kyc_varified_state_type`
--

CREATE TABLE `lst_kyc_varified_state_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_kyc_varified_state_type`
--

INSERT INTO `lst_kyc_varified_state_type` (`id`, `label`, `createdon`) VALUES
(1, 'NOT SUBMITTED', '2022-08-02 12:13:42'),
(2, 'SUBMITTED', '2022-08-02 12:13:42'),
(3, 'VERIFIED', '2022-08-02 12:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_kyc_aadharcard`
--

CREATE TABLE `t_user_kyc_aadharcard` (
  `user_id` varchar(45) NOT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `url` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_kyc_aadharcard`
--

INSERT INTO `t_user_kyc_aadharcard` (`user_id`, `card_number`, `fullname`, `birth`, `url`, `status`, `createdon`) VALUES
('28331260329852929', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28331260329852929/', 1, '2023-07-13 10:03:05'),
('28331260329852930', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28331260329852930/', 1, '2023-07-13 17:31:33'),
('28331260329852931', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28331260329852931/', 1, '2023-07-14 07:12:30'),
('28331260329852932', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28331260329852932/', 1, '2023-07-21 07:34:22'),
('28331260329852933', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28331260329852933/', 1, '2023-07-23 04:04:30'),
('28331260329852934', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28331260329852934/', 1, '2023-07-24 04:20:51'),
('28331260329852935', '232323232323', 'RaKeSh Sharma', '1982-07-26', 'userpersistent/kyc/aadhar_card/28331260329852935/', 2, '2023-07-25 11:14:34'),
('28378932604567552', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28378932604567552/', 1, '2023-08-21 09:03:42'),
('28423899972632576', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28423899972632576/', 1, '2023-09-29 05:33:42'),
('28423899972632577', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28423899972632577/', 1, '2023-09-29 05:34:37'),
('28511039507136512', NULL, NULL, NULL, 'userpersistent/kyc/aadhar_card/28511039507136512/', 1, '2023-11-14 10:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_kyc_pancard`
--

CREATE TABLE `t_user_kyc_pancard` (
  `user_id` varchar(45) NOT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `url` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_kyc_pancard`
--

INSERT INTO `t_user_kyc_pancard` (`user_id`, `card_number`, `fullname`, `birth`, `url`, `status`, `createdon`) VALUES
('28331260329852929', NULL, NULL, NULL, 'userpersistent/kyc/pan/28331260329852929/', 1, '2023-07-13 10:03:05'),
('28331260329852930', NULL, NULL, NULL, 'userpersistent/kyc/pan/28331260329852930/', 1, '2023-07-13 17:31:33'),
('28331260329852931', NULL, NULL, NULL, 'userpersistent/kyc/pan/28331260329852931/', 1, '2023-07-14 07:12:30'),
('28331260329852932', NULL, NULL, NULL, 'userpersistent/kyc/pan/28331260329852932/', 1, '2023-07-21 07:34:22'),
('28331260329852933', NULL, NULL, NULL, 'userpersistent/kyc/pan/28331260329852933/', 1, '2023-07-23 04:04:30'),
('28331260329852934', NULL, NULL, NULL, 'userpersistent/kyc/pan/28331260329852934/', 1, '2023-07-24 04:20:51'),
('28331260329852935', NULL, NULL, NULL, 'userpersistent/kyc/pan/28331260329852935/', 1, '2023-07-25 11:14:34'),
('28378932604567552', NULL, NULL, NULL, 'userpersistent/kyc/pan/28378932604567552/', 1, '2023-08-21 09:03:42'),
('28423899972632576', NULL, NULL, NULL, 'userpersistent/kyc/pan/28423899972632576/', 1, '2023-09-29 05:33:42'),
('28423899972632577', NULL, NULL, NULL, 'userpersistent/kyc/pan/28423899972632577/', 1, '2023-09-29 05:34:37'),
('28511039507136512', NULL, NULL, NULL, 'userpersistent/kyc/pan/28511039507136512/', 1, '2023-11-14 10:10:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lst_kyc_varified_state_type`
--
ALTER TABLE `lst_kyc_varified_state_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label_UNIQUE` (`label`);

--
-- Indexes for table `t_user_kyc_aadharcard`
--
ALTER TABLE `t_user_kyc_aadharcard`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `t_user_kyc_pancard`
--
ALTER TABLE `t_user_kyc_pancard`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lst_kyc_varified_state_type`
--
ALTER TABLE `lst_kyc_varified_state_type`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `db_match`
--
CREATE DATABASE IF NOT EXISTS `db_match` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_match`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_match_state`
--

CREATE TABLE `lst_match_state` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_match_state`
--

INSERT INTO `lst_match_state` (`id`, `label`, `createdon`) VALUES
(1, 'CREATED', '2023-04-20 10:52:32'),
(2, 'LIVE', '2023-04-20 10:52:32'),
(3, 'CONCLUDED', '2023-04-20 10:52:32'),
(4, 'ERROR', '2023-04-20 10:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `lst_player_state`
--

CREATE TABLE `lst_player_state` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_player_state`
--

INSERT INTO `lst_player_state` (`id`, `label`, `createdon`) VALUES
(1, 'INLOBBY', '2022-10-19 07:32:10'),
(2, 'PLAYING', '2022-10-19 07:32:10'),
(3, 'LEAVED', '2022-10-19 07:32:10'),
(4, 'DISCONNECTED', '2022-10-19 07:32:10'),
(5, 'CONCLUDED', '2022-11-26 19:39:03'),
(6, 'ERROR', '2022-11-30 12:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `lst_tournament_listing`
--

CREATE TABLE `lst_tournament_listing` (
  `id` varchar(45) NOT NULL,
  `tournament_type_id` tinyint(4) NOT NULL,
  `game_type_id` tinyint(3) UNSIGNED NOT NULL,
  `max_players` tinyint(3) UNSIGNED NOT NULL,
  `max_winners` tinyint(3) UNSIGNED NOT NULL,
  `entry_fee` float NOT NULL DEFAULT '0',
  `price_pool` float NOT NULL DEFAULT '0',
  `shareschema` varchar(60) NOT NULL,
  `note` varchar(500) NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expireson` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_tournament_listing`
--

INSERT INTO `lst_tournament_listing` (`id`, `tournament_type_id`, `game_type_id`, `max_players`, `max_winners`, `entry_fee`, `price_pool`, `shareschema`, `note`, `is_active`, `createdon`, `expireson`) VALUES
('2145d281-72f3-11ed-ae91-9ff6f3df82ef', 1, 3, 6, 1, 0, 0, '85,0', 'Maintain a good internet connection.', b'1', '2022-12-03 18:43:27', NULL),
('32db5567-72c2-11ed-ae91-9ff6f3df82ef', 1, 1, 4, 3, 1, 4, '65,25,15,0', 'Maintain a good internet connection.\nAn unstable connection can lead to disqualification', b'1', '2022-12-03 12:53:12', '2022-12-03 12:53:12'),
('4f98cd37-72c7-11ed-ae91-9ff6f3df82ef', 1, 2, 2, 1, 1, 2, '85,0', 'Maintain a good internet connection.', b'1', '2022-12-03 13:29:47', NULL),
('bc68cafa-72f2-11ed-ae91-9ff6f3df82ef', 1, 1, 4, 3, 0, 0, '65,25,15,0', 'Maintain a good internet connection.', b'1', '2022-12-03 18:40:38', NULL),
('bc68cd0d-72f2-11ed-ae91-9ff6f3df82ef', 1, 2, 2, 1, 0, 0, '85,0', 'Maintain a good internet connection.', b'1', '2022-12-03 18:40:38', NULL),
('bee41dba-72c7-11ed-ae91-9ff6f3df82ef', 1, 1, 2, 1, 1, 2, '85,0', 'Maintain a good internet connection.', b'1', '2022-12-03 13:32:54', NULL),
('d2e995fb-72c7-11ed-ae91-9ff6f3df82ef', 1, 3, 6, 1, 1, 6, '85,0', 'Price can change depends on (entry fee x participants)', b'1', '2022-12-03 13:33:28', NULL),
('fb810054-72f2-11ed-ae91-9ff6f3df82ef', 1, 1, 2, 1, 0, 0, '85,0', 'Maintain a good internet connection.', b'1', '2022-12-03 18:42:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lst_tournament_type`
--

CREATE TABLE `lst_tournament_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lst_tournament_type`
--

INSERT INTO `lst_tournament_type` (`id`, `label`, `createdon`) VALUES
(0, 'BRONZE', '2022-12-03 12:30:24'),
(0, 'SILVER', '2022-12-03 12:30:24'),
(0, 'GOLD', '2022-12-03 12:30:24'),
(0, 'BRONZE', '2022-12-03 12:30:57'),
(0, 'SILVER', '2022-12-03 12:30:57'),
(0, 'GOLD', '2022-12-03 12:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `t_live_matches`
--

CREATE TABLE `t_live_matches` (
  `room_id` varchar(45) NOT NULL,
  `tournament_id` varchar(45) NOT NULL,
  `gamecode` varchar(20) NOT NULL,
  `match_state` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endon` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_live_matches`
--

INSERT INTO `t_live_matches` (`room_id`, `tournament_id`, `gamecode`, `match_state`, `createdon`, `endon`) VALUES
('28fcb69f-f983-4d6b-a0e6-21363194c3c0', 'fb810054-72f2-11ed-ae91-9ff6f3df82ef', 'LD01', 'LIVE', '2023-07-24 04:42:39', '2023-07-24 04:52:39'),
('2e581e23-1ca4-4ee7-b80b-8145e308fe71', '2145d281-72f3-11ed-ae91-9ff6f3df82ef', 'RY01', 'CREATED', '2023-11-26 07:13:10', NULL),
('5ad96cc6-8cc1-4058-9435-95780b2831d8', 'bc68cafa-72f2-11ed-ae91-9ff6f3df82ef', 'LD01', 'CREATED', '2023-07-24 19:30:43', NULL),
('82aeafb7-1fa7-423d-9038-587dcb2164ea', 'bc68cd0d-72f2-11ed-ae91-9ff6f3df82ef', 'CR01', 'CREATED', '2023-11-14 10:10:20', NULL),
('ce9541cb-282b-4309-a0cb-4289759c8189', 'fb810054-72f2-11ed-ae91-9ff6f3df82ef', 'LD01', 'LIVE', '2023-07-24 04:42:39', '2023-07-24 04:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `t_live_players_in_match`
--

CREATE TABLE `t_live_players_in_match` (
  `userid` varchar(45) NOT NULL,
  `room_id` varchar(45) NOT NULL,
  `player_state` varchar(20) NOT NULL,
  `score` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `wonamount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `joinon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `leavedon` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_live_players_in_match`
--

INSERT INTO `t_live_players_in_match` (`userid`, `room_id`, `player_state`, `score`, `wonamount`, `joinon`, `leavedon`) VALUES
('28331260329852930', '5ad96cc6-8cc1-4058-9435-95780b2831d8', 'INLOBBY', 0, 0.00, '2023-07-24 19:30:43', NULL),
('28331260329852933', 'ce9541cb-282b-4309-a0cb-4289759c8189', 'CONCLUDED', 0, 0.00, '2023-07-24 04:42:29', '2023-07-24 04:43:06'),
('28331260329852934', 'ce9541cb-282b-4309-a0cb-4289759c8189', 'CONCLUDED', 15, 0.00, '2023-07-24 04:42:27', '2023-07-24 04:43:06'),
('28511039507136512', '2e581e23-1ca4-4ee7-b80b-8145e308fe71', 'INLOBBY', 0, 0.00, '2023-11-26 07:13:10', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_get_all_tournaments`
-- (See below for the actual view)
--
CREATE TABLE `vw_get_all_tournaments` (
`tourid` varchar(45)
,`tourtype` varchar(45)
,`gametype` varchar(20)
,`gamecode` varchar(5)
,`maxplayers` tinyint(3) unsigned
,`maxwinners` tinyint(3) unsigned
,`entryfee` float
,`pricepool` float
,`share` varchar(60)
,`note` varchar(500)
,`isactive` bit(1)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_get_all_tournaments`
--
DROP TABLE IF EXISTS `vw_get_all_tournaments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_get_all_tournaments`  AS SELECT `lst_tournament_listing`.`id` AS `tourid`, `lst_tournament_type`.`label` AS `tourtype`, `db_app`.`lst_games_type`.`label` AS `gametype`, `db_app`.`lst_games_type`.`code` AS `gamecode`, `lst_tournament_listing`.`max_players` AS `maxplayers`, `lst_tournament_listing`.`max_winners` AS `maxwinners`, `lst_tournament_listing`.`entry_fee` AS `entryfee`, `lst_tournament_listing`.`price_pool` AS `pricepool`, `lst_tournament_listing`.`shareschema` AS `share`, `lst_tournament_listing`.`note` AS `note`, `lst_tournament_listing`.`is_active` AS `isactive` FROM ((`lst_tournament_listing` left join `lst_tournament_type` on((`lst_tournament_listing`.`tournament_type_id` = `lst_tournament_type`.`id`))) join `db_app`.`lst_games_type` on((`lst_tournament_listing`.`game_type_id` = `db_app`.`lst_games_type`.`id`))) ORDER BY `lst_tournament_listing`.`entry_fee` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lst_match_state`
--
ALTER TABLE `lst_match_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label_UNIQUE` (`label`);

--
-- Indexes for table `lst_player_state`
--
ALTER TABLE `lst_player_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label_UNIQUE` (`label`);

--
-- Indexes for table `lst_tournament_listing`
--
ALTER TABLE `lst_tournament_listing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_live_matches`
--
ALTER TABLE `t_live_matches`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `t_live_players_in_match`
--
ALTER TABLE `t_live_players_in_match`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lst_match_state`
--
ALTER TABLE `lst_match_state`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lst_player_state`
--
ALTER TABLE `lst_player_state`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `db_pg_phonepay`
--
CREATE DATABASE IF NOT EXISTS `db_pg_phonepay` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_pg_phonepay`;

-- --------------------------------------------------------

--
-- Table structure for table `t_instrument_card`
--

CREATE TABLE `t_instrument_card` (
  `transactionid` varchar(30) NOT NULL,
  `cardtype` varchar(20) NOT NULL,
  `pg_transactionid` varchar(30) DEFAULT NULL,
  `bank_transactionid` varchar(30) DEFAULT NULL,
  `pg_authorizationcode` varchar(20) DEFAULT NULL,
  `arn` varchar(20) DEFAULT NULL,
  `bankid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_instrument_card`
--

INSERT INTO `t_instrument_card` (`transactionid`, `cardtype`, `pg_transactionid`, `bank_transactionid`, `pg_authorizationcode`, `arn`, `bankid`) VALUES
('T2308050807226823685526', 'CREDIT_CARD', 'PG2207221432267522530776', NULL, NULL, NULL, 'null');

-- --------------------------------------------------------

--
-- Table structure for table `t_instrument_netbanking`
--

CREATE TABLE `t_instrument_netbanking` (
  `transactionid` varchar(30) NOT NULL,
  `pg_transactionid` varchar(30) DEFAULT NULL,
  `pg_service_transactionid` varchar(30) DEFAULT NULL,
  `bank_transactionid` varchar(30) DEFAULT NULL,
  `bankid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_instrument_netbanking`
--

INSERT INTO `t_instrument_netbanking` (`transactionid`, `pg_transactionid`, `pg_service_transactionid`, `bank_transactionid`, `bankid`) VALUES
('T2309291119572406312788', '1995464773', 'PG2212291607083344934300', NULL, ''),
('T2309291123098976312723', '1995464773', 'PG2212291607083344934300', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_instrument_upi`
--

CREATE TABLE `t_instrument_upi` (
  `transactionid` varchar(30) NOT NULL,
  `utr` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_payment_details`
--

CREATE TABLE `t_payment_details` (
  `payment_status` varchar(45) NOT NULL,
  `Order_id` varchar(45) NOT NULL,
  `Transaction_id` varchar(45) NOT NULL,
  `Amount` int(45) NOT NULL,
  `Instrument_type` varchar(45) DEFAULT NULL,
  `Jdata` varchar(999) NOT NULL,
  `Created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_payment_details`
--

INSERT INTO `t_payment_details` (`payment_status`, `Order_id`, `Transaction_id`, `Amount`, `Instrument_type`, `Jdata`, `Created_on`) VALUES
('PAYMENT_SUCCESS', 'PB1691203042170', 'T2308050807226823685526', 10, 'CARD', '{\"success\":true,\"code\":\"PAYMENT_SUCCESS\",\"message\":\"Your payment is successful.\",\"data\":{\"merchantId\":\"PLAYBEEUAT\",\"merchantTransactionId\":\"PB1691203042170\",\"transactionId\":\"T2308050807226823685526\",\"amount\":1000,\"state\":\"COMPLETED\",\"responseCode\":\"SUCCESS\",\"paymentInstrument\":{\"type\":\"CARD\",\"cardType\":\"CREDIT_CARD\",\"pgTransactionId\":\"PG2207221432267522530776\",\"bankTransactionId\":null,\"pgAuthorizationCode\":null,\"arn\":null,\"bankId\":\"null\",\"brn\":\"B12345\"}}}', '2023-08-05 15:07:41'),
('PAYMENT_SUCCESS', 'PB1691206207894', 'T2308050900084543685230', 10, 'CARD', '{\"success\":true,\"code\":\"PAYMENT_SUCCESS\",\"message\":\"Your payment is successful.\",\"data\":{\"merchantId\":\"PLAYBEEUAT\",\"merchantTransactionId\":\"PB1691206207894\",\"transactionId\":\"T2308050900084543685230\",\"amount\":1000,\"state\":\"COMPLETED\",\"responseCode\":\"SUCCESS\",\"paymentInstrument\":{\"type\":\"CARD\",\"cardType\":\"CREDIT_CARD\",\"pgTransactionId\":\"PG2207221432267522530776\",\"bankTransactionId\":null,\"pgAuthorizationCode\":null,\"arn\":null,\"bankId\":\"null\",\"brn\":\"B12345\"}}}', '2023-08-05 16:00:26'),
('PAYMENT_SUCCESS', 'PB1691207487729', 'T2308050921280613685222', 10, 'CARD', '{\"success\":true,\"code\":\"PAYMENT_SUCCESS\",\"message\":\"Your payment is successful.\",\"data\":{\"merchantId\":\"PLAYBEEUAT\",\"merchantTransactionId\":\"PB1691207487729\",\"transactionId\":\"T2308050921280613685222\",\"amount\":1000,\"state\":\"COMPLETED\",\"responseCode\":\"SUCCESS\",\"paymentInstrument\":{\"type\":\"CARD\",\"cardType\":\"CREDIT_CARD\",\"pgTransactionId\":\"PG2207221432267522530776\",\"bankTransactionId\":null,\"pgAuthorizationCode\":null,\"arn\":null,\"bankId\":\"null\",\"brn\":\"B12345\"}}}', '2023-08-05 16:22:09'),
('PAYMENT_SUCCESS', 'PB1691207987173', 'T2308050929475003685972', 10, 'CARD', '{\"success\":true,\"code\":\"PAYMENT_SUCCESS\",\"message\":\"Your payment is successful.\",\"data\":{\"merchantId\":\"PLAYBEEUAT\",\"merchantTransactionId\":\"PB1691207987173\",\"transactionId\":\"T2308050929475003685972\",\"amount\":1000,\"state\":\"COMPLETED\",\"responseCode\":\"SUCCESS\",\"paymentInstrument\":{\"type\":\"CARD\",\"cardType\":\"CREDIT_CARD\",\"pgTransactionId\":\"PG2207221432267522530776\",\"bankTransactionId\":null,\"pgAuthorizationCode\":null,\"arn\":null,\"bankId\":\"null\",\"brn\":\"B12345\"}}}', '2023-08-05 16:30:04'),
('PAYMENT_SUCCESS', 'PB1695966596799', 'T2309291119572406312788', 25, 'NETBANKING', '{\"success\":true,\"code\":\"PAYMENT_SUCCESS\",\"message\":\"Your payment is successful.\",\"data\":{\"merchantId\":\"PLAYBEEUAT\",\"merchantTransactionId\":\"PB1695966596799\",\"transactionId\":\"T2309291119572406312788\",\"amount\":2500,\"state\":\"COMPLETED\",\"responseCode\":\"SUCCESS\",\"paymentInstrument\":{\"type\":\"NETBANKING\",\"pgTransactionId\":\"1995464773\",\"pgServiceTransactionId\":\"PG2212291607083344934300\",\"bankTransactionId\":null,\"bankId\":\"\"}}}', '2023-09-29 18:21:41'),
('PAYMENT_SUCCESS', 'PB1695966789471', 'T2309291123098976312723', 10, 'NETBANKING', '{\"success\":true,\"code\":\"PAYMENT_SUCCESS\",\"message\":\"Your payment is successful.\",\"data\":{\"merchantId\":\"PLAYBEEUAT\",\"merchantTransactionId\":\"PB1695966789471\",\"transactionId\":\"T2309291123098976312723\",\"amount\":1000,\"state\":\"COMPLETED\",\"responseCode\":\"SUCCESS\",\"paymentInstrument\":{\"type\":\"NETBANKING\",\"pgTransactionId\":\"1995464773\",\"pgServiceTransactionId\":\"PG2212291607083344934300\",\"bankTransactionId\":null,\"bankId\":\"\"}}}', '2023-09-29 18:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `t_response_data`
--

CREATE TABLE `t_response_data` (
  `transectionid` varchar(30) DEFAULT NULL,
  `transectionstatus` varchar(20) NOT NULL,
  `orderid` varchar(20) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `paymentstatus` varchar(20) DEFAULT NULL,
  `instrument_type` varchar(20) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_instrument_card`
--
ALTER TABLE `t_instrument_card`
  ADD PRIMARY KEY (`transactionid`);

--
-- Indexes for table `t_instrument_netbanking`
--
ALTER TABLE `t_instrument_netbanking`
  ADD PRIMARY KEY (`transactionid`);

--
-- Indexes for table `t_instrument_upi`
--
ALTER TABLE `t_instrument_upi`
  ADD PRIMARY KEY (`transactionid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
