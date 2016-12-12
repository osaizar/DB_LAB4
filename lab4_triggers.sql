SELECT 'Creating triggers (part 5)' AS 'Message';

DELIMITER $$
CREATE TRIGGER before_ticket_insert
    BEFORE INSERT ON ticket
    FOR EACH ROW
BEGIN
    SET NEW.code = RAND()*10000;
END$$
DELIMITER ;

SELECT 'Creating reservation stored procedures (part 6)' AS 'Message';

SELECT 'Creating custom views (part 7)' AS 'Message';
