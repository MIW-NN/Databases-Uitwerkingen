DROP DATABASE IF EXISTS `bibliotheek`;

-- Create database
CREATE DATABASE IF NOT EXISTS `bibliotheek`;
USE `bibliotheek`;

CREATE TABLE `Auteur` (
    auteurnummer    INT             PRIMARY KEY,
    voornaam        VARCHAR(45)     NOT NULL,
    tussenvoegsel   VARCHAR(45),
    achternaam      VARCHAR(45)     NOT NULL,
    locatie         VARCHAR(45)
);

CREATE TABLE `Uitgever` (
    naam        VARCHAR(45)     PRIMARY KEY,
    locatie     VARCHAR(45)     NOT NULL
);

CREATE TABLE `Lid` (
    lidnummer       INT             PRIMARY KEY,
    naam            VARCHAR(45)     NOT NULL,
    adres           VARCHAR(45),
    geboortedatum   DATE
);

CREATE TABLE `Boek` (
    isbn                INT             PRIMARY KEY,
    titel               VARCHAR(45)     NOT NULL,
    genre               VARCHAR(45),
    publicatiedatum     DATE            NOT NULL,
    uitgeversnaam       VARCHAR(45)     NOT NULL,
    FOREIGN KEY (uitgeversnaam)
        REFERENCES `Uitgever`(naam)
);

CREATE TABLE `BoekAuteur` (
    isbn            INT,
    auteurnummer    INT,
    PRIMARY KEY (isbn, auteurnummer),
    FOREIGN KEY (isbn)
        REFERENCES `Boek`(isbn),
    FOREIGN KEY (auteurnummer)
        REFERENCES `Auteur`(auteurnummer)
);

CREATE TABLE `Exemplaar` (
    isbn                INT,
    exemplaarnummer     INT,
    jaar_van_aanschaf   YEAR,
    PRIMARY KEY (isbn, exemplaarnummer),
    FOREIGN KEY (isbn)
        REFERENCES `Boek`(isbn)
);

CREATE TABLE `Lening` (
    isbn                INT,
    exemplaarnummer     INT,
    lidnummer           INT,
    uitleendatum        DATE,
    terugbrengdatum     DATE,
    PRIMARY KEY (isbn, exemplaarnummer, lidnummer, uitleendatum),
    FOREIGN KEY (isbn, exemplaarnummer) REFERENCES `Exemplaar`(isbn, exemplaarnummer),
    FOREIGN KEY (lidnummer) REFERENCES `Lid`(lidnummer)
);