CREATE DATABASE IF NOT EXISTS `db_enduser`;
CREATE DATABASE IF NOT EXISTS `db_enduser_complaint`;
CREATE DATABASE IF NOT EXISTS `db_history_activity`;
CREATE DATABASE IF NOT EXISTS `db_kyc`;
CREATE DATABASE IF NOT EXISTS `db_match`;
CREATE DATABASE IF NOT EXISTS `db_pg_phonepay`;
CREATE DATABASE IF NOT EXISTS `db_bounty`;
CREATE DATABASE IF NOT EXISTS `db_app`;
USE `db_app`;


CREATE TABLE `lst_games_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(20) NOT NULL,
  `code` varchar(5) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `lst_games_type` (`id`, `label`, `code`, `createdon`) VALUES
(2, 'CARROM ARENA', 'CR01', '2022-12-03 13:21:09'),
(1, 'LUDO SUPREME', 'LD01', '2022-12-03 13:21:09'),
(3, 'RUMMY POINT', 'RY01', '2022-12-03 13:21:09');


CREATE TABLE `lst_server_state` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `lst_server_state` (`id`, `label`, `createdon`) VALUES
(1, 'ONLINE', '2022-12-02 19:23:54'),
(2, 'OFFLINE', '2022-12-02 19:23:54'),
(3, 'MAINTENANCE', '2022-12-02 19:24:46');

CREATE TABLE `lst_vip_pack_list` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `period_days` smallint(6) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `hashkey` varchar(100) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO `lst_vip_pack_list` (`id`, `label`, `period_days`, `amount`, `hashkey`, `createdon`) VALUES
(1, '1 MONTH', 30, 199.00, '2', '2022-10-12 08:36:00'),
(2, '3 MONTH', 90, 499.00, '3', '2022-10-12 08:36:00'),
(3, '6 MONTH', 180, 999.00, '4', '2022-10-12 08:36:00'),
(4, '1 YEAR', 365, 1499.00, '5', '2022-10-12 08:36:00');

CREATE TABLE `t_refferal_reedem` (
  `userid` varchar(45) NOT NULL,
  `refferalfrom` varchar(12) NOT NULL,
  `createdon` timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `t_register_devices` (
  `device_id` varchar(45) NOT NULL,
  `token` varchar(45) DEFAULT NULL,
  `dtype` varchar(20) NOT NULL,
  `model` varchar(100) NOT NULL,
  `imei` varchar(45) DEFAULT NULL,
  `srno` varchar(45) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `t_sever_info` (
  `platform_key` varchar(45) NOT NULL,
  `server_state` tinyint(4) NOT NULL,
  `version` varchar(10) NOT NULL,
  `update_url` text NOT NULL,
  `maintainence_message` text,
  `maintainence_scheduledon` varchar(45) DEFAULT NULL,
  `maintainence_expireson` varchar(45) DEFAULT NULL,
  `modifiedon` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `t_sever_info` (`platform_key`, `server_state`, `version`, `update_url`, `maintainence_message`, `maintainence_scheduledon`, `maintainence_expireson`, `modifiedon`) VALUES
('09721ab88e0a552087391be1ef0c6826', 1, '2.0.0', 'bhdsbfsdv', NULL, NULL, NULL, '2023-07-01 05:26:55');

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lst_vip_pack_list`
--
ALTER TABLE `lst_vip_pack_list`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `db_bounty`
--
USE `db_bounty`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_bounty_value_type`
--

CREATE TABLE `lst_bounty_value_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `amount` smallint(6) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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
);

-- --------------------------------------------------------

--
-- Table structure for table `t_live_players_in_bounty`
--

CREATE TABLE `t_live_players_in_bounty` (
  `room_id` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `target` varchar(100) NOT NULL,
  `joinon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `db_enduser`
--
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
);

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
);

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
);

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
);

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
);

-- --------------------------------------------------------

--
-- Table structure for table `t_wallets`
--

CREATE TABLE `t_wallets` (
  `userid` varchar(45) NOT NULL,
  `deposit_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `bonus_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `winning_amount` decimal(8,2) NOT NULL DEFAULT '0.00'
);

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
);

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

CREATE VIEW `vw_user_profile`  AS SELECT `t_user_acc`.`id` AS `id`, `t_user_acc`.`phone_number` AS `phone_number`, `t_user_acc`.`authtoken` AS `authtoken`, `t_user_acc`.`game_name` AS `game_name`, `t_user_acc`.`emailid` AS `emailid`, `t_user_acc`.`avatar_name` AS `avatar_name`, `t_user_acc`.`dp_image_url` AS `dp_image_url`, `t_wallets`.`bonus_amount` AS `bonus_amount`, `t_wallets`.`deposit_amount` AS `deposit_amount`, `t_wallets`.`winning_amount` AS `winning_amount`, `t_user_acc`.`isblocked` AS `isblocked`, `t_user_acc`.`referalcode` AS `referalcode`, `t_user_acc`.`createdon` AS `createdon` FROM (`t_user_acc` join `t_wallets` on((`t_user_acc`.`id` = `t_wallets`.`userid`))) ;

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
);

--
-- Dumping data for table `lst_issue_list`
--


-- --------------------------------------------------------

--
-- Table structure for table `lst_issue_status`
--

CREATE TABLE `lst_issue_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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
);

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
);

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

CREATE VIEW `vw_get_all_issue_entities`  AS SELECT `lst_issue_list`.`id` AS `id`, `lst_issue_type`.`label` AS `topic`, `lst_issue_list`.`topic` AS `subtopic`, `lst_issue_list`.`description` AS `description` FROM (`lst_issue_list` join `lst_issue_type` on((`lst_issue_list`.`issue_type_id` = `lst_issue_type`.`id`))) ORDER BY `lst_issue_type`.`label` ASC ;

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
);

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
  `match_endon` timestamp NOT NULL 
);

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
);
--
-- Database: `db_kyc`
--
USE `db_kyc`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_kyc_varified_state_type`
--

CREATE TABLE `lst_kyc_varified_state_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(20) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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
);

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
);

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `db_match`
--
USE `db_match`;

-- --------------------------------------------------------

--
-- Table structure for table `lst_match_state`
--

CREATE TABLE `lst_match_state` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(45) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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
);

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
);

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
);

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
);

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
);

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

