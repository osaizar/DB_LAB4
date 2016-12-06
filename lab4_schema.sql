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
  id INT,
  dest INT,
  source INT,
  price DOUBLE,
  CONSTRAINT pk_route PRIMARY KEY(id)
);

CREATE TABLE airport(
  code VARCHAR(3),
  name VARCHAR(30),
  city INT,
  CONSTRAINT pk_airport PRIMARY KEY(code)
);

CREATE TABLE city(
  id INT,
  name VARCHAR(30),
  country INT,
  CONSTRAINT pk_city PRIMARY KEY(id)
);

CREATE TABLE country(
  id INT,
  name VARCHAR(30),
  CONSTRAINT pk_country PRIMARY KEY(id)
);

CREATE TABLE weekly_flight(
  id INT,
  weekday INT,
  route INT,
  departure_time TIME,
  CONSTRAINT pk_wflight PRIMARY KEY(id)
);

CREATE TABLE week_day(
  id INT,
  name VARCHAR(10),
  year INT,
  wpfactor DOUBLE,
  CONSTRAINT pk_wday PRIMARY KEY(id)
);

CREATE TABLE flight(
  id INT,
  wflight INT,
  week INT,
  year INT,
  CONSTRAINT pk_flight PRIMARY KEY(id)
);

CREATE TABLE year(
  year INT,
  ypfactor DOUBLE,
  CONSTRAINT pk_year PRIMARY KEY(year)
);

CREATE TABLE seat(
  id INT,
  name VARCHAR(4),
  CONSTRAINT pk_seat PRIMARY KEY(id)
);

CREATE TABLE ticket(
  code INT, --?
  seat INT,
  passenger INT,
  booking INT,
  CONSTRAINT pk_ticket PRIMARY KEY(code)
);

CREATE TABLE passenger(
  passport INT,
  name VARCHAR(30),
  surname VARCHAR(30),
  CONSTRAINT pk_passenger PRIMARY KEY(code)
);

CREATE TABLE booking(
  code INT,
  contact INT,
  cphone BIGINT,
  cemail VARCHAR(30),
  payed BOOLEAN,
  price DOUBLE,
  payedby INT,
  flight INT,
  CONSTRAINT pk_booking PRIMARY KEY(code)
);

CREATE TABLE ccinfo(
  id INT,
  ccnumber BIGINT,
  name VARCHAR(30),
  surname VARCHAR(30),
  CONSTRAINT pk_ccinfo PRIMARY KEY(id)
);

CREATE TABLE passenger_bookings(
  passenger INT,
  booking INT,
  CONSTRAINT pk_passbook PRIMARY KEY(passenger,booking)
);

SELECT 'Creating foreign keys' AS 'Message';
