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
