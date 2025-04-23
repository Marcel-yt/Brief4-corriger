-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 23 avr. 2025 à 10:55
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `todo_api`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_22_141513_create_tasks_table', 1),
(5, '2025_04_22_145346_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'cairocoders-ednalan', '509b525d894d777bd9291180e5474269af8724ad03f298470227d12bcc8bb3ad', '[\"*\"]', '2025-04-22 16:03:45', NULL, '2025-04-22 13:56:26', '2025-04-22 16:03:45'),
(2, 'App\\Models\\User', 2, 'cairocoders-ednalan', 'e9127659b2089c76ee1b5fd46f328e5be70479bc888026e9df3d5ccd7b05bb9a', '[\"*\"]', '2025-04-22 15:52:56', NULL, '2025-04-22 14:57:50', '2025-04-22 15:52:56'),
(3, 'App\\Models\\User', 1, 'cairocoders-ednalan', '8ab5d518f011113a7332415d59004e5507c971cfa78870cc0692a49809aa0ed5', '[\"*\"]', '2025-04-22 16:49:56', NULL, '2025-04-22 16:04:18', '2025-04-22 16:49:56'),
(4, 'App\\Models\\User', 1, 'cairocoders-ednalan', '9370edecd92901e71fbf3bfc3d8052edc9dacf5d5eaa55010db3675f232d645a', '[\"*\"]', NULL, NULL, '2025-04-22 17:07:25', '2025-04-22 17:07:25'),
(5, 'App\\Models\\User', 1, 'cairocoders-ednalan', 'ddc180074820ffdfb74b45f89cabee6de0816f8a75cd09c7c937f8e038b89b45', '[\"*\"]', NULL, NULL, '2025-04-22 17:07:46', '2025-04-22 17:07:46'),
(6, 'App\\Models\\User', 1, 'cairocoders-ednalan', 'e5ede21194bd6a80028d6a2763d49b8190b5d3a8886ed0ec64496ae189074f34', '[\"*\"]', '2025-04-22 17:08:50', NULL, '2025-04-22 17:08:35', '2025-04-22 17:08:50'),
(7, 'App\\Models\\User', 1, 'cairocoders-ednalan', 'a5b7ca7677f062e8ff3b10f539f85b2abcc26ea7e50d0e50311a55fe5bf3d1d5', '[\"*\"]', NULL, NULL, '2025-04-22 17:15:14', '2025-04-22 17:15:14'),
(8, 'App\\Models\\User', 1, 'cairocoders-ednalan', '4b17ce259726839528f6165583ca9b8ddc5bcb17da3382dc5f8b1d6cf375fdc2', '[\"*\"]', NULL, NULL, '2025-04-22 17:15:38', '2025-04-22 17:15:38'),
(9, 'App\\Models\\User', 1, 'cairocoders-ednalan', '69a38276a06be505ece693ee9989258f7d6ef2bbc2ff9c85bfa579cdc4c7cf50', '[\"*\"]', '2025-04-22 17:21:24', NULL, '2025-04-22 17:21:11', '2025-04-22 17:21:24'),
(10, 'App\\Models\\User', 1, 'cairocoders-ednalan', 'd574893957ee5f0bb7754acdabf4596c916a98bd51af72b3f4dbb4c70a82237c', '[\"*\"]', NULL, NULL, '2025-04-22 17:25:53', '2025-04-22 17:25:53'),
(11, 'App\\Models\\User', 1, 'cairocoders-ednalan', '71bf5e2adc22273e1f51b59402da2d88da29bcf069128af83ccd238834aaf7fd', '[\"*\"]', '2025-04-22 18:00:30', NULL, '2025-04-22 17:26:20', '2025-04-22 18:00:30'),
(12, 'App\\Models\\User', 1, 'cairocoders-ednalan', '522cdece7277df4810c78cfed92204aa9b633a3890100907da6f44b7823d962e', '[\"*\"]', '2025-04-23 06:38:20', NULL, '2025-04-23 05:23:59', '2025-04-23 06:38:20'),
(13, 'App\\Models\\User', 2, 'cairocoders-ednalan', '82bba8f84a78c6c0041afe690bab440172c213d7fa646a616352d2032584293e', '[\"*\"]', '2025-04-23 06:44:58', NULL, '2025-04-23 06:40:54', '2025-04-23 06:44:58'),
(14, 'App\\Models\\User', 2, 'cairocoders-ednalan', '2a23a9d9d606168939925184623f88172389d98726385366b6284da01f43271f', '[\"*\"]', '2025-04-23 06:55:33', NULL, '2025-04-23 06:54:25', '2025-04-23 06:55:33');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4rTnLyyzJCAxEUAVQP1Fqj13NtWhJR3rruhOvQLk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnQ3bTRwSkV0UXZVVkxIS2tVVExyR2xBeU5CQkJ1QlJoYnRYQWZwQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745389416);

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Tache 2', 'cette tache', 'completed', '2025-04-22 13:57:14', '2025-04-22 16:16:15'),
(3, 2, 'Ma première tâche', 'Description de la tâche', 'pending', '2025-04-22 15:06:45', '2025-04-22 15:06:45'),
(4, 2, 'Ma deuxieme tâche modifier', 'Description de la deuxieme tâche', 'completed', '2025-04-22 15:08:11', '2025-04-22 15:52:56'),
(6, 1, 'Tache 3', 'Description de la tache 3', 'pending', '2025-04-22 16:12:26', '2025-04-22 16:12:26'),
(7, 1, 'Tache de test', 'Description de la tache de test', 'pending', '2025-04-23 06:28:30', '2025-04-23 06:28:30'),
(8, 2, 'Ma troixieme tache', 'Description de ma troixieme tache', 'pending', '2025-04-23 06:43:01', '2025-04-23 06:43:01'),
(9, 2, 'Ma quatieme tache', 'Description de ma quatrieme tache', 'pending', '2025-04-23 06:44:46', '2025-04-23 06:44:46'),
(10, 2, 'TTTTTTTTTTTTTTTTTTTTTT', 'FFFFFFFFFFFFFFFFFFFFFFFFVBBBBBB', 'pending', '2025-04-23 06:54:50', '2025-04-23 06:54:50');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'FLORA', 'flora@gmail.com', NULL, '$2y$12$0HsaXBLYkc1oZQ2j38DtOeVTdS8iiCIgIylerpNUaLw.XM83QyJfG', NULL, '2025-04-22 13:55:53', '2025-04-22 13:55:53'),
(2, 'Marcel YAMI', 'marcel@gmail.com', NULL, '$2y$12$5DJxYFBsJOvpfGFhq.eMo.gXl4rgQcDbvG3KTv.DeA1iD04Pmx3TG', NULL, '2025-04-22 14:56:55', '2025-04-22 14:56:55');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
