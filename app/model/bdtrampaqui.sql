-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/08/2023 às 12:38
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdtrampaqui`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcurriculo`
--

CREATE TABLE `tbcurriculo` (
  `idCurriculo` int(11) NOT NULL,
  `objetivoCurriculo` varchar(500) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `estadoCivil` varchar(40) NOT NULL,
  `cpfUsuario` varchar(15) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbempresa`
--

CREATE TABLE `tbempresa` (
  `idEmpresa` int(11) NOT NULL,
  `nomeEmpresa` varchar(200) NOT NULL,
  `cnpjEmpresa` int(11) NOT NULL,
  `cepEmpresa` varchar(10) NOT NULL,
  `dataCriacaoEmpresa` date NOT NULL,
  `emailEmpresa` varchar(140) NOT NULL,
  `telefoneEmpresa` varchar(30) NOT NULL,
  `descEmpresa` varchar(500) NOT NULL,
  `complementoEmpresa` varchar(200) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbexperiencia`
--

CREATE TABLE `tbexperiencia` (
  `idExperiencia` int(11) NOT NULL,
  `tituloExperiencia` varchar(100) NOT NULL,
  `tipoEmpresa` varchar(50) NOT NULL,
  `nomeEmpresa` varchar(80) NOT NULL,
  `dataInicioExperiencia` date NOT NULL,
  `dataTerminoExperiencia` date NOT NULL,
  `localidadeExperiencia` varchar(200) NOT NULL,
  `tipoEmprego` varchar(100) NOT NULL,
  `descExperiencia` varchar(500) NOT NULL,
  `idCurriculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbformacao`
--

CREATE TABLE `tbformacao` (
  `idFormacao` int(11) NOT NULL,
  `areaFormacao` varchar(50) NOT NULL,
  `dataInicioFormacao` date NOT NULL,
  `dataTerminoFormacao` date NOT NULL,
  `localFormacao` varchar(80) NOT NULL,
  `idCurriculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbidioma`
--

CREATE TABLE `tbidioma` (
  `idIdioma` int(11) NOT NULL,
  `idioma` varchar(50) NOT NULL,
  `nivelIdioma` varchar(20) NOT NULL,
  `idCurriculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbintercambio`
--

CREATE TABLE `tbintercambio` (
  `idIntercambio` int(11) NOT NULL,
  `objetivoIntercambio` varchar(500) NOT NULL,
  `orgIntercambio` varchar(120) NOT NULL,
  `dataIdaIntercambio` date NOT NULL,
  `dataVoltaIntercambio` date NOT NULL,
  `paisIntercambio` varchar(80) NOT NULL,
  `idCurriculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbtrabvoluntario`
--

CREATE TABLE `tbtrabvoluntario` (
  `idTrabVoluntatio` int(11) NOT NULL,
  `nomeOrg` varchar(80) NOT NULL,
  `qntdMembros` int(11) NOT NULL,
  `descTrabVoluntario` varchar(500) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataEncerramento` date NOT NULL,
  `idCurriculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbusuario`
--

CREATE TABLE `tbusuario` (
  `idUsuario` int(11) NOT NULL,
  `nomeUsuario` varchar(120) NOT NULL,
  `cpfUsuario` varchar(15) NOT NULL,
  `emailUsuario` varchar(140) NOT NULL,
  `telefoneUsuario` varchar(30) NOT NULL,
  `dataNascUsuario` date NOT NULL,
  `tipoUsuario` bit(1) NOT NULL,
  `senhaUsuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbvaga`
--

CREATE TABLE `tbvaga` (
  `idVaga` int(11) NOT NULL,
  `descVaga` varchar(80) NOT NULL,
  `cargoVaga` varchar(30) NOT NULL,
  `cargaHorariaVaga` time NOT NULL,
  `sobreVaga` varchar(500) NOT NULL,
  `idCurriculo` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbcurriculo`
--
ALTER TABLE `tbcurriculo`
  ADD PRIMARY KEY (`idCurriculo`),
  ADD KEY `fk_idUsuario` (`idUsuario`);

--
-- Índices de tabela `tbempresa`
--
ALTER TABLE `tbempresa`
  ADD PRIMARY KEY (`idEmpresa`),
  ADD KEY `fk_idUsuario` (`idUsuario`);

--
-- Índices de tabela `tbexperiencia`
--
ALTER TABLE `tbexperiencia`
  ADD PRIMARY KEY (`idExperiencia`),
  ADD KEY `idCurriculo` (`idCurriculo`);

--
-- Índices de tabela `tbformacao`
--
ALTER TABLE `tbformacao`
  ADD PRIMARY KEY (`idFormacao`),
  ADD KEY `idCurriculo` (`idCurriculo`);

--
-- Índices de tabela `tbidioma`
--
ALTER TABLE `tbidioma`
  ADD PRIMARY KEY (`idIdioma`),
  ADD KEY `idCurriculo` (`idCurriculo`);

--
-- Índices de tabela `tbintercambio`
--
ALTER TABLE `tbintercambio`
  ADD PRIMARY KEY (`idIntercambio`),
  ADD KEY `idCurriculo` (`idCurriculo`);

--
-- Índices de tabela `tbtrabvoluntario`
--
ALTER TABLE `tbtrabvoluntario`
  ADD PRIMARY KEY (`idTrabVoluntatio`),
  ADD KEY `fk_idCurriculo` (`idCurriculo`);

--
-- Índices de tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Índices de tabela `tbvaga`
--
ALTER TABLE `tbvaga`
  ADD PRIMARY KEY (`idVaga`),
  ADD KEY `idCurriculo` (`idCurriculo`),
  ADD KEY `fk_idEmpresa` (`idEmpresa`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcurriculo`
--
ALTER TABLE `tbcurriculo`
  MODIFY `idCurriculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbempresa`
--
ALTER TABLE `tbempresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbexperiencia`
--
ALTER TABLE `tbexperiencia`
  MODIFY `idExperiencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbformacao`
--
ALTER TABLE `tbformacao`
  MODIFY `idFormacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbidioma`
--
ALTER TABLE `tbidioma`
  MODIFY `idIdioma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbintercambio`
--
ALTER TABLE `tbintercambio`
  MODIFY `idIntercambio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbtrabvoluntario`
--
ALTER TABLE `tbtrabvoluntario`
  MODIFY `idTrabVoluntatio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbvaga`
--
ALTER TABLE `tbvaga`
  MODIFY `idVaga` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbcurriculo`
--
ALTER TABLE `tbcurriculo`
  ADD CONSTRAINT `tbcurriculo_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuario` (`idUsuario`);

--
-- Restrições para tabelas `tbempresa`
--
ALTER TABLE `tbempresa`
  ADD CONSTRAINT `tbempresa_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuario` (`idUsuario`);

--
-- Restrições para tabelas `tbexperiencia`
--
ALTER TABLE `tbexperiencia`
  ADD CONSTRAINT `tbexperiencia_ibfk_1` FOREIGN KEY (`idCurriculo`) REFERENCES `tbcurriculo` (`idCurriculo`);

--
-- Restrições para tabelas `tbformacao`
--
ALTER TABLE `tbformacao`
  ADD CONSTRAINT `tbformacao_ibfk_1` FOREIGN KEY (`idCurriculo`) REFERENCES `tbcurriculo` (`idCurriculo`);

--
-- Restrições para tabelas `tbidioma`
--
ALTER TABLE `tbidioma`
  ADD CONSTRAINT `tbidioma_ibfk_1` FOREIGN KEY (`idCurriculo`) REFERENCES `tbcurriculo` (`idCurriculo`);

--
-- Restrições para tabelas `tbintercambio`
--
ALTER TABLE `tbintercambio`
  ADD CONSTRAINT `tbintercambio_ibfk_1` FOREIGN KEY (`idCurriculo`) REFERENCES `tbcurriculo` (`idCurriculo`);

--
-- Restrições para tabelas `tbtrabvoluntario`
--
ALTER TABLE `tbtrabvoluntario`
  ADD CONSTRAINT `tbtrabvoluntario_ibfk_1` FOREIGN KEY (`idCurriculo`) REFERENCES `tbcurriculo` (`idCurriculo`);

--
-- Restrições para tabelas `tbvaga`
--
ALTER TABLE `tbvaga`
  ADD CONSTRAINT `tbvaga_ibfk_1` FOREIGN KEY (`idCurriculo`) REFERENCES `tbcurriculo` (`idCurriculo`),
  ADD CONSTRAINT `tbvaga_ibfk_2` FOREIGN KEY (`idEmpresa`) REFERENCES `tbempresa` (`idEmpresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
