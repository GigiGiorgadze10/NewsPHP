-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2024 at 04:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `article_id` int(4) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `author_id` int(4) UNSIGNED DEFAULT NULL,
  `category_id` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `content`, `image_url`, `published_at`, `author_id`, `category_id`) VALUES
(23, 'Georgia Signs Trade Agreement with Turkey', 'Georgia has signed a new trade agreement with Turkey, boosting economic cooperation between the two countries...', 'images/turkey-1.jpg', '2024-06-08 11:24:01', 3, 1),
(24, 'Protests Erupt in Tbilisi Over Economic Inequality', 'Thousands of protesters have taken to the streets in Tbilisi to demand action on economic inequality...', 'images/1c085aa14bf6e196ce5ce843e2efe32d6a212202.jpg', '2024-06-08 11:24:01', 3, 1),
(25, 'Georgian President Calls for Unity Amid Political Tensions', 'The President of Georgia has called for unity amid rising political tensions in the country...', 'images/3391c8a172c2277f283b565fc9972a1a.jpg', '2024-06-08 11:24:01', 3, 1),
(28, 'Global Leaders Meet to Discuss Climate Change', 'World leaders gathered to discuss urgent actions needed to combat climate change...', 'images/07cop27-morning-lede-family-photo-videoSixteenByNine3000-v2.jpg', '2024-06-08 11:24:01', 3, 2),
(29, 'UN Sanctions Imposed on North Korea', 'The United Nations has imposed new sanctions on North Korea in response to its continued nuclear tests...', 'images/1_nD6132l9nLoDaP0e7rcapg.png', '2024-06-08 11:24:01', 3, 2),
(30, 'Trade Tensions Rise Between US and China', 'Trade tensions between the United States and China have escalated following new tariffs...', 'images/large_vMJ9OEAeC2T0hifSuhTvk5cfuxFToksuyG6HPS3wrlk.jpg', '2024-06-08 11:24:01', 3, 2),
(31, 'Brexit: UK and EU Reach Agreement', 'The UK and EU have finally reached an agreement on the terms of Brexit, marking the end of a long negotiation...', 'images/107200295-1677514473794-gettyimages-1247534210-hd1_0025.jpeg', '2024-06-08 11:24:01', 3, 2),
(32, 'Elections in Brazil Bring New Leadership', 'Brazil has elected a new president in a closely contested election that saw high voter turnout...', 'images/brazil-election-results-hero-940x529.jpg', '2024-06-08 11:24:01', 3, 2),
(33, 'Russia Expands Influence in Eastern Europe', 'Russia is increasing its influence in Eastern Europe through a series of strategic partnerships...', 'images/geography_review_2023_02_01-imagesimg13_1_jpg-2552c27d14fd5c28bb0bc10b3f254ee9.jpg', '2024-06-08 11:24:01', 3, 2),
(35, 'US Congress Passes Major Healthcare Reform', 'The US Congress has passed a major healthcare reform bill aimed at expanding access to medical care...', 'images/national-plan-to-end-parkinsons-act-810x460.png', '2024-06-08 11:24:01', 3, 2),
(36, 'Germany Announces Green Energy Initiatives', 'Germany has announced a series of green energy initiatives to reduce carbon emissions and promote sustainability...', 'images/8840_large_CLAPR1271a_52241418.jpg.jpg', '2024-06-08 11:24:01', 3, 2),
(37, 'Africa Union Launches Economic Development Plan', 'The Africa Union has launched a new economic development plan aimed at fostering growth and reducing poverty...', 'images/LGS-Launch-2.png', '2024-06-08 11:24:01', 3, 2),
(39, 'Environmental Policies in Georgia Under Scrutiny', 'Environmental activists in Georgia are calling for stricter regulations to protect natural resources...', 'images/WEB-COVER--2.jpg.jpeg', '2024-06-08 11:25:49', 3, 1),
(40, 'New Education Reforms in Georgia', 'The Georgian government has introduced new education reforms aimed at improving the quality of education...', 'images/unnamed.jpg', '2024-06-08 11:25:49', 3, 1),
(41, 'Georgia and Azerbaijan Sign Energy Deal', 'Georgia and Azerbaijan have signed a major energy deal to boost cooperation in the energy sector...', 'images/16015-1696587077.jpg', '2024-06-08 11:25:49', 3, 1),
(42, 'Georgian Opposition Parties Form Coalition', 'Several opposition parties in Georgia have formed a coalition to challenge the ruling party in upcoming elections...', 'images/elect-1598257459.jpg', '2024-06-08 11:25:49', 3, 1),
(44, 'Georgia Launches Anti-Corruption Campaign', 'The Georgian government has launched a new campaign to combat corruption in public offices...', 'images/trnsp_timeline_eng.png', '2024-06-08 11:25:49', 3, 1),
(46, 'Georgia Enhances Cybersecurity Measures', 'In response to recent cyber attacks, Georgia is enhancing its cybersecurity measures to protect critical infrastructure...', 'images/CO1234-01.png', '2024-06-08 11:25:49', 3, 1),
(47, 'Georgian Healthcare System Receives Funding Boost', 'The Georgian healthcare system is set to receive a significant funding boost to improve services...', 'images/healt-1572344214.jpg', '2024-06-08 11:25:49', 3, 1),
(48, 'US and Russia Discuss Arms Control', 'Officials from the US and Russia have met to discuss renewing arms control agreements...', 'images/200608165352-usa-russia-flags.jpg', '2024-06-08 11:25:49', 3, 2),
(50, 'China Announces Major Infrastructure Projects', 'China has announced a series of major infrastructure projects as part of its Belt and Road Initiative...', 'images/f4aaab3a-2c9a-410e-82a6-1033db5ad9fa.jpeg', '2024-06-08 11:25:49', 3, 2),
(51, 'India and Pakistan Engage in Peace Talks', 'India and Pakistan have resumed peace talks to address ongoing conflicts and improve relations...', 'images/605aa4dc6f428.jpg', '2024-06-08 11:25:49', 3, 2),
(52, 'Economic Reforms in Argentina Show Progress', 'Economic reforms in Argentina are showing signs of progress, according to recent reports...', 'images/thumbs_b_c_566639741c202db48f85133d232621f3.jpg', '2024-06-08 11:25:49', 3, 2),
(54, 'UN Calls for Humanitarian Aid in Yemen', 'The United Nations has called for increased humanitarian aid to address the crisis in Yemen...', 'images/Yemen-crisis-.jpeg', '2024-06-08 11:25:49', 3, 2),
(55, 'Australia Passes Landmark Climate Legislation', 'Australia has passed landmark climate legislation aimed at reducing greenhouse gas emissions...', 'images/iStock-1004543484-australia-parliament-679x419.jpg', '2024-06-08 11:25:49', 3, 2),
(56, 'Canada Introduces New Healthcare Policies', 'Canada has introduced new healthcare policies aimed at improving access to medical services...', 'images/CNHIAP-Horizontal.png', '2024-06-08 11:25:49', 3, 2),
(57, 'Japan Strengthens Military Alliances', 'Japan is strengthening its military alliances in response to regional security threats...', 'images/cropped_image_l.png', '2024-06-08 11:25:49', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(4) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `created_at`) VALUES
(1, 'Georgia', 'News related to Georgia', '2024-06-02 19:22:16'),
(2, 'world', 'News related to World', '2024-06-02 19:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(4) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(4) UNSIGNED DEFAULT NULL,
  `article_id` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `created_at`, `user_id`, `article_id`) VALUES
(449, 'magaria dzmaa', '2024-06-08 16:51:41', 3, 41),
(450, 'tsarmatebebi', '2024-06-08 17:12:34', 4, 57),
(451, 'kaka', '2024-06-09 09:29:06', 4, 23),
(452, 'dudu', '2024-06-09 09:41:46', 4, 31),
(453, 'africa', '2024-06-09 09:42:02', 4, 37);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(4) UNSIGNED NOT NULL,
  `user_id` int(4) UNSIGNED DEFAULT NULL,
  `article_id` int(4) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `user_id`, `article_id`, `created_at`) VALUES
(1394, 4, 23, '2024-06-08 11:38:36'),
(1395, 3, 24, '2024-06-08 11:38:36'),
(1396, 4, 25, '2024-06-08 11:38:36'),
(1399, 3, 28, '2024-06-08 11:38:36'),
(1400, 3, 29, '2024-06-08 11:38:36'),
(1401, 3, 30, '2024-06-08 11:38:36'),
(1402, 3, 31, '2024-06-08 11:38:36'),
(1403, 3, 32, '2024-06-08 11:38:36'),
(1404, 3, 33, '2024-06-08 11:38:36'),
(1406, 3, 35, '2024-06-08 11:38:36'),
(1407, 3, 36, '2024-06-08 11:38:36'),
(1408, 3, 37, '2024-06-08 11:38:36'),
(1409, 3, 23, '2024-06-08 14:22:46'),
(1410, 3, 25, '2024-06-08 14:36:53'),
(1411, 4, 24, '2024-06-08 14:42:44'),
(1412, 4, 28, '2024-06-08 14:42:48'),
(1413, 3, 41, '2024-06-08 16:51:32'),
(1414, 3, 39, '2024-06-08 16:53:20'),
(1415, 4, 57, '2024-06-08 17:12:20'),
(1417, 4, 51, '2024-06-09 09:34:18'),
(1418, 4, 31, '2024-06-09 09:41:39'),
(1419, 4, 37, '2024-06-09 09:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(4) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','basic') NOT NULL DEFAULT 'basic',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `user_type`, `created_at`) VALUES
(3, 'gigi', 'gigi@gmail.com', '$2y$10$r/LsY3XgUPBgwTr3XSo1ROUZ5LlCmWFZ3db4JC0qGgsg.hIWzYar6', 'admin', '2024-06-03 09:58:53'),
(4, 'duda', 'duda@duda.com', '$2y$10$dxrFLHSpBPibECAhD/R6.OOMSjKJ2YukAhR5cPhxU.VGfN1YRxD7K', 'basic', '2024-06-03 10:03:27'),
(13, 'gigig', 'duda@duda.comm', '$2y$10$SqsecAYO18tCNw349vZe0.cYEYbuOBSqAAyccaFmcjmttjFQwe0By', 'basic', '2024-06-03 11:04:47'),
(14, 'alice', 'alice@example.com', '$2y$10$wHPLZwHsdy1lNmzI7KH8J.QpJ60UqHcBjdA7s8lkl3E6Oa5.dE74a', 'basic', '2024-06-08 11:28:37'),
(15, 'bob', 'bob@example.com', '$2y$10$wHPLZwHsdy1lNmzI7KH8J.QpJ60UqHcBjdA7s8lkl3E6Oa5.dE74a', 'basic', '2024-06-08 11:28:37'),
(16, 'charlie', 'charlie@example.com', '$2y$10$wHPLZwHsdy1lNmzI7KH8J.QpJ60UqHcBjdA7s8lkl3E6Oa5.dE74a', 'basic', '2024-06-08 11:28:37'),
(17, 'dave', 'dave@example.com', '$2y$10$wHPLZwHsdy1lNmzI7KH8J.QpJ60UqHcBjdA7s8lkl3E6Oa5.dE74a', 'basic', '2024-06-08 11:28:37'),
(18, 'kaka', 'ka@ka.com', '$2y$10$okPvexv6RGwxGbA9JRq.PeZ.YkF3agzRbtZBiZQ0cP1cvMguOfpTC', 'basic', '2024-06-08 17:14:53'),
(19, 'dodo', 'do@do.com', '$2y$10$j5.RdNs5FgMl8jUV5nqZUe7vaW.lIX5vuwbhBNvejopqIwzm6M0lG', 'basic', '2024-06-09 09:43:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD UNIQUE KEY `unique_like` (`user_id`,`article_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=455;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1421;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
