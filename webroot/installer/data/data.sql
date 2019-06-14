-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 09 jan. 2019 à 19:02
-- Version du serveur :  10.2.19-MariaDB
-- Version de PHP :  7.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `data`
--

-- --------------------------------------------------------

--
-- Structure de la table `cm_announcements`
--

CREATE TABLE `cm_announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_persian_ci NOT NULL DEFAULT '1',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cm_categories`
--

CREATE TABLE `cm_categories` (
  `id` int(10) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_desc` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_browsers` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `enable_screenshots` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `enable_previewlink` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `enable_comments` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `enable_reviews` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `cm_categories`
--

INSERT INTO `cm_categories` (`id`, `name`, `short_desc`, `link`, `enable_browsers`, `enable_screenshots`, `enable_previewlink`, `enable_comments`, `enable_reviews`, `status`, `created`) VALUES
(1, 'Scripts', NULL, 'scripts', '1', '1', '1', '1', '1', '1', '44646'),
(2, 'Themes', '', 'themes', '1', '1', '1', '1', '1', '1', '44646'),
(3, 'Plugins', NULL, 'plugins', '1', '1', '1', '1', '1', '1', '44646'),
(4, 'Print', '', 'print', '1', '1', '1', '1', '1', '1', '44646');

-- --------------------------------------------------------

--
-- Structure de la table `cm_comments`
--

CREATE TABLE `cm_comments` (
  `id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `author_id` int(10) DEFAULT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isauthor` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `ispurchased` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `parent_id` int(10) DEFAULT NULL,
  `email_me` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `comment` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isread` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `created` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cm_config`
--

CREATE TABLE `cm_config` (
  `config_id` int(11) NOT NULL,
  `header` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `value` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Déchargement des données de la table `cm_config`
--

INSERT INTO `cm_config` (`config_id`, `header`, `value`) VALUES
(1, 'name', 'DigaSell'),
(2, 'short_desc', 'We Are specialize in creating some of the Best Free and Premium Bootstrap PSD Templates, HTML Templates, Wordpress Themes & Others Graphics'),
(3, 'min_deposit', '5.00'),
(4, 'sumbole', '$'),
(5, 'reCAPTCHA_site_key', ''),
(6, 'reCAPTCHA_secret_key', ''),
(7, 'background_image', 'https://codsem.com/digasell/template/main/Assets/img/hero.jpg'),
(8, 'icon_url', 'https://codsem.com/digasell/template/uploads/images/favicon.png'),
(9, 'site_description', 'DigaSell is an online store for Themes, Plugins, PHP Script, JavaSCript, HTML5, Print and CSS files.'),
(10, 'site_title', 'Buy premium PHP scripts, themes and create amazing websites '),
(11, 'taxes', '2.00'),
(12, 'language', 'en_US'),
(13, 'support_email', 'support@example.com'),
(14, 'head_code', ''),
(15, 'footer_code', ''),
(16, 'copyright_code', ''),
(17, 'currency', 'USD'),
(18, 'fb_link', 'https://www.facebook.com/codesem/'),
(19, 'go_link', 'https://plus.google.com/codesem'),
(20, 'tweet_link', 'https://twitter.com/codesemhq'),
(21, 'pin_link', 'https://www.pinterest.com/codesem/'),
(22, 'logo_url', 'https://codsem.com/digasell/template/uploads/images/file.png'),
(23, 'logo_url_home', 'https://codsem.com/digasell/template/uploads/images/file.png'),
(24, 'account_activate_email', '2'),
(25, 'body_code', ''),
(26, 'captcha_type', 'recaptcha'),
(27, 'captcha_signup', '2'),
(28, 'captcha_login', '2'),
(29, 'captcha_forgot', '2'),
(30, 'keywords', 'themes, templates, plugins , javascript, css, html5, php scripts, print, buy'),
(31, 'enable_home_featured', '1'),
(32, 'enable_home_popular', '1'),
(33, 'enable_home_why', '1'),
(34, 'enable_home_testimonial', '1'),
(35, 'enable_home_announcement', '2');

-- --------------------------------------------------------

--
-- Structure de la table `cm_credits`
--

CREATE TABLE `cm_credits` (
  `id` int(10) NOT NULL,
  `amount` varchar(500) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `created` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cm_credits`
--

INSERT INTO `cm_credits` (`id`, `amount`, `status`, `created`) VALUES
(1, '5', '1', NULL),
(2, '10', '1', NULL),
(3, '15', '1', NULL),
(4, '20', '1', ''),
(5, '25', '1', ''),
(6, '30', '1', ''),
(7, '40', '1', ''),
(8, '50', '1', ''),
(9, '60', '1', ''),
(10, '70', '1', ''),
(11, '80', '1', ''),
(12, '90', '1', ''),
(13, '100', '1', ''),
(14, '200', '1', ''),
(15, '500', '1', '');

-- --------------------------------------------------------

--
-- Structure de la table `cm_depMethods`
--

CREATE TABLE `cm_depMethods` (
  `id` int(10) NOT NULL,
  `methods` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `processor` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `account` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `publick_key` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `secret_key` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `info` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ipn` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '1=active, 2=inactive',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cm_depMethods`
--

INSERT INTO `cm_depMethods` (`id`, `methods`, `processor`, `account`, `address`, `publick_key`, `secret_key`, `info`, `ipn`, `status`, `created`) VALUES
(1, 'Bitcoin', 'coinpayments', '', '', '', '', 'BTC', '', '1', ''),
(2, 'PayPal', 'express_checkout', '', '', '', '', '', '', '1', '');

-- --------------------------------------------------------

--
-- Structure de la table `cm_downloads`
--

CREATE TABLE `cm_downloads` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `price` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `purchase_key` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isreviewed` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `status` enum('1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cm_invoice`
--

CREATE TABLE `cm_invoice` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `method` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `type` enum('1','2') CHARACTER SET utf8 DEFAULT '1',
  `item_id` int(10) DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2' COMMENT '1=paid,2=unpaid',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cm_items`
--

CREATE TABLE `cm_items` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(12000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_desc` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preview_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenshots` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `software_framework` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `demo_url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('free','paid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'paid',
  `is_popular` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `is_featured` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `price` int(10) DEFAULT 0,
  `browsers` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stars` enum('0','1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sales` int(10) DEFAULT 0,
  `amount_sales` int(10) NOT NULL DEFAULT 0,
  `status` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `created` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cm_members`
--

CREATE TABLE `cm_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8 DEFAULT 'user',
  `status` int(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=active, 2=inactive, 3=pending',
  `username` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
  `email` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `admin_earnings` decimal(20,2) NOT NULL DEFAULT 0.00,
  `first_name` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
  `last_name` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `recover` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
  `login_ip` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `register_ip` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `created` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `token` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `newsletter` enum('1','2') COLLATE utf8_persian_ci NOT NULL DEFAULT '1',
  `avatar` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `since` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `homepage` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cm_pages`
--

CREATE TABLE `cm_pages` (
  `id` int(10) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `short` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protect` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `cm_pages`
--

INSERT INTO `cm_pages` (`id`, `title`, `content`, `short`, `protect`, `status`, `created`) VALUES
(1, 'Terms & Conditions', 'Terms & Conditions', NULL, '1', '1', '54545'),
(2, 'Privacy Policy\r\n', 'Privacy Policy', NULL, '1', '1', '54545'),
(7, 'About us', '<p>About us&nbsp;About us&nbsp;About us</p>\r\n', 'About us&nbsp;About us&nbsp;About us\r\n', '2', '1', '05 Dec 2018'),
(8, 'FAQ', '<p>ererererererererererererererererererererer</p>\r\n', 'ererererererererererererererererererererer\r\n', '2', '1', '05 Dec 2018');

-- --------------------------------------------------------

--
-- Structure de la table `cm_payments`
--

CREATE TABLE `cm_payments` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `txn_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `item_number` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `payment_gross` decimal(20,2) DEFAULT 0.00,
  `amount_btc` decimal(20,8) DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `payment_status` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cm_reviews`
--

CREATE TABLE `cm_reviews` (
  `id` int(10) NOT NULL,
  `item_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `review` varchar(12000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stars` int(10) NOT NULL DEFAULT 0,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cm_statement`
--

CREATE TABLE `cm_statement` (
  `id` int(10) NOT NULL,
  `item_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` enum('purchase','deposit','refund') COLLATE utf8_unicode_ci DEFAULT 'purchase',
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cm_testimonials`
--

CREATE TABLE `cm_testimonials` (
  `id` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `job` varchar(250) DEFAULT NULL,
  `content` varchar(1500) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `status` enum('1','2') DEFAULT '1',
  `created` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cm_themes`
--

CREATE TABLE `cm_themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `version` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2' COMMENT '1=active,2=inactive',
  `created` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cm_themes`
--

INSERT INTO `cm_themes` (`id`, `name`, `version`, `status`, `created`) VALUES
(1, 'main', '1.0.0', '1', '21/04/18 , 09:20 AM');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cm_announcements`
--
ALTER TABLE `cm_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_categories`
--
ALTER TABLE `cm_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_comments`
--
ALTER TABLE `cm_comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_config`
--
ALTER TABLE `cm_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Index pour la table `cm_credits`
--
ALTER TABLE `cm_credits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_depMethods`
--
ALTER TABLE `cm_depMethods`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_downloads`
--
ALTER TABLE `cm_downloads`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_invoice`
--
ALTER TABLE `cm_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_items`
--
ALTER TABLE `cm_items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_members`
--
ALTER TABLE `cm_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Index pour la table `cm_pages`
--
ALTER TABLE `cm_pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_payments`
--
ALTER TABLE `cm_payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_reviews`
--
ALTER TABLE `cm_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_statement`
--
ALTER TABLE `cm_statement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_testimonials`
--
ALTER TABLE `cm_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cm_themes`
--
ALTER TABLE `cm_themes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cm_announcements`
--
ALTER TABLE `cm_announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `cm_categories`
--
ALTER TABLE `cm_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `cm_comments`
--
ALTER TABLE `cm_comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `cm_config`
--
ALTER TABLE `cm_config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `cm_credits`
--
ALTER TABLE `cm_credits`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `cm_depMethods`
--
ALTER TABLE `cm_depMethods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `cm_downloads`
--
ALTER TABLE `cm_downloads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT pour la table `cm_invoice`
--
ALTER TABLE `cm_invoice`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `cm_items`
--
ALTER TABLE `cm_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6589;

--
-- AUTO_INCREMENT pour la table `cm_members`
--
ALTER TABLE `cm_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `cm_pages`
--
ALTER TABLE `cm_pages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `cm_payments`
--
ALTER TABLE `cm_payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `cm_reviews`
--
ALTER TABLE `cm_reviews`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `cm_statement`
--
ALTER TABLE `cm_statement`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT pour la table `cm_testimonials`
--
ALTER TABLE `cm_testimonials`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `cm_themes`
--
ALTER TABLE `cm_themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cm_members`
--
ALTER TABLE `cm_members`
  ADD CONSTRAINT `cm_members_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `cm_members` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