CREATE VIEW `vw_get_all_tournaments`  AS SELECT `lst_tournament_listing`.`id` AS `tourid`, `lst_tournament_type`.`label` AS `tourtype`, `db_app`.`lst_games_type`.`label` AS `gametype`, `db_app`.`lst_games_type`.`code` AS `gamecode`, `lst_tournament_listing`.`max_players` AS `maxplayers`, `lst_tournament_listing`.`max_winners` AS `maxwinners`, `lst_tournament_listing`.`entry_fee` AS `entryfee`, `lst_tournament_listing`.`price_pool` AS `pricepool`, `lst_tournament_listing`.`shareschema` AS `share`, `lst_tournament_listing`.`note` AS `note`, `lst_tournament_listing`.`is_active` AS `isactive` FROM ((`lst_tournament_listing` left join `lst_tournament_type` on((`lst_tournament_listing`.`tournament_type_id` = `lst_tournament_type`.`id`))) join `db_app`.`lst_games_type` on((`lst_tournament_listing`.`game_type_id` = `db_app`.`lst_games_type`.`id`))) ORDER BY `lst_tournament_listing`.`entry_fee` ASC ;

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lst_player_state`
--
ALTER TABLE `lst_player_state`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `db_pg_phonepay`
--
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
);

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
);

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
);

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
);

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
);

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






-- Store Procedures--------------------------------







CREATE DATABASE IF NOT EXISTS `db_kyc` ;
USE `db_kyc`;


DELIMITER ;;
CREATE PROCEDURE `sp_create_user_kyc_entries`(
IN `uid` VARCHAR(45)
)
Begin
if((select count(*) from `db_kyc`.`t_user_kyc_aadharcard` where `user_id` = uid) = 0)then
begin
	INSERT INTO `db_kyc`.`t_user_kyc_aadharcard`(`user_id`,`url`)
	VALUES(uid,concat('userpersistent/kyc/aadhar_card/',uid,'/'));
	set @stat = 'success';
	select @stat as stat;
end;
end if;

if((select count(*) from `db_kyc`.`t_user_kyc_pancard` where  `user_id` = uid)=0)then
begin
	INSERT INTO `db_kyc`.`t_user_kyc_pancard`(`user_id`,`url`)
	VALUES (uid,concat('userpersistent/kyc/pan/',uid,'/'));
	set @stat = 'success';
	select @stat as stat;
end;
end if;
End ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_user_kyc_status`(
IN `uid` VARCHAR(45)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
	set @pan_status = (SELECT `status` as aadharstatus FROM `db_kyc`.`t_user_kyc_pancard` where `user_id` = uid);
	set @aadhar_status = (SELECT `status` as panstatus FROM `db_kyc`.`t_user_kyc_aadharcard` where `user_id` = uid);


	set @stat = 'success';
	select @stat as stat, @pan_status as `pan_status`, @aadhar_status as `aadhar_status`;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_update_user_kyc`(
IN `uid` VARCHAR(45), 
IN `kycfor` VARCHAR(10), 
IN `cnum` VARCHAR(20), 
IN `fnm` VARCHAR(100), 
IN `dob` VARCHAR(20)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
	if(kycfor = 'aadhar')Then
	begin
		if ((select count(*) from `db_kyc`.`t_user_kyc_aadharcard` where `user_id` = uid)>0)then
		begin
			UPDATE `db_kyc`.`t_user_kyc_aadharcard`
			SET `card_number` = cnum,
			`fullname` = fnm,
			`birth` = (select STR_TO_DATE(dob,'%d/%m/%Y')),
			`status` = (SELECT `id` FROM `db_kyc`.`lst_kyc_varified_state_type` where `id`= 2)
			WHERE `user_id` = uid;
			set @stat= 'success';
			select @stat as stat, kycfor;
		end;
		else
		begin
			set @stat= 'failed';
			select @stat as stat, kycfor;
		end;
		end if;
	end;
	end if;

	if(kycfor = 'pan')Then
	begin
		if ((select count(*) from `db_kyc`.`t_user_kyc_pancard` where `user_id` = uid)>0)then
		begin
			UPDATE `db_kyc`.`t_user_kyc_pancard`
			SET `card_number` = cnum,
			`fullname` = fnm,
			`birth` = (select STR_TO_DATE(dob,'%d/%m/%Y')),
			`status` =(SELECT `id` FROM `db_kyc`.`lst_kyc_varified_state_type` where `id`= 2)
			WHERE `user_id` = uid;
			set @stat= 'success';
			select @stat as stat, kycfor;
		end;
		else
		begin
			set @stat= 'failed';
			select @stat as stat, kycfor;
		end;
		end if;
	end;
	end if;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;




CREATE DATABASE  IF NOT EXISTS `db_match` ;
USE `db_match`;

DROP TABLE IF EXISTS `vw_get_all_tournaments`;

SET @saved_cs_client     = @@character_set_client;

SET character_set_client = @saved_cs_client;

DELIMITER ;;
CREATE PROCEDURE `sp_add_created_match`(
IN `uid` VARCHAR(45), 
IN `roomid` VARCHAR(45), 
IN `tourid` VARCHAR(45), 
IN `gamecode` VARCHAR(20)
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((SELECT count(*) FROM `db_app`.`lst_games_type` where `code` = gamecode) = 0)THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((select count(*) FROM `db_match`.`t_live_matches` where `room_id`= roomid) > 0 )THEN
begin
	set @stat = 'exists';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

set @isActive = '';
set @expireson = '';

SELECT `is_active`, `expireson` FROM `db_match`.`lst_tournament_listing` where `id` = tourid into @isActive, @expireson;

if(@isActive = 0)Then
BEGIN
	set @stat ='inactive';
	select @stat as `stat` ;
	leave lbl_begin;
End;
End if;

set @matchstat = (SELECT `label`FROM `db_match`.`lst_match_state` where `id` = 1);
set @playerstat = (SELECT `label`FROM `db_match`.`lst_player_state` where `id` = 1);


case
when gamecode = 'LD01' OR gamecode = 'CR01' then
	INSERT INTO `db_match`.`t_live_matches`
	(`room_id`,`tournament_id`,`gamecode`,`match_state`)VALUES
	(roomid,tourid, gamecode, @matchstat);
when gamecode = 'RY01' then
	INSERT INTO `db_match`.`t_live_matches`
	(`room_id`,`tournament_id`,`gamecode`,`match_state`)VALUES
	(roomid,tourid, gamecode, @matchstat);
end case;

set @stat = 'success';
select @stat as stat;
end ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_add_participants_in_match`(
IN `uid` VARCHAR(45), 
IN `roomid` VARCHAR(45), 
IN `tourid` VARCHAR(45)
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((select count(*) FROM `db_match`.`t_live_matches` where `room_id`= roomid) = 0)THEN
BEGIN
	set @stat = 'failedsql';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

DELETE FROM `db_match`.`t_live_players_in_match` WHERE `userid` = uid ;

set @playerstat = (select `label` from `db_match`.`lst_player_state` where `id` =1);
INSERT INTO `db_match`.`t_live_players_in_match`
(`userid`,`room_id`,`player_state`)
VALUES(uid, roomid, @playerstat);

set @stat = 'success';
select @stat as `stat`, @playerstat as `player_state`;
End ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_change_match_state`(
IN `uid` VARCHAR(45), 
IN `roomid` VARCHAR(45), 
IN `gamecode` VARCHAR(20), 
IN `matchstat` VARCHAR(20)
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) =0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

if ((select count(*) FROM `db_match`.`t_live_players_in_match` where `userid`= uid AND `room_id` = roomid) = 0 OR
(SELECT count(*) FROM `db_match`.`t_live_matches` where  `room_id` = roomid AND `gamecode` = gamecode) = 0) THEN
BEGIN
	set @stat = 'failed1';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

set @curmatchstatid = (select `id` from `db_match`.`lst_match_state` where `label`= (select `match_state` FROM `db_match`.`t_live_matches` where `room_id` = roomid));
set @newmatchstatid = (select `id` from `db_match`.`lst_match_state` where `label`= matchstat);

if ((select count(*) from `db_match`.`lst_match_state` where `label`= matchstat) = 0 ) THEN
BEGIN
	set @stat = 'failed2';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

if (@newmatchstatid < @curmatchstatid) THEN
BEGIN
	set @stat = 'failed3';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;


if(matchstat = 'LIVE' AND (select `match_state` from  `db_match`.`t_live_matches` where  `room_id` = roomid AND `gamecode` = gamecode) = 'CREATED')THEN
BEGIN
	set @now = now(3);
	set @endon =  timestampadd(minute, 10, NOW(3));

	case
		when gamecode = 'LD01' OR gamecode = 'CR01' then
			UPDATE `db_match`.`t_live_matches`
			SET `match_state` = matchstat, `createdon` = @now, `endon` = @endon
			WHERE `room_id` = room_id;
		when gamecode = 'RY01' then
			UPDATE `db_match`.`t_live_matches`
			SET `match_state` = matchstat, `createdon` = @now
			WHERE `room_id` = room_id;
	end case;

	UPDATE `db_match`.`t_live_players_in_match`
	SET `player_state` = 'PLAYING'
	WHERE `room_id` = roomid AND `player_state` = 'INLOBBY';

	set @endon =  '';
	set @lefttime = (select TIMESTAMPDIFF(second,@now,@endon)-TIMESTAMPDIFF(second,@now,@endon)*60 AS second);

	set @stat = 'success';
	SELECT @stat as `stat`,matchstat, @lefttime as `timeleft` FROM `db_match`.`t_live_matches` where `room_id` = roomid;

END;
END IF;


if(matchstat = 'CONCLUDED' AND (select `match_state` from  `db_match`.`t_live_matches` where  `room_id` = roomid AND `gamecode` = gamecode) = 'LIVE')THEN
BEGIN
	UPDATE `db_match`.`t_live_players_in_match`
	SET `player_state` = 'CONCLUDED' , `leavedon` = CURRENT_TIMESTAMP()
	WHERE `room_id` = roomid AND `player_state` = 'PLAYING';
	set @stat = 'distribute';
	select @stat as `stat`, matchstat;
END;
else
BEGIN
	set @stat = 'success';
	select @stat as `stat`, matchstat;
END;
END IF;

if(matchstat = 'ERROR')THEN
BEGIN
	UPDATE `db_match`.`t_live_matches`
	SET `match_state` = matchstat
	WHERE `room_id` = room_id;

    UPDATE `db_match`.`t_live_players_in_match`
	SET `player_state` ='ERROR'WHERE `room_id` =roomid;
END;
END IF;

End ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_create_new_tournament`(
IN `typeid` TINYINT, 
IN `gtypeid` TINYINT, 
IN `maxplayers` TINYINT,
IN `maxwinners` TINYINT,
IN `entryfee` FLOAT, 
IN `shareschema` VARCHAR(20), 
IN `note` TEXT
 )
if ((select count(*) from `db_match`.`lst_tournament_listing` where `tournament_type_id` = typeid AND `game_type_id` = gtypeid AND
`max_players` = maxplayers AND `max_winners` =maxwinners AND`entry_fee` = entryfee) = 0) THEN
Begin
  INSERT INTO `db_match`.`lst_tournament_listing` (`id`, `tournament_type_id`, `game_type_id`, `max_players`, `max_winners`, `entry_fee`, `price_pool`, `shareschema`, `note`) VALUES
  ((uuid()), typeid,gtypeid, maxplayers, maxwinners, entryfee, 0, shareschema, note);
set @stat = 'success';
SELECT @stat as stat;
end;
else
Begin
	set @stat = 'failed';
	SELECT @stat as stat;
End;

End if ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `sp_distribute_pricepool`(
IN `uid` VARCHAR(45), 
IN `roomid` VARCHAR(45), 
IN `wonamount` FLOAT, 
IN `position` TINYINT
)
lbl_begin:Begin
if((select count(*) FROM `db_match`.`t_live_matches` where `room_id`= roomid) = 0)THEN
BEGIN
	set @stat = 'failed';
	select @stat as stat ;
	leave lbl_begin;
END;
END IF;

if((select count(*) FROM `db_match`.`t_live_players_in_match` where `room_id`= roomid) = 0)THEN
BEGIN
	set @stat = 'failed';
	select @stat as stat ;
	leave lbl_begin;
END;
END IF;

if((select `isblocked` FROM `db_enduser`.`t_user_acc` where `id`= uid) = 1)THEN
BEGIN
	set @stat = 'blocked';
	select @stat as stat ;
	leave lbl_begin;
END;
END IF;

UPDATE `db_enduser`.`t_wallets`
SET	 `winning_amount` = wonamount
WHERE `userid` = uid;

DELETE FROM `db_match`.`t_live_matches`
WHERE `room_id` = roomid;

DELETE FROM `db_match`.`t_live_players_in_match`
WHERE `room_id` = roomid;

DELETE FROM `db_bounty`.`t_live_bounty`
WHERE `roomid` = roomid;

DELETE FROM `db_bounty`.`t_live_players_in_bounty`
WHERE `room_id` = roomid;



set @stat = 'success';
select @stat as stat;
End ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_app_tournaments_data`(
IN `uid` VARCHAR(45)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
	SELECT * FROM `db_match`.`vw_get_all_tournaments`;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_match_state`(
IN `uid` VARCHAR(45),
IN `roomid` VARCHAR(45)
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((select count(*) FROM `db_match`.`t_live_matches` where `room_id`= roomid) = 0 )THEN
begin
	set @stat = 'failed';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

set @stat = 'success';
set @endon =  '';

SELECT `endon` FROM `db_match`.`t_live_matches` where `room_id` = roomid into @endon;
set @lefttime = (select TIMESTAMPDIFF(second,NOW(),@endon)-TIMESTAMPDIFF(HOUR,NOW(),@endon)*60 AS second);

SELECT @stat as `stat`, `t_live_matches`.`match_state`, @lefttime as `timeleft` FROM `db_match`.`t_live_matches` where `room_id` = roomid;

END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_new_match_state`(
IN `uid` VARCHAR(45),
IN `roomid` VARCHAR(45), 
IN `gamecode` VARCHAR(20)
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0) THEN
BEGIN
	set @stat = '0';
	select @stat ;
	leave lbl_begin;
END;
END IF;

if((select count(*) FROM `db_match`.`t_live_matches` where `room_id`= roomid) = 0)THEN
BEGIN
	set @stat = 'failed';
	select @stat;
	leave lbl_begin;
END;
END IF;


Case gamecode
	when 'LD01' THEN
	select gamecode;
	when 'CR01' THEN
	select gamecode;
	when 'RY01' THEN
	select gamecode;
END CASE;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_update_player_match_info`(IN `uid` VARCHAR(45), IN `roomid` VARCHAR(45), IN `gamecode` VARCHAR(20), IN `playerstat` VARCHAR(20), IN `score` INT)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) =0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

if((select count(*) from `db_match`.`lst_player_state` where `label`= playerstat) = 0 OR (select count(*) FROM `db_match`.`t_live_players_in_match` where `userid`= uid AND `room_id` = roomid) = 0)THEN
BEGIN
	set @stat = 'failed1';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;
set @curplayerstat = (select `player_state` FROM `db_match`.`t_live_players_in_match` where `userid` = uid);
set @curplayerstatid = (select `id` from `lst_player_state` where `label`= @curplayerstat);
set @newplayerstatid = (select `id` from `lst_player_state` where `label`= playerstat);

if (@newplayerstatid < @curplayerstatid) THEN
BEGIN
	set @stat = 'failed2';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;



if (length(score) > 0) THEN
BEGIN
/*	case
		when gamecode = 'LD01' THEN
		if(score > 7)THEN
        BEGIN
			UPDATE `db_enduser`.`t_user_acc` SET `isblocked` = 1 WHERE `id` = uid;
			set @stat = 'kal aanaa';
			select @stat as `stat`;
			leave lbl_begin;
		END;
		END if;
		when gamecode = 'CR01' THEN
		if(score > 7)THEN BEGIN
			UPDATE `db_enduser`.`t_user_acc` SET `isblocked` = 1 WHERE `id` = uid;
			set @stat = 'kal aanaa';
			select @stat as `stat`;
			leave lbl_begin;
		END;
		END if;
    end case;
    */

	UPDATE `db_match`.`t_live_players_in_match`
	SET `score` = score
	WHERE `userid` = uid AND `room_id` = roomid;
END;
END IF;

IF (playerstat = 'DISCONNECTED' OR playerstat = 'LEAVED' OR playerstat = 'CONCLUDED')THEN
BEGIN
	UPDATE `db_match`.`t_live_players_in_match`
	SET `player_state` = playerstat, `leavedon` = CURRENT_TIMESTAMP()
	WHERE `userid` = uid AND `room_id` = roomid;
END;
END IF;

set @stat = 'success';
select @stat as `stat`, `player_state`,`score` FROM `db_match`.`t_live_players_in_match`;
End ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_validate_joining`(IN `uid` VARCHAR(45), IN `tourid` VARCHAR(45), IN `gamecode` VARCHAR(20))
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) =0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;
/*
if ((select count(*) FROM `db_match`.`t_live_matches` where `room_id`= roomid) > 0) THEN
BEGIN
	set @stat = 'exists';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;
*/

if ((SELECT count(*) FROM `db_app`.`lst_games_type` where `code` = gamecode) = 0) THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

set @deposit= (select `deposit_amount` from `db_enduser`.`t_wallets` where `userid` = uid);
set @entry_fee = '';
set @isActive = '';
set @expireson = '';
SELECT `entry_fee`, `is_active`, `expireson` FROM `db_match`.`lst_tournament_listing` where `id` = tourid into @entry_fee, @isActive, @expireson;

if (@isActive = 0) THEN
BEGIN
	set @stat = 'inactive';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

if ((@deposit - @entry_fee) < 0) THEN
BEGIN
	set @stat = 'lowbalance';
	select @stat as `stat`,@deposit, @entry_fee,(@deposit - @entry_fee) ;
	leave lbl_begin;
END;
END IF;

UPDATE `db_enduser`.`t_wallets` set `deposit_amount` = (@deposit - @entry_fee) where `userid` = uid;
set @stat ='success';
select @stat as stat;
End ;;
DELIMITER ;



CREATE DATABASE  IF NOT EXISTS `db_pg_phonepay`;
USE `db_pg_phonepay`;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_card_instrument`(
In `transaction_id` varchar(30),
In `card_type` varchar(20),
In `pg_transaction_id` varchar(30),
In `bank_transaction_id` varchar(30),
In `pg_authorization_code` varchar(30),
In `_arn` varchar(20),
In `bank_id` varchar(20)
)
lbl_begin:Begin
if ((select count(*) FROM `db_pg_phonepay`.`t_instrument_card` where `transactionid`= transactionid) > 0) THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

INSERT INTO `db_pg_phonepay`.`t_instrument_card`
(`transactionid`,`cardtype`,`pg_transactionid`,`bank_transactionid`,`pg_authorizationcode`,`arn`,`bankid`)VALUES
(transaction_id,card_type,pg_transaction_id,bank_transaction_id,pg_authorization_code,arn,bank_id);

	set @stat = 'success';
	select @stat as `stat`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_netbanking_instrument`(
In `transaction_id` varchar(30),
In `pg_transaction_id` varchar(30),
In `pg_service_transaction_id` varchar(30),
In `pg_banktransaction_id` varchar(30),
In `bank_id` varchar(20)
)
lbl_begin:Begin
if ((select count(*) FROM `db_pg_phonepay`.`t_instrument_card` where `transactionid`= transaction_id) > 0) THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

INSERT INTO `db_pg_phonepay`.`t_instrument_netbanking`
(`transactionid`,`pg_transactionid`,`pg_service_transactionid`,`bank_transactionid`,`bankid`)VALUES
(transaction_id,pg_transaction_id,pg_service_transaction_id,pg_banktransaction_id,bank_id);

	set @stat = 'success';
	select @stat as `stat`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_transection_request`(
IN `uid` VARCHAR(45),
In `transection_id` varchar(30),
In `transection_status` varchar(20),
In `order_id` varchar(20),
In `_amount` int,
In `payment_status` varchar(20),
In `instrument_type` varchar(20)
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

if((select count(*) from `db_pg_phonepay`.`t_response_data` where `transectionid` = transection_id and `orderid` = order_id and `paymentstatus` = 'PAYMENT_SUCCESS')>0) Then
Begin
	set @stat = 'exists';
	select @stat as `stat`;
	leave lbl_begin;
End;
end if;

INSERT INTO `db_pg_phonepay`.`t_response_data`
(`transectionid`,`transectionstatus`,`orderid`,`amount`,`paymentstatus`,`instrument_type`)VALUES
(transection_id,transection_status,order_id,_amount,payment_status,instrument_type);

set @stat = 'success';
select @stat as `stat`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_transection_response`(
In `transection_id` varchar(30),
In `transection_status` varchar(20),
In `order_id` varchar(20),
In `_amount` int,
In `payment_status` varchar(20),
In `instrument_type` varchar(20)
)
lbl_begin:Begin
if((select count(*) from `db_pg_phonepay`.`t_response_data` where `transectionid` = transection_id and `orderid` = order_id and `paymentstatus` = 'PAYMENT_SUCCESS')>0) Then
Begin
	set @stat = 'exists';
	select @stat as `stat`;
	leave lbl_begin;
End;
end if;

INSERT INTO `db_pg_phonepay`.`t_response_data`
(`transectionid`,`transectionstatus`,`orderid`,`amount`,`paymentstatus`,`instrument_type`)VALUES
(transection_id,transection_status,order_id,_amount,payment_status,instrument_type);

set @stat = 'success';
select @stat as `stat`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_upi_instrument`(
	In `transaction_id` varchar(30),
	In `_utr` varchar(20)
)
lbl_begin:Begin
if ((select count(*) FROM `db_pg_phonepay`.`t_instrument_upi` where `utr`= _utr) > 0) THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;
INSERT INTO `db_pg_phonepay`.`t_instrument_upi`
(`transactionid`,`utr`)VALUES(transaction_id,_utr);
	set @stat = 'success';
	select @stat as `stat`;
END ;;
DELIMITER ;




CREATE DATABASE  IF NOT EXISTS `db_bounty` ;
USE `db_bounty`;


DELIMITER ;;
CREATE PROCEDURE `sp_claim_bounty`(
IN `uid` VARCHAR(45), 
IN `roomid` VARCHAR(45), 
IN `gamecode` VARCHAR(45), 
IN `target` VARCHAR(45), 
IN `value_type` VARCHAR(45),
 IN `bountycreatedon` VARCHAR(45)
 )
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;
set @isblocked = (SELECT `t_user_acc`.`isblocked` FROM `db_enduser`.`t_user_acc` where `id` = uid);

if(@isblocked = 1)THEN
begin
	set @stat = 'blocked';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;




if((select count(*) FROM `db_bounty`.`t_live_bounty` where `roomid`= roomid) = 0 OR
(select count(*) FROM `db_bounty`.`t_live_players_in_bounty` where `userid` = uid) = 0)THEN
BEGIN
	set @stat = 'failed1';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

set @targethash = (SELECT `targethash` FROM `db_bounty`.`t_live_bounty` where `roomid`= roomid);
set @target = md5(concat(roomid,gamecode,target, value_type, bountycreatedon));

set @targethash = (SELECT `targethash` FROM `db_bounty`.`t_live_bounty` where `roomid`= roomid);
set @target = md5(concat(roomid,gamecode,target, value_type, bountycreatedon));

if(@targethash != @target)THEN
begin
	/*set @stat = concat('failed',@targethash,':',@target,':',roomid,':',gamecode,':',target,':',value_type,':',bountycreatedon);*/
    set @stat = 'failedhash';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

set @winning = (SELECT `winning_amount` FROM `db_enduser`.`t_wallets` where `userid` = uid);
set @pricepool = (SELECT `pricepool` FROM `db_bounty`.`t_live_bounty` where `roomid`=roomid);

UPDATE `db_bounty`.`t_live_bounty` SET `state` = 3 WHERE `roomid`= roomid;

UPDATE `db_enduser`.`t_wallets`
SET `winning_amount` = (@winning + (@pricepool*0.8))
WHERE `userid` = uid;

set @stat = 'success';
select @stat as `stat`;

END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_created_bounty`(
IN `uid` VARCHAR(45), 
IN `roomid` VARCHAR(45), 
IN `gamecode` VARCHAR(20), 
IN `target` VARCHAR(45), 
IN `value_type` TINYINT
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((SELECT count(*) FROM `db_app`.`lst_games_type` where `code` = gamecode) = 0 OR (SELECT count(*) FROM `db_bounty`.`lst_bounty_value_type` where `amount` = value_type) = 0)THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((select count(*) FROM `db_bounty`.`t_live_bounty` where `roomid`= roomid) > 0 )THEN
begin
	set @stat = 'exists';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

set @deposit = (SELECT `deposit_amount` FROM `db_enduser`.`t_wallets` where `userid` = uid);
set @bountyamount = (SELECT `amount` FROM `db_bounty`.`lst_bounty_value_type` where `id` = value_type);

if((@deposit - @bountyamount) < 0)THEN
begin
	set @stat = 'lowbalance';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

UPDATE `db_enduser`.`t_wallets`
SET `deposit_amount` = (@deposit - @bountyamount)
WHERE `userid` = uid;

set @createdon = now();

set @target = md5(concat(roomid,gamecode,target, value_type,@createdon));
set @pricepool = (SELECT `amount` FROM `db_bounty`.`lst_bounty_value_type` where `id`=value_type);

INSERT INTO `db_bounty`.`t_live_bounty`
(`roomid`,`gamecode`,`state`,`value_type`,`pricepool`,`initiator_player_id`,`targethash`,`createdon`)
VALUES (roomid,gamecode,1,value_type,@pricepool, uid, @target , @createdon);

INSERT INTO `db_bounty`.`t_live_players_in_bounty`
(`room_id`,`userid`,`target`)VALUES(roomid, uid, target);

set @stat = 'success';
SELECT @stat as `stat`, `value_type`as `bountytype`,`pricepool`, @target as `target`,`createdon`
FROM `db_bounty`.`t_live_bounty` where `roomid`= roomid;

END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_disqualify_bounty`(
IN `uid` VARCHAR(45), 
IN `roomid` VARCHAR(45)
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((select count(*) FROM `db_bounty`.`t_live_bounty` where `roomid`= roomid) = 0 OR
(select count(*) FROM `db_bounty`.`t_live_players_in_bounty` where `userid` = uid) = 0)THEN
BEGIN
	set @stat = 'failed1';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((SELECT count(*) FROM `db_bounty`.`t_live_bounty` where `roomid` = roomid) = 0)THEN
BEGIN
	set @stat = 'failed2';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

DELETE FROM `db_bounty`.`t_live_bounty`
WHERE `roomid` = roomid;

DELETE FROM `db_bounty`.`t_live_players_in_bounty`
WHERE `room_id` = roomid;


set @stat = 'success';
select @stat as `stat`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_refund_bounty`(IN `uid` VARCHAR(45), IN `roomid` VARCHAR(45))
lbl_begin:Begin
if((select count(*) FROM `db_bounty`.`t_live_players_in_bounty` where `room_id`= roomid) = 0)THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

if((select `isblocked` FROM `db_enduser`.`t_user_acc` where `id`= uid) = 1)THEN
BEGIN
	set @stat = 'blocked';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

set @bountyamount =  (SELECT `amount` FROM `db_bounty`.`lst_bounty_value_type` where `id` = (SELECT `value_type` FROM `db_bounty`.`t_live_bounty` where `roomid`=roomid));
set @deposit = (SELECT `deposit_amount` FROM `db_enduser`.`t_wallets` where `userid`=uid);
UPDATE `db_enduser`.`t_wallets`
SET `deposit_amount` = (@deposit + @bountyamount)
WHERE `userid` = uid;

set @stat = 'success';
select @stat as `stat` ;
END ;;
DELIMITER ;



CREATE DATABASE  IF NOT EXISTS `db_enduser_complaint` ;
USE `db_enduser_complaint`;

DROP TABLE IF EXISTS `vw_get_all_issue_entities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = @saved_cs_client;

DELIMITER ;;
CREATE PROCEDURE `sp_get_app_issues_data`(
IN `uid` VARCHAR(45)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
	SELECT * FROM `db_enduser_complaint`.`vw_get_all_issue_entities`;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_user_raised_tickets`(
IN `uid` VARCHAR(45)
 )
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
	SELECT `tid`, `topic`, `subtopic`, `issue_status`, `message`, `createdon` FROM `db_enduser_complaint`.`t_user_issue_tickets` where `userid` = uid;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_raise_new_issue_ticket`(
IN `uid` VARCHAR(45), 
IN `issue_list_id` INT, 
IN `msg` VARCHAR(500)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
  set @tid = concat('PBT',Round(UNIX_TIMESTAMP(now(6))), MICROSECOND(now(6)));
  set @issueState = (SELECT `label` FROM `db_enduser_complaint`.`lst_issue_status` where `id` = 1);
  set @topic =  (SELECT `topic` FROM `db_enduser_complaint`.`vw_get_all_issue_entities` where `id` = issue_list_id);
  set @subtopic =  (SELECT `subtopic`FROM `db_enduser_complaint`.`vw_get_all_issue_entities` where `id` = issue_list_id);

  INSERT INTO `db_enduser_complaint`.`t_user_issue_tickets`(`tid`,`userid`,`issue_list_id`,`topic`,`subtopic`,`issue_status`,`message`,`attachment_url`)
  VALUES(@tid,uid,issue_list_id,@topic,@subtopic,@issueState, msg,concat('userpersistent/Images/',uid,'/tickets/',@tid,"/"));
  set @stat = 'success';
  SELECT @stat as stat, @tid as ticketid;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;



CREATE DATABASE  IF NOT EXISTS `db_enduser`;
USE `db_enduser`;

DROP TABLE IF EXISTS `vw_user_profile`;

SET @saved_cs_client     = @@character_set_client;

SET character_set_client = @saved_cs_client;

DELIMITER ;;
CREATE PROCEDURE `sp_enduser_login`(
IN `uid` VARCHAR(45), 
IN `pnum` VARCHAR(20), 
IN `otp` VARCHAR(6), 
IN `dtk` VARCHAR(45)
)
lbl_begin:Begin
if ((select count(*) from `db_app`.`t_register_devices` where `token`= dtk) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;
if ((select count(*) from `db_enduser`.`t_user_acc` where `phone_number` = pnum) = 0 ) THEN
BEGIN
	set @stat = 'notfound';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;
set @exptime = (select `expireon` from `db_enduser`.`t_user_otp` where `phone_number` = pnum);


set @salt = 'playbee';
set @authtkn = md5(concat(`uid`, `pnum`, `dtk`, `otp`, @salt, CURRENT_TIMESTAMP()));
UPDATE `db_enduser`.`t_user_acc` SET `authtoken` = @authtkn WHERE (`phone_number` = pnum);

DELETE FROM `db_enduser`.`t_active_logged_in` WHERE `userid` = uid;
DELETE FROM `db_enduser`.`t_active_logged_in` WHERE `device_token` = dtk;

INSERT INTO `db_enduser`.`t_active_logged_in`
(`userid`,`auth_token`,`device_token`)
VALUES(uid, @authtkn, dtk);

DELETE FROM `db_enduser`.`t_user_otp` WHERE `phone_number` = pnum;
INSERT INTO `db_history_activity`.`t_history_logging_activity`
(`userid`,`device_token`,`status`) VALUES (uid,device_token,'IN');

Set @stat = 'success';
SELECT @stat AS stat, @authtkn as `auth_token`;


End ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `sp_check_endUser_isloggedin`(
	IN `uid` VARCHAR(45), 
	IN `atk` VARCHAR(45), 
	IN `dtk` VARCHAR(45)
)
Begin
	set @stat = ((select count(*) from `db_enduser`.`t_active_logged_in` where `userid` = uid AND `auth_token` =  atk AND `device_token` = dtk) > 0);
select @stat as stat;
end;;
DELIMITER ;




DELIMITER ;;
CREATE PROCEDURE `sp_enduser_logout`(
IN `uid` VARCHAR(45)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0) Then
Begin
	DELETE FROM `db_enduser`.`t_active_logged_in` WHERE `userid` = uid;
	UPDATE `db_enduser`.`t_user_acc` SET `authtoken` = null WHERE `id` = uid;

	set @stat = 'success';
	select @stat as stat;
End;
ELSE
Begin
	set @stat = '0';
	select @stat as stat;
End;
End if ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_enduser_register`(IN `pnum` VARCHAR(20), IN `dtk` VARCHAR(45))
lbl_begin:Begin
set @stat = 'failed';
set @uid = '';
set @gamename='';
set @emailid='';
set @avatarname='';
set @isblocked='';
set @referalcode='';
if ((select count(*) from `db_enduser`.`t_user_acc` where `phone_number` = pnum) = 0  AND (select count(*) from `db_app`.`t_register_devices` where `token`= dtk) > 0)then
begin
	set @uid = (uuid_short());
	set @referalcode = (SELECT SUBSTRING(@uid, 7,  length(@uid)));
	set @count=5;
	WHILE (select count(`referalcode`) from `db_enduser`.`t_user_acc` where `referalcode` = @referalcode) > 0 DO
		set @uid = (uuid_short());
		set @referalcode = (SELECT SUBSTRING(@uid, 7,  length(@uid)));
	END WHILE;

	set @gamename =concat('pb_', Round(UNIX_TIMESTAMP(now(6))), MICROSECOND(now(6)));
	INSERT INTO `db_enduser`.`t_user_acc`(`id`,`phone_number`,`game_name`,`dp_image_url`, `referalcode`)
	VALUES(@uid, pnum, @gamename, concat('userpersistent/',@uid,'/dp_avatar/'),@referalcode);
    INSERT INTO `db_enduser`.`t_wallets`(`userid`,`deposit_amount`,`bonus_amount`)VALUES(@uid,10,0);


	set @stat = 'success';
end;
else
begin
	if (select `isblocked` from `db_enduser`.`t_user_acc` where `phone_number` = pnum) THEN
	BEGIN
		set @stat = 'blocked';
		select @stat as `stat`;
		leave lbl_begin;
	END;
	END IF;
	set @uid = (SELECT `id` FROM `db_enduser`.`t_user_acc` where `phone_number`= pnum);

    select `game_name`,`emailid`,`avatar_name`,`isblocked`,`referalcode` from `db_enduser`.`t_user_acc` where `id` = @uid
    into @gamename, @emailid, @avatarname,@isblocked, @referalcode ;
	set @stat = 'success';
end;
end if;

IF ((SELECT count(*) from `db_enduser`.`t_user_otp` where `phone_number` = pnum)=0)THEN
BEGIN
	INSERT INTO `db_enduser`.`t_user_otp`(`phone_number`) VALUES (pnum);
END;
END IF;

SELECT @stat AS `stat`, @uid AS `userid`, @gamename as `gamename`, @emailid as `emailid`, @avatarname as `avatarname`, @referalcode as `referalcode` ;

End ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_gen_otp`(
IN `uid` VARCHAR(45), 
IN `pnum` VARCHAR(20)
)
if ((select count(*) FROM `db_enduser`.`t_user_acc` where `id`= uid) > 0)THEN
BEGIN
	Set @otp = ROUND((RAND() * (9999-1111))+1111);
	set @stat = 'success';

	if((select count(*) from `db_enduser`.`t_user_otp` where `phone_number` = pnum) = 0)THEN
	BEGIN
		Set @exptime = timestampadd(second, 5, NOW());

		INSERT INTO `db_enduser`.`t_user_otp`
		(`phone_number`, `otp`, `expireon`) VALUES (pnum, @otp, @exptime);
		select @stat as `stat`, @otp as `otp`;
	END;
	else
	BEGIN
    	set @exptime = (select `expireon` from `db_enduser`.`t_user_otp` where `phone_number` = pnum);
		if (@exptime>now()) Then
		Begin
			Set @otp = (select `otp` from `db_enduser`.`t_user_otp` where `phone_number` = pnum);
			select @stat as `stat`, @otp as `otp`;
		End;
		else
		Begin
			delete from `db_enduser`.`t_user_otp` where `phone_number` = pnum;
			Set @exptime = timestampadd(second, 5, NOW());
			INSERT INTO `db_enduser`.`t_user_otp`
			(`phone_number`, `otp`, `expireon`) VALUES (pnum, @otp, @exptime);
			select @stat as `stat`, @otp as `otp`;
		End;
		End if;
	End;
	End if;

END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_enduser_vip_info`(
IN `uid` VARCHAR(45)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
    SELECT `userid`, `expireson` FROM `db_enduser`.`t_vip_user` where `userid` = uid;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_user_profile_dtl`(
IN `uid` VARCHAR(45)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
	set @stat = 'success';
SELECT  @stat as stat, `id`,`phone_number`,`authtoken`,`game_name`,`emailid`,`avatar_name`,`dp_image_url`,`bonus_amount`,
    `deposit_amount`,`winning_amount`,`isblocked`,`referalcode`,`createdon`
FROM `db_enduser`.`vw_user_profile`
	where `id` = uid;

DELETE FROM `db_bounty`.`t_live_players_in_match` WHERE `userid` = uid;


	select @stat as stat;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_vip_status`(
IN `uid` VARCHAR(45)
 )
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) =0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;

set @stat = 'success';
set @expon = '';
set @createdon = '';


set @daysleft = datediff(Date(@expon),Date(@createdon));

if ((select count(*) from `db_enduser`.`t_vip_user` where `userid`= uid) = 0 ) THEN
BEGIN
	set @daysleft=0;
	set @isvip = 0;
END;
else
BEgiN

	select `expiredon`, `createdon` from `db_enduser`.`t_vip_user` where `userid`= uid into @expon, @createdon;
	set @daysleft = datediff(Date(@expon),Date(@createdon));
	set @isvip = '1';
End;
END IF;
select @stat as `stat`,	@isvip as `isvip`,@daysleft as `daysleft`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_update_order_status`(
IN `uid` VARCHAR(45),
In `order_id` varchar(20),
In `order_Status` varchar(20),
In `order_type` varchar(10),
In `_amount` int
)
lbl_begin:Begin
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat`;
	leave lbl_begin;
END;
END IF;
if((select `orderstatus` from `db_enduser`.`t_purchase_order` where `orderid` = order_id) = 'PAYMENT_SUCCESS')then
begin
	set @stat = 'exists';
	select @stat as `stat`;
	leave lbl_begin;
end;
end if;

if((select count(*) from `db_enduser`.`t_purchase_order` where `orderid` = order_id) = 0)then
begin
	INSERT INTO `db_enduser`.`t_purchase_order`
	(`orderid`,`userid`,`ordertype`,`orderstatus`,`amount`)VALUES
	(order_id,uid,order_type,order_Status,_amount);
end;
else 
Begin
	UPDATE `db_enduser`.`t_purchase_order` 
    SET `orderstatus` = order_Status, `concludeon` = current_timestamp() 
    WHERE `orderid` = order_id;
End;
end if;

set @stat = 'success';
select @stat as `stat`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_update_user_profile`(
IN `uid` VARCHAR(45),
IN `gname` VARCHAR(45), IN `email` VARCHAR(100), IN `aname` VARCHAR(20)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN

	if (length(gname) > 0)THEN
	begin
	  UPDATE `db_enduser`.`t_user_acc` SET `game_name` = gname WHERE `id` = uid;
	end;
	end if;
	if (length(email) > 0)THEN
	begin
	  UPDATE `db_enduser`.`t_user_acc` SET `emailid` = email WHERE `id` = uid;
	end;
	end if;
	if (length(aname) > 0)THEN
	begin
	  UPDATE `db_enduser`.`t_user_acc` SET `avatar_name` = aname WHERE `id` = uid;
	end;
	end if;
	set @stat = 'success';
	select @stat as stat, gname,email,aname;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;



CREATE DATABASE  IF NOT EXISTS `db_app`;
USE `db_app`;

DELIMITER ;;
CREATE PROCEDURE `sp_app_install`(
IN `gkey` VARCHAR(45), 
IN `sKey` VARCHAR(45), 
IN `pkey` VARCHAR(45), 
IN `devid` VARCHAR(45), 
IN `dtype` VARCHAR(45), 
IN `model` VARCHAR(100),
 IN `imei` VARCHAR(45), 
 IN `srno` VARCHAR(45)
 )
if(`gkey` = 'd9791e3873eb74ff1a0ada96d3562f3c' AND `sKey` = 'bdc9b3061cd61d6b308991fc56176eda' AND `pkey`= '09721ab88e0a552087391be1ef0c6826')
THEN
BEGIN
	set @stat = 'success';
	set @salt='playbee';
	set @device_token = md5(concat(`devid`,`dtype`,@salt));

	if ((select count(*) from `db_app`.`t_register_devices` where `device_id` = devid)=0)then
	begin
	  INSERT INTO `db_app`.`t_register_devices`(`device_id`,`token`,`dtype`,`model`)
	  VALUES(devid, @device_token,dtype,model);
	  SELECT @stat as stat, @device_token as device_token;
	end;
	else
	begin
	  set @device_token = (select `token` from `db_app`.`t_register_devices` where `device_id` = devid AND `dtype` = dtype and `model` = model);
	  SELECT @stat as stat, @device_token as device_token;
	end;
	end if;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_maintenance_info`(
IN `platformkey` VARCHAR(45), 
IN `gamekey` VARCHAR(45)
)
if(platformkey='09721ab88e0a552087391be1ef0c6826' AND gamekey='d9791e3873eb74ff1a0ada96d3562f3c')THEN
  BEGIN
  set @schon = CURRENT_TIMESTAMP();
  set @expon = CURRENT_TIMESTAMP();
      SELECT `message`, @schon as `scheduledon`, @expon as `expireson` FROM `db_app`.`maintenance_state` where `platform_key`= platformkey;
  END;
  END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_refferal_reeedem`(
IN `uid` VARCHAR(45)
 )
lbl_begin:Begin
set @myrflcode = (select `referalcode` FROM `db_enduser`.`t_user_acc` where `id`= uid);

if((select `isblocked` FROM `db_enduser`.`t_user_acc` where `id`= uid) > 0)THEN
BEGIN
	set @stat = 'blocked';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;
	set @stat = 'success';
    set @isrefferalreedem = (SELECT count(*) FROM `db_app`.`t_refferal_reedem` where `userid` = uid);
	select @stat as `stat`, @isrefferalreedem as `isrefferalreedem`;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_get_vip_pack_list`(
IN `uid` VARCHAR(45)
)
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) > 0)THEN
BEGIN
  SELECT `id`,`label`,`period_days` as `days`,`amount` FROM `db_app`.`lst_vip_pack_list`;
END;
ELSE
BEGIN
	set @stat = '0';
	select @stat as stat;
END;
END IF ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `sp_refferal_reedem`(
IN `uid` VARCHAR(45), 
IN `refferercode` VARCHAR(20)
)
lbl_begin:Begin
set @myrflcode = (select `referalcode` FROM `db_enduser`.`t_user_acc` where `id`= uid);

if((select `isblocked` FROM `db_enduser`.`t_user_acc` where `id`= uid) > 0)THEN
BEGIN
	set @stat = 'blocked';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;
if ((select count(*) FROM `db_enduser`.`t_active_logged_in` where `userid`= uid) = 0) THEN
BEGIN
	set @stat = '0';
	select @stat as `stat` ;
	leave lbl_begin;
END;

END IF;
if(length(refferercode) != 12 OR (select `referalcode` FROM `db_enduser`.`t_user_acc` where `id` = uid) = refferercode  OR
(select count(*) FROM `db_enduser`.`t_user_acc` where `referalcode` = refferercode) = 0)THEN
BEGIN
	set @stat = 'failed';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;
if((select count(*) FROM `db_app`.`t_refferal_reedem` where `userid`= uid) > 0)THEN
BEGIN
	set @stat = 'exists';
	select @stat as `stat` ;
	leave lbl_begin;
END;
END IF;

set @refferuid = (select `id` FROM `db_enduser`.`t_user_acc` where `referalcode`= refferercode);
set @isreffervip = (select count(*) FROM `db_enduser`.`t_vip_user` where `userid`= @refferuid AND `expiredon` < now());

set @curbonus = (SELECT `bonus_amount` FROM `db_enduser`.`t_wallets` where `userid` = uid);
set @newbouns = 0;

if(@isreffervip = 1)THEN
BEGIN
	set @newbouns = @curbonus+20;
END;
ELSE
BEGIN
	set @newbouns = @curbonus+10;
END;
END IF;

UPDATE `db_enduser`.`t_wallets`
SET `bonus_amount` = @curbonus+20
WHERE `userid` = uid;
INSERT INTO `db_app`.`t_refferal_reedem`
(`userid`,`refferalfrom`)
VALUES(uid,refferercode);
	set @stat = 'success';
	select @stat as `stat` ;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE PROCEDURE `trunct`()
BEGIN

truncate table `db_app`.`t_refferal_reedem`;
truncate table `db_app`.`t_register_devices`;

truncate table `db_bounty`.`t_live_bounty`;
truncate table `db_bounty`.`t_live_players_in_bounty`;

truncate table `db_enduser`.`t_active_logged_in`;
truncate table `db_enduser`.`t_purchase_order`;
truncate table `db_enduser`.`t_user_acc`;
truncate table `db_enduser`.`t_user_otp`;
truncate table `db_enduser`.`t_vip_user`;
truncate table `db_enduser`.`t_wallets`;
truncate table `db_enduser`.`t_withdrawal_order`;

truncate table `db_enduser_complaint`.`t_user_issue_tickets`;

truncate table `db_history_activity`.`t_history_logging_activity`;
truncate table `db_history_activity`.`t_history_player_matches`;
truncate table `db_history_activity`.`t_match_history`;

truncate table `db_kyc`.`t_user_kyc_aadharcard`;
truncate table `db_kyc`.`t_user_kyc_pancard`;

truncate table `db_match`.`t_live_matches`;
truncate table `db_match`.`t_live_players_in_match`;

truncate table `db_pg_phonepay`.`t_instrument_card`;
truncate table `db_pg_phonepay`.`t_instrument_netbanking`;
truncate table `db_pg_phonepay`.`t_instrument_upi`;
truncate table `db_pg_phonepay`.`t_response_data`;


END ;;
DELIMITER ;

