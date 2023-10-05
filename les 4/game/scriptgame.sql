-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema persoonsite
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema persoonsite
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `persoonsite` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameraccount` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `persoonsite` ;

-- -----------------------------------------------------
-- Table `persoonsite`.`persoon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persoonsite`.`persoon` (
  `persoonID` INT UNSIGNED NOT NULL,
  `voornaam` CHAR(45) NOT NULL,
  `achternaam` CHAR(45) NOT NULL,
  `telefoonnummer` DECIMAL(10) UNSIGNED NOT NULL,
  `geboortedatum` DECIMAL(20) UNSIGNED NOT NULL,
  `geslacht` CHAR(10) NOT NULL,
  `geboorte stad` CHAR(45) NOT NULL,
  `nationaliteit` CHAR(45) NOT NULL,
  PRIMARY KEY (`persoonID`),
  UNIQUE INDEX `persoonID_UNIQUE` (`persoonID` ASC) VISIBLE,
  UNIQUE INDEX `telefoonnummer_UNIQUE` (`telefoonnummer` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `persoonsite`.`adres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persoonsite`.`adres` (
  `adresID` INT UNSIGNED NOT NULL,
  `straatnaam` CHAR(100) NOT NULL,
  `huisnummer` DECIMAL(10) UNSIGNED NOT NULL,
  `postcode` CHAR(10) NOT NULL,
  `woonplaats` CHAR(45) NOT NULL,
  `persoon_persoonID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`adresID`),
  UNIQUE INDEX `adresID_UNIQUE` (`adresID` ASC) VISIBLE,
  UNIQUE INDEX `huisnummer_UNIQUE` (`huisnummer` ASC) VISIBLE,
  UNIQUE INDEX `postcode_UNIQUE` (`postcode` ASC) VISIBLE,
  UNIQUE INDEX `woonplaats_UNIQUE` (`woonplaats` ASC) VISIBLE,
  INDEX `fk_adres_persoon_idx` (`persoon_persoonID` ASC) VISIBLE,
  CONSTRAINT `fk_adres_persoon`
    FOREIGN KEY (`persoon_persoonID`)
    REFERENCES `persoonsite`.`persoon` (`persoonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `persoonsite`.`klmvluchten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persoonsite`.`klmvluchten` (
  `vluchtenID` INT UNSIGNED NOT NULL,
  `vluchtnummer` DECIMAL(30) UNSIGNED NOT NULL,
  `vliegtuig type` CHAR(45) NOT NULL,
  `vertrektijd` DECIMAL(10) UNSIGNED NOT NULL,
  `aankomsttijd` DECIMAL(10) UNSIGNED NOT NULL,
  `vertrek vluchthaven` VARCHAR(45) NOT NULL,
  `aankomst vluchthaven` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`vluchtenID`),
  UNIQUE INDEX `vluchtenID_UNIQUE` (`vluchtenID` ASC) VISIBLE,
  UNIQUE INDEX `vluchtnummer_UNIQUE` (`vluchtnummer` ASC) VISIBLE,
  UNIQUE INDEX `vliegtuig type_UNIQUE` (`vliegtuig type` ASC) VISIBLE,
  UNIQUE INDEX `vertrektijd_UNIQUE` (`vertrektijd` ASC) VISIBLE,
  UNIQUE INDEX `aankomsttijd_UNIQUE` (`aankomsttijd` ASC) VISIBLE,
  UNIQUE INDEX `vertrek vluchthaven_UNIQUE` (`vertrek vluchthaven` ASC) VISIBLE,
  UNIQUE INDEX `aankomst vluchthaven_UNIQUE` (`aankomst vluchthaven` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `persoonsite`.`personeel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persoonsite`.`personeel` (
  `personeelID` INT UNSIGNED NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`personeelID`),
  UNIQUE INDEX `personeelID_UNIQUE` (`personeelID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `persoonsite`.`klmvluchten_has_personeel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `persoonsite`.`klmvluchten_has_personeel` (
  `klmvluchten_vluchtenID` INT UNSIGNED NOT NULL,
  `personeel_personeelID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`klmvluchten_vluchtenID`, `personeel_personeelID`),
  INDEX `fk_klmvluchten_has_personeel_personeel1_idx` (`personeel_personeelID` ASC) VISIBLE,
  INDEX `fk_klmvluchten_has_personeel_klmvluchten1_idx` (`klmvluchten_vluchtenID` ASC) VISIBLE,
  CONSTRAINT `fk_klmvluchten_has_personeel_klmvluchten1`
    FOREIGN KEY (`klmvluchten_vluchtenID`)
    REFERENCES `persoonsite`.`klmvluchten` (`vluchtenID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_klmvluchten_has_personeel_personeel1`
    FOREIGN KEY (`personeel_personeelID`)
    REFERENCES `persoonsite`.`personeel` (`personeelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`account` (
  `account ID` INT UNSIGNED NOT NULL,
  `gebruikersnaam` VARCHAR(45) NOT NULL,
  `wachtwoord` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account ID`),
  UNIQUE INDEX `inloggegevens ID_UNIQUE` (`account ID` ASC) VISIBLE,
  UNIQUE INDEX `gebruikersnaam_UNIQUE` (`gebruikersnaam` ASC) VISIBLE,
  UNIQUE INDEX `wachtwoord_UNIQUE` (`wachtwoord` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`ingame gegevens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`ingame gegevens` (
  `ingame ID` INT UNSIGNED NOT NULL,
  `voortgang gegevens` VARCHAR(45) NOT NULL,
  `ingame munten` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ingame ID`),
  UNIQUE INDEX `systeemgegevens ID_UNIQUE` (`ingame ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`online`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`online` (
  `online ID` INT UNSIGNED NOT NULL,
  `vrienden` VARCHAR(45) NOT NULL,
  `online vrienden` VARCHAR(45) NOT NULL,
  `offline vrienden` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`online ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `gameraccount` ;

-- -----------------------------------------------------
-- Table `gameraccount`.`game achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`game achievements` (
  `game achievements ID` INT NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `soort achievement` VARCHAR(45) NOT NULL,
  `moeilijkheidsgraad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game achievements ID`),
  UNIQUE INDEX `naam_UNIQUE` (`naam` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`gamer achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gamer achievements` (
  `gamer achievements ID` INT UNSIGNED NOT NULL,
  `aantal behaalde` VARCHAR(45) NOT NULL,
  `aantal niet behaalde` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gamer achievements ID`),
  UNIQUE INDEX `gamer achievements ID_UNIQUE` (`gamer achievements ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`games` (
  `games ID` INT UNSIGNED NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `grootte` INT UNSIGNED NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`games ID`),
  UNIQUE INDEX `games ID_UNIQUE` (`games ID` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`naam` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`gebruiker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gebruiker` (
  `gerbruiker ID` INT UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `wachtwoord` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `inlog naam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gerbruiker ID`),
  UNIQUE INDEX `gerbruiker ID_UNIQUE` (`gerbruiker ID` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `wachtwoord_UNIQUE` (`wachtwoord` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `inlog naam_UNIQUE` (`inlog naam` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
