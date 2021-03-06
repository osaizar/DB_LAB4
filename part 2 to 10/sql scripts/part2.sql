SELECT 'Creating tables (part2)' AS 'Message';

DROP TABLE IF EXISTS route;
DROP TABLE IF EXISTS airport;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS weekly_flight;
DROP TABLE IF EXISTS week_day;
DROP TABLE IF EXISTS flight;
DROP TABLE IF EXISTS year;
DROP TABLE IF EXISTS seat;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS passenger;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS ccinfo;
DROP TABLE IF EXISTS passenger_bookings;


CREATE TABLE route(
  id INT AUTO_INCREMENT,
  source VARCHAR(3) NOT NULL,
  dest VARCHAR(3) NOT NULL,
  price DOUBLE,
  year INT,
  CONSTRAINT pk_route PRIMARY KEY(id)
);

CREATE TABLE airport(
  code VARCHAR(3) NOT NULL,
  name VARCHAR(30),
  country INT NOT NULL,
  CONSTRAINT pk_airport PRIMARY KEY(code)
);


CREATE TABLE country(
  id INT AUTO_INCREMENT,
  name VARCHAR(30),
  CONSTRAINT pk_country PRIMARY KEY(id)
);

CREATE TABLE weekly_flight(
  id INT AUTO_INCREMENT,
  weekday INT NOT NULL,
  route INT NOT NULL,
  departure_time TIME,
  CONSTRAINT pk_wflight PRIMARY KEY(id)
);

CREATE TABLE week_day(
  id INT AUTO_INCREMENT,
  name VARCHAR(10),
  year INT,
  wpfactor DOUBLE,
  CONSTRAINT pk_wday PRIMARY KEY(id)
);

CREATE TABLE flight(
  id INT AUTO_INCREMENT,
  wflight INT NOT NULL,
  week INT,
  year INT NOT NULL,
  CONSTRAINT pk_flight PRIMARY KEY(id)
);

CREATE TABLE year(
  year INT NOT NULL,
  ypfactor DOUBLE,
  CONSTRAINT pk_year PRIMARY KEY(year)
);

CREATE TABLE seat(
  id INT AUTO_INCREMENT,
  name INT,
  flight  INT NOT NULL,
  CONSTRAINT pk_seat PRIMARY KEY(id)
);

CREATE TABLE ticket(
  id INT AUTO_INCREMENT,
  code INT NOT NULL,
  seat INT NOT NULL,
  passenger INT NOT NULL,
  booking INT NOT NULL,
  CONSTRAINT pk_ticket PRIMARY KEY(id)
);

CREATE TABLE passenger(
  id INT AUTO_INCREMENT,
  passport INT,
  name VARCHAR(30),
  UNIQUE (passport),
  CONSTRAINT pk_passenger PRIMARY KEY(id)
);

CREATE TABLE booking(
  id INT AUTO_INCREMENT,
  code INT NOT NULL,
  contact INT,
  price DOUBLE,
  passenger_count INT,
  payedby INT,
  flight INT NOT NULL,
  CONSTRAINT pk_booking PRIMARY KEY(id)
);

CREATE TABLE contact(
  id INT AUTO_INCREMENT,
  passenger INT NOT NULL,
  phone BIGINT,
  email VARCHAR(30),
  CONSTRAINT pk_contact PRIMARY KEY(id)
);

CREATE TABLE ccinfo(
  id INT AUTO_INCREMENT,
  ccnumber BIGINT,
  name VARCHAR(30),
  CONSTRAINT pk_ccinfo PRIMARY KEY(id)
);

CREATE TABLE passenger_bookings(
  passenger INT NOT NULL,
  booking INT NOT NULL,
  CONSTRAINT pk_passbook PRIMARY KEY(passenger,booking)
);

SELECT 'Creating foreign keys' AS 'Message';

ALTER TABLE route ADD CONSTRAINT fk_route_dest FOREIGN KEY (dest) REFERENCES airport(code);
ALTER TABLE route ADD CONSTRAINT fk_route_source FOREIGN KEY (source) REFERENCES airport(code);
ALTER TABLE airport ADD CONSTRAINT fk_airport_country FOREIGN KEY (country) REFERENCES country(id);
ALTER TABLE weekly_flight ADD CONSTRAINT fk_weeklyflight_route FOREIGN KEY (route) REFERENCES route(id);
ALTER TABLE weekly_flight ADD CONSTRAINT fk_weeklyflight_weekday FOREIGN KEY (weekday) REFERENCES week_day(id);
ALTER TABLE flight ADD CONSTRAINT fk_flight_weekflight FOREIGN KEY (wflight) REFERENCES weekly_flight(id);
ALTER TABLE flight ADD CONSTRAINT fk_flight_year FOREIGN KEY (year) REFERENCES year(year);
ALTER TABLE seat ADD CONSTRAINT fk_seat_flight FOREIGN KEY (flight) REFERENCES flight(id);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_seat FOREIGN KEY (seat) REFERENCES seat(id);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_passenger FOREIGN KEY (passenger) REFERENCES passenger(id);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_booking FOREIGN KEY (booking) REFERENCES booking(id);
ALTER TABLE booking ADD CONSTRAINT fk_booking_ccinfo FOREIGN KEY (payedby) REFERENCES ccinfo(id);
ALTER TABLE booking ADD CONSTRAINT fk_booking_contact FOREIGN KEY (contact) REFERENCES contact(id);
ALTER TABLE booking ADD CONSTRAINT fk_booking_flight FOREIGN KEY (flight) REFERENCES flight(id);
ALTER TABLE contact ADD CONSTRAINT fk_contact_passenger FOREIGN KEY (passenger) REFERENCES passenger(id) ON DELETE CASCADE; -- When a passenger is deleted, so should the contact
ALTER TABLE passenger_bookings ADD CONSTRAINT fk_pb_bookings FOREIGN KEY (booking) REFERENCES booking(id);
ALTER TABLE passenger_bookings ADD CONSTRAINT fk_pb_passenger FOREIGN KEY (passenger) REFERENCES passenger(id);
