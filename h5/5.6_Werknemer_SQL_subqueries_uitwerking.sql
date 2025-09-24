USE `werknemer`;

-- 1. Welke werknemer verdient het laagste salaris?
SELECT min(`salaris`)
FROM `Werknemer`;

SELECT *
FROM `Werknemer`
WHERE `salaris` = 800;

SELECT *
FROM `Werknemer`
WHERE `salaris` = (
	SELECT min(`salaris`)
	FROM `Werknemer`
);

-- 2. Welke werknemers verdienen meer dan het gemiddelde salaris?
SELECT avg(`salaris`)
FROM `Werknemer`;

SELECT *
FROM `Werknemer`
WHERE `salaris` > 2073;

SELECT *
FROM `Werknemer`
WHERE `salaris` > (
	SELECT avg(`salaris`)
	FROM `Werknemer`
);

-- 3. Welke werknemers werken op dezelfde afdeling als Smith?
SELECT `werknemernummer`
FROM `Prive`
WHERE `achternaam` = "Smith";

SELECT `afdelingnummer`
FROM `Werknemer`
WHERE `werknemernummer` = 7369;

SELECT *
FROM `Werknemer`
WHERE `afdelingnummer` = 20;

SELECT *
FROM `Werknemer`
WHERE `afdelingnummer` = (
	SELECT `afdelingnummer`
	FROM `Werknemer`
	WHERE `werknemernummer` = (
		SELECT `werknemernummer`
		FROM `Prive`
		WHERE `achternaam` = "Smith"
    )
);

-- 4. In welke afdeling wordt het hoogste salaris verdiend?
SELECT max(`salaris`)
FROM `Werknemer`;

SELECT `afdelingnummer`
FROM `Werknemer`
WHERE `salaris` = 5000;

SELECT *
FROM `Afdeling`
WHERE `afdelingnummer` = 10;

SELECT *
FROM `Afdeling`
WHERE `afdelingnummer` = (
	SELECT `afdelingnummer`
	FROM `Werknemer`
	WHERE `salaris` = (
		SELECT max(`salaris`)
		FROM `Werknemer`
    )
);

-- 5. Welke werknemers verdienen meer dan het gemiddelde salaris van hun afdeling?
SELECT `afdelingnummer`, avg(`salaris`)
FROM `Werknemer`
GROUP BY `afdelingnummer`;

SELECT *
FROM `Werknemer` JOIN (
	SELECT `afdelingnummer`, avg(`salaris`) AS "salarisgemiddelde_per_afdeling"
	FROM `Werknemer`
	GROUP BY `afdelingnummer`
) GemiddeldSalarisPerAfdeling
	ON `Werknemer`.`afdelingnummer` = `GemiddeldSalarisPerAfdeling`.`afdelingnummer`
WHERE `salaris` > `salarisgemiddelde_per_afdeling`;