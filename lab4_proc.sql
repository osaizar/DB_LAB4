SELECT 'Creating stored procedures (part3)' AS 'Message';

delimiter //
CREATE PROCEDURE addYear(IN yr INT, IN fctr DOUBLE)
BEGIN
INSERT INTO year (year, ypfactor) VALUES (yr, fctr);
END; //
delimiter ;

delimiter //
CREATE PROCEDURE addDay(IN yr INT, IN day VARCHAR(10), IN fctr DOUBLE)
BEGIN
INSERT INTO week_day (name, year, wpfactor) VALUES (lower(day), yr, fctr);
END; //
delimiter ;

delimiter //
CREATE PROCEDURE addDestination(IN acode VARCHAR(3), IN aname VARCHAR(30), IN cityname VARCHAR(30))
BEGIN
INSERT INTO city (name) VALUES (lower(cityname));
INSERT INTO airport VALUES (upper(acode), lower(aname),
                            (SELECT id FROM city WHERE name LIKE lower(cityname)));
END; //
delimiter ;

delimiter //
CREATE PROCEDURE addRoute(IN deptcode VARCHAR(3), IN arrcode VARCHAR(3), IN yr INT, IN cost DOUBLE)
BEGIN
INSERT INTO route (dest, source, price, year)
VALUES ((SELECT code FROM airport WHERE code LIKE upper(arrcode)),
        (SELECT code FROM airport WHERE code LIKE upper(deptcode)),
        cost, yr);
END; //
delimiter ;

delimiter //
CREATE PROCEDURE addFlight(IN deptcode VARCHAR(3), IN arrcode VARCHAR(3), IN yr INT, IN day VARCHAR(10), IN dtime TIME)
BEGIN
INSERT INTO route (dest, source, price, year)
VALUES ((SELECT code FROM airport WHERE code LIKE upper(arrcode)),
        (SELECT code FROM airport WHERE code LIKE upper(deptcode)),
        cost, yr);
END; //
delimiter ;
