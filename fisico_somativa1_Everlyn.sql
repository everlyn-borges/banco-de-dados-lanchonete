-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lanchonete
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lanchonete` ;

-- -----------------------------------------------------
-- Schema lanchonete
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lanchonete` DEFAULT CHARACTER SET utf8 ;
USE `lanchonete` ;

-- -----------------------------------------------------
-- Table `lanchonete`.`cardapio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lanchonete`.`cardapio` ;

CREATE TABLE IF NOT EXISTS `lanchonete`.`cardapio` (
  `codigo` SMALLINT(8) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lanchonete`.`sanduiche`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lanchonete`.`sanduiche` ;

CREATE TABLE IF NOT EXISTS `lanchonete`.`sanduiche` (
  `codigo` SMALLINT(8) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `codigo_cardapio` SMALLINT(8) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_sanduiche_cardapio1_idx` (`codigo_cardapio` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  CONSTRAINT `codigo_cardapio`
    FOREIGN KEY (`codigo_cardapio`)
    REFERENCES `lanchonete`.`cardapio` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lanchonete`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lanchonete`.`cliente` ;

CREATE TABLE IF NOT EXISTS `lanchonete`.`cliente` (
  `codigo` SMALLINT(8) NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(75) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `endereco_cep` VARCHAR(10) NOT NULL,
  `endereco_logradouro` VARCHAR(100) NOT NULL,
  `endereco_numero` VARCHAR(6) NOT NULL,
  `endereco_complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lanchonete`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lanchonete`.`pedido` ;

CREATE TABLE IF NOT EXISTS `lanchonete`.`pedido` (
  `codigo` SMALLINT(8) NOT NULL AUTO_INCREMENT,
  `status` INT NOT NULL DEFAULT 0,
  `data_emissao` DATE NOT NULL,
  `codigo_cliente` SMALLINT(8) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_pedido_cliente1_idx` (`codigo_cliente` ASC) VISIBLE,
  CONSTRAINT `codigo_cliente`
    FOREIGN KEY (`codigo_cliente`)
    REFERENCES `lanchonete`.`cliente` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lanchonete`.`itens_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lanchonete`.`itens_pedido` ;

CREATE TABLE IF NOT EXISTS `lanchonete`.`itens_pedido` (
  `codigo_pedido` SMALLINT(8) NOT NULL,
  `codigo_sanduiche` SMALLINT(8) NOT NULL,
  INDEX `codigo_pedido_idx` (`codigo_pedido` ASC) VISIBLE,
  INDEX `codigo_sanduiche_idx` (`codigo_sanduiche` ASC) VISIBLE,
  CONSTRAINT `codigo_pedido`
    FOREIGN KEY (`codigo_pedido`)
    REFERENCES `lanchonete`.`pedido` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_sanduiche`
    FOREIGN KEY (`codigo_sanduiche`)
    REFERENCES `lanchonete`.`sanduiche` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lanchonete`.`entregador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lanchonete`.`entregador` ;

CREATE TABLE IF NOT EXISTS `lanchonete`.`entregador` (
  `codigo` SMALLINT(8) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(75) NOT NULL,
  `telefone_celular` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lanchonete`.`entregas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lanchonete`.`entregas` ;

CREATE TABLE IF NOT EXISTS `lanchonete`.`entregas` (
  `codigo_entregador` SMALLINT(8) NOT NULL,
  `codigo_pedido_entrega` SMALLINT(8) NOT NULL,
  INDEX `codigo_pedido_idx` (`codigo_pedido_entrega` ASC) VISIBLE,
  INDEX `codigo_entregador_idx` (`codigo_entregador` ASC) VISIBLE,
  CONSTRAINT `codigo_pedido_entrega`
    FOREIGN KEY (`codigo_pedido_entrega`)
    REFERENCES `lanchonete`.`pedido` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_entregador`
    FOREIGN KEY (`codigo_entregador`)
    REFERENCES `lanchonete`.`entregador` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
