-- oefening 1 - laat boeken zien
SELECT *
FROM Boek;

-- oefening 2 - laat boeken zien, maar niet alle informatie
SELECT isbn, titel, genre
FROM Boek;

SELECT isbn, titel, genre
FROM Boek
WHERE publicatiedatum > "2006-01-01";

SELECT CONCAT(isbn, ".", exemplaarnummer) AS "exemplaarnummer v2", jaar_van_aanschaf
FROM Exemplaar;

INSERT INTO Auteur VALUES (105, "Paul", "van", "Loon", "NL");

SELECT 
	auteurnummer, 
    -- concat(voornaam, " ", ifnull(tussenvoegsel, ""), " ", achternaam) AS naam, 
    concat_ws(" ", voornaam, tussenvoegsel, achternaam) AS naam,
    locatie
FROM Auteur;

SELECT lidnummer, datediff(terugbrengdatum, uitleendatum)
FROM Lening
WHERE terugbrengdatum IS NOT NULL;

SELECT lidnummer, timestampdiff(day, uitleendatum, now()) AS dagen_geleend
FROM Lening;