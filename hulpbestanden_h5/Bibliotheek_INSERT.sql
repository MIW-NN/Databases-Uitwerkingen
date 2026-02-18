USE bibliotheek;

-- Insert publishers
INSERT INTO Uitgever (naam, locatie) VALUES
     ('Stormlicht Drukkerij', 'Amsterdam'),      -- For Brandon Sanderson
     ('Drakenveer Uitgeverij', 'Utrecht'),       -- For Patrick Rothfuss
     ('Midden-aarde Press', 'Rotterdam'),        -- For J.R.R. Tolkien
     ('Eikenhart Publicaties', 'Den Haag');      -- For Robin Hobb

-- Insert authors (original names)
INSERT INTO Auteur (auteurnummer, voornaam, achternaam, locatie) VALUES
     (101, 'Brandon', 'Sanderson', 'USA'),
     (102, 'Patrick', 'Rothfuss', 'USA'),
     (103, 'J.R.R.', 'Tolkien', 'VK'),
     (104, 'Robin', 'Hobb', 'USA');

-- Insert members (Dutch names)
INSERT INTO Lid (lidnummer, naam, adres, geboortedatum) VALUES
    (501, 'Lieke Janssen', 'Vlietstraat 5, Leiden', '1995-08-14'),
    (502, 'Bram van Dijk', 'Molenweg 22, Groningen', '1988-11-03'),
    (503, 'Fatima El Amrani', 'Kanaalstraat 44, Utrecht', '2001-02-19'),
    (504, 'Sanne de Graaf', 'Dijkstraat 88, Rotterdam', '1999-09-27');

-- Insert books with dual English/Dutch titles
INSERT INTO Boek (isbn, titel, genre, publicatiedatum, uitgeversnaam) VALUES
    -- Brandon Sanderson
    (1001, 'The Way of Kings', 'Epic Fantasy', '2010-08-31', 'Stormlicht Drukkerij'),
    (1002, 'De Weg der Koningen', 'Epische fantasy', '2011-03-15', 'Stormlicht Drukkerij'),
    (1003, 'Words of Radiance', 'Epic Fantasy', '2014-03-04', 'Stormlicht Drukkerij'),
    (1004, 'Woorden van Glorie', 'Epische fantasy', '2015-01-20', 'Stormlicht Drukkerij'),

    -- Patrick Rothfuss
    (2001, 'The Name of the Wind', 'High Fantasy', '2007-03-27', 'Drakenveer Uitgeverij'),
    (2002, 'De Naam van de Wind', 'Hoge fantasy', '2008-09-10', 'Drakenveer Uitgeverij'),
    (2003, 'The Wise Man''s Fear', 'High Fantasy', '2011-03-01', 'Drakenveer Uitgeverij'),
    (2004, 'De Angst van de Wijze Man', 'Hoge fantasy', '2012-11-22', 'Drakenveer Uitgeverij'),

    -- J.R.R. Tolkien
    (3001, 'The Fellowship of the Ring', 'Heroic Fantasy', '1954-07-29', 'Midden-aarde Press'),
    (3002, 'De Reisgenoten', 'Heroïsche fantasy', '1956-05-12', 'Midden-aarde Press'),
    (3003, 'The Two Towers', 'Heroic Fantasy', '1954-11-11', 'Midden-aarde Press'),
    (3004, 'De Twee Torens', 'Heroïsche fantasy', '1957-02-28', 'Midden-aarde Press'),

    -- Robin Hobb
    (4001, 'Assassin''s Apprentice', 'Dark Fantasy', '1995-04-01', 'Eikenhart Publicaties'),
    (4002, 'De Leerling van de Moordenaar', 'Donkere fantasy', '1997-08-15', 'Eikenhart Publicaties'),
    (4003, 'Royal Assassin', 'Dark Fantasy', '1996-03-04', 'Eikenhart Publicaties'),
    (4004, 'Koninklijk Moordenaar', 'Donkere fantasy', '1998-10-30', 'Eikenhart Publicaties');

-- Link authors to books (both language versions)
INSERT INTO BoekAuteur (isbn, auteurnummer) VALUES
-- Sanderson
    (1001, 101), (1002, 101), (1003, 101), (1004, 101),
    -- Rothfuss
    (2001, 102), (2002, 102), (2003, 102), (2004, 102),
    -- Tolkien
    (3001, 103), (3002, 103), (3003, 103), (3004, 103),
    -- Hobb
    (4001, 104), (4002, 104), (4003, 104), (4004, 104);

-- Insert book copies
INSERT INTO Exemplaar (isbn, exemplaarnummer, jaar_van_aanschaf) VALUES
-- English copies
    (1001, 1, 2020), (1001, 2, 2021),
    (2001, 1, 2019), (2001, 2, 2020),
    (3001, 1, 1995), (3001, 2, 2005),
    (4001, 1, 2010), (4001, 2, 2015),

-- Dutch copies
    (1002, 1, 2022), (2002, 1, 2023),
    (3002, 1, 1960), (4002, 1, 2000);

-- Insert loans
INSERT INTO Lening (isbn, exemplaarnummer, lidnummer, uitleendatum, terugbrengdatum) VALUES
    -- Current loans
    (1001, 1, 501, '2023-09-01', NULL),
    (2002, 1, 502, '2023-09-10', NULL),

    -- Returned loans
    (3001, 1, 503, '2023-07-15', '2023-08-30'),
    (4002, 1, 504, '2023-08-20', '2023-09-05');