CREATE DATABASE FAST_Marketplace;
USE FAST_Marketplace;

-- FAST_Marketplace.Categoria_Produto definition

CREATE TABLE `Categoria_Produto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(120) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Departamento definition

CREATE TABLE `Departamento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(120) NOT NULL,
  `Descricao` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Formacao definition

CREATE TABLE `Formacao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Grau` varchar(80) NOT NULL,
  `Curso` varchar(120) NOT NULL,
  `Instituicao` varchar(120) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Funcao definition

CREATE TABLE `Funcao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(120) NOT NULL,
  `Descricao` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Loja definition

CREATE TABLE `Loja` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(120) NOT NULL,
  `Rua` varchar(120) NOT NULL,
  `Bairro` varchar(120) NOT NULL,
  `Cidade` varchar(120) NOT NULL,
  `Numero` varchar(120) NOT NULL,
  `CEP` varchar(10) NOT NULL,
  `Complemento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Pessoa definition

CREATE TABLE `Pessoa` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(120) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Salario` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Produto definition

CREATE TABLE `Produto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(120) NOT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Funcao_Departamento definition

CREATE TABLE `Funcao_Departamento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Funcao` int NOT NULL,
  `ID_Departamento` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Funcao` (`ID_Funcao`),
  KEY `ID_Departamento` (`ID_Departamento`),
  CONSTRAINT `Funcao_Departamento_ibfk_1` FOREIGN KEY (`ID_Funcao`) REFERENCES `Funcao` (`ID`),
  CONSTRAINT `Funcao_Departamento_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `Departamento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Pessoa_Departamento definition

CREATE TABLE `Pessoa_Departamento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Pessoa` int NOT NULL,
  `ID_Departamento` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Pessoa` (`ID_Pessoa`),
  KEY `ID_Departamento` (`ID_Departamento`),
  CONSTRAINT `Pessoa_Departamento_ibfk_1` FOREIGN KEY (`ID_Pessoa`) REFERENCES `Pessoa` (`ID`),
  CONSTRAINT `Pessoa_Departamento_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `Departamento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Pessoa_Formacao definition

CREATE TABLE `Pessoa_Formacao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Pessoa` int NOT NULL,
  `ID_Formacao` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Pessoa` (`ID_Pessoa`),
  KEY `ID_Formacao` (`ID_Formacao`),
  CONSTRAINT `Pessoa_Formacao_ibfk_1` FOREIGN KEY (`ID_Pessoa`) REFERENCES `Pessoa` (`ID`),
  CONSTRAINT `Pessoa_Formacao_ibfk_2` FOREIGN KEY (`ID_Formacao`) REFERENCES `Formacao` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Pessoa_Funcao definition

CREATE TABLE `Pessoa_Funcao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Pessoa` int NOT NULL,
  `ID_Funcao` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Pessoa` (`ID_Pessoa`),
  KEY `ID_Funcao` (`ID_Funcao`),
  CONSTRAINT `Pessoa_Funcao_ibfk_1` FOREIGN KEY (`ID_Pessoa`) REFERENCES `Pessoa` (`ID`),
  CONSTRAINT `Pessoa_Funcao_ibfk_2` FOREIGN KEY (`ID_Funcao`) REFERENCES `Funcao` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Pessoa_Loja definition

CREATE TABLE `Pessoa_Loja` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Pessoa` int NOT NULL,
  `ID_Loja` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Pessoa` (`ID_Pessoa`),
  KEY `ID_Loja` (`ID_Loja`),
  CONSTRAINT `Pessoa_Loja_ibfk_1` FOREIGN KEY (`ID_Pessoa`) REFERENCES `Pessoa` (`ID`),
  CONSTRAINT `Pessoa_Loja_ibfk_2` FOREIGN KEY (`ID_Loja`) REFERENCES `Loja` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Produto_Categoria_Produto definition

CREATE TABLE `Produto_Categoria_Produto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Produto` int NOT NULL,
  `ID_Categoria_Produto` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Produto` (`ID_Produto`),
  KEY `ID_Categoria_Produto` (`ID_Categoria_Produto`),
  CONSTRAINT `Produto_Categoria_Produto_ibfk_1` FOREIGN KEY (`ID_Produto`) REFERENCES `Produto` (`ID`),
  CONSTRAINT `Produto_Categoria_Produto_ibfk_2` FOREIGN KEY (`ID_Categoria_Produto`) REFERENCES `Categoria_Produto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- FAST_Marketplace.Produto_Departamento definition

CREATE TABLE `Produto_Departamento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Produto` int NOT NULL,
  `ID_Departamento` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Produto` (`ID_Produto`),
  KEY `ID_Departamento` (`ID_Departamento`),
  CONSTRAINT `Produto_Departamento_ibfk_1` FOREIGN KEY (`ID_Produto`) REFERENCES `Produto` (`ID`),
  CONSTRAINT `Produto_Departamento_ibfk_2` FOREIGN KEY (`ID_Departamento`) REFERENCES `Departamento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;