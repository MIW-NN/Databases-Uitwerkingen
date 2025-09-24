USE `basketbal`;

-- 1. Geef de leden die in dezelfde plaats wonen als het lid met nummer 83.

-- Tussenstappen, deze lever je dus niet in!!!

SELECT `woonplaats`
FROM `Lid`
WHERE `lidnr` = 83;

SELECT *
FROM `Lid`
WHERE `woonplaats` = "Landsmeer";

-- Antwoord, onderstaand is dus juist wat je wel inlevert
SELECT *
FROM `Lid`
WHERE `woonplaats` = (
	SELECT `woonplaats`
	FROM `Lid`
	WHERE `lidnr` = 83
);

-- 2. Geef een overzicht van de boetes van de leden die in Amsterdam wonen.

-- Tussenstappen
SELECT `lidnr`
FROM `Lid`
WHERE `woonplaats` = "Amsterdam";

SELECT *
FROM `Boete`
WHERE `lidnummer` IN (1, 2, 3, 10, 108, 109); -- Ze hoeven hier niet allemaal te staan, maar als het er meerdere kunnen zijn, test dan met meerdere!

-- Antwoord
SELECT *
FROM `Boete`
WHERE `lidnummer` IN (
	SELECT `lidnr`
	FROM `Lid`
	WHERE `woonplaats` = "Amsterdam"
);

-- 3. Geef de thuiswedstrijden en de uitslag van de thuiswedstrijden van de teams met als thuishal de Apollohal.

-- Tussenstappen
SELECT `teamcode`
FROM `Team`
WHERE `thuishal` = "Apollohal";

SELECT *
FROM `Wedstrijd`
WHERE `teamthuis` IN ("AMSTH1", "AMSTH2");

-- Ik zie dat het onduidelijk is welke velden hier getoont moeten worden, mijn interpretatie hier is: welke teams spelen en wat was de eindstand
SELECT 
	concat_ws(" - ", `teamthuis`, `teamuit`) AS "wedstrijd", 
    concat_ws(" - ", `scorethuis`, `scoreuit`) AS "uitslag"
FROM `Wedstrijd`
WHERE `teamthuis` IN ("AMSTH1", "AMSTH2");

SELECT 
	concat_ws(" - ", `teamthuis`, `teamuit`) AS "wedstrijd", 
    concat_ws(" - ", `scorethuis`, `scoreuit`) AS "uitslag"
FROM `Wedstrijd`
WHERE `teamthuis` IN (
	SELECT `teamcode`
	FROM `Team`
	WHERE `thuishal` = "Apollohal"
);

-- 4. Geef een overzicht van de boetes van de leden die voor team LEAMD1 hebben gespeeld.
SELECT `lidnr`
FROM `Lid`
WHERE `speelt_in` = "LEAMD1";

SELECT *
FROM `Boete`
WHERE `lidnummer` IN (2, 109);

SELECT *
FROM `Boete`
WHERE `lidnummer` IN (
	SELECT `lidnr`
	FROM `Lid`
	WHERE `speelt_in` = "LEAMD1"
);

-- 5. Geef de namen van de leden die de hoogste boete hebben gekregen.
SELECT max(`bedrag`)
FROM `Boete`;

SELECT `lidnummer`
FROM `Boete`
WHERE `bedrag` = 11.0;

SELECT concat_ws(" ", `voorletters`, `tussenvoegsel`, `achternaam`) AS "naam"
FROM `Lid`
WHERE `lidnr` IN (201, 208);

SELECT concat_ws(" ", `voorletters`, `tussenvoegsel`, `achternaam`) AS "naam"
FROM `Lid`
WHERE `lidnr` IN (
	SELECT `lidnummer`
	FROM `Boete`
	WHERE `bedrag` = (
		SELECT max(`bedrag`)
		FROM `Boete`
    )
);

-- 6. (a) Geef een lijst van leden en het aantal boetes dat ze hebben betaald, laat de naam van het lid en het aantal boetes zien.
SELECT `achternaam`, count(*) AS "aantal_boetes" 
FROM `Lid` JOIN `Boete` 
	ON `Lid`.`lidnr` = `Boete`.`lidnummer`
GROUP BY `Lid`.`lidnr`;

SELECT `achternaam`, ifnull(`aantal_boetes`, 0) AS "aantal_boetes"
FROM `Lid` JOIN (SELECT `lidnummer`, count(*) AS "aantal_boetes" FROM `Boete` GROUP BY `lidnummer`) AantalBoetes
	ON `lidnr` = `lidnummer`;

-- 6. (b) Geef de namen van de leden die meer dan 2 boetes hebben gekregen.
SELECT `achternaam`
FROM `Lid`
WHERE `lidnr` IN (
	SELECT `lidnummer`
    FROM `Boete`
    GROUP BY `lidnummer`
    HAVING count(*) > 2
);

-- 6. (c) Geef de naam van de leden die meer boetes hebben betaald dan het lid met lidnummer 201.
SELECT `achternaam`
FROM `Lid`
WHERE `lidnr` IN (
	SELECT `lidnummer`
    FROM `Boete`
    GROUP BY `lidnummer`
    HAVING count(*) > (
		SELECT count(*)
        FROM `Boete`
        WHERE `lidnummer` = 201
    )
);