DROP DATABASE IF EXISTS lab4;
CREATE DATABASE lab4;

USE lab4;

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

SELECT 'Creating tables' AS 'Message';

CREATE TABLE route(
  id INT AUTO_INCREMENT,
  dest VARCHAR(3) NOT NULL,
  source VARCHAR(3) NOT NULL,
  price DOUBLE,
  year INT,
  CONSTRAINT pk_route PRIMARY KEY(id)
);

CREATE TABLE airport(
  code VARCHAR(3) NOT NULL,
  name VARCHAR(30),
  city INT NOT NULL,
  CONSTRAINT pk_airport PRIMARY KEY(code)
);

CREATE TABLE city(
  id INT AUTO_INCREMENT,
  name VARCHAR(30),
  country INT NOT NULL,
  CONSTRAINT pk_city PRIMARY KEY(id)
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
  name VARCHAR(4),
  flight  INT NOT NULL,
  CONSTRAINT pk_seat PRIMARY KEY(id)
);

CREATE TABLE ticket(
  code INT NOT NULL,
  seat INT NOT NULL,
  passenger INT NOT NULL,
  booking INT NOT NULL,
  CONSTRAINT pk_ticket PRIMARY KEY(code)
);

CREATE TABLE passenger(
  id INT AUTO_INCREMENT,
  passport INT,
  name VARCHAR(30),
  surname VARCHAR(30),
  CONSTRAINT pk_passenger PRIMARY KEY(id)
);

CREATE TABLE booking(
  code INT NOT NULL,
  contact INT NOT NULL,
  cphone BIGINT,
  cemail VARCHAR(30),
  payed BOOLEAN,
  price DOUBLE,
  payedby INT NOT NULL,
  flight INT NOT NULL,
  CONSTRAINT pk_booking PRIMARY KEY(code)
);

CREATE TABLE ccinfo(
  id INT AUTO_INCREMENT,
  ccnumber BIGINT,
  name VARCHAR(30),
  surname VARCHAR(30),
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
ALTER TABLE airport ADD CONSTRAINT fk_airport_city FOREIGN KEY (city) REFERENCES city(id);
ALTER TABLE city ADD CONSTRAINT fk_city_country FOREIGN KEY (country) REFERENCES country(id);
ALTER TABLE weekly_flight ADD CONSTRAINT fk_weeklyflight_route FOREIGN KEY (route) REFERENCES route(id);
ALTER TABLE weekly_flight ADD CONSTRAINT fk_weeklyflight_weekday FOREIGN KEY (weekday) REFERENCES week_day(id);
ALTER TABLE flight ADD CONSTRAINT fk_flight_weekflight FOREIGN KEY (wflight) REFERENCES weekly_flight(id);
ALTER TABLE flight ADD CONSTRAINT fk_flight_year FOREIGN KEY (year) REFERENCES year(year);
ALTER TABLE seat ADD CONSTRAINT fk_seat_flight FOREIGN KEY (flight) REFERENCES flight(id);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_seat FOREIGN KEY (seat) REFERENCES seat(id);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_passenger FOREIGN KEY (passenger) REFERENCES passenger(id);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_booking FOREIGN KEY (booking) REFERENCES booking(code);
ALTER TABLE booking ADD CONSTRAINT fk_booking_ccinfo FOREIGN KEY (payedby) REFERENCES ccinfo(id);
ALTER TABLE booking ADD CONSTRAINT fk_booking_contact FOREIGN KEY (contact) REFERENCES passenger(id);
ALTER TABLE booking ADD CONSTRAINT fk_booking_flight FOREIGN KEY (flight) REFERENCES flight(id);
ALTER TABLE passenger_bookings ADD CONSTRAINT fk_pb_bookings FOREIGN KEY (booking) REFERENCES booking(code);
ALTER TABLE passenger_bookings ADD CONSTRAINT fk_pb_passenger FOREIGN KEY (passenger) REFERENCES passenger(id);
