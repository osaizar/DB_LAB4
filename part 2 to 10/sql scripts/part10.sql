SELECT 'Making overbookings possible (part10)' AS 'Message';

-- This script changes the addPayment procedure to make overbookings possible.
DROP PROCEDURE IF EXISTS addPayment;

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
      SELECT SLEEP(5); -- All the checks have been made, if another session makes changes on the tables, a ovebooking can occur.
      INSERT INTO ccinfo (ccnumber, name)
      VALUES (cc_n, lower(cc_name));

      UPDATE booking
      SET payedby = LAST_INSERT_ID(),
          price = calculatePrice(flight)*passenger_count
      WHERE code = reserv;

    ELSE
      SELECT 'The reservation has no contact yet' AS 'Message';

    END IF;
  END IF;
END IF;

END; //
delimiter ;
