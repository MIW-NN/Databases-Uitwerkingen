-- 5.2 Basketbal SQL JOIN
USE `basketbal`;

-- 1 Geef van elke team de teamgegevens en de gegevens van de aanvoerder
SELECT *
FROM `Team` JOIN `Lid`
	ON `Team`.`aanvoerder` = `Lid`.`lidnr`;
    
-- 2.	Geef van elk team de teamcode en de naam van de aanvoerder.
SELECT `Team`.`teamcode`, `Lid`.`voorletters`, `Lid`.`tussenvoegsel`, `Lid`.`achternaam`
FROM `Team` JOIN `Lid`
	ON `Team`.`aanvoerder` = `Lid`.`lidnr`;
    
-- 2 alternatief:
SELECT `Team`.`teamcode`, concat_ws(" ", `Lid`.`voorletters`, `Lid`.`tussenvoegsel`, `Lid`.`achternaam`) AS "aanvoerder"
FROM `Team` JOIN `Lid`
	ON `Team`.`aanvoerder` = `Lid`.`lidnr`;
    
-- 3.	Geef van elk team uit de klasse B2000 de teamcode en de achternaam van de aanvoerder.
SELECT `Team`.`teamcode`, `Lid`.`achternaam`
FROM `Team` JOIN `Lid`
	ON `Team`.`aanvoerder` = `Lid`.`lidnr`
WHERE `Team`.`klasse` = "B2000";

-- 4.	Geef van de leden met boetes het lidnummer, de naam en de boetebedragen die voor hem of haar geregistreerd zijn.
SELECT `Boete`.`lidnummer`, `Lid`.`achternaam`, `Boete`.`bedrag`
FROM `Boete` JOIN `Lid`
	ON `Boete`.`lidnummer` = `Lid`.`lidnr`;
    
-- 5.	Geef van de vrouwelijke leden uit Volendam het lidnummer, de naam en de boetebedragen die voor haar geregistreerd zijn.
SELECT `Boete`.`lidnummer`, `Lid`.`achternaam`, `Boete`.`bedrag`
FROM `Boete` JOIN `Lid`
	ON `Boete`.`lidnummer` = `Lid`.`lidnr`
WHERE `Lid`.`woonplaats` = "Volendam" 
	AND `Lid`.`geslacht` = "v";
    
-- 6.	Geef van de leden, die aanvoerder van een team zijn, het lidnummer en de achternaam. 
-- Geef ook de teamcode en de klasse van het team waarvan hij of zij aanvoerder is.
SELECT `Lid`.`lidnr`, `Lid`.`achternaam`, `Team`.`teamcode`, `Team`.`klasse`
FROM `Team` JOIN `Lid`
	ON `Team`.`aanvoerder` = `Lid`.`lidnr`;
    
-- 7.	Geef het lidnummer, de achternaam en de woonplaats van elke vrouwelijke speler die niet in Delft woonachtig is.
SELECT `lidnr`, `achternaam`, `woonplaats`
FROM `Lid`
WHERE `woonplaats` != "Delft" 
	AND `geslacht` = "v";
    
-- 8.	Geef de lidnummers van de leden die in de periode 2000-2005 tot de vereniging zijn toegetreden.
SELECT `lidnr`, `jaartoe`
FROM `Lid`
WHERE jaartoe BETWEEN 2000 AND 2005;

-- 9.	Geef een lijst van leden met de achternaam, de geboortedatum en de huidige leeftijd.
SELECT `lidnr`, `achternaam`, `geb_datum`, timestampdiff(YEAR, `geb_datum`, curdate()) AS "leeftijd"
FROM `Lid`;

-- 10.	Geef de achternaam van de leden en het volledig adres. Het adres moet in één kolom komen te staan met als kolomkop ‘adres’.
SELECT `achternaam`, concat(`straat`, " ", `huisnr`, ifnull(`toevoeging`, ""), " ", `postcode`, " ", `woonplaats`) AS "adres"
FROM `Lid`;

SELECT `achternaam`, concat_ws(" ", `straat`, concat(`huisnr`, ifnull(`toevoeging`, "")), `postcode`, `woonplaats`) AS "adres"
FROM `Lid`;

-- 11.	Geef een lijst van teams met hun thuis gewonnen wedstrijden. Laat het team zien met daarachter uitslag in één kolom als volgt: 30 – 24.
SELECT `teamcode`, `teamnaam`, concat(`scorethuis`, "-", `scoreuit`) AS "uitslag"
FROM `Team` JOIN `Wedstrijd`
	ON `Team`.`teamcode` = `Wedstrijd`.`teamthuis`  
WHERE `scorethuis` > `scoreuit`;

-- 12.	Geef een lijst met boetes die meer dan twintig jaar geleden uitgedeeld zijn.
SELECT *
FROM `Boete`
WHERE timestampdiff(YEAR, `datumovertreding`, curdate()) > 20;

-- 13. Geef van elk lid het lidnummer, de achternaam en de boetebedragen die voor dit lid geregistreerd zijn, dus ook leden zonder boetes
SELECT `lidnr`, `achternaam`, `bedrag`
FROM `Lid` LEFT JOIN `Boete` 
	ON `lidnr` = `lidnummer`;

-- 14. Toon 0 in plaats van null bij de vorige opdracht
SELECT `lidnr`, `achternaam`, ifnull(`bedrag`, 0) AS "bedrag"
FROM `Lid` LEFT JOIN `Boete` 
	ON `lidnr` = `lidnummer`;

-- 15. Geef een overzicht van alle leden, toon het lidnummer, de achternaam, en van aanvoerders ook het team (teamcode en teamnaam) waar ze aanvoerder van zijn.
SELECT `lidnr`, `achternaam`, `teamcode`, `teamnaam`
FROM `Lid` LEFT JOIN `Team`
	ON `lidnr` = `aanvoerder`;

-- 16. Geef een lijst van de leden die spelen in team REDGH1. Toon waar mogelijk informatie over de bestuursfunctie het lid heeft gehad. Toon het lidnummer, de achternaam en eventuele de functie en begindatum
SELECT `lidnr`, `achternaam`, `functie`, `begindatum`
FROM `Lid` LEFT JOIN `Bestuurslid`
	ON `lidnr` = `lidnummer`
WHERE `speelt_in` = "REDGH1";

-- 17. Vraag uit de klas: Is een aanvoerder ook bestuurder? Geef de personalia van deze aanvoerders

SELECT 
	lidnr,
	CONCAT_WS(" ", voorletters, tussenvoegsel, achternaam) AS naam,
    functie
FROM (Team JOIN Bestuurslid
	ON Team.aanvoerder = Bestuurslid.lidnummer) JOIN Lid
		ON Bestuurslid.lidnummer = Lid.lidnr;