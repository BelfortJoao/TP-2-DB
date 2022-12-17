-- MySQL Script generated by MySQL Workbench
-- Sun 04 Dec 2022 06:59:59 PM -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trabalhobd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trabalhobd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabalhobd` ;
USE `trabalhobd` ;

-- -----------------------------------------------------
-- Table `trabalhobd`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`fabricante` (
                                                         `idfabricante` INT NOT NULL,
                                                         `nomefab` VARCHAR(30) NULL,
                                                         `ano_fundacao` INT NULL,
                                                         PRIMARY KEY (`idfabricante`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`plataforma` (
                                                         `idplataforma` INT NOT NULL,
                                                         `nomeplat` VARCHAR(30) NULL,
                                                         `memoria` INT NULL,
                                                         `ano_lancamento` INT NULL,
                                                         `idfabricante` INT NOT NULL,
                                                         PRIMARY KEY (`idplataforma`),
                                                         INDEX `fk_plataforma_fabricante1_idx` (`idfabricante` ASC) VISIBLE,
                                                         CONSTRAINT `fk_plataforma_fabricante1`
                                                             FOREIGN KEY (`idfabricante`)
                                                                 REFERENCES `trabalhobd`.`fabricante` (`idfabricante`)
                                                                 ON DELETE NO ACTION
                                                                 ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`midia` (
                                                    `idmidia` INT NOT NULL,
                                                    `nomemid` VARCHAR(30) NULL,
                                                    `velocidade_leitura` INT NULL,
                                                    PRIMARY KEY (`idmidia`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`jogo` (
                                                   `idjogo` INT NOT NULL,
                                                   `nomejogo` VARCHAR(30) NULL,
                                                   `descricao` VARCHAR(30) NULL,
                                                   PRIMARY KEY (`idjogo`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_midia` (
                                                               `idplataforma` INT NOT NULL,
                                                               `idmidia` INT NOT NULL,
                                                               PRIMARY KEY (`idplataforma`, `idmidia`),
                                                               INDEX `fk_plataforma_has_midia_midia1_idx` (`idmidia` ASC) VISIBLE,
                                                               INDEX `fk_plataforma_has_midia_plataforma_idx` (`idplataforma` ASC) VISIBLE,
                                                               CONSTRAINT `fk_plataforma_has_midia_plataforma`
                                                                   FOREIGN KEY (`idplataforma`)
                                                                       REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
                                                                       ON DELETE NO ACTION
                                                                       ON UPDATE NO ACTION,
                                                               CONSTRAINT `fk_plataforma_has_midia_midia1`
                                                                   FOREIGN KEY (`idmidia`)
                                                                       REFERENCES `trabalhobd`.`midia` (`idmidia`)
                                                                       ON DELETE NO ACTION
                                                                       ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_jogo_plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_jogo_plataforma` (
                                                                         `idjogo` INT NOT NULL,
                                                                         `idplataforma` INT NOT NULL,
                                                                         `quantidade` INT NULL,
                                                                         `ano_lancamento_jogo` INT NULL,
                                                                         PRIMARY KEY (`idjogo`, `idplataforma`),
                                                                         INDEX `fk_jogo_has_plataforma_plataforma1_idx` (`idplataforma` ASC) VISIBLE,
                                                                         INDEX `fk_jogo_has_plataforma_jogo1_idx` (`idjogo` ASC) VISIBLE,
                                                                         CONSTRAINT `fk_jogo_has_plataforma_jogo1`
                                                                             FOREIGN KEY (`idjogo`)
                                                                                 REFERENCES `trabalhobd`.`jogo` (`idjogo`)
                                                                                 ON DELETE NO ACTION
                                                                                 ON UPDATE NO ACTION,
                                                                         CONSTRAINT `fk_jogo_has_plataforma_plataforma1`
                                                                             FOREIGN KEY (`idplataforma`)
                                                                                 REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
                                                                                 ON DELETE NO ACTION
                                                                                 ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (1, 'Nintendo', 1889);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (2, 'Sony', 1946);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (3, 'Microsoft', 1975);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (4, 'Atari', 1972);


INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (1, 'Atari 2600', 1977, '128', 4);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (2, 'NES', 1985, '2048', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (3, 'SNES', 1990, '131072', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (4, 'Wii', 2006, '92274688', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (5, 'Xbox360', 2005, '536870912', 3);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (6, 'PlayStation3', 2006, '536870912', 2);


INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (1, 'CD', 10);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (2, 'DVD', 20);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (3, 'Blu-ray', 40);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (4, 'Disquete', 1);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (5, 'SD', 100);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (6, 'Cartucho', 1000);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (7, 'HD-USB', 100);


INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (1, 'River Raid', 'Tiro');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (2, 'Mario Bros', 'Aventura');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (3, 'F-Zero', 'Corrida');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (4, 'Super Mario Bros', 'Aventura');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (5, 'Wii Sports', 'Esportes variados');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (6, 'FIFA12', 'Futebol');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (7, 'God of War 3', 'Ação');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (8, 'Forza MotorSport', 'Corrida realista');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (9, 'Gran Turismo 5', 'Corrida realista');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (10, 'Street Fighter IV', 'Luta');


INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (1, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (2, 4);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (2, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (3, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (4, 2);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (4, 5);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (5, 2);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (5, 7);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (6, 3);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (6, 7);



INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (1, 1, 2, 1982);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (1, 2, 2, 1983);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (2, 2, 1, 1983);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (3, 3, 1, 1990);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 3, 1, 2007);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (2, 4, 1, 1985);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 4, 1, 2007);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 5, 1, 2006);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 7, 2, 2012);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 8, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 9, 1, 2010);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 10, 2, 2008);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 10, 1, 2008);

-- 1
SELECT nomeplat
FROM plataforma JOIN compativel_jogo_plataforma JOIN midia
WHERE velocidade_leitura >100
GROUP BY nomeplat;

-- 2
SELECT nomeplat, ano_lancamento
FROM plataforma JOIN  fabricante
WHERE ano_fundacao  > 1970;

-- 3
SELECT nomemid, velocidade_leitura
FROM midia
WHERE 10  <  velocidade_leitura  AND velocidade_leitura<30
ORDER BY velocidade_leitura DESC;

-- 4
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES(7, 'WiiU', 2012, '214748364', (
    SELECT idfabricante
    FROM fabricante
    WHERE  nomefab = 'Nintendo'));

-- 5
SELECT nomeplat, nomefab, numero_jogos, nji.idplataforma
FROM (
         SELECT nomeplat, nomefab, idplataforma
         FROM plataforma INNER JOIN fabricante ON plataforma.idfabricante=fabricante.idfabricante
         GROUP BY idplataforma
     ) AS nni INNER JOIN  (
    SELECT SUM(quantidade) AS numero_jogos, idplataforma
    FROM compativel_jogo_plataforma
    GROUP BY idplataforma
) AS nji ON nji.idplataforma = nni.idplataforma
GROUP BY nji.idplataforma;

-- 6
SELECT nomejogo, jogo.idjogo
FROM jogo INNER JOIN ((SELECT idjogo, count(idplataforma) as idpt
                       FROM compativel_jogo_plataforma
                       GROUP BY idjogo)) cjp on jogo.idjogo = cjp.idjogo
WHERE cjp.idpt>=2;

-- 7
SELECT count(idjogo) as jogos_lancados, ano_lancamento_jogo
FROM compativel_jogo_plataforma
GROUP BY ano_lancamento_jogo
ORDER BY ano_lancamento_jogo;

-- 8
SELECT ano_lancamento_jogo, nomejogo, nomeplat
FROM compativel_jogo_plataforma JOIN jogo j ON compativel_jogo_plataforma.idjogo = j.idjogo JOIN trabalhobd.plataforma p on p.idplataforma = compativel_jogo_plataforma.idplataforma
WHERE ano_lancamento_jogo = (SELECT MIN(ano_lancamento_jogo)
                             FROM compativel_jogo_plataforma)
GROUP BY ano_lancamento_jogo, nomejogo, nomeplat;

-- 9
SELECT AVG(memoria)
FROM plataforma NATURAL JOIN compativel_jogo_plataforma NATURAL JOIN jogo;

-- 10
SELECT nomefab
FROM fabricante NATURAL JOIN (SELECT count(nomemid) AS con, idfabricante
                              FROM plataforma NATURAL JOIN compativel_midia NATURAL JOIN midia
                              GROUP BY idfabricante) as ci
WHERE con>=2;





















-- MySQL Script generated by MySQL Workbench
-- Thu 08 Dec 2022 05:05:39 PM -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trabalhobd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trabalhobd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabalhobd` ;
USE `trabalhobd` ;

-- -----------------------------------------------------
-- Table `trabalhobd`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`fabricante` (
                                                         `idfabricante` INT NOT NULL,
                                                         `nomefab` VARCHAR(30) NULL,
                                                         `ano_fundacao` INT NULL,
                                                         PRIMARY KEY (`idfabricante`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`plataforma` (
                                                         `idplataforma` INT NOT NULL,
                                                         `nomeplat` VARCHAR(30) NULL,
                                                         `memoria` INT NULL,
                                                         `ano_lancamento` INT NULL,
                                                         `idfabricante` INT NOT NULL,
                                                         PRIMARY KEY (`idplataforma`),
                                                         INDEX `fk_plataforma_fabricante1_idx` (`idfabricante` ASC) VISIBLE,
                                                         CONSTRAINT `fk_plataforma_fabricante1`
                                                             FOREIGN KEY (`idfabricante`)
                                                                 REFERENCES `trabalhobd`.`fabricante` (`idfabricante`)
                                                                 ON DELETE NO ACTION
                                                                 ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`midia` (
                                                    `idmidia` INT NOT NULL,
                                                    `nomemid` VARCHAR(30) NULL,
                                                    `velocidade_leitura` INT NULL,
                                                    PRIMARY KEY (`idmidia`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`jogo` (
                                                   `idjogo` INT NOT NULL,
                                                   `nomejogo` VARCHAR(30) NULL,
                                                   `descricao` VARCHAR(30) NULL,
                                                   PRIMARY KEY (`idjogo`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_midia` (
                                                               `idplataforma` INT NOT NULL,
                                                               `idmidia` INT NOT NULL,
                                                               PRIMARY KEY (`idplataforma`, `idmidia`),
                                                               INDEX `fk_plataforma_has_midia_midia1_idx` (`idmidia` ASC) VISIBLE,
                                                               INDEX `fk_plataforma_has_midia_plataforma_idx` (`idplataforma` ASC) VISIBLE,
                                                               CONSTRAINT `fk_plataforma_has_midia_plataforma`
                                                                   FOREIGN KEY (`idplataforma`)
                                                                       REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
                                                                       ON DELETE NO ACTION
                                                                       ON UPDATE NO ACTION,
                                                               CONSTRAINT `fk_plataforma_has_midia_midia1`
                                                                   FOREIGN KEY (`idmidia`)
                                                                       REFERENCES `trabalhobd`.`midia` (`idmidia`)
                                                                       ON DELETE NO ACTION
                                                                       ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_jogo_plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_jogo_plataforma` (
                                                                         `idjogo` INT NOT NULL,
                                                                         `idplataforma` INT NOT NULL,
                                                                         `quantidade` INT NULL,
                                                                         `ano_lancamento_jogo` INT NULL,
                                                                         PRIMARY KEY (`idjogo`, `idplataforma`),
                                                                         INDEX `fk_jogo_has_plataforma_plataforma1_idx` (`idplataforma` ASC) VISIBLE,
                                                                         INDEX `fk_jogo_has_plataforma_jogo1_idx` (`idjogo` ASC) VISIBLE,
                                                                         CONSTRAINT `fk_jogo_has_plataforma_jogo1`
                                                                             FOREIGN KEY (`idjogo`)
                                                                                 REFERENCES `trabalhobd`.`jogo` (`idjogo`)
                                                                                 ON DELETE NO ACTION
                                                                                 ON UPDATE NO ACTION,
                                                                         CONSTRAINT `fk_jogo_has_plataforma_plataforma1`
                                                                             FOREIGN KEY (`idplataforma`)
                                                                                 REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
                                                                                 ON DELETE NO ACTION
                                                                                 ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`Jogadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`Jogadores` (
                                                        `idJogadores` INT NOT NULL,
                                                        `jogador_nome` VARCHAR(30) NULL,
                                                        `nickname` VARCHAR(4) NULL,
                                                        PRIMARY KEY (`idJogadores`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`jogo_has_Jogadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`jogo_has_Jogadores` (
                                                                 `jogo_idjogo` INT NOT NULL,
                                                                 `Jogadores_idJogadores` INT NOT NULL,
                                                                 `Horas` INT NULL,
                                                                 PRIMARY KEY (`jogo_idjogo`, `Jogadores_idJogadores`),
                                                                 INDEX `fk_jogo_has_Jogadores_Jogadores1_idx` (`Jogadores_idJogadores` ASC) VISIBLE,
                                                                 INDEX `fk_jogo_has_Jogadores_jogo1_idx` (`jogo_idjogo` ASC) VISIBLE,
                                                                 CONSTRAINT `fk_jogo_has_Jogadores_jogo1`
                                                                     FOREIGN KEY (`jogo_idjogo`)
                                                                         REFERENCES `trabalhobd`.`jogo` (`idjogo`)
                                                                         ON DELETE NO ACTION
                                                                         ON UPDATE NO ACTION,
                                                                 CONSTRAINT `fk_jogo_has_Jogadores_Jogadores1`
                                                                     FOREIGN KEY (`Jogadores_idJogadores`)
                                                                         REFERENCES `trabalhobd`.`Jogadores` (`idJogadores`)
                                                                         ON DELETE NO ACTION
                                                                         ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (1, 'Nintendo', 1889);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (2, 'Sony', 1946);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (3, 'Microsoft', 1975);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (4, 'Atari', 1972);


INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (1, 'Atari 2600', 1977, '128', 4);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (2, 'NES', 1985, '2048', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (3, 'SNES', 1990, '131072', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (4, 'Wii', 2006, '92274688', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (5, 'Xbox360', 2005, '536870912', 3);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (6, 'PlayStation3', 2006, '536870912', 2);


INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (1, 'CD', 10);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (2, 'DVD', 20);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (3, 'Blu-ray', 40);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (4, 'Disquete', 1);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (5, 'SD', 100);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (6, 'Cartucho', 1000);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (7, 'HD-USB', 100);


INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (1, 'River Raid', 'Tiro');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (2, 'Mario Bros', 'Aventura');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (3, 'F-Zero', 'Corrida');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (4, 'Super Mario Bros', 'Aventura');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (5, 'Wii Sports', 'Esportes variados');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (6, 'FIFA12', 'Futebol');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (7, 'God of War 3', 'Ação');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (8, 'Forza MotorSport', 'Corrida realista');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (9, 'Gran Turismo 5', 'Corrida realista');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (10, 'Street Fighter IV', 'Luta');


INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (1, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (2, 4);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (2, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (3, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (4, 2);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (4, 5);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (5, 2);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (5, 7);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (6, 3);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (6, 7);



INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (1, 1, 2, 1982);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (1, 2, 2, 1983);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (2, 2, 1, 1983);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (3, 3, 1, 1990);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 3, 1, 2007);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (2, 4, 1, 1985);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 4, 1, 2007);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 5, 1, 2006);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 7, 2, 2012);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 8, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 9, 1, 2010);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 10, 2, 2008);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 10, 1, 2008);

INSERT INTO trabalhobd.Jogadores(idJogadores, jogador_nome, nickname) VALUES (1,'Predro','KILL');
INSERT INTO trabalhobd.Jogadores(idJogadores, jogador_nome, nickname) VALUES (2,'Rafael','GASS');
INSERT INTO trabalhobd.Jogadores(idJogadores, jogador_nome, nickname) VALUES (3,'Joao','PLAY');
INSERT INTO trabalhobd.Jogadores(idJogadores, jogador_nome, nickname) VALUES (4,'Daniel','KING');

INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (1,1,14);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (2,2,23);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (3,3,45);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (1,4,67);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (2,1,44);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (4,2,80);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (9,3,70);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (10,4,45);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (7,2,3);
INSERT INTO trabalhobd.jogo_has_Jogadores(jogo_idjogo, Jogadores_idJogadores, Horas) VALUES (9,1,1);

-- nicknames de jogadores com mais de 100 horas de jogadas no geral.
SELECT nickname
FROM Jogadores NATURAL JOIN (SELECT SUM(Horas) AS horas_totais, idJogadores
                             FROM jogo_has_Jogadores JOIN Jogadores J on J.idJogadores = jogo_has_Jogadores.Jogadores_idJogadores
                             GROUP BY idJogadores) as htiJ
WHERE horas_totais >=100;


-- quantas horas cada plataforma tem e o nome da plataforma.
SELECT nomeplat, SUM(Horas) as horas_plat
FROM jogo_has_Jogadores JOIN jogo j on j.idjogo = jogo_has_Jogadores.jogo_idjogo JOIN trabalhobd.compativel_jogo_plataforma cjp on j.idjogo = cjp.idjogo JOIN trabalhobd.plataforma p on cjp.idplataforma = p.idplataforma
GROUP BY p.idplataforma;