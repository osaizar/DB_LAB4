SELECT 'Creating help functions (part4)' AS 'Message';

DROP FUNCTION IF EXISTS calculateFreeSeats;
DROP FUNCTION IF EXISTS calculatePrice;


-- TODO: Aprobechar que guardamos cuanta gente hay por booking
DELIMITER $$
CREATE FUNCTION calculateFreeSeats(flight INT)
  RETURNS INT
BEGIN
  DECLARE seats INT;
  select 40-COUNT(*)
  INTO @seats
  from booking
  where booking.flight = flight and booking.payedby IS NULL;
  RETURN @seats;

END;
$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION calculatePrice(flight INT)
  RETURNS DOUBLE
BEGIN
  DECLARE totalprice DOUBLE;
  DECLARE seats INT;
  DECLARE wfactor DOUBLE;
  DECLARE yfactor DOUBLE;
  DECLARE routeprice DOUBLE;

  select COUNT(*)
  INTO @seats
  from booking
  where booking.flight = flight and booking.payedby IS NULL;

  select week_day.wpfactor
  INTO @wfactor
  from flight
  join weekly_flight on flight.wflight = weekly_flight.id
  join week_day on weekly_flight.weekday = week_day.id
  where week_day.year = flight.year and flight.id = flight;

  select year.ypfactor
  into @yfactor
  from flight
  join year on flight.year = year.year
  where flight.id = flight;

  select route.price
  into @routeprice
  from flight
  join weekly_flight on flight.wflight = weekly_flight.id
  join route on weekly_flight.route = route.id
  where flight.id = flight;

  SET @totalprice = @routeprice * @wfactor * (@seats+1)/40 * @yfactor;
  RETURN @totalprice;

END;
$$
DELIMITER ;
