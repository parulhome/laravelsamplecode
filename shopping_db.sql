-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2021 at 10:57 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custdetails`
--

CREATE TABLE `custdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custdetails`
--

INSERT INTO `custdetails` (`id`, `customer_email`, `customer_name`, `customer_city`, `created_at`, `updated_at`) VALUES
(1, 'nidhi.lad@gmail.com', 'Nidhi Lad', 'Singapore', '2021-03-08 05:28:46', NULL),
(2, 'nidhi.ladu@gmail.com', 'Nidhi Ladu', 'Singapore', '2021-03-08 05:28:46', NULL),
(3, 'testUser1@gmail.com', 'Test User1', 'Singapore', '2021-03-08 05:28:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2021_03_11_093613_create_category_table', 2),
(5, '2021_03_11_100423_create_product_table', 2),
(6, '2021_03_12_050905_create_orderdetails_table', 3),
(7, '2021_03_12_052614_create_custdetails_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `customer_email`, `product_name`, `product_code`, `quantity`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 100, 'nidhi.lad@gmail.com', 'Pant', 'P1232', 1, 34.00, '1615534153.png', '2021-03-11 05:18:58', NULL),
(2, 101, 'nidhi.lad@gmail.com', 'Tshirt', 'T24251', 2, 22.00, '1615534153.png', '2021-03-09 05:20:55', NULL),
(3, 101, 'nidhi.lad@gmail.com', 'Night Dress', 'N5351', 1, 33.00, '1615534153.png', '2021-03-09 05:20:55', NULL),
(4, 101, 'nidhi.lad@gmail.com', 'Pant', 'P1232', 1, 34.00, '1615534153.png', '2021-03-09 05:20:55', NULL),
(5, 102, 'testUser1@gmail.com', 'Pant', 'P1232', 1, 34.00, '1615534153.png', '2021-03-10 05:20:55', NULL),
(6, 102, 'testUser1@gmail.com', 'Night Dress', 'N5351', 1, 33.00, '1615534153.png', '2021-03-09 05:20:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `product_name`, `product_code`, `description`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'shirt', '0112', 'test123', 450.00, '1615535905.png', 1, '2021-03-11 04:31:25', '2021-03-11 23:58:25'),
(2, 1, 'Pant', 'P1232', 'Jeans', 34.00, '', 1, '2021-03-11 16:44:46', '2021-03-11 16:44:46'),
(3, 1, 'Tshirt', 'T24251', 'High Neck T shirt', 22.00, '', 1, '2021-03-11 16:45:20', '2021-03-11 16:45:20'),
(4, 1, 'Night Dress', 'N5351', 'Night Dress', 33.00, '', 1, '2021-03-11 16:46:17', '2021-03-11 16:46:17'),
(5, 1, 'testing product', 'F456', 'TestDescModified', 89.00, '1615537143.png', 0, '2021-03-11 23:29:13', '2021-03-12 00:19:03'),
(6, 1, 'shirt', 'S111', 'OfficeWear', 55.00, '1615536566.png', 1, '2021-03-12 00:09:26', '2021-03-12 00:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Nidhi Lad', 'nidhi.lad@gmail.com', NULL, '$2y$10$G6kkeRhR6/KzoFHeTch2R.wv5ft8JxhMlORrXujaMQZi0HdrH85WW', 0, NULL, '2021-03-09 22:58:37', '2021-03-09 22:58:37'),
(3, 'Vipul', 'vips@gmail.com', NULL, '$2y$10$7b5ONeibs1lTdmbfrGDAKecapfkg.T23fY2e0zS7aACGFqwvwNdoi', 1, NULL, '2021-03-10 18:45:45', '2021-03-10 18:45:45'),
(4, 'test20', 'nidhi.ladu@gmail.com', NULL, '$2y$10$A1hNeqlD5d88DLY9HBePVOHP9FZ4tWVFV8vNyEf/BoEsVlmaJdt4.', 0, NULL, '2021-03-11 16:25:16', '2021-03-11 16:25:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custdetails`
--
ALTER TABLE `custdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custdetails`
--
ALTER TABLE `custdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
