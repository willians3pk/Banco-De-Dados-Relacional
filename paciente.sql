-- MySQL Script generated by MySQL Workbench
-- dom 20 set 2020 14:26:57 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Atividade Mikhael
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Atividade Mikhael
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Atividade Mikhael` ;
USE `Atividade Mikhael` ;

-- -----------------------------------------------------
-- Table `Atividade Mikhael`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Atividade Mikhael`.`paciente` (
  `idpaciente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `cpf` INT NOT NULL,
  `numero_beneficio` INT NOT NULL,
  `telefonel` INT NOT NULL,
  PRIMARY KEY (`idpaciente`),
  UNIQUE INDEX `idpaciente_UNIQUE` (`idpaciente` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `numero_beneficio_UNIQUE` (`numero_beneficio` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
