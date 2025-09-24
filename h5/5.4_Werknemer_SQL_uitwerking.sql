USE `werknemer`;

-- 1. Geef de namen van de werknemers die op locatie Chicago werken
SELECT `achternaam`
FROM (`Werknemer` JOIN `Prive`
	ON `Werknemer`.`werknemernummer` = `Prive`.`werknemernummer`) JOIN `Afdeling`
		ON `Werknemer`.`afdelingnummer` = `Afdeling`.`afdelingnummer`
WHERE `locatie` = "Chicago";

-- 2. Geef van alle werknemers de naam, functie en salarisschaal
SELECT `achternaam`, `functie`, `schaal`
FROM (`Werknemer` JOIN `Prive`
	ON `Werknemer`.`werknemernummer` = `Prive`.`werknemernummer`) JOIN `Salarisschaal`
		ON `Werknemer`.`salaris` BETWEEN `Salarisschaal`.`ondergrens` AND `Salarisschaal`.`bovengrens`;
        
-- 3. Geef de naam van de verkopers die in schaal 3 zitten
SELECT `achternaam`
FROM (`Werknemer` JOIN `Prive`
	ON `Werknemer`.`werknemernummer` = `Prive`.`werknemernummer`) JOIN `Salarisschaal`
		ON `Werknemer`.`salaris` BETWEEN `Salarisschaal`.`ondergrens` AND `Salarisschaal`.`bovengrens`
WHERE `functie` = "Verkoper"
	AND `schaal` = 3;

-- 4. Geef het nummer en naam van de werknemers en geef ook het nummer en de naam van diens chef zorg dat alle werknemers in de lijst staan.
SELECT `Werker`.`werknemernummer`, `WerkerPrive`.`achternaam`, `Chef`.`werknemernummer`, `ChefPrive`.`achternaam`
FROM (`Werknemer` AS Werker JOIN `Prive` AS WerkerPrive
	ON `Werker`.`werknemernummer` = `WerkerPrive`.`werknemernummer`) LEFT JOIN (`Werknemer` AS Chef JOIN `Prive` AS ChefPrive
	ON `Chef`.`werknemernummer` = `ChefPrive`.`werknemernummer`)
		ON `Werker`.`chef` = `Chef`.`werknemernummer`;
        
-- 5. Toon een werknemers, diens chef, diens chef én diens chef.
SELECT `WerkerPrive`.`achternaam`, `ChefPrive`.`achternaam`, `Chef2Prive`.`achternaam`, `Chef3Prive`.`achternaam`
FROM (((`Werknemer` AS Werker JOIN `Prive` AS WerkerPrive
	ON `Werker`.`werknemernummer` = `WerkerPrive`.`werknemernummer`) LEFT JOIN (`Werknemer` AS Chef JOIN `Prive` AS ChefPrive
	ON `Chef`.`werknemernummer` = `ChefPrive`.`werknemernummer`)
		ON `Werker`.`chef` = `Chef`.`werknemernummer`) LEFT JOIN  (`Werknemer` AS Chef2 JOIN `Prive` AS Chef2Prive
	ON `Chef2`.`werknemernummer` = `Chef2Prive`.`werknemernummer`)
		ON `Chef`.`chef` = `Chef2`.`werknemernummer`) LEFT JOIN  (`Werknemer` AS Chef3 JOIN `Prive` AS Chef3Prive
	ON `Chef3`.`werknemernummer` = `Chef3Prive`.`werknemernummer`)
		ON `Chef2`.`chef` = `Chef3`.`werknemernummer`;
        
-- 6. Laat het aantal werknemers per functie zien.
SELECT `functie`werknemer, count(*) AS "aantal_medewerkers"
FROM `Werknemer`
GROUP BY `functie`;

-- 7. Geef alle functies die door minstens drie werknemers wordt uitgeoefend.
SELECT `functie`werknemer, count(*) AS "aantal_medewerkers"
FROM `Werknemer`
GROUP BY `functie`
HAVING `aantal_medewerkers` >= 3;

-- 8. Laat per afdeling zien wat het hoogste salaris van de afdeling is.
SELECT `afdelingnaam`, max(`salaris`) AS "hoogste_salaris"
FROM `Werknemer` JOIN `Afdeling`
	ON `Werknemer`.`afdelingnummer` = `Afdeling`.`afdelingnummer`
GROUP BY `afdelingnaam`;

-- 9. Laat per afdeling de naam van de afdeling en het gemiddelde salaris zien.
SELECT `afdelingnaam`, avg(`salaris`) AS "gemiddelde"
FROM `Werknemer` JOIN `Afdeling`
	ON `Werknemer`.`afdelingnummer` = `Afdeling`.`afdelingnummer`
GROUP BY `afdelingnaam`;

-- 10. Welke afdelingen hebben een gemiddeld salaris van meer dan 2000?
SELECT `afdelingnaam`
FROM `Werknemer` JOIN `Afdeling`
	ON `Werknemer`.`afdelingnummer` = `Afdeling`.`afdelingnummer`
GROUP BY `afdelingnaam`
HAVING avg(`salaris`) > 2000;

-- 11. In welke plaatsen woont meer dan één werknemer?
SELECT `woonplaats`
FROM `Prive`
GROUP BY `woonplaats`
HAVING count(*) >= 2;

-- 12. Geef van alle werknemers die chef zijn hun naam en het aantal werknemers waar ze chef van zijn.
SELECT `achternaam`, count(*) AS "aantal_werknemers_onder_directe_leiding"
FROM `Werknemer` JOIN `Prive`
	ON `Werknemer`.`chef` = `Prive`.`werknemernummer`
GROUP BY `chef`