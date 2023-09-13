USE FAST_Agenda;

CREATE TABLE IF NOT EXISTS `Pessoa` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(120) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `Tipo_Email` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo_Email` varchar(80) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `Email` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `ID_Tipo_Email` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID_Tipo_Email`) REFERENCES `Tipo_Email`(`ID`)
);

CREATE TABLE IF NOT EXISTS `Tipo_Telefone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo_Telefone` varchar(80) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `Telefone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Telefone` varchar(30) NOT NULL,
  `ID_Tipo_Telefone` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID_Tipo_Telefone`) REFERENCES `Tipo_Telefone` (`ID`)
);

CREATE TABLE IF NOT EXISTS `Pessoa_Telefone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Pessoa_Telefone` INT NOT NULL,
  `ID_Pessoa` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID_Pessoa_Telefone`) REFERENCES `Telefone` (`ID`),
  FOREIGN KEY (`ID_Pessoa`) REFERENCES `Pessoa` (`ID`)
);

CREATE TABLE IF NOT EXISTS `Pessoa_Email` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Pessoa` INT NOT NULL,
  `ID_Pessoa_Email` INT NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID_Pessoa_Email`) REFERENCES `Email` (`ID`),
  FOREIGN KEY (`ID_Pessoa`) REFERENCES `Pessoa` (`ID`)
);


