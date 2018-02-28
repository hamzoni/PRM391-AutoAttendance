-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2018 at 05:53 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prm`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Alivia Kilback', 'heaney.kirstin@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'kuOKrBGb2V', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(2, 'Julianne Roberts', 'janick.wintheiser@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'pEgEw6QhjV', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(3, 'Mr. Noah Barrows', 'kessler.raegan@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'PtY16x0miM', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(4, 'Andreanne Reichert', 'zprice@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'DCsSiu1QXI', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(5, 'Felix Willms', 'emmet.schaefer@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'tfbLmYwKgg', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(6, 'Alana Lebsack', 'merl.bode@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'Izzct9K9RG', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(7, 'Mr. D\'angelo Windler DVM', 'ugorczany@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'JHGzxUmVBU', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(8, 'Nathanial Miller', 'bins.bridget@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'zbt3ODuyXY', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(9, 'Maxie Ward', 'lubowitz.callie@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '9C25vsyzKZ', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(10, 'Ms. Idell Treutel IV', 'llewellyn23@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'LPOjoyVWfq', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(11, 'Dr. Velva Kilback', 'julien35@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'G5JEqO3uYR', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(12, 'Dr. Zola Kub II', 'erin.ledner@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'A3hkRzkh2u', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(13, 'Randal Ratke III', 'stoltenberg.lulu@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'fpN9nBWrGu', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(14, 'Mr. Nicolas Ward', 'rosamond.green@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'ImP4IDcx9Z', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(15, 'Electa Hauck MD', 'vconnelly@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'CqzcQOjxIo', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(16, 'Ms. Tatyana Russel', 'toy62@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, '1y1zM9D3rk', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(17, 'Dawson Morar', 'runolfsson.rosetta@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'gD8jBiGzYe', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(18, 'Israel Huel', 'emory77@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'ku2kfHgd5p', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(19, 'Keon Kilback', 'dianna.connelly@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'E4mvwSCkYX', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(20, 'Dr. Marley Gislason IV', 'senger.austin@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, '2E0NcvjCMu', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(21, 'Holly Pacocha', 'omacejkovic@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'jeDsDymVe7', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(22, 'Weston Von', 'hubert.towne@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'c2NF4c2B9z', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(23, 'Rosa Kshlerin', 'imraz@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'OCqgbgQwBy', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(24, 'Tristin Koss DVM', 'wboehm@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '7E964Hbr06', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(25, 'Alfredo Veum Sr.', 'okunde@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'oPtqnfnIKt', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(26, 'Eryn Cormier', 'jimmy57@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'avlmJAFLtx', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(27, 'Destini McLaughlin DVM', 'leda88@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'mGgBj555rk', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(28, 'Amaya Kozey', 'pwindler@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'poFR8SKFlH', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(29, 'Theodora Gleason IV', 'macejkovic.elinor@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'lVkXWnkup5', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(30, 'Kory Conroy', 'gene.borer@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'S7ayn5l3IV', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(31, 'Leonora Hyatt', 'imani50@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'OwfHhM0Zks', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(32, 'Laurianne Trantow MD', 'pwilkinson@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '3kj3FBgjfJ', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(33, 'Kim Gerhold', 'bergstrom.antwan@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, '2XMl7u8yTC', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(34, 'Addison Baumbach', 'tomasa49@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'V8wbni8JNG', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(35, 'Marlin Kertzmann', 'casper.natalie@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'xYZ73rmmPv', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(36, 'Ms. Misty Tillman MD', 'waino.spinka@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'kNtSvhCOgH', '2018-02-28 08:02:48', '2018-02-28 08:02:48'),
(37, 'Prof. Perry Shields I', 'bruen.danielle@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'ROPO1538F3', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(38, 'Prof. Boris Hahn', 'keeling.timmothy@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '7xcXjZzPIL', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(39, 'Albertha Bahringer', 'antonina37@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'W9owLtY2ab', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(40, 'Ardella Reilly', 'rowena14@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'vH78SooUhX', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(41, 'Peyton Little', 'hammes.deron@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'cWpXEhHmJX', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(42, 'Barrett Goyette', 'weimann.percival@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '83HdyFoLGo', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(43, 'Orie Bogan', 'qleffler@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'F4hMX4KCD2', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(44, 'Dr. Rashad Wolff Sr.', 'junius63@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'ELlIGowSaE', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(45, 'Dr. Cullen Hudson II', 'orval10@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'cAr2tRm1eD', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(46, 'Tatyana Schmidt', 'krussel@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '1yCo0IYWRo', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(47, 'Dee Lockman', 'eglover@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'JOkuHv9ao7', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(48, 'Prof. Triston Howe DVM', 'ritchie.kamron@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'DLZSO68m8h', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(49, 'Orrin Wilkinson', 'bjacobi@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '1ZHrKIY8ff', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(50, 'Lela Wisozk', 'casandra79@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'DBdwACKWnX', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(51, 'Miss Donna Boehm DVM', 'leo25@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'BSog2PSRqW', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(52, 'Estevan Dooley', 'hyman39@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '32uJtfyKuP', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(53, 'Miss Felicity Hermann V', 'eugene36@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'wS8MSAgkJs', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(54, 'Dr. Joe Wunsch MD', 'emitchell@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'hxLLrqTx5m', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(55, 'Annalise Parisian', 'xmarquardt@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'dJoZUs4TtC', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(56, 'Manuel Brown', 'vtillman@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'qiLhGTYMAE', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(57, 'Dr. Era Mertz I', 'rose82@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'HGXyQefrnS', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(58, 'Lyla Kris', 'randall.smitham@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'nS5XXjIgkK', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(59, 'Alize Stamm MD', 'gladys.spinka@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'LPWjZ7rL5B', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(60, 'Vella Crooks IV', 'jenkins.jamarcus@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'bBGfdQxGmF', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(61, 'Joany Raynor II', 'alta61@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'jae3p72jBC', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(62, 'Roosevelt Robel', 'yfunk@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'u3JTgNRfHg', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(63, 'Hallie Johnston PhD', 'cwaters@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '32VOlLkDKK', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(64, 'Maudie Russel', 'marlene34@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'CDaDDb6bvp', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(65, 'Chaya O\'Connell', 'aveum@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'HEhZRQQMT7', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(66, 'Lysanne Huels', 'ryleigh.legros@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '8dvLdfptp4', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(67, 'Prof. Tremayne Nolan', 'lauryn.cruickshank@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'Z3DeX8lGAO', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(68, 'Aditya Bechtelar', 'turcotte.cierra@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'jETvDWK9kA', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(69, 'Shania Bartell', 'barrows.fernando@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'JatP6hCPEb', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(70, 'Joannie Heaney', 'shaina26@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'Tu2zvPWB6D', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(71, 'Prof. Hobart Batz', 'alvena44@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'LieYmSU4BB', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(72, 'Mrs. Jena Greenholt', 'helen27@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'OB0xP3Xnoe', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(73, 'Mrs. Leonor Rodriguez', 'vkub@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'DzbJl3llJT', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(74, 'Marquise Abshire III', 'ffeil@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '7Bajg1jEtm', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(75, 'Alvera Blick', 'magnus84@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'fiQ8r09NYE', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(76, 'Gerhard Jenkins', 'sonia06@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'FADiL9BZrr', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(77, 'Trevion Funk', 'timothy83@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'GDIgjQ6p2j', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(78, 'Prof. Lydia Fritsch PhD', 'marc24@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '3XoqMf3yRa', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(79, 'Miss Velma Vandervort I', 'qbechtelar@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'zOWrgCc7cy', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(80, 'Prof. Eugenia Kling', 'beatty.oda@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, '2oN2J5zADh', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(81, 'Grover Reilly', 'white.cyrus@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'fJYWycUtS6', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(82, 'Prof. Vallie Cronin', 'ghintz@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'LcWi9U3cNy', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(83, 'Prof. Addison Hand DDS', 'bobby.goodwin@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'kU7zr3pbYm', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(84, 'Cassie Toy IV', 'libbie51@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'iMA4Dtebdp', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(85, 'Mr. Lawrence Daugherty', 'ekuphal@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'fHf94fknLW', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(86, 'Prof. Dion Strosin', 'christiana.conn@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'ySVKATdFGP', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(87, 'Prof. Kennith Schaefer IV', 'stracke.lazaro@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'PfBo7SxaDD', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(88, 'June Effertz', 'brakus.elbert@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'qzr95BBFPZ', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(89, 'Roscoe Reilly Jr.', 'xheathcote@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'A8XwBSLRlP', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(90, 'Helena Fadel Jr.', 'vfranecki@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'VP2xRUbi1x', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(91, 'Lisandro Leuschke Jr.', 'anastasia.leannon@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 1, 'pMtmxHTgvD', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(92, 'Krista Rice', 'lemmerich@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'Fbhlk6UYS8', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(93, 'Ronny Beier', 'jgibson@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, '1CxhEl1Q8B', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(94, 'Enrique Barrows', 'ariane78@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'fDa6mxgvm3', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(95, 'Phoebe Olson', 'zkuvalis@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'zloBUhcdVC', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(96, 'Mr. Tre Skiles', 'hellen69@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'u0BumxYbcr', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(97, 'Selena Smith', 'labadie.travon@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'o8KohYIPRd', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(98, 'Dr. Ezra Stehr', 'yasmin90@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'wfuegGGScQ', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(99, 'Julian Olson', 'fhowe@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 2, 'oxQEHQHC7l', '2018-02-28 08:02:49', '2018-02-28 08:02:49'),
(100, 'Miss Luna Fisher', 'gina16@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 0, 'dX1CkrXbRl', '2018-02-28 08:02:49', '2018-02-28 08:02:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
