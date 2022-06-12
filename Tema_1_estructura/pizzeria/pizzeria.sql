-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Table `pizzeria`.`categoria_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria_pizza` (
  `id_categoria_pizza` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` ENUM('especial', 'de la casa', 'normal') NOT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria_pizza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`localidad` (
  `id_localidad` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_localidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provincia` (
  `id_provincia` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `localidad_id_localidad` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_provincia`),
  INDEX `fk_provincia_localidad1_idx` (`localidad_id_localidad` ASC) ,
  CONSTRAINT `fk_provincia_localidad1`
    FOREIGN KEY (`localidad_id_localidad`)
    REFERENCES `pizzeria`.`localidad` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`cliente` (
  `id_cliente` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `apellidos` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(25) NOT NULL,
  `codigo_postal` INT(5) NOT NULL,
  `localidad_id_localidad` INT(10) UNSIGNED NOT NULL,
  `provincia_id_provincia` INT(10) UNSIGNED NOT NULL,
  `numero_telefono` INT(9) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_localidad1_idx` (`localidad_id_localidad` ASC) ,
  INDEX `fk_cliente_provincia1_idx` (`provincia_id_provincia` ASC) ,
  CONSTRAINT `fk_cliente_localidad1`
    FOREIGN KEY (`localidad_id_localidad`)
    REFERENCES `pizzeria`.`localidad` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_provincia1`
    FOREIGN KEY (`provincia_id_provincia`)
    REFERENCES `pizzeria`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleado` (
  `id_empleado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `apellidos` VARCHAR(20) NOT NULL,
  `nif` VARCHAR(9) NOT NULL,
  `telefono` INT(9) NOT NULL,
  `tipo_empleado` ENUM('cocinero', 'repartidor') NOT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`producto_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`producto_pizza` (
  `id_producto_pizza` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `descripcion` MEDIUMTEXT NOT NULL,
  `imagen` VARCHAR(20) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `cantidad` INT(5) NOT NULL,
  `categoria_pizza_id_categoria_pizza` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_producto_pizza`),
  INDEX `fk_producto_pizza_categoria_pizza1_idx` (`categoria_pizza_id_categoria_pizza` ASC) ,
  CONSTRAINT `fk_producto_pizza_categoria_pizza1`
    FOREIGN KEY (`categoria_pizza_id_categoria_pizza`)
    REFERENCES `pizzeria`.`categoria_pizza` (`id_categoria_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`producto` (
  `id_producto` INT(10) UNSIGNED NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `descripcion` MEDIUMTEXT NOT NULL,
  `imagen` VARCHAR(20) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `cantidad` INT(5) NOT NULL,
  `producto_pizza_id_producto_pizza` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_producto_pizza1_idx` (`producto_pizza_id_producto_pizza` ASC) ,
  CONSTRAINT `fk_producto_producto_pizza1`
    FOREIGN KEY (`producto_pizza_id_producto_pizza`)
    REFERENCES `pizzeria`.`producto_pizza` (`id_producto_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `id_comanda` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `forma_entrega` ENUM('restaurante', 'domicilio') NOT NULL,
  `cliente_id_cliente` INT(10) UNSIGNED NOT NULL,
  `empleado_id_empleado` INT(11) NOT NULL,
  `producto_id_producto` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_comanda`),
  INDEX `fk_comanda_cliente1_idx` (`cliente_id_cliente` ASC) ,
  INDEX `fk_comanda_empleado1_idx` (`empleado_id_empleado` ASC) ,
  INDEX `fk_comanda_producto1_idx` (`producto_id_producto` ASC) ,
  CONSTRAINT `fk_comanda_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `pizzeria`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_empleado1`
    FOREIGN KEY (`empleado_id_empleado`)
    REFERENCES `pizzeria`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `pizzeria`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`reparto_domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`reparto_domicilio` (
  `id_reparto_domicilio` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hora_entrega` TIME NOT NULL,
  `comanda_id_comanda` INT(11) NOT NULL,
  `empleado_id_empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id_reparto_domicilio`),
  INDEX `fk_reparto_domicilio_comanda1_idx` (`comanda_id_comanda` ASC) ,
  INDEX `fk_reparto_domicilio_empleado1_idx` (`empleado_id_empleado` ASC) ,
  CONSTRAINT `fk_reparto_domicilio_comanda1`
    FOREIGN KEY (`comanda_id_comanda`)
    REFERENCES `pizzeria`.`comanda` (`id_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reparto_domicilio_empleado1`
    FOREIGN KEY (`empleado_id_empleado`)
    REFERENCES `pizzeria`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizzeria`.`tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`tienda` (
  `id_tienda` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(20) NOT NULL,
  `codigo_postal` INT(5) NOT NULL,
  `localidad_id_localidad` INT(10) UNSIGNED NOT NULL,
  `provincia_id_provincia` INT(10) UNSIGNED NOT NULL,
  `empleado_id_empleado` INT(11) NOT NULL,
  `comanda_id_comanda` INT(11) NOT NULL,
  PRIMARY KEY (`id_tienda`),
  INDEX `fk_tienda_empleado1_idx` (`empleado_id_empleado` ASC) ,
  INDEX `fk_tienda_localidad1_idx` (`localidad_id_localidad` ASC) ,
  INDEX `fk_tienda_provincia1_idx` (`provincia_id_provincia` ASC) ,
  INDEX `fk_tienda_comanda1_idx` (`comanda_id_comanda` ASC) ,
  CONSTRAINT `fk_tienda_comanda1`
    FOREIGN KEY (`comanda_id_comanda`)
    REFERENCES `pizzeria`.`comanda` (`id_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tienda_empleado1`
    FOREIGN KEY (`empleado_id_empleado`)
    REFERENCES `pizzeria`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tienda_localidad1`
    FOREIGN KEY (`localidad_id_localidad`)
    REFERENCES `pizzeria`.`localidad` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tienda_provincia1`
    FOREIGN KEY (`provincia_id_provincia`)
    REFERENCES `pizzeria`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
