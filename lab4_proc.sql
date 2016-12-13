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
CREATE PROCEDURE addDestination(IN acode VARCHAR(3), IN aname VARCHAR(30), IN country VARCHAR(30))
BEGIN
INSERT INTO country (name) VALUES (lower(country));
INSERT INTO airport VALUES (upper(acode), lower(aname),
                            (SELECT id FROM country WHERE name LIKE lower(country)));
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

DECLARE rt INT;
DECLARE cnt INT;

SELECT id INTO @rt FROM route WHERE ((dest LIKE upper(deptcode)) AND (source LIKE upper(arrcode)) AND (year = yr));
INSERT INTO weekly_flight (weekday, route, departure_time)
VALUES ((SELECT id FROM week_day WHERE name LIKE lower(day)),
        @rt,
        dtime);


SET @cnt = 1;
WHILE @cnt < 53
DO
   INSERT INTO flight (wflight, week, year)
   VALUES ((SELECT id FROM weekly_flight WHERE route = @rt),
           @cnt,
           yr);

   SET @cnt = @cnt + 1;
END WHILE;

END; //
delimiter ;
