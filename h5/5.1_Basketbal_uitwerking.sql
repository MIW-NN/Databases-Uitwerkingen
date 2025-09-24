-- Opdracht 5.1: SQL Basketbal Basis

USE `basketbal`;

-- 1 Toon alle records van de tabel Lid
SELECT *
FROM `Lid`;

-- 2 Geef alle gegevens van de leden die voor 2001 bij de club zijn toegetreden
SELECT *
FROM `Lid`
WHERE `jaartoe` < 2001;

-- 3 Geef van de vrouwelijke leden de achternaam, de geboortedatum en hun lidnummer
SELECT `achternaam`, `geb_datum`, `lidnr`
FROM `Lid`
WHERE `geslacht` = "v";

-- 4 Geef alle leden die geen emailadres hebben
SELECT *
FROM `Lid`
WHERE `emailadres` IS NULL;

-- 5 Geef alleen de leden die wel een emailadres hebben.
SELECT *
FROM `Lid`
WHERE `emailadres` IS NOT NULL;

-- 6 Geef de namen (met voorletters en tussenvoegsel) van de leden uit Zoetermeer
SELECT `voorletters`, `tussenvoegsel`, `achternaam`
FROM `Lid`
WHERE `woonplaats` = "Zoetermeer";

-- 7 Geef de uitslagen (teamthuis, teamuit, scorethuis, scoreuit) van de wedstrijden uit klasse B2000 die tussen 15u en 19u gespeeld zijn
SELECT `teamthuis`, `teamuit`, `scorethuis`, `scoreuit`
FROM `Wedstrijd`
WHERE `klasse` = "b2000"
AND `tijd` >= "15:00"
AND `tijd` <= "19:00";

-- 8 verwijder de leden die in Leiden wonen
SELECT *
FROM `Lid`
WHERE `woonplaats` = "leiden";

DELETE 
FROM `Lid`
WHERE `woonplaats` = "Leiden";

-- HERSTEL 8 Leden in Leiden weer toevoegen
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (91, 'Haasse','U',NULL,'1994-01-06','m',2008,'Van Vollenhovenkade',105,NULL,'2312BS','Leiden','0715356135','U.Haasse@live.nl','ZZLEH2',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (92, 'Kluismart ','Q',NULL,'1988-06-01','m',2002,'Willem De Zwijgerlaan',51,NULL,'2461AU','Leiden','0714542457','Q.Kluismart @live.nl','ZZLEH2',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (93, 'Jansma','J','van','1994-05-21','m',2007,'De Bazelstraat',22,NULL,'2365FR','Leiden',NULL,'J.Jansma@live.nl','ZZLEH2','ZZLEH1');
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (94, 'Dijk','D','van','1998-11-30','m',2008,'Boommarkt',53,NULL,'2312NB','Leiden','0718329569','D.Dijk@live.nl','ZZLEH2',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (95, 'Tromp','L',NULL,'1989-12-06','m',2005,'Trompstraat',45,NULL,'2341UI','Leiden','0714593214','L.Tromp@live.nl','ZZLEH2',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (96, 'Berger','M.R',NULL,'1983-05-09','m',2003,'Pieterskerkhof',13,NULL,'2391LI','Leiden','0719714971','M.R.Berger@live.nl','ZZLEH1',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (97, 'Hoes','T',NULL,'1987-10-12','m',2009,'Apothekersdijk',66,NULL,'2341RX','Leiden','0717852938','T.Hoes@live.nl','ZZLEH1',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (98, 'Albulescu','U',NULL,'1984-03-17','m',2008,'Noordeinde',86,NULL,'2418UI','Leiden','0718795024','U.Albulescu@live.nl','ZZLEH1',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (99, 'Vlaming','Y',NULL,'1989-08-30','m',2008,'Morsstraat',13,NULL,'2375IN','Leiden','0711045024','Y.Vlaming@live.nl','ZZLEH1',NULL);
insert into Lid(lidnr, achternaam, voorletters, tussenvoegsel, geb_datum, geslacht, jaartoe, straat, huisnr, toevoeging, postcode, woonplaats, telefoon, emailadres, speelt_in, bank) Values (100, 'Vayne','N.R',NULL,'1978-04-17','m',2001,'Langebrug',143,NULL,'2370LP','Leiden',NULL,'N.R.Vayne@live.nl','ZZLEH1',NULL);


-- 9 voeg jezelf toe als lid sinds 1998 met lidnr 300
INSERT INTO `Lid`(`lidnr`, `achternaam`, `voorletters`, `tussenvoegsel`, `geb_datum`, `geslacht`, `jaartoe`, `straat`, `huisnr`, `toevoeging`, `postcode`, `woonplaats`, `telefoon`, `emailadres`)
VALUES (300, "Velthuizen", "V.R.", NULL , "1988-02-27", "m", 1998, "Slot Bommelstein", 1, NULL, "9999ZZ", "Rommeldam", "0991234567", "v.r.velthuizen@pl.hanze.nl");

-- 10 Geef alle boetes hoger dan 10 euro van het type A
SELECT *
FROM `Boete`
WHERE `boetetype` = "A"
	AND `bedrag` > 10;

-- 11 Verhoog de boetes van speler 109 met 10
SELECT *
FROM `Boete`
WHERE `lidnummer` = 109;

UPDATE `Boete`
SET `bedrag` = `bedrag` + 10
WHERE `lidnummer` = 109;

-- 12.	Schrijf een create-script om de tabel Bestuurslid toe te voegen. Deze tabel bevat informatie over de bestuursfuncties die leden van de club hebben bekleed. De primaire sleutel bestaat uit de kolommen lidnummer en begin_datum. De tabel is hieronder gegeven.
CREATE TABLE `Bestuurslid` (
	`lidnummer` 	INT 			NOT NULL, 
	`begindatum` 	DATE 			NOT NULL, 
	`einddatum`	 	DATE, 
	`functie` 		VARCHAR(45) 	NOT NULL,
    
	PRIMARY KEY (lidnummer, begindatum)
);

-- 13.	Voeg de eerste 5 records toe aan de tabel Bestuursleden.
INSERT INTO `bestuurslid` (`lidnummer`, `begindatum`, `einddatum`, `functie`) VALUES (109, '2008-01-01', '2008-12-31', 'Voorzitter');
INSERT INTO `bestuurslid` (`lidnummer`, `begindatum`, `einddatum`, `functie`) VALUES (107, '2008-01-01', '2008-12-31', 'Secretaris');
INSERT INTO `bestuurslid` (`lidnummer`, `begindatum`, `einddatum`, `functie`) VALUES (107, '2009-01-01', '2009-12-31', 'Lid');
INSERT INTO `bestuurslid` (`lidnummer`, `begindatum`, `einddatum`, `functie`) VALUES (107, '2010-01-01', NULL, 'Penningmeester');
INSERT INTO `bestuurslid` (`lidnummer`, `begindatum`, `einddatum`, `functie`) VALUES (107, '2007-01-01', '2010-12-31', 'Voorzitter');
INSERT INTO `bestuurslid` (`lidnummer`, `begindatum`, `einddatum`, `functie`) VALUES (155, '2011-01-01', '2018-12-31', 'Voorzitter');

-- 14.	Geef alle gegevens van de sporthallen waarvan de naam begint met een S.
SELECT *
FROM `Sporthal`
WHERE `sporthalnaam` LIKE "S%";

-- 15.	Geef de gegevens van de thuiswedstrijden van Dames 1 teams. Daarvan eindigt de code op D1.
SELECT *
FROM `Wedstrijd`
WHERE `teamthuis` LIKE "%D1";