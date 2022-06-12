-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Table `optica`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `id_direccion` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(20) NOT NULL,
  `numero` INT(4) NOT NULL,
  `piso` VARCHAR(10) NOT NULL,
  `puerta` VARCHAR(10) NOT NULL,
  `ciudad` VARCHAR(15) NOT NULL,
  `codigo_postal` INT(5) NOT NULL,
  `pais` VARCHAR(15) NULL DEFAULT 'Espanya',
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `optica`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clientes` (
  `id_clientes` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `direccion_id_direccion` INT(10) UNSIGNED NOT NULL,
  `telefono` INT(9) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  `fecha_registro` DATE NOT NULL,
  `recomendado_id_clientes` INT(10) UNSIGNED NULL,
  PRIMARY KEY (`id_clientes`),
  INDEX `fk_clientes_direccion1_idx` (`direccion_id_direccion` ASC) ,
  INDEX `fk_clientes_clientes1_idx` (`recomendado_id_clientes` ASC) ,
  CONSTRAINT `fk_clientes_clientes1`
    FOREIGN KEY (`recomendado_id_clientes`)
    REFERENCES `optica`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_direccion1`
    FOREIGN KEY (`direccion_id_direccion`)
    REFERENCES `optica`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `optica`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `id_proveedor` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion_id_direccion` INT(10) UNSIGNED NOT NULL,
  `telefono` INT(9) NOT NULL,
  `fax` INT(9) NULL DEFAULT NULL,
  `nif` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  INDEX `fk_proveedor_direccion1_idx` (`direccion_id_direccion` ASC) ,
  CONSTRAINT `fk_proveedor_direccion1`
    FOREIGN KEY (`direccion_id_direccion`)
    REFERENCES `optica`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `id_marca` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `proveedor_id_proveedor` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_marca`),
  INDEX `fk_marca_proveedor1_idx` (`proveedor_id_proveedor` ASC) ,
  CONSTRAINT `fk_marca_proveedor1`
    FOREIGN KEY (`proveedor_id_proveedor`)
    REFERENCES `optica`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`gafas` (
  `id_gafas` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `marca_id_marca` INT(10) UNSIGNED NOT NULL,
  `graduacion` VARCHAR(45) NOT NULL,
  `tipo_montura` ENUM('flotante', 'pasta', 'metalica') NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_vidrio` VARCHAR(10) NOT NULL,
  `precio` DOUBLE NOT NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `fk_gafas_marca1_idx` (`marca_id_marca` ASC) ,
  CONSTRAINT `fk_gafas_marca1`
    FOREIGN KEY (`marca_id_marca`)
    REFERENCES `optica`.`marca` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `optica`.`trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`trabajador` (
  `id_trabajador` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_trabajador`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `optica`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ventas` (
  `id_ventas` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATE NOT NULL,
  `trabajador_id_trabajador` INT(11) NOT NULL,
  `clientes_id_clientes` INT(10) UNSIGNED NOT NULL,
  `gafas_id_gafas` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_ventas`),
  INDEX `fk_ventas_trabajador1_idx` (`trabajador_id_trabajador` ASC) ,
  INDEX `fk_ventas_clientes1_idx` (`clientes_id_clientes` ASC) ,
  INDEX `fk_ventas_gafas1_idx` (`gafas_id_gafas` ASC) ,
  CONSTRAINT `fk_ventas_clientes1`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `optica`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_gafas1`
    FOREIGN KEY (`gafas_id_gafas`)
    REFERENCES `optica`.`gafas` (`id_gafas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_trabajador1`
    FOREIGN KEY (`trabajador_id_trabajador`)
    REFERENCES `optica`.`trabajador` (`id_trabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Agregar valores a las tablas
-- -----------------------------------------------------
INSERT INTO `direccion` VALUES ('1', 'Peru', '32', '5', '1', 'Barcelona', '08031', NULL);
INSERT INTO `direccion` VALUES ('2', 'Llull', '122', '2', '9', 'Barcelona', '08031', NULL);
INSERT INTO `direccion` VALUES ('3', 'Almogavers', '44', '4', '1', 'Barcelona', '08031', NULL);

INSERT INTO `proveedor` VALUES('1','Progafas.SL','1', 934543250,934543250, 29268166);
INSERT INTO `proveedor` VALUES('2','GrupoLFT.SL','2', 934545451,934526252, 29679166);
INSERT INTO `proveedor` VALUES('3','MayoristaLK.SL','3', 933345451,934526214, 29679114);

INSERT INTO `trabajador` VALUES ('1', 'Jose Luis Perez');
INSERT INTO `trabajador` VALUES ('2', 'Sebastian Lopez');
INSERT INTO `trabajador` VALUES ('3', 'Sara Martinez');

INSERT INTO `clientes` VALUES ('1','Andres', 1, 934191321,'correoandres@correo.com,',"2021-11-06", 1);
INSERT INTO `clientes` VALUES ('2','Paula', 2 , 934161721,'correopaula@correo.com,',"2021-04-03", 1);
INSERT INTO `clientes` VALUES ('3','Sara', 3, 934543242, 'correosara@correo.com',"2021-04-03", 1);

INSERT INTO `marca` VALUES('1', 'Rayban',1);
INSERT INTO `marca` VALUES('2', 'Police',1);
INSERT INTO `marca` VALUES('3', 'Carlolina Herrera',1);

INSERT INTO `gafas` VALUES('1', 1, '+2,25, -1,75, + 4,50, -0,75', 'pasta', 'azul', 'rojo',145);
INSERT INTO `gafas` VALUES('2', 2, '+2,25, -1,75, + 4,50, -0,75', 'pasta', 'verde', 'negro',214);
INSERT INTO `gafas` VALUES('3', 2, '+1,25, -0,75, + 2,50, -0,77', 'pasta', 'negro', 'negro',185);

INSERT INTO `ventas` VALUES (1,"2022-06-14",1,1,1);
INSERT INTO `ventas` VALUES (2,"2022-06-14",2,2,3);
INSERT INTO `ventas` VALUES (3,"2022-02-11",3,3,2);
INSERT INTO `ventas` VALUES (4,"2022-05-12",3,3,1);
