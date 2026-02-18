DROP SCHEMA IF EXISTS `werknemer`;
CREATE SCHEMA `werknemer`;
USE `werknemer`;

CREATE TABLE `Afdeling`
(
	`afdelingnummer` 	INT			 NOT NULL,
	`afdelingnaam` 		VARCHAR(16)  NOT NULL,
	`locatie` 			VARCHAR(16)  NOT NULL,

	PRIMARY KEY (`afdelingnummer`)
);

CREATE TABLE `Salarisschaal`
(
	`schaal` 		INT 	NOT NULL,
	`ondergrens` 	INT 	NOT NULL,
	`bovengrens` 	INT 	NOT NULL,
  
	PRIMARY KEY (schaal)
);

CREATE TABLE `Werknemer`
(
	`werknemernummer` 	INT 			NOT NULL,
	`functie` 			VARCHAR(10) 	NOT NULL,
	`chef` 				INT,
	`datum_in_dienst` 	DATE 			NOT NULL,
	`salaris` 			DOUBLE 			NOT NULL,
	`commissie` 			DOUBLE,
	`afdelingnummer` 		INT,
  
	PRIMARY KEY (`werknemernummer`),

	FOREIGN KEY (`afdelingnummer`) 
		REFERENCES `werknemer`.`Afdeling` (`afdelingnummer`) 
		ON DELETE RESTRICT 
		ON UPDATE RESTRICT,
        
	FOREIGN KEY (`chef`)
		REFERENCES `werknemer`.`Werknemer` (`werknemernummer`)
		ON DELETE RESTRICT
		ON UPDATE SET NULL,
        
	INDEX (`afdelingnummer` ASC),
	INDEX (`chef` ASC)
);

CREATE TABLE `Prive`
(
	`werknemernummer` 		INT 			NOT NULL,
	`achternaam` 			VARCHAR(10) 	NOT NULL,
	`voorletter` 			VARCHAR(6),
	`adres` 				VARCHAR(25),
	`postcode` 				VARCHAR(6),
	`woonplaats` 			VARCHAR(15),

	PRIMARY KEY (`werknemernummer`),
    
	FOREIGN KEY (`werknemernummer`)
		REFERENCES `werknemer`.`Werknemer` (`werknemernummer`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);