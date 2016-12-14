SELECT 'Creating reservation stored procedures (part 6)' AS 'Message';


delimiter //
CREATE PROCEDURE addReservation(IN deptcode VARCHAR(3), IN arrcode VARCHAR(3),
                                IN yr INT, IN wk INT, IN day VARCHAR(10),
                                IN dtime TIME, IN nofpass INT, OUT resnum INT)
BEGIN

DECLARE route_id INT;    -- Route ID
DECLARE wflight_id INT;  -- Weekly flight ID
DECLARE flight_id INT;   -- Flight ID

SELECT id INTO @route_id FROM route WHERE dest LIKE upper(arrcode) AND source LIKE upper(deptcode);
SELECT id INTO @wflight_id FROM weekly_flight
  WHERE weekday LIKE lower(day) AND departure_time = dtime AND route = @route_id;
  
IF NULLIF(@wflight_id, '') IS NULL  -- FIXME
THEN
  SELECT 'There exist no flight for the given route, date and time' AS 'Message';

ELSE  -- If the flight exists
  SELECT id INTO @flight_id FROM flight
    WHERE year = yr AND week = wk AND wflight = @wflight_id;

  IF (calculateFreeSeats(@flight_id) < nofpass)
  THEN
    SELECT 'There are not enough seats available on the chosen flight' AS 'Message';

  ELSE  -- TODO: Finished?
    INSERT INTO booking (price, passenger_count, flight)
    VALUES (calculatePrice(@flight_id)*nofpass, nofpass, @flight_id);

    SET resnum = LAST_INSERT_ID();

  END IF;
END IF;

END; //
delimiter ;

delimiter //
CREATE PROCEDURE addPassenger(IN reserv INT, IN pass INT, IN pass_name VARCHAR(30))
BEGIN

INSERT INTO passenger (passport,name)
VALUES (pass, lower(pass_name));

-- DEBUG
SELECT * FROM booking;
SELECT reserv AS 'CODE';
-- END DEBUG

INSERT INTO passenger_bookings (passenger, booking)
VALUES ((SELECT id FROM passenger WHERE name like lower(pass_name) and passport = pass),
        (SELECT code FROM booking WHERE code = reserv));

END; //
delimiter ;

delimiter //
CREATE PROCEDURE addContact(IN reserv INT, IN passport_number INT, IN eml VARCHAR(30), IN ph BIGINT)
BEGIN

INSERT INTO contact (passenger, phone, email)
VALUES (passport_number, ph, lower(eml));

UPDATE booking
SET contact = (SELECT id
               FROM contact
               WHERE passenger = passport_number
               and phone = ph
               and email like lower(eml))
WHERE code = reserv;

END; //
delimiter ;

delimiter //
CREATE PROCEDURE addPayment(IN reserv INT, IN cc_name VARCHAR(30), IN cc_n BIGINT)
BEGIN

INSERT INTO ccinfo (ccnumber, name)
VALUES (cc_n, lower(cc_name));

UPDATE booking
SET payedby = (SELECT id
               FROM ccinfo
               WHERE ccnumber = cc_n
               and name like lower(cc_name))
WHERE code = reserv;

END; //
delimiter ;
