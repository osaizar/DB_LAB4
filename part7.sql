SELECT 'Creating custom views (part7)' AS 'Message';


DROP VIEW IF EXISTS allFlights;

CREATE VIEW allFlights AS
SELECT dep.name AS "DEPARTURE_CITY_NAME",
       arr.name AS "DESTINATION_CITY_NAME",
       weekly_flight.departure_time as "DEPARTURE_TIME",
       week_day.name as "DEPARTURE_DAY",
       flight.week as "DEPARTURE_WEEK",
       flight.year as "DEPARTURE_YEAR",
       calculateFreeSeats(flight.id) as "NR_OF_FREE_SEATS",
       calculatePrice(flight.id) as "CURRENT_PRICE_PER_SEAT"
FROM flight
JOIN weekly_flight on weekly_flight.id = flight.wflight
JOIN route on route.id = weekly_flight.route
JOIN airport AS dep on dep.code = route.source
JOIN airport AS arr on arr.code = route.dest
JOIN week_day on week_day.id  = weekly_flight.weekday;
