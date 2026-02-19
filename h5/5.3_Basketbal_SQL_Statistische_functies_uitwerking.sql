use Basketbal;

-- 1.	Geef per jaar van toetreding het aantal leden dat in dat jaar is toegetreden.
SELECT `jaartoe`, count(*) AS "aantal_leden"
FROM `Lid`
GROUP BY `jaartoe`;

-- 2.	Geef het aantal leden per opgegeven geslacht
SELECT `geslacht`, count(*) AS "aantal_leden"
FROM `Lid`
GROUP BY `geslacht`;

-- 3.	Geef voor elk lid voor wie minstens 1 boete is betaald, het lidnummer, de gemiddelde boete (2 decimalen) en het aantal boetes.
SELECT `lidnummer`, round(avg(`bedrag`), 2) AS "gemiddelde_boete", count(*) AS "aantal_boetes" 
FROM `Boete` 
GROUP BY `lidnummer`;

-- 4
SELECT `lidnr`, `achternaam`, ifnull(sum(`bedrag`), 0) AS "bedrag"
FROM `Lid` LEFT JOIN `Boete`
	ON `lidnr` = `lidnummer`
GROUP BY `lidnr`;


-- 5.	Geef het lidnummer van elke speler voor wie in totaal meer dan €15.- aan boetes is betaald.
SELECT `lidnummer`, sum(`bedrag`) AS "totaal_boetes"
FROM `Boete` 
GROUP BY `lidnummer` 
HAVING `totaal_boetes` > 15;

-- 6.	Geef de voorletters, tussenvoegsel en achternaam en het aantal boetes van elk lid voor wie meer dan één boete is betaald.
SELECT `voorletters`, `tussenvoegsel`, `achternaam`, count(*) AS "aantal_boetes"
FROM `Lid` JOIN `Boete`
	ON `lidnr` = `lidnummer`
GROUP BY `lidnr`
HAVING `aantal_boetes` > 1;

-- 7.	Geef de hoogste en de laagste boete die geregistreerd is.
SELECT min(`bedrag`) AS "laagste_boete", max(`bedrag`) AS "hoogste_boete"
FROM `Boete`;

SELECT
    concat_ws(" ", `voorletters`, `tussenvoegsel`, `achternaam`) AS naam,
    min(`bedrag`) AS "laagste_boete",
    max(`bedrag`) AS "hoogste_boete"
FROM `Lid` JOIN `Boete`
                ON `lidnr` = `lidnummer`
GROUP BY `lidnr`;

-- 8.	Geef van elk team de teamcode, het totaal aantal thuis gewonnen wedstrijden.
SELECT `teamthuis`, count(*) AS "aantal_thuis_gewonnen_wedstrijden"
FROM `Wedstrijd`
WHERE `scorethuis` > `scoreuit`
GROUP BY `teamthuis`;

SELECT * FROM Wedstrijd
WHERE scorethuis > scoreuit
ORDER BY teamthuis;

-- 8 alternatief.
SELECT `teamthuis`, sum(if(`scorethuis` > `scoreuit`, 1, 0)) as "aantal_thuis_gewonnen_wedstrijden"
FROM `Wedstrijd`
GROUP BY `teamthuis`;

-- 9.	Geef per klasse het aantal teams in die klasse
SELECT `klasse`, count(*) AS "aantal_teams"
FROM `Team` 
Group by `klasse`;

-- 10.	Geef de sporthallen die door meer dan 1 team gebruikt worden als thuishal.
SELECT `thuishal`, count(*) AS "aantal_teams"
FROM `Team`
GROUP BY `thuishal`
HAVING `aantal_teams` > 1;