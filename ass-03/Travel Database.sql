DROP DATABASE IF EXISTS Travel;
CREATE DATABASE IF NOT EXISTS Travel;
SHOW DATABASES;
USE Travel;

-- create table for admin
CREATE TABLE Admin (
	adminId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50),
    password VARCHAR(12) NOT NULL,
    age INT NOT NULL,
    contactNo INT NOT NULL,
    emailId VARCHAR(25) NOT NULL,
    PRIMARY KEY(adminId)
);

-- Adding one to one between admin and booking agency
ALTER TABLE Admin
ADD bookingAgencyId INT, 
ADD FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId);

-- Create table for user
CREATE TABLE User (
	userId INT NOT NULL AUTO_INCREMENT,
    adminId INT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50),
    age INT NOT NULL,
    contactNo INT NOT NULL,
    emailId VARCHAR(25) NOT NULL,
    password VARCHAR(12) NOT NULL,
    PRIMARY KEY(userId),
    FOREIGN KEY(adminId) REFERENCES Admin(adminId)
);

-- INSERT INTO Admin(firstName, lastName, password, age, contactNo, emailId)
-- Values('Carlson', 'Taylor', 'asdjk', 29, 68429687, 'carlson@gmail.com');

-- INSERT INTO User(adminId, firstName, lastname, password, age, contactNo, emailId)
-- VALUES(2, 'Harry', 'Styles', 'aassdu', 27, 987636421, 'harry@gmail.com');

SELECT * FROM User;

SELECT * FROM Admin;

-- Create table using select 
CREATE TABLE User2 AS
SELECT UserId, firstName
FROM User;

SELECT * FROM User;

desc User;

SELECT * FROM User, Admin;

SHOW TABLES;

-- Create table for payment
CREATE TABLE Payment (
	paymentId INT AUTO_INCREMENT,
    userId INT NOT NULL,
    paymentType VARCHAR(50) NOT NULL,
    paymentStatus VARCHAR(10) DEFAULT 'False',
    PRIMARY KEY(paymentId),
    FOREIGN KEY(userId) REFERENCES User(userId)
);

-- Insert data in payment
INSERT INTO Payment (userId, paymentType, paymentStatus)
VALUES (5, 'COD', 'Completed');

SELECT * FROM Payment;

-- Create table for booking
CREATE TABLE Booking (
	bookingId INT AUTO_INCREMENT,
    userId INT NOT NULL,
    bookingDate VARCHAR(25) NOT NULL,
    travelDate VARCHAR(25) NOT NULL,
    destinationFrom VARCHAR(25) NOT NULL,
    destinationTo VARCHAR(25) NOT NULL,
    PRIMARY KEY(bookingId),
    FOREIGN KEY(userId) REFERENCES User(userId)
);

-- Insert data in booking
INSERT INTO Booking(userId, bookingDate, travelDate, destinationFrom, destinationTo)
VALUES (3, '20-09-2020', '2-12-2020', 'DUBAI', 'LONDON');

SELECT * FROM Booking;

-- Create table booking agency
CREATE TABLE BookingAgency (
	bookingAgencyId INT AUTO_INCREMENT,
    adminId INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (bookingAgencyId),
    FOREIGN KEY(adminId) REFERENCES Admin(adminId)
);

-- Insert data in booking agency
INSERT INTO BookingAGENCY VALUES (2, 1, 'Fare Portal');

SELECT * FROM BookingAgency;

-- Cretae accomodation table
CREATE TABLE Accomodation (
	accomodationId INT AUTO_INCREMENT,
    bookingAgencyId INT,
    address VARCHAR(75) NOT NULL,
    ratings INT,
    PRIMARY KEY(accomodationId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);

-- -- Insert data in Accomodation
INSERT INTO Accomodation VALUES(2, 2, 'Black Cross Square Society, 9th Street, New York', 5);

SELECT * FROM Accomodation;

-- Create advertisement table
CREATE TABLE Advertisement (
	advertisementId INT AUTO_INCREMENT,
    bookingAgencyId INT NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY(advertisementId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);

-- Create transport table 
CREATE TABLE Transport (
	transportId INT AUTO_INCREMENT,
    bookingAgencyId INT NOT NULL,
    transportType VARCHAR(50) NOT NULL,
    charges INT NOT NULL,
    PRIMARY KEY(transportId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);

-- Insert data in Advertisement
INSERT INTO Advertisement VALUES (1, 1, 5000);
INSERT INTO Advertisement VALUES (2, 1, 2000);
INSERT INTO Advertisement VALUES (3, 2, 500);
INSERT INTO Advertisement VALUES (4, 2, 3000);

SELECT * FROM Advertisement;

-- Insert data in Transport
INSERT INTO Transport VALUES (1, 1, 'Flight', 5000);
INSERT INTO Transport VALUES (2, 1, 'Flight', 10000);
INSERT INTO Transport VALUES (3, 1, 'Train', 2500);
INSERT INTO Transport VALUES (4, 1, 'Bus', 500);

SELECT * FROM Transport;

--  A select query using logical and relational operators
SELECT transportType, charges, name, adminId FROM Transport as t, BookingAgency as b WHERE t.charges >= 2500 or b.bookingAgencyId = 1;

-- A sub-query using select
SELECT firstName, lastName, transportType FROM User as u, Transport as t WHERE transportType IN (SELECT transportType FROM Transport where transportType = 'Flight');

-- Create place table
CREATE TABLE Places (
	placeId INT NOT NULL AUTO_INCREMENT,
    bookingAgencyId INT NOT NULL,
    name VARCHAR(25) NOT NULL,
    pincode INT NOT NULL,
    PRIMARY KEY(placeId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);
 
 -- Extra table for many to many relationship between bookingAgency and Place
CREATE TABLE BookingAgencyPlaces (
	bookingAgencyId INT NOT NULL,
    placeId INT NOT NULL,
    PRIMARY KEY(bookingAgencyId, placeId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId),
    FOREIGN KEY(placeId) REFERENCES Places(placeId)
);

SELECT * FROM Admin;