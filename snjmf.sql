-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Maio-2022 às 21:06
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `snjmf`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `amigos`
--

CREATE TABLE `amigos` (
  `pessoa1` int(11) NOT NULL,
  `pessoa2` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `amigos`
--

INSERT INTO `amigos` (`pessoa1`, `pessoa2`, `status`, `id`) VALUES
(48, 52, 1, 60),
(44, 52, 1, 68),
(44, 50, 1, 69),
(44, 49, 1, 70),
(44, 48, 1, 71),
(44, 53, 1, 72);

-- --------------------------------------------------------

--
-- Estrutura da tabela `anuncios`
--

CREATE TABLE `anuncios` (
  `id` int(11) NOT NULL,
  `midia` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `idConta` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `idPub` int(11) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `comentarios`
--

INSERT INTO `comentarios` (`id`, `idConta`, `texto`, `idPerfil`, `idPub`, `datetime`) VALUES
(31, '44', 'oi', 48, 211, '2022-05-15 13:47:52'),
(32, '44', 'aiai kkj', 44, 207, '2022-05-15 13:48:02'),
(33, '48', 'ola', 48, 211, '2022-05-15 13:48:37'),
(34, '48', 'Ola', 44, 207, '2022-05-15 13:49:16'),
(35, '50', 'auau', 50, 218, '2022-05-15 13:56:21'),
(36, '50', 'Baitingas', 48, 211, '2022-05-15 13:57:29'),
(37, '50', 'nao', 48, 204, '2022-05-15 13:58:06'),
(38, '50', 'aaaa', 44, 207, '2022-05-15 13:58:27'),
(39, '44', 'Doida', 49, 219, '2022-05-15 14:37:54'),
(40, '44', 'nha', 44, 201, '2022-05-15 19:25:10'),
(41, '44', 'miau', 44, 201, '2022-05-15 19:41:30'),
(42, '44', 'aaaaaaaaaasdfas', 44, 201, '2022-05-15 20:07:41'),
(43, '44', 'adfas dfasdf', 44, 201, '2022-05-15 20:07:46'),
(44, '44', 'aa', 44, 203, '2022-05-17 21:33:47'),
(45, '44', 'Dida', 49, 219, '2022-05-17 21:41:50'),
(46, '44', 'Biruta', 49, 219, '2022-05-17 21:41:53'),
(47, '44', 'Bocó', 49, 219, '2022-05-17 21:41:56'),
(48, '44', '😒👌', 49, 219, '2022-05-17 21:42:09'),
(49, '44', '🎈', 49, 219, '2022-05-17 21:42:53'),
(50, '44', '[][][][][][]', 49, 219, '2022-05-17 21:43:04'),
(51, '44', 'kj', 49, 219, '2022-05-17 21:43:09'),
(52, '44', 'kjjh', 49, 219, '2022-05-17 21:43:09'),
(53, '44', '23', 49, 219, '2022-05-17 21:43:17'),
(54, '49', 'lidia', 49, 219, '2022-05-18 07:27:13'),
(55, '44', 'joao vitor', 50, 218, '2022-05-18 07:33:29'),
(56, '44', 'boba', 49, 219, '2022-05-18 07:34:05'),
(57, '44', 'se', 49, 219, '2022-05-18 07:34:22'),
(58, '44', 'x', 49, 219, '2022-05-18 07:34:24'),
(59, '44', 'Ravele chata', 49, 219, '2022-05-18 08:04:22'),
(60, '44', 'gfsdgfsdgfd', 48, 206, '2022-05-18 08:05:13'),
(62, '44', 'sdfg', 44, 231, '2022-05-20 21:22:55'),
(63, '44', 'aaaa', 44, 230, '2022-05-20 21:22:59'),
(64, '44', 'mim der', 44, 222, '2022-05-20 21:29:36'),
(65, '44', 'asdfdsa', 44, 222, '2022-05-20 21:29:39'),
(66, '44', 'oishiiiiiiii', 44, 222, '2022-05-20 21:29:42'),
(67, '44', 'asdf', 44, 231, '2022-05-20 21:59:49'),
(68, '44', 'ola', 44, 227, '2022-05-21 12:19:08'),
(69, '48', 'oi', 48, 205, '2022-05-21 12:23:59'),
(70, '48', 'kwkwke', 48, 205, '2022-05-21 12:24:03'),
(71, '44', 'fake?', 48, 206, '2022-05-21 13:10:02'),
(72, '44', 'asdf', 44, 252, '2022-05-21 17:09:33'),
(73, '44', 'sadf', 44, 252, '2022-05-21 17:09:36'),
(74, '44', 'mingau', 44, 251, '2022-05-21 17:09:59'),
(75, '44', 'aa', 44, 257, '2022-05-21 20:44:21'),
(76, '44', 'oi', 48, 260, '2022-05-21 20:47:48'),
(77, '44', 'oi', 48, 260, '2022-05-21 20:58:38'),
(78, '44', 'ashuashua', 44, 249, '2022-05-22 12:17:34'),
(79, '44', 'DSLAFL SDFKA SDKFA KSDFK SAKDF KSADFK SADKF AKSDFK SADKF SAKDF KASDFK ASKDF KASDFKA SDKF ASKDF AKSDFK ASDKF ASKDF KASDFK ASDKF SKADF KSADF KASDFK ASDKF ASKDF KASDF KASDFK SADKF ASKDF AKSDFK ASDFK ASKD', 44, 257, '2022-05-22 12:40:18'),
(80, '44', 'j', 44, 257, '2022-05-22 12:40:31'),
(81, '44', 'asdf sad', 44, 257, '2022-05-22 12:40:52'),
(82, '44', '', 44, 257, '2022-05-22 12:42:47'),
(83, '44', 'oi kk', 44, 257, '2022-05-22 12:43:55'),
(84, '44', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa ', 44, 257, '2022-05-22 12:44:40'),
(85, '44', 'RGH', 44, 257, '2022-05-22 12:44:50'),
(86, '44', 'asdf', 44, 257, '2022-05-22 12:47:43'),
(87, '44', 'MMMMMMMMMMMMMMMMMMMM', 44, 257, '2022-05-22 12:47:51'),
(88, '44', 'queeeeeeee', 44, 257, '2022-05-22 12:52:50'),
(89, '44', 'teste', 48, 260, '2022-05-22 12:54:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas`
--

CREATE TABLE `contas` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `verificado` tinyint(4) NOT NULL,
  `criacao` datetime NOT NULL DEFAULT current_timestamp(),
  `tema` tinyint(4) NOT NULL DEFAULT 0,
  `nascimento` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `contas`
--

INSERT INTO `contas` (`id`, `nome`, `sobrenome`, `email`, `senha`, `status`, `verificado`, `criacao`, `tema`, `nascimento`, `role`) VALUES
(44, 'Whoami', 'Steakmeat', 'geronimo@gmail.com', 'Z2VsZmZnZWxmZjAwMQ==', 1, 0, '0000-00-00 00:00:00', 0, '2003-09-29', 2),
(48, 'Admin', 'Presente', 'admin@gmail.com', 'MTIzNDU2Nzg=', 0, 1, '0000-00-00 00:00:00', 0, '1221-05-16', 1),
(49, 'Leticia', 'Moeda', 'leticia@gmail.com', 'MTIzNDU2Nzht', 0, 0, '0000-00-00 00:00:00', 0, '2020-05-09', 1),
(50, 'Mesa', 'Quadrada', 'mesa@gmail.com', 'MTIzNDU2Nzg=', 0, 0, '0000-00-00 00:00:00', 0, '2020-05-09', 1),
(52, 'Idade', 'Teste', 'idade@gmail.com', 'aWRhZGVpZGFkZWlkYWRl', 0, 0, '0000-00-00 00:00:00', 0, '2003-09-29', 1),
(53, 'Teste', 'Teste', 'teste@testes.te', 'dGVzdGV0ZXN0ZQ==', 0, 0, '2022-05-22 12:52:10', 0, '2020-05-09', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curtidas`
--

CREATE TABLE `curtidas` (
  `id` int(11) NOT NULL,
  `idPub` int(11) NOT NULL,
  `idConta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `curtidas`
--

INSERT INTO `curtidas` (`id`, `idPub`, `idConta`) VALUES
(45, 172, 44),
(47, 203, 48),
(48, 206, 44),
(49, 207, 48),
(50, 207, 44),
(51, 211, 50),
(52, 207, 50),
(54, 219, 44),
(65, 202, 44),
(66, 201, 44),
(67, 200, 44),
(69, 219, 49),
(70, 211, 44),
(85, 225, 44),
(87, 205, 48),
(89, 231, 44),
(90, 220, 44),
(91, 203, 44),
(92, 245, 48),
(93, 244, 48),
(95, 245, 44),
(97, 250, 44),
(98, 259, 48),
(101, 257, 44),
(103, 249, 44),
(104, 260, 44);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs`
--

CREATE TABLE `logs` (
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `type` tinyint(4) NOT NULL,
  `macaddr` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `logs`
--

INSERT INTO `logs` (`token`, `data`, `type`, `macaddr`) VALUES
('87bda2750c425471aa795969ef2c3750', '2022-05-14 16:46:08', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 16:47:00', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 16:48:54', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 16:55:29', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 16:56:10', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 17:26:04', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 18:00:32', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 18:00:52', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 18:06:15', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:07:56', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:12:15', 0, '12-02-F8-0F-DD-D8'),
('d1ca18cecaa470117672980092647dfe', '2022-05-14 18:12:40', 1, '12-02-F8-0F-DD-D8'),
('d1ca18cecaa470117672980092647dfe', '2022-05-14 18:16:10', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:16:32', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:18:49', 0, '12-02-F8-0F-DD-D8'),
('d1ca18cecaa470117672980092647dfe', '2022-05-14 18:26:17', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:27:14', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:27:31', 1, '12-02-F8-0F-DD-D8'),
('d1ca18cecaa470117672980092647dfe', '2022-05-14 18:34:14', 0, '12-02-F8-0F-DD-D8'),
('1450ac4f6a279fe0d3c0341f6b53e2d5', '2022-05-14 18:34:55', 1, '12-02-F8-0F-DD-D8'),
('1450ac4f6a279fe0d3c0341f6b53e2d5', '2022-05-14 18:36:42', 0, '12-02-F8-0F-DD-D8'),
('3f009d72559f51e7e454b16e5d0687a1', '2022-05-14 18:39:37', 1, '12-02-F8-0F-DD-D8'),
('3f009d72559f51e7e454b16e5d0687a1', '2022-05-14 18:39:51', 0, '12-02-F8-0F-DD-D8'),
('70b03db954aa45fc2559e85f5d5bd13e', '2022-05-14 18:40:12', 1, '12-02-F8-0F-DD-D8'),
('70b03db954aa45fc2559e85f5d5bd13e', '2022-05-14 18:45:57', 0, '12-02-F8-0F-DD-D8'),
('3f009d72559f51e7e454b16e5d0687a1', '2022-05-14 18:48:35', 1, '12-02-F8-0F-DD-D8'),
('3f009d72559f51e7e454b16e5d0687a1', '2022-05-14 18:48:49', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:51:40', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 18:58:01', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 18:58:52', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 19:09:45', 0, '12-02-F8-0F-DD-D8'),
('d41d8cd98f00b204e9800998ecf8427e', '2022-05-14 19:09:46', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 19:10:11', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 19:10:31', 0, '12-02-F8-0F-DD-D8'),
('d41d8cd98f00b204e9800998ecf8427e', '2022-05-14 19:10:32', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 19:10:40', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 19:11:11', 0, '12-02-F8-0F-DD-D8'),
('d41d8cd98f00b204e9800998ecf8427e', '2022-05-14 19:11:12', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 19:11:32', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 19:24:58', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 19:27:01', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 21:07:49', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-14 21:52:42', 0, '12-02-F8-0F-DD-D8'),
('0ccd57151d16316e2f7b559451fa74d0', '2022-05-14 21:52:53', 1, '12-02-F8-0F-DD-D8'),
('0ccd57151d16316e2f7b559451fa74d0', '2022-05-14 23:12:55', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 23:35:07', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-14 23:43:41', 0, '12-02-F8-0F-DD-D8'),
('0ccd57151d16316e2f7b559451fa74d0', '2022-05-15 00:04:11', 0, '12-02-F8-0F-DD-D8'),
('0ccd57151d16316e2f7b559451fa74d0', '2022-05-15 10:46:16', 1, '12-02-F8-0F-DD-D8'),
('0ccd57151d16316e2f7b559451fa74d0', '2022-05-15 10:47:36', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-15 10:50:26', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-15 12:41:34', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 12:41:54', 1, '12-02-F8-0F-DD-D8'),
('5d12046b9f3c36558fbe2ddded0f1278', '2022-05-15 13:40:34', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-15 13:48:31', 1, '12-02-F8-0F-DD-D8'),
('6823866ace2a7b75da481cd3d2952952', '2022-05-15 13:55:07', 1, '12-02-F8-0F-DD-D8'),
('6823866ace2a7b75da481cd3d2952952', '2022-05-15 13:59:25', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-15 14:00:01', 0, '12-02-F8-0F-DD-D8'),
('5d12046b9f3c36558fbe2ddded0f1278', '2022-05-15 14:03:02', 1, '12-02-F8-0F-DD-D8'),
('5d12046b9f3c36558fbe2ddded0f1278', '2022-05-15 14:03:28', 0, '12-02-F8-0F-DD-D8'),
('5d12046b9f3c36558fbe2ddded0f1278', '2022-05-15 14:03:36', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 14:04:23', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 14:37:42', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 14:38:37', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 19:01:52', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 19:59:48', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 20:02:06', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-15 20:18:35', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-17 21:32:26', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-17 21:53:37', 0, '12-02-F8-0F-DD-D8'),
('5d12046b9f3c36558fbe2ddded0f1278', '2022-05-18 07:26:42', 1, ''),
('5d12046b9f3c36558fbe2ddded0f1278', '2022-05-18 07:31:15', 0, ''),
('87bda2750c425471aa795969ef2c3750', '2022-05-18 07:31:40', 1, ''),
('87bda2750c425471aa795969ef2c3750', '2022-05-18 09:17:31', 1, ''),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-18 09:56:53', 1, ''),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-18 10:02:08', 0, ''),
('24f11086e35dda50577a03a01e570434', '2022-05-18 10:03:43', 1, ''),
('24f11086e35dda50577a03a01e570434', '2022-05-18 10:15:52', 0, ''),
('87bda2750c425471aa795969ef2c3750', '2022-05-20 20:56:03', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 12:18:55', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 12:23:43', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 14:11:26', 0, '12-02-F8-0F-DD-D8'),
('64609781bc6c1e2c99f7870f7070b4ab', '2022-05-21 14:17:24', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 16:21:18', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 16:21:27', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 16:21:36', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 16:26:43', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 16:26:51', 1, '12-02-F8-0F-DD-D8'),
('64609781bc6c1e2c99f7870f7070b4ab', '2022-05-21 16:47:45', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 16:47:54', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 17:14:59', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 17:15:30', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 17:18:11', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 17:24:06', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 18:44:55', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 18:49:19', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 19:55:04', 1, '12-02-F8-0F-DD-D8'),
('5d12046b9f3c36558fbe2ddded0f1278', '2022-05-21 20:24:48', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 20:35:26', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 20:49:57', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 20:50:04', 0, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 20:50:13', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 20:53:33', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-21 20:53:41', 1, '12-02-F8-0F-DD-D8'),
('75d23af433e0cea4c0e45a56dba18b30', '2022-05-21 21:20:47', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 11:31:16', 1, '12-02-F8-0F-DD-D8'),
('84c513cc9591ed375d71f77cafa125f1', '2022-05-22 12:52:24', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 13:03:51', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 13:18:47', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 13:22:31', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 13:25:22', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 14:39:10', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 14:47:07', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 15:08:57', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 15:09:46', 1, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 15:10:30', 0, '12-02-F8-0F-DD-D8'),
('87bda2750c425471aa795969ef2c3750', '2022-05-22 15:12:10', 1, '12-02-F8-0F-DD-D8');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `pessoa1` int(11) NOT NULL,
  `pessoa2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `type`, `pessoa1`, `pessoa2`) VALUES
(25, 0, 48, 44),
(26, 2, 44, 48),
(27, 0, 52, 44),
(28, 2, 44, 52),
(29, 1, 52, 44),
(30, 3, 44, 52),
(31, 0, 49, 44),
(32, 2, 44, 49),
(33, 0, 52, 48),
(34, 2, 48, 52),
(35, 0, 49, 48),
(36, 2, 48, 49),
(37, 1, 49, 48),
(38, 3, 48, 49),
(39, 4, 44, 44),
(40, 4, 48, 44),
(41, 5, 44, 44),
(42, 6, 44, 44),
(43, 5, 44, 44),
(44, 5, 48, 44),
(45, 4, 48, 44),
(46, 6, 48, 44),
(47, 1, 49, 44),
(48, 3, 44, 49),
(49, 0, 49, 44),
(50, 2, 44, 49),
(51, 0, 52, 44),
(52, 2, 44, 52),
(53, 0, 50, 44),
(54, 2, 44, 50),
(55, 1, 48, 44),
(56, 3, 44, 48),
(57, 0, 52, 44),
(58, 2, 44, 52),
(59, 1, 48, 44),
(60, 3, 44, 48),
(61, 0, 50, 44),
(62, 2, 44, 50),
(63, 1, 48, 44),
(64, 3, 44, 48),
(65, 0, 52, 44),
(66, 2, 44, 52),
(67, 1, 48, 44),
(68, 3, 44, 48),
(69, 1, 48, 44),
(70, 3, 44, 48),
(71, 1, 48, 44),
(72, 3, 44, 48),
(73, 1, 48, 44),
(74, 3, 44, 48),
(75, 0, 52, 44),
(76, 2, 44, 52),
(77, 0, 50, 44),
(78, 2, 44, 50),
(79, 0, 49, 44),
(80, 2, 44, 49),
(81, 0, 48, 44),
(82, 2, 44, 48),
(93, 4, 48, 44),
(94, 5, 48, 44),
(95, 7, 48, 44),
(96, 0, 53, 44),
(97, 2, 44, 53);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `apelido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capa` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biografia` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `turma` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `apelido`, `capa`, `biografia`, `turma`, `foto`) VALUES
(44, '', 'aeb2ce46ef889016c9f12adc9f409d1f.jpg', 'bom dia', 'adm3', 'aeb2ce46ef889016c9f12adc9f409d1f.jpg'),
(48, '', '1fecf073b98db40397dfdfcd4772d79b.jpg', '👀', 'none', '1fecf073b98db40397dfdfcd4772d79b.jpg'),
(49, '', 'bf8f2526c0773f86d83f98c2deb845d2.jpg', '🧚‍♀️', 'inf3', 'bf8f2526c0773f86d83f98c2deb845d2.jpg'),
(50, '', '3cd1d46adb3cf2c454fc00ab9dabcba5.jpg', 'Escreva algo legal :)', 'inf3', '3cd1d46adb3cf2c454fc00ab9dabcba5.jpg'),
(52, '', 'capa.png', 'bom dia', 'adm1', '4dcecbd5dc35da7a82cc0443c410b768.jpg'),
(53, '', 'capa.png', 'Escreva algo legal :)', 'none', 'e928ef885d56327ef169a9600eedff4e.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacoes`
--

CREATE TABLE `publicacoes` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `midia` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `privacidade` int(11) NOT NULL DEFAULT 0,
  `denuncias` int(11) NOT NULL DEFAULT 0,
  `idConta` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `comp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `publicacoes`
--

INSERT INTO `publicacoes` (`id`, `data`, `midia`, `texto`, `likes`, `privacidade`, `denuncias`, `idConta`, `idPerfil`, `comp`) VALUES
(196, '2022-05-14 22:35:01', 'f65ece716cd506afdc73431fc1a50a5e.jpg', 'as', 0, 0, 0, 44, 44, 0),
(200, '2022-05-14 22:52:07', 'nil', 'mim der', 1, 0, 0, 44, 44, 0),
(201, '2022-05-14 22:52:39', 'nil', 'ghdfghg', 1, 0, 0, 44, 44, 0),
(202, '2022-05-14 22:58:31', 'nil', 'hora certa?', 1, 0, 0, 44, 44, 0),
(203, '2022-05-14 23:09:38', '6627d1274f00b329f71d75112d9aeb87.jpg', '...', 2, 0, 0, 44, 44, 0),
(204, '2022-05-14 23:35:17', 'nil', 'bom dia', 0, 0, 0, 48, 48, 0),
(205, '2022-05-14 23:36:15', 'd896337d10faf478a6b17479136e5f79.jpg', 'Hoje tem aula livre', 1, 0, 0, 48, 48, 0),
(206, '2022-05-14 23:43:20', '155529d81e827b4e2db1594128da3b52.jpg', '😱', 1, 0, 0, 48, 48, 0),
(211, '2022-05-15 10:51:28', 'nil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nunc quam, iaculis at tristique quis, ullamcorper at nulla. Aliquam id volutpat odio. Proin enim libero, placerat vitae augue id, aliquam fringilla tellus. Maecenas ornare justo nec nisl tristique consectetur. Pellentesque placerat lacinia nulla, non lacinia augue viverra vel. Curabitur facilisis at ante sit amet varius. Phasellus semper semper finibus. Mauris pellentesque urna lacus, non pretium arcu pretium porta. Nulla eget dignis', 2, 0, 0, 48, 48, 0),
(218, '2022-05-15 13:56:15', 'nil', 'Nhem nhem', 0, 0, 0, 50, 50, 1),
(219, '2022-05-15 14:15:03', 'nil', 'я голоден🌻', 2, 0, 0, 49, 49, 3),
(232, '2022-05-21 12:35:59', '27048aa6d48fd9654ceab76afd929925.jpg', 'a', 0, 0, 0, 44, 44, 0),
(243, '2022-05-21 13:24:24', 'nil', '<a href=\'/perfil/48\'>Admin Presente</a>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nunc quam, iaculis at tristique quis, ullamcorper at nulla. Aliquam id volutpat odio. Proin enim libero, placerat vitae augue id, aliquam fringilla tellus. Maecenas ornare justo nec nisl tristique consectetur. Pellentesque placerat lacinia nulla, non lacinia augue viverra vel. Curabitur facilisis at ante sit amet varius. Phasellus semper semper finibus. Mauris pellentesque urna lacus, non pretium arcu pretium porta. Nulla eget dignis', 0, 0, 0, 44, 48, 0),
(244, '2022-05-21 13:44:37', 'nil', '<a href=\'/perfil/49\'>Leticia Moeda</a>я голоден🌻', 1, 0, 0, 44, 49, 0),
(245, '2022-05-21 13:46:06', 'nil', '<a href=\'/perfil/49\'>Leticia Moeda</a>я голоден🌻', 2, 0, 0, 44, 49, 0),
(246, '2022-05-21 13:55:14', 'nil', '<a href=\'/perfil/50\'>Mesa Quadrada</a>Nhem nhem', 0, 0, 0, 48, 50, 0),
(247, '2022-05-21 17:07:55', 'nil', 'rtyer', 0, 0, 0, 44, 44, 0),
(248, '2022-05-21 17:08:02', 'nil', 'nyet', 0, 0, 0, 44, 44, 0),
(249, '2022-05-21 17:08:05', 'nil', 'asdf', 1, 0, 0, 44, 44, 0),
(250, '2022-05-21 17:08:07', 'nil', 'oi', 1, 0, 0, 44, 44, 0),
(251, '2022-05-21 17:09:14', 'nil', '63456345', 0, 0, 0, 44, 44, 0),
(252, '2022-05-21 17:09:18', 'nil', 'asdo', 0, 0, 0, 44, 44, 0),
(253, '2022-05-21 17:11:14', 'nil', 'au', 0, 0, 0, 44, 44, 0),
(254, '2022-05-21 17:11:21', 'nil', 'au', 0, 0, 0, 44, 44, 0),
(255, '2022-05-21 17:11:23', 'nil', 'auau', 0, 0, 0, 44, 44, 0),
(256, '2022-05-21 17:11:44', 'nil', 'kekekek', 0, 0, 0, 44, 44, 0),
(257, '2022-05-21 17:13:01', 'nil', '<a href=\'/perfil/49\'>Leticia Moeda</a>я голоден🌻', 1, 0, 0, 44, 49, 0),
(258, '2022-05-21 20:34:13', 'nil', 'odeio ._.', 0, 0, 0, 48, 48, 0),
(259, '2022-05-21 20:34:19', 'nil', 'aaaaaaaaaa', 1, 0, 0, 48, 48, 0),
(260, '2022-05-21 20:34:59', 'nil', 'cade', 1, 0, 0, 48, 48, 1),
(261, '2022-05-22 12:56:01', 'nil', '<a href=\'/perfil/48\'>Admin Presente</a>cade', 0, 0, 0, 44, 48, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `manutencao` tinyint(4) NOT NULL,
  `onlines` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`manutencao`, `onlines`, `id`) VALUES
(0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `valor` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`id`, `valor`, `nome`) VALUES
(1, 'none', 'Nenhuma'),
(2, 'inf1', '1º Informática'),
(3, 'enf1', '1º Enfermagem'),
(4, 'adm1', '1º Administração'),
(5, 'con1', '1º Contabilidade'),
(6, 'inf2', '2º Informática'),
(7, 'enf2', '2º Enfermagem'),
(8, 'adm2', '2º Administração'),
(9, 'con2', '2º Contabilidade'),
(10, 'inf3', '3º Informática'),
(11, 'com3', '3º Comércio'),
(12, 'enf3', '3º Enfermagem'),
(13, 'sec3', '3º Secretaria'),
(14, 'adm3', '3º Administração'),
(15, 'con3', '3º Contabilidade');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `curtidas`
--
ALTER TABLE `curtidas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `publicacoes`
--
ALTER TABLE `publicacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `amigos`
--
ALTER TABLE `amigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `curtidas`
--
ALTER TABLE `curtidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de tabela `publicacoes`
--
ALTER TABLE `publicacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
