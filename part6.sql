SELECT 'Creating reservation stored procedures (part 6)' AS 'Message';


delimiter //
CREATE PROCEDURE addReservation(IN deptcode VARCHAR(3), IN arrcode VARCHAR(3),
                                IN yr INT, IN wk INT, IN day VARCHAR(10),
                                IN dtime TIME, IN nofpass INT, OUT resnum INT)
BEGIN

DECLARE route_id INT;    -- Route ID
DECLARE day_id INT;      -- Day ID
DECLARE wflight_id INT;  -- Weekly flight ID
DECLARE flight_id INT;   -- Flight ID

SET @route_id = 0;
SET @day_id = 0;
SET @wflight_id = 0;
SET @flight_id = 0;


SELECT id INTO @route_id FROM route WHERE dest LIKE upper(arrcode) AND source LIKE upper(deptcode) AND year = yr;
SELECT id INTO @day_id FROM week_day WHERE (name LIKE lower(day) AND year = yr);
SELECT id INTO @wflight_id FROM weekly_flight
  WHERE (weekday = @day_id AND departure_time = dtime AND route = @route_id);

IF @wflight_id = 0
THEN
  SELECT 'There exist no flight for the given route, date and time' AS 'Message';

ELSE  -- If the flight exists
  SELECT id INTO @flight_id FROM flight
    WHERE year = yr AND week = wk AND wflight = @wflight_id;

  IF (calculateFreeSeats(@flight_id) < nofpass)
  THEN
    SELECT 'There are not enough seats available on the chosen flight' AS 'Message';

  ELSE
    INSERT INTO booking (price, passenger_count, flight)
    VALUES (calculatePrice(@flight_id)*nofpass, nofpass, @flight_id);

    SELECT code INTO resnum FROM booking WHERE (id = LAST_INSERT_ID());

  END IF;
END IF;

END; //
delimiter ;

delimiter //
CREATE PROCEDURE addPassenger(IN reserv INT, IN pass INT, IN pass_name VARCHAR(30))
BEGIN

DECLARE booking_id INT;
DECLARE payer_id INT;
SET @booking_id = 0;

SELECT payedby INTO @payer_id FROM booking WHERE code = reserv;

IF @payer_id IS NOT NULL
THEN
  SELECT 'The booking has already been payed and no futher passengers can be added' AS 'Message';

ELSE
  SELECT id INTO @booking_id FROM booking WHERE code = reserv;

  IF @booking_id = 0
  THEN
    SELECT 'The given reservation number does not exist' AS 'Message';

  ELSE
    INSERT INTO passenger (passport,name)
    VALUES (pass, lower(pass_name));

    INSERT INTO passenger_bookings (passenger, booking)
    VALUES ((SELECT id FROM passenger WHERE name like lower(pass_name) and passport = pass),
            @booking_id);

    UPDATE booking
  	SET passenger_count = (SELECT COUNT(*) FROM passenger_bookings WHERE booking = @booking_id)
  	WHERE id = @booking_id;

  END IF;
END IF;

END; //
delimiter ;

delimiter //
CREATE PROCEDURE addContact(IN reserv INT, IN passport_number INT, IN eml VARCHAR(30), IN ph BIGINT)
BEGIN

DECLARE booking_id INT;
DECLARE passenger_id INT;
DECLARE security_check INT;
SET @booking_id = 0;
SET @passenger_id = 0;
SET @security_check = 0;

SELECT id INTO @booking_id FROM booking WHERE code = reserv;

IF @booking_id = 0
THEN
  SELECT 'The given reservation number does not exist' AS 'Message';

ELSE
  SELECT id INTO @passenger_id FROM passenger WHERE passport = passport_number LIMIT 1;
  SELECT passenger INTO @security_check FROM passenger_bookings
    WHERE passenger = @passenger_id AND booking = @booking_id LIMIT 1;

  IF @security_check = 0
  THEN
    SELECT 'The person is not a passenger of the reservation' AS 'Message';

  ELSE

    INSERT INTO contact (passenger, phone, email)
    VALUES (@passenger_id, ph, lower(eml));

    UPDATE booking
    SET contact = (SELECT id
                   FROM contact
                   WHERE passenger = @passenger_id
                   and phone = ph
                   and email like lower(eml))
    WHERE id = @booking_id;

  END IF;
END IF;

END; //
delimiter ;

delimiter //
CREATE PROCEDURE addPayment(IN reserv INT, IN cc_name VARCHAR(30), IN cc_n BIGINT)
BEGIN

DECLARE booking_id INT;
DECLARE contact_id INT;
DECLARE passenger_num INT;
SET @booking_id = 0;
SET @passenger_num = 0;

SELECT id INTO @booking_id FROM booking WHERE code = reserv;

IF @booking_id = 0
THEN
  SELECT 'The given reservation number does not exist' AS 'Message';

ELSE
  SELECT passenger_count INTO @passenger_num FROM booking WHERE code = reserv;

  IF (calculateFreeSeats(@flight_id) < @passenger_num)
  THEN
    SELECT 'There are not enough seats available on the flight anymore, deleting reservation' AS 'Message';

    DELETE FROM passenger_bookings WHERE booking = @booking_id;
    DELETE FROM booking WHERE code = reserv;

  ELSE
    SELECT contact INTO @contact_id FROM booking WHERE code = reserv;

    IF @contact_id IS NOT NULL
    THEN
      INSERT INTO ccinfo (ccnumber, name)
      VALUES (cc_n, lower(cc_name));

      UPDATE booking
      SET payedby = LAST_INSERT_ID()
      WHERE code = reserv;

    ELSE
      SELECT 'The reservation has no contact yet' AS 'Message';

    END IF;
  END IF;
END IF;

END; //
delimiter ;
