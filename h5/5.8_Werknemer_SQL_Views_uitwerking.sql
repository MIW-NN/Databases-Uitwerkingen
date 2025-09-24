USE `werknemer`;

-- 1. Maak een view die de gegevens van de verkopers weergeeft en noem deze Verkopers.
SELECT *
FROM `Werknemer`
WHERE `functie` = "Verkoper";

CREATE VIEW Verkopers AS
	SELECT *
	FROM `Werknemer`
	WHERE `functie` = "Verkoper";

-- 2. Gebruik de view Verkopers om de verkopers te geven (naam, salaris) die in schaal 3 zitten.
SELECT `achternaam`, `salaris`
FROM (`Verkopers` JOIN `Salarisschaal`
	ON `salaris` BETWEEN `ondergrens` AND `bovengrens`) JOIN `Prive`
    ON `Verkopers`.`werknemernummer` = `Prive`.`werknemernummer`
WHERE `schaal` = 3;

-- 3. Maak een view Privégegevens die van alle werknemers hun privégegevens, hun functie en de locatie van de afdeling geeft.
SELECT `Prive`.`werknemernummer`, `achternaam`, `voorletter`, `adres`, `postcode`, `woonplaats`, `functie`, `locatie`
FROM (`Werknemer` JOIN `Prive`
	ON `Werknemer`.`werknemernummer` = `Prive`.`werknemernummer`) JOIN `Afdeling`
	ON `Werknemer`.`afdelingnummer` = `Afdeling`.`afdelingnummer`;
    
CREATE VIEW Privégegevens AS
	SELECT `Prive`.`werknemernummer`, `achternaam`, `voorletter`, `adres`, `postcode`, `woonplaats`, `functie`, `locatie`
	FROM (`Werknemer` JOIN `Prive`
		ON `Werknemer`.`werknemernummer` = `Prive`.`werknemernummer`) JOIN `Afdeling`
		ON `Werknemer`.`afdelingnummer` = `Afdeling`.`afdelingnummer`;

-- 4. Gebruik de view Privégegevens om de werknemers te laten zien die wonen én werken in dezelfde plaats.
SELECT *
FROM `Privégegevens`
WHERE `woonplaats` = `locatie`;

-- 5. Maak een view aan van alle chefs en noem die Chefs, alle gegevens, oplopend op naam gesorteerd.   
CREATE VIEW Chefs AS
	SELECT	`Werknemer`.`werknemernummer`, `achternaam`, `functie`, `chef`, `datum_in_dienst`, `salaris`, `commissie`, `afdelingnummer`
	FROM `Werknemer` JOIN `Prive`
		ON `Werknemer`.`werknemernummer` = `Prive`.`werknemernummer`
	WHERE `Werknemer`.`werknemernummer` IN (
		SELECT `chef`
		FROM `Werknemer`
	)
	ORDER BY `achternaam`;
    
SELECT * FROM `Chefs`;