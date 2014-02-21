SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`users` (
  `idusers` INT NOT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `first_name` VARCHAR(45) NOT NULL ,
  `last_name` VARCHAR(45) NOT NULL ,
  `mail` VARCHAR(45) NOT NULL ,
  `pwd` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idusers`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`photos` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`photos` (
  `idphotos` INT NOT NULL ,
  `idusers` INT NOT NULL ,
  `url` VARCHAR(200) NOT NULL ,
  `latitude` VARCHAR(45) NOT NULL ,
  `longitude` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idphotos`) ,
  INDEX `fk_idusers_idx` (`idusers` ASC) ,
  CONSTRAINT `fk_idusers`
    FOREIGN KEY (`idusers` )
    REFERENCES `mydb`.`users` (`idusers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_coments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_coments` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`user_coments` (
  `idcoments` INT NOT NULL ,
  `idusers_aut` INT NOT NULL ,
  `idusers_rec` INT NOT NULL ,
  `coment` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`idcoments`) ,
  INDEX `fk_idusers_idx` (`idusers_aut` ASC) ,
  INDEX `fk_idusers_rec_idx` (`idusers_rec` ASC) ,
  CONSTRAINT `fk_idusers_aut`
    FOREIGN KEY (`idusers_aut` )
    REFERENCES `mydb`.`users` (`idusers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusers_rec`
    FOREIGN KEY (`idusers_rec` )
    REFERENCES `mydb`.`users` (`idusers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`videos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`videos` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`videos` (
  `idvideos` INT NOT NULL ,
  `idusers` INT NOT NULL ,
  `url` VARCHAR(200) NOT NULL ,
  `longitude` VARCHAR(45) NOT NULL ,
  `latitude` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idvideos`) ,
  INDEX `fk_idusers_idx` (`idusers` ASC) ,
  CONSTRAINT `fk_idusers`
    FOREIGN KEY (`idusers` )
    REFERENCES `mydb`.`users` (`idusers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`video_coments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`video_coments` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`video_coments` (
  `idvideo_coments` INT NOT NULL ,
  `idusers` INT NOT NULL ,
  `idvideos` INT NOT NULL ,
  `coment` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`idvideo_coments`) ,
  INDEX `fk_video_coments_1_idx` (`idvideos` ASC) ,
  INDEX `fk_video_coments_2_idx` (`idusers` ASC) ,
  CONSTRAINT `fk_video_coments_1`
    FOREIGN KEY (`idvideos` )
    REFERENCES `mydb`.`videos` (`idvideos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_coments_2`
    FOREIGN KEY (`idusers` )
    REFERENCES `mydb`.`users` (`idusers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`photo_coments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`photo_coments` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`photo_coments` (
  `idphoto_coments` INT NOT NULL ,
  `idusers` INT NOT NULL ,
  `idphotos` INT NOT NULL ,
  `coment` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`idphoto_coments`) ,
  INDEX `fk_idusers_idx` (`idusers` ASC) ,
  INDEX `fk_idphotos_idx` (`idphotos` ASC) ,
  CONSTRAINT `fk_idusers`
    FOREIGN KEY (`idusers` )
    REFERENCES `mydb`.`users` (`idusers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idphotos`
    FOREIGN KEY (`idphotos` )
    REFERENCES `mydb`.`photos` (`idphotos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
