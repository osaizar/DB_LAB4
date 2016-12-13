SELECT 'Creating stored procedures (part3)' AS 'Message';

DROP PROCEDURE IF EXISTS addYear;
DROP PROCEDURE IF EXISTS addDay;
DROP PROCEDURE IF EXISTS addDestination;
DROP PROCEDURE IF EXISTS addRoute;
DROP PROCEDURE IF EXISTS addFlight;


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
INSERT INTO route (source, dest, price, year)
VALUES ((SELECT code FROM airport WHERE code LIKE upper(deptcode)),
        (SELECT code FROM airport WHERE code LIKE upper(arrcode)),
        cost, yr);
END; //
delimiter ;

delimiter //
CREATE PROCEDURE addFlight(IN deptcode VARCHAR(3), IN arrcode VARCHAR(3), IN yr INT, IN day VARCHAR(10), IN dtime TIME)
BEGIN

DECLARE rt INT;          -- Route ID
DECLARE cnt INT;         -- Count for the flights (52)
DECLARE cnts INT;        -- Count fot the seats (40)
DECLARE wflight_id INT;  -- Weekly flight ID
DECLARE flight_id INT;   -- Flight ID

-- WEEKLY FLIGHT INSERTION:

SELECT id INTO @rt FROM route WHERE ((dest LIKE upper(deptcode)) AND (source LIKE upper(arrcode)) AND (year = yr));
INSERT INTO weekly_flight (weekday, route, departure_time)
VALUES ((SELECT id FROM week_day WHERE name LIKE lower(day)),
        @rt,
        dtime);


-- NOW THE 52 INSTANCES OF THAT FLIGHT:

SELECT id INTO @wflight_id FROM weekly_flight WHERE route = @rt AND departure_time = dtime;

SET @cnt = 1;
SET @cnts = 1;
WHILE @cnt < 53
DO

   INSERT INTO flight (wflight, week, year)
   VALUES (@wflight_id, @cnt, yr);

   -- AND THE 40 SEATS FOR EACH FLIGHT:

   SELECT id INTO @flight_id FROM flight WHERE week = @cnt AND year = yr AND wflight = @wflight_id;

   WHILE @cnts < 41
   DO
      INSERT INTO seat (name, flight)
      VALUES (@cnts, @flight_id);

      SET @cnts = @cnts + 1;
   END WHILE;  -- Seats while

   SET @cnts = 1;
   SET @cnt = @cnt + 1;
END WHILE;  -- Flights while

END; //
delimiter ;
