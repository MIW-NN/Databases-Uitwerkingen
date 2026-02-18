USE `werknemer`;

INSERT INTO Afdeling VALUES 
	(10, "Accounting","New York"),
    (20, "Research","Dallas"),
    (30, "Sales","Chicago"),
    (40, "Operations","Boston");

INSERT INTO `Werknemer` (`werknemernummer`, `functie`, `chef`, `datum_in_dienst`, `salaris`, `commissie`, `afdelingnummer`) VALUES 
	(7839, "President", 	null, "1981-11-17", 5000, null, 10),
    (7698, "Manager", 		7839, "1981-05-01", 2850, null, 30),
    (7566, "Manager", 		7839, "1981-04-02", 2975, null, 20),
    (7782, "Manager", 		7839, "1981-06-09", 2450, null, 10),
    (7902, "Analist", 		7566, "1981-12-03", 3000, null, 20),
    (7369, "Boekhouder", 	7902, "1980-12-17",  800, null, 20),
    (7499, "Verkoper", 		7698, "1981-02-20", 1600,  300, 30),
    (7521, "Verkoper", 		7698, "1981-01-22", 1250,  500, 30),
    (7788, "Analist", 		7566, "1982-12-09", 3000, null, 20),
    (7654, "Verkoper", 		7698, "1981-09-28", 1250, 1400, 30),
    (7844, "Verkoper", 		7698, "1981-09-08", 1500,    0, 30),
    (7876, "Boekhouder", 	7788, "1983-01-12", 1100, null, 20),
    (7900, "Boekhouder", 	7698, "1981-12-03",  950, null, 30),
    (7934, "Boekhouder", 	7782, "1982-01-23", 1300, null, 10);

INSERT INTO `Prive` (`werknemernummer`, `achternaam`, `voorletter`, `adres`, `postcode`, `woonplaats`) VALUES 
	(7369, "Smith",	 "A.B.C", "Highway 12",			"AA3456", "Dallas"),
    (7499, "Allen",	"C.C.L.", "Lonely Road 878",	"MN4556", "Boston"),
    (7521, "Ward",	"X.T.M.", "Indian Road 4578",	"AS5653", "Chicago"),
    (7566, "Jones", "G.M.B.", "Highway 14",			"AB3456", "Dallas"),
    (7654, "Martin","D.G.H.", "Villian Avenue 5623","AS3045", "Chicago"),
    (7698, "Blake", "O.L.D.", "Great Avenue 1238",	"VC3675", "Chicago"),
    (7782, "Clark", "R.Y.K.", "Broadway 4616",		"TY4566", "New York"),
    (7788, "Scott",	    null, null, 					null, null),
    (7839, "King",	"A.R.T.", "White House Rd 456",	"WH3481", "New York"),
    (7844, "Turner","A.L.F.", "Army Avenue 456",	"XS3452", "Dalas"),
    (7876, "Adams",	"E.V.E.", "Driveway 44",		"KL9963", "Dallas"),
    (7900, "James",	"W.I.L.", "Poets Drive 516",	"SP4566", "Blackwood"),
    (7902, "Ford",	"B.E.D.", "TheeRoad 26",		"DS7661", "Dallas"),
    (7934, "Miller","A.R.T.", "Sales Square 469",	"UI3519", "New York");

INSERT INTO `Salarisschaal` (`schaal`, `ondergrens`, `bovengrens`) VALUES 
	(1,  700, 1200),
    (2, 1201, 1400),
    (3, 1401, 2000),
    (4, 2001, 3000),
    (5, 3001, 9999);
