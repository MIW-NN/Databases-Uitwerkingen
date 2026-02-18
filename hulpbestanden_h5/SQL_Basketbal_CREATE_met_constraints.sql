DROP SCHEMA IF EXISTS `basketbal`;
CREATE SCHEMA `basketbal` CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE `basketbal`.`Lid` (
    lidnr 				SMALLINT 	NOT NULL,
    achternaam 			VARCHAR(25) NOT NULL,
    voorletters 		VARCHAR(6) 	NOT NULL,
    tussenvoegsel 		VARCHAR(7),
    geb_datum 			DATE 		NOT NULL,
    geslacht 			VARCHAR(1) 	NOT NULL,
    jaartoe 			YEAR 		NOT NULL,
    straat 				VARCHAR(50) NOT NULL,
    huisnr 				VARCHAR(4) 	NOT NULL,
    toevoeging 			VARCHAR(4),
    postcode 			VARCHAR(7),
    woonplaats 			VARCHAR(50) NOT NULL,
    telefoon 			VARCHAR(15),
    emailadres 			VARCHAR(50),
    speelt_in			VARCHAR(10),
    bank 				VARCHAR(10),
    
    PRIMARY KEY (lidnr)
);

CREATE TABLE `basketbal`.`Boete` (
    betalingnummer 		SMALLINT 		NOT NULL,
    lidnummer 			SMALLINT,
    boetetype 			VARCHAR(1),
    datumovertreding 	DATE,
    bedrag 				DECIMAL(5 , 2 ),
    
    PRIMARY KEY (`betalingnummer`),
    
    FOREIGN KEY (`lidnummer`) REFERENCES `basketbal`.`Lid` (`lidnr`)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
        
	CONSTRAINT bedrag_mag_niet_hoger_dan_15_zijn CHECK (`bedrag` < 15)
);

CREATE TABLE `basketbal`.`Sporthal` (
    sporthalnaam VARCHAR(25) NOT NULL,
    sporthalplaats VARCHAR(25),
    aantalvelden SMALLINT,
    CONSTRAINT sporthal_pkey PRIMARY KEY (sporthalnaam)
);

CREATE TABLE `basketbal`.`Team` (
    klasse VARCHAR(8) NOT NULL,
    teamcode VARCHAR(10) NOT NULL,
    teamnaam VARCHAR(50),
    thuishal VARCHAR(25),
    aanvoerder SMALLINT,
    
    PRIMARY KEY (teamcode),
    UNIQUE (teamnaam)
);

CREATE TABLE `basketbal`.`Wedstrijd` (
    datum DATE,
    tijd TIME,
    veld SMALLINT,
    teamthuis VARCHAR(10) NOT NULL,
    klasse VARCHAR(8) NOT NULL,
    teamuit VARCHAR(10) NOT NULL,
    scorethuis INT NOT NULL,
    scoreuit INT NOT NULL,
    CONSTRAINT wedstrijd_pkey PRIMARY KEY (teamthuis , teamuit)
);

CREATE INDEX wedstrijd_thuisteam
	ON `basketbal`.`Wedstrijd` (`teamthuis`); 