-- phpMyAdmin SQL Dump
-- version 4.9.5deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 12/10/2020 às 15:42
-- Versão do servidor: 10.3.23-MariaDB-0+deb10u1
-- Versão do PHP: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atividade`
--
CREATE SCHEMA IF NOT EXISTS `atividade` ;
USE `atividade`;
-- --------------------------------------------------------

--
-- Estrutura para tabela `comentario`
--

CREATE TABLE `atividade`.`comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post`
--

CREATE TABLE `atividade`.`post` (
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `id_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post_comentario`
--

CREATE TABLE `atividade`.`post_comentario` (
  `id_postComentario` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post_marcacoes`
--

CREATE TABLE `atividade`.`post_marcacoes` (
  `id_postMarcacoes` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `stores`
--

CREATE TABLE `atividade`.`stores` (
  `id_stores` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

CREATE TABLE `atividade`.`telefone` (
  `id_telefone` int(11) NOT NULL,
  `ddd` int(11) NOT NULL,
  `fone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `atividade`.`user` (
  `id_user` int(11) NOT NULL,
  `nome` varchar(55) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `biografia` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL,
  `telefone` int(11) NOT NULL,
  `foto perfil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `comentario`
--
ALTER TABLE `atividade`.`comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `fk_comentario_user` (`id_user`),
  ADD KEY `fk_comentario_post` (`id_post`);

--
-- Índices de tabela `post`
--
ALTER TABLE `atividade`.`post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `fk_post_user` (`id_user`),
  ADD KEY `fk_post_comentario` (`id_comentario`);

--
-- Índices de tabela `post_comentario`
--
ALTER TABLE `atividade`.`post_comentario`
  ADD PRIMARY KEY (`id_postComentario`),
  ADD KEY `fk_postComentario_post` (`id_post`),
  ADD KEY `fk_postComentario_comentario` (`id_comentario`);

--
-- Índices de tabela `post_marcacoes`
--
ALTER TABLE `atividade`.`post_marcacoes`
  ADD PRIMARY KEY (`id_postMarcacoes`),
  ADD KEY `fk_postMarcacoes_user` (`id_user`),
  ADD KEY `fk_postMarcacoes_post` (`id_post`);

--
-- Índices de tabela `stores`
--
ALTER TABLE `atividade`.`stores`
  ADD PRIMARY KEY (`id_stores`),
  ADD KEY `fk_stores_user` (`id_user`);

--
-- Índices de tabela `telefone`
--
ALTER TABLE `atividade`.`telefone`
  ADD PRIMARY KEY (`id_telefone`);

--
-- Índices de tabela `user`
--
ALTER TABLE `atividade`.`user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_user_telefone` (`telefone`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `atividade`.`comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post`
--
ALTER TABLE `atividade`.`post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post_comentario`
--
ALTER TABLE `atividade`.`post_comentario`
  MODIFY `id_postComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post_marcacoes`
--
ALTER TABLE `atividade`.`post_marcacoes`
  MODIFY `id_postMarcacoes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `stores`
--
ALTER TABLE `atividade`.`stores`
  MODIFY `id_stores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `atividade`.`telefone`
  MODIFY `id_telefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `atividade`.`user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `comentario`
--
ALTER TABLE `atividade`.`comentario`
  ADD CONSTRAINT `fk_comentario_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  ADD CONSTRAINT `fk_comentario_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Restrições para tabelas `post`
--
ALTER TABLE `atividade`.`post`
  ADD CONSTRAINT `fk_post_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `post_comentario`
--
ALTER TABLE `atividade`.`post_comentario`
  ADD CONSTRAINT `fk_postComentario_comentario` FOREIGN KEY (`id_comentario`) REFERENCES `comentario` (`id_comentario`),
  ADD CONSTRAINT `fk_postComentario_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`);

--
-- Restrições para tabelas `post_marcacoes`
--
ALTER TABLE `atividade`.`post_marcacoes`
  ADD CONSTRAINT `fk_postMarcacoes_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_postMarcacoes_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Restrições para tabelas `stores`
--
ALTER TABLE `atividade`.`stores`
  ADD CONSTRAINT `fk_stores_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `user`
--
ALTER TABLE `atividade`.`user`
  ADD CONSTRAINT `fk_user_telefone` FOREIGN KEY (`telefone`) REFERENCES `telefone` (`id_telefone`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
