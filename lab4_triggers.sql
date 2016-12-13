SELECT 'Creating triggers (part 5)' AS 'Message';

DROP TRIGGER IF EXISTS before_ticket_insert;
DROP TRIGGER IF EXISTS before_booking_insert;

DELIMITER $$
CREATE TRIGGER before_ticket_insert
    BEFORE INSERT ON ticket
    FOR EACH ROW
BEGIN
    SET NEW.code = RAND()*10000;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_booking_insert
    BEFORE INSERT ON booking
    FOR EACH ROW
BEGIN
    SET NEW.code = RAND()*10000;
END$$
DELIMITER ;


SELECT 'Creating reservation stored procedures (part 6)' AS 'Message';


-- TODO: Hay que cambiar algo, nos pasan el número de reservas. Nuestra BD no funciona así.
delimiter //
CREATE PROCEDURE addReservation(IN deptcode VARCHAR(3), IN arrcode VARCHAR(3),
                                IN yr INT, IN wk INT, IN day VARCHAR(10),
                                IN dtime TIME, IN nofpass INT, OUT resnum INT)
BEGIN

SELECT id INTO @fid FROM flight WHERE year = yr
                                      and week = wk
                                      and wflight = (SELECT id
                                                 FROM weekly_flight
                                                 WHERE weekday like lower(day)
                                                 and departure_time = dtime
                                                 and route = (SELECT id
                                                              FROM route
                                                              WHERE dest like arrcode
                                                              and source like deptcode));

INSERT INTO booking (price, flight)
VALUES (calculatePrice(@fid), @fid);

SET resnum = RAND()*10000;

END; //
delimiter ;

delimiter //
CREATE PROCEDURE addPassenger(IN reserv INT, IN pass INT, IN pass_name VARCHAR(30))
BEGIN

INSERT INTO passenger (passport,name)
VALUES (pass, lower(pass_name));

INSERT INTO passenger_bookings (booking, passenger)
VALUES (reserv, (SELECT id
                 FROM passenger
                 WHERE name like lower(pass_name)
                 and passport = pass));

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

SELECT 'Creating custom views (part 7)' AS 'Message';
