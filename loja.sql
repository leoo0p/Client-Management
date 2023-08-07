-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jun-2023 às 23:00
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--
CREATE DATABASE IF NOT EXISTS `loja` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `loja`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `Nome` longtext NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Permissao` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`idCliente`, `Nome`, `Telefone`, `Email`, `Permissao`) VALUES
(45, 'João Silva', '1111111111', 'joao.silva@example.com', '0'),
(46, 'Maria Santos', '2147483647', 'maria.santos@example.com', '0'),
(47, 'Pedro Costa', '2147483647', 'pedro.costa@example.com', '0'),
(51, 'Fernando Pereira', '2147483647', 'fernando.pereira@example.com', '0'),
(52, 'Isabela Gonçalves', '2147483647', 'isabela.goncalves@example.com', '0'),
(53, 'Rafael Rodrigues', '2147483647', 'rafael.rodrigues@example.com', '0'),
(54, 'Carolina Lima', '1010101010', 'carolina.lima@example.com', '0'),
(55, 'Daniel Castro', '1111111111', 'daniel.castro@example.com', '0'),
(56, 'Larissa Santos', '1212121212', 'larissa.santos@example.com', '0'),
(57, 'José Ferreira', '1313131313', 'jose.ferreira@example.com', '0'),
(58, 'Mariana Alves', '1414141414', 'mariana.alves@example.com', '0'),
(59, 'Gustavo Gomes', '1515151515', 'gustavo.gomes@example.com', '0'),
(60, 'Lúcia Costa', '1616161616', 'lucia.costa@example.com', '0'),
(61, 'Roberto Ribeiro', '1717171717', 'roberto.ribeiro@example.com', '0'),
(62, 'Amanda Oliveira', '1818181818', 'amanda.oliveira@example.com', '0'),
(63, 'Antônio Silva', '1919191919', 'antonio.silva@example.com', '0'),
(64, 'Patrícia Barbosa', '2020202020', 'patricia.barbosa@example.com', '0'),
(66, 'Luciana Rodrigues', '2147483647', 'luciana.rodrigues@example.com', '0'),
(67, 'Ricardo Santos', '2147483647', 'ricardo.santos@example.com', '0'),
(68, 'Lívia Ferreira', '2147483647', 'livia.ferreira@example.com', '0'),
(69, 'André Almeida', '2147483647', 'andre.almeida@example.com', '0'),
(70, 'Gabriela Castro', '2147483647', 'gabriela.castro@example.com', '0'),
(71, 'Marcelo Pereira', '2147483647', 'marcelo.pereira@example.com', '0'),
(72, 'Bianca Gonçalves', '2147483647', 'bianca.goncalves@example.com', '0'),
(73, 'Fábio Lima', '2147483647', 'fabio.lima@example.com', '0'),
(3519, 'Leonardo Capitani Pansonato', '11975249537', 'leopansonato@gmail.com', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL,
  `Nome` varchar(80) NOT NULL,
  `Telefone` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Endereço` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `Email` (`Email`) USING BTREE;

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idFornecedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3520;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idFornecedor` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
