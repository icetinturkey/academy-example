-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Kas 2024, 20:23:50
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kampuslms`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Bilgisayar - Bilişim'),
(2, 'Tehlikeli ve Çok Tehlikeli'),
(3, 'Sağlık Eğitimleri'),
(4, 'Yabancı Dil Eğitimleri'),
(5, 'Tarım ve Hayvancılık'),
(6, 'Eğitmenlik Eğitimleri'),
(7, 'Mesleki Eğitimler'),
(8, 'Kişisel Gelişim Eğitimleri'),
(9, 'Aile Grubu'),
(10, 'Emlak Grubu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
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
-- Tablo için tablo yapısı `jobs`
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
-- Tablo için tablo yapısı `job_batches`
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
-- Tablo için tablo yapısı `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `meb` tinyint(4) NOT NULL DEFAULT 0,
  `university` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `lessons`
--

INSERT INTO `lessons` (`id`, `image`, `title`, `category_id`, `price`, `meb`, `university`) VALUES
(1, 'https://www.uzaktanegitim.com/images/ders/sm/bilgisayar-kursu-meb-isletmenlik-kursu-meb-sertifikali-bilgisayar-kursu.webp', 'Bilgisayar İşletmenliği Sertifika Programı', 1, 6250, 1, 0),
(2, 'https://www.uzaktanegitim.com/images/ders/sm/uzaktan-egitim-net-yazilim-uzmanligi.webp', 'Yazılım Uzmanlığı Eğitimi', 1, 11250, 0, 1),
(3, 'https://www.uzaktanegitim.com/images/ders/sm/bilgisayar-programciligi-sertifikasi-meb-programcilik-egitimi.webp', 'Bilgisayar Programcılığı Sertifika Programı', 1, 5250, 0, 1),
(4, 'https://www.uzaktanegitim.com/images/ders/sm/dijital-pazarlama-egitimi.webp', 'Dijital Pazarlama Eğitimi', 1, 4250, 0, 1),
(5, 'https://www.uzaktanegitim.com/images/ders/sm/robotik-kodlama-egitmen-egitimi.webp', 'Robotik Kodlama Eğitimi', 1, 6500, 0, 1),
(6, 'https://www.uzaktanegitim.com/images/ders/sm/robotik-kodlama-egitimi-ileri-seviye.webp', 'İleri Seviye Robotik Kodlama Eğitimi', 1, 5250, 0, 1),
(7, 'https://www.uzaktanegitim.com/images/ders/sm/robotik-kodlama-egitimi-orta-seviye.webp', 'Robotik Kodlama Eğitimi 7+ Yaş', 1, 4750, 0, 1),
(8, 'https://www.uzaktanegitim.com/images/ders/sm/adli-bilisim-uzmanligi-sertifika-programi.webp', 'Adli Bilişim Uzmanlığı Sertifika Programı', 1, 5250, 0, 1),
(9, 'https://www.uzaktanegitim.com/images/ders/sm/python-egitimi-python-kursu-python-sertifikasi.webp', 'Sıfırdan İleri Seviye Python Eğitimi', 1, 9750, 0, 1),
(10, 'https://www.uzaktanegitim.com/images/ders/sm/robotik-kodlama-sertifika-egitimi.webp', 'Okul Öncesi Robotik Kodlama Eğitimi', 1, 4750, 0, 1),
(11, 'https://www.uzaktanegitim.com/images/ders/sm/steam-egitimi.webp', 'Stem Eğitimi', 1, 4500, 0, 1),
(12, 'https://www.uzaktanegitim.com/images/ders/sm/autocad-kursu-autocad-egitimi.webp', 'AutoCAD Eğitimi', 1, 7500, 0, 1),
(13, 'https://www.uzaktanegitim.com/images/ders/sm/web-tasarim-kursu.webp', 'Web Tasarım Kursu', 1, 3130, 0, 1),
(14, 'https://www.uzaktanegitim.com/images/ders/sm/grafik-tasarim-kursu.webp', 'Grafik Tasarım Kursu', 1, 3450, 0, 1),
(15, 'https://www.uzaktanegitim.com/images/ders/sm/ileri-excel-egitimi.webp', 'İleri Excel Eğitimi', 1, 3450, 0, 1),
(16, 'https://www.uzaktanegitim.com/images/ders/sm/sosyal-muhendislik-egitimi.webp', 'Sosyal Mühendislik Eğitimi', 1, 3450, 0, 1),
(17, 'https://www.uzaktanegitim.com/images/ders/sm/e-ticaret-egitimi.webp', 'E-Ticaret Eğitimi', 1, 4250, 0, 1),
(18, 'https://www.uzaktanegitim.com/images/ders/sm/sosyal-medya-uzmanligi-egitimi.webp', 'Sosyal Medya Uzmanlığı Eğitimi', 1, 4250, 0, 1),
(19, 'https://www.uzaktanegitim.com/images/ders/sm/solidworks-kursu.webp', 'Solidworks Kursu', 1, 3450, 0, 1),
(20, 'https://www.uzaktanegitim.com/images/ders/sm/metaverse-egitimi.webp', 'Metaverse Eğitimi', 1, 3450, 0, 1),
(21, 'https://www.uzaktanegitim.com/images/ders/sm/after-effects.webp', 'After Effects Eğitimi', 1, 3450, 0, 1),
(22, 'https://www.uzaktanegitim.com/images/ders/sm/3d-yazici-operatorlugu-egitimi.webp', '3D Yazıcı Operatörlüğü Eğitimi', 1, 3450, 0, 1),
(23, 'https://www.uzaktanegitim.com/images/ders/sm/photoshop-kursu.webp', 'Photoshop Kursu', 1, 0, 0, 1),
(24, 'https://www.uzaktanegitim.com/images/ders/sm/illustrator-kursu.webp', 'Illustrator Kursu', 1, 3450, 0, 1),
(25, 'https://www.uzaktanegitim.com/images/ders/sm/spss-egitimi.webp', 'SPSS Eğitimi', 1, 3450, 1, 0),
(26, 'https://www.uzaktanegitim.com/images/ders/sm/isg-egitimi.webp', 'İş Sağlığı ve Güvenliği Eğitimi', 2, 4500, 0, 1),
(27, 'https://www.uzaktanegitim.com/images/ders/sm/kaynakcilik-kursu.webp', 'Kaynakçılık Kursu', 2, 3450, 0, 1),
(28, 'https://www.uzaktanegitim.com/images/ders/sm/dogal-gaz-ic-tesisatcisi-kursu.webp', 'Doğalgaz İç Tesisatçısı Kursu', 2, 3450, 0, 1),
(29, 'https://www.uzaktanegitim.com/images/ders/sm/kombi-kursu.webp', 'Kombi Kursu', 2, 3450, 0, 1),
(30, 'https://www.uzaktanegitim.com/images/ders/sm/kimya-laboratuvari-parfum-kolonya-sabun-kursu.webp', 'Kimya Laboratuvarı Kursu', 2, 0, 0, 1),
(31, 'https://www.uzaktanegitim.com/images/ders/sm/cnc-lazer-kesim-operatoru-kursu.webp', 'CNC Lazer Kesim Operatörü Kursu', 2, 3450, 0, 1),
(32, 'https://www.uzaktanegitim.com/images/ders/sm/kar-kureme-araci-operatoru-kursu.webp', 'Kar Küreme Aracı Operatörü Kursu', 2, 3450, 0, 1),
(33, 'https://www.uzaktanegitim.com/images/ders/sm/kati-ve-sivi-yakitli-kalorifer-atescisi-egitimi.webp', 'Katı ve Sıvı Yakıtlı Kalorifer Ateşçisi Eğitimi', 2, 3450, 0, 1),
(34, 'https://www.uzaktanegitim.com/images/ders/sm/tibbi-dis-hasta-kabul.webp', 'Tıbbi, Diş, Hasta Kabul Sağlık Paketi', 3, 4950, 0, 1),
(35, 'https://www.uzaktanegitim.com/images/ders/sm/temel-ilk-yardim-egitimi.webp', 'Temel İlk Yardım Eğitimi', 3, 2450, 0, 1),
(36, 'https://www.uzaktanegitim.com/images/ders/sm/tibbi-sekreterlik-kursu.webp', 'Tıbbi Sekreterlik Kursu', 3, 2350, 0, 1),
(37, 'https://www.uzaktanegitim.com/images/ders/sm/hasta-kabul-kursu.webp', 'Hasta Kabul Kursu', 3, 2350, 0, 1),
(38, 'https://www.uzaktanegitim.com/images/ders/sm/ingilice-kursu-ingilizce-egitimi-online-uzaktan-egitim-ingilizce.webp', 'İngilizce Eğitimi', 4, 2000, 1, 0),
(39, 'https://www.uzaktanegitim.com/images/ders/sm/aricilik-kursu-aricilik-belgesi.webp', 'Arıcılık Kursu', 5, 3750, 0, 1),
(40, 'https://www.uzaktanegitim.com/images/ders/sm/bahcivanlik-kursu.webp', 'Bahçıvanlık Kursu', 5, 3450, 0, 1),
(41, 'https://www.uzaktanegitim.com/images/ders/sm/bahce-bakimi-ve-peyzaj-kursu.webp', 'Bahçe Bakımı ve Peyzaj Kursu', 5, 3450, 0, 1),
(42, 'https://www.uzaktanegitim.com/images/ders/sm/mantar-yetistiriciliigi-kursu.webp', 'Mantar Yetiştiriciliği Kursu', 5, 3450, 0, 1),
(43, 'https://www.uzaktanegitim.com/images/ders/sm/hazmat-egitimi.webp', 'Hazmat Eğitimi', 6, 3450, 0, 1),
(44, 'https://www.uzaktanegitim.com/images/ders/sm/hafizlik-ezberleme-egitimi.webp', 'Hafızlık Ezberleme Eğitimi Kurs Programı', 6, 3450, 0, 1),
(45, 'https://www.uzaktanegitim.com/images/ders/sm/cocuk-yogasi-egitmenlik-egitimi.webp', 'Çocuk Yogası Eğitmenlik Eğitimi', 6, 0, 0, 1),
(46, 'https://www.uzaktanegitim.com/images/ders/sm/motorlu-tasit-suruculeri-direksiyon-egitimi-ogreticiligi-kursu.webp', 'Motorlu Taşıt Sürücüleri Direksiyon Eğitimi Öğreticiliği Kursu', 6, 3450, 0, 1),
(47, 'https://www.uzaktanegitim.com/images/ders/sm/osmanli-turkcesi-ogreticiligi-kursu.webp', 'Osmanlı Türkçesi Öğreticiliği Kursu', 6, 3450, 0, 1),
(48, 'https://www.uzaktanegitim.com/images/ders/sm/engellilerde-temel-spor-egitmenligi-kursu.webp', 'Engellilerde Temel Spor Eğitmenliği Kursu', 6, 3450, 0, 1),
(49, 'https://www.uzaktanegitim.com/images/ders/sm/aile-danismanligi-kursu-sertifika-egitim-programi.webp', 'Aile Danışmanlığı Eğitimi', 7, 11250, 1, 0),
(50, 'https://www.uzaktanegitim.com/images/ders/sm/emlak-danismanligi-kursu-emlakcilik-sertifikasi.webp', 'Emlak Danışmanlığı Eğitimi Sertifika Programı', 7, 2450, 1, 0),
(52, 'https://www.uzaktanegitim.com/images/ders/sm/sihhi-tesisat-kursu.webp', 'Sıhhi Tesisat Kursu', 7, 3450, 0, 1),
(53, 'https://www.uzaktanegitim.com/images/ders/sm/diksiyon-egitimi.webp', 'Diksiyon Eğitimi', 8, 3750, 0, 1),
(54, 'https://www.uzaktanegitim.com/images/ders/sm/satranc-egitimi.webp', 'Satranç Eğitimi', 8, 4250, 0, 1),
(55, 'https://www.uzaktanegitim.com/images/ders/sm/zaman-yonetimi-egitimi.webp', 'Zaman Yönetimi Eğitimi', 8, 1750, 1, 0),
(56, 'https://www.uzaktanegitim.com/images/ders/sm/hizli-okuma-kursu.webp', 'Hızlı Okuma Kursu', 8, 1750, 1, 0),
(58, 'https://www.uzaktanegitim.com/images/ders/sm/aile-ve-iliski-koclugu-egitimi-sertifika-programi.webp', 'Evlilik ve İlişki Danışmanlığı Eğitimi', 9, 7950, 0, 1),
(59, 'https://www.uzaktanegitim.com/images/ders/sm/ozel-egitim-kursu.webp', 'Özel Eğitim Kursu', 9, 4000, 0, 1),
(60, 'https://www.uzaktanegitim.com/images/ders/sm/cocuk-gelisimi-kursu.webp', 'Çocuk Gelişim Kursu', 9, 3250, 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
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
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('jwmFQ6Dgpbxs4itE8SXK6HzEIfOKNnObvRdQQQgY', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:132.0) Gecko/20100101 Firefox/132.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS21mQUgyeFlSZTVxTlEwMk1oMTBDZHhmNnBtZDB4NnhiV1hVRkFQMyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1730489008);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
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
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'contact@ismailcetin.dev', NULL, '$2y$12$s0EpCY0zLkGfb/sOQWGOXOZL4nNGJ0mMoaexwxCsDNFqxZUhlMSPq', NULL, '2024-10-31 13:02:27', '2024-10-31 13:02:27');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_FK_1` (`category_id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_FK_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
