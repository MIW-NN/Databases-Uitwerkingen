USE `basketbal`;

-- 1. Maak een view Apollohalteams, met daarin de teamgegevens van die teams die de Apollohal als thuishal hebben.
SELECT *
FROM `Team`
WHERE `thuishal` = "Apollohal";

CREATE VIEW Apollohalteams AS
	SELECT *
	FROM `Team`
	WHERE `thuishal` = "Apollohal";
    
SELECT *
FROM `Apollohalteams`;

-- 2. Wedstrijden worden altijd gespeeld in de hal van het thuis spelende team. 
-- 		Gebruik de view Apollohalteams om de wedstrijden in de Apollohal weer te geven. 
-- 		Zet de laatst gespeelde wedstrijd bovenaan de lijst.
SELECT *
FROM `Wedstrijd`
WHERE `teamthuis` IN (SELECT `teamcode` FROM `Apollohalteams`)
ORDER BY `datum` DESC, `tijd` DESC;

-- 3. Maak een view van leden, gesorteerd op lidnummer, voor wie minstens één boete is geregistreerd. 
-- 		Geef ook de gegevens van deze boete (betalingsnummer, type, bedrag en datum).
SELECT *
FROM `Lid` JOIN `Boete`
	ON `lidnr` = `lidnummer`
ORDER BY `lidnr`;

CREATE VIEW `BeboeteLeden` AS
	SELECT *
	FROM `Lid` JOIN `Boete`
		ON `lidnr` = `lidnummer`
	ORDER BY `lidnr`;
    
SELECT * FROM `BeboeteLeden`;

-- 4. Geef voor elk lid voor wie minstens één boete is geregistreerd (gebruik je view uit de vorige opdracht) het lidnummer, de gemiddelde boete (2 decimalen) en het aantal boetes.
SELECT
	`lidnr`,
    avg(`bedrag`) AS "gemiddelde_boete",
    count(*) AS "aantal_boetes"
FROM `BeboeteLeden`
GROUP BY `lidnr`;