DROP DATABASE IF EXISTS Travel;
CREATE DATABASE IF NOT EXISTS Travel;

SHOW databases;
USE Travel;

-- CREATE TABLE FOR ADMIN
CREATE TABLE Admin(
	adminId INT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50),
    password VARCHAR(12) NOT NULL,
    age INT NOT NULL,
    contactNo INT NOT NULL,
    emailId VARCHAR(25) NOT NULL,
    PRIMARY KEY(adminId)
);

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

-- Create table using select 
-- -- CREATE TABLE User2 AS
-- -- SELECT UserId, firstName
-- -- FROM User;

-- -- DESC User2;
-- -- DROP TABLE User2;
CREATE TABLE Payment (
	paymentId INT AUTO_INCREMENT,
    userId INT NOT NULL,
    paymentType VARCHAR(50) NOT NULL,
    paymentStatus VARCHAR(10) DEFAULT 'False',
    PRIMARY KEY(paymentId),
    FOREIGN KEY(userId) REFERENCES User(userId)
);

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

CREATE TABLE BookingAgency (
	bookingAgencyId INT AUTO_INCREMENT,
    adminId INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (bookingAgencyId),
    FOREIGN KEY(adminId) REFERENCES Admin(adminId)
);


CREATE TABLE Accomodation (
	accomodationId INT AUTO_INCREMENT,
    bookingAgencyId INT,
    address VARCHAR(75) NOT NULL,
    ratings INT,
    PRIMARY KEY(accomodationId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);

CREATE TABLE Advertisement (
	advertisementId INT AUTO_INCREMENT,
    bookingAgencyId INT NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY(advertisementId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);

CREATE TABLE Transport (
	transportId INT AUTO_INCREMENT,
    bookingAgencyId INT NOT NULL,
    transportType VARCHAR(50) NOT NULL,
    charges INT NOT NULL,
    PRIMARY KEY(transportId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);

CREATE TABLE Places (
	placeId INT NOT NULL AUTO_INCREMENT,
    bookingAgencyId INT NOT NULL,
    name VARCHAR(25) NOT NULL,
    pincode INT NOT NULL,
    PRIMARY KEY(placeId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId)
);

CREATE TABLE BookingAgencyPlaces (
	bookingAgencyId INT NOT NULL,
    placeId INT NOT NULL,
    PRIMARY KEY(bookingAgencyId, placeId),
    FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId),
    FOREIGN KEY(placeId) REFERENCES Places(placeId)
);

-- SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- SHOW TABLES;

-- Adding one to one between admin and booking agency
ALTER TABLE Admin
ADD bookingAgencyId INT, 
ADD FOREIGN KEY(bookingAgencyId) REFERENCES BookingAgency(bookingAgencyId);

INSERT INTO Admin(firstName, lastName, password, age, contactNo, emailId)
Values('Carlson', 'Taylor', 'asdjk', 29, 68429687, 'carlson@gmail.com');

INSERT INTO Admin(firstName, lastName, password, age, contactNo, emailId)
Values('JOHN', 'MATHHEW', 'asdjk1', 22, 68429222, 'JOHN@gmail.com');

INSERT INTO Admin(firstName, lastName, password, age, contactNo, emailId)
Values('DAVE', null, 'asdjk2', 18, 87429687, 'DAVE@gmail.com');

INSERT INTO Admin(firstName, lastName, password, age, contactNo, emailId)
Values('Jagrut', 'NEMATUNDE', 'asdjk3', 39, 99029687, 'JN@gmail.com');

INSERT INTO Admin(firstName, lastName, password, age, contactNo, emailId)
Values('Pranjal', 'aggarwal', 'asdjk5', 20, 98977675, 'pranjal@gmail.com');

INSERT INTO Admin(firstName, lastName, password, age, contactNo, emailId)
Values('Harry', 'POTTER', 'asdjk5', 14, 77829687, 'HARRY@gmail.com');


-- INSERTING VALUES IN USER TABLE

INSERT INTO User(adminId, firstName, lastname, password, age, contactNo, emailId)
VALUES(2, 'HARRY', null, 'aassdu', 27, 887636421, 'HARRY@gmail.com');

INSERT INTO User(adminId, firstName, lastname, password, age, contactNo, emailId)
VALUES(2, 'Ronald', 'Styles', 'aassdu1', 22, 987636421, 'ronald@gmail.com');

INSERT INTO User(adminId, firstName, lastname, password, age, contactNo, emailId)
VALUES(2, 'Katy', 'Mathews', 'aassdu2', 22, 987634421, 'katy@gmail.com');

INSERT INTO User(adminId, firstName, lastname, password, age, contactNo, emailId)
VALUES(3, 'Sean', null, 'aassdu3', 18, 687636421, 'Sean@gmail.com');

INSERT INTO User(adminId, firstName, lastname, password, age, contactNo, emailId)
VALUES(1, 'Kmann', 'hector', 'aassdu4', 21, 587636421, 'Kmann@gmail.com');

-- Insert data in payment
INSERT INTO Payment (userId, paymentType, paymentStatus)
VALUES (5, 'COD', 'Completed');

INSERT INTO Payment (userId, paymentType, paymentStatus)
VALUES (2, 'COD', 'NCompleted');

INSERT INTO Payment (userId, paymentType, paymentStatus)
VALUES (2, 'COD', 'NCompleted');

INSERT INTO Payment (userId, paymentType, paymentStatus)
VALUES (3, 'COD', 'Completed');

INSERT INTO Payment (userId, paymentType, paymentStatus)
VALUES (1, 'COD', 'Completed');

INSERT INTO Payment (userId, paymentType, paymentStatus)
VALUES (5, 'COD', 'Completed');

-- Insert data in booking
INSERT INTO Booking(userId, bookingDate, travelDate, destinationFrom, destinationTo)
VALUES (3, '20-09-2020', '2-12-2020', 'DUBAI', 'LONDON');

INSERT INTO Booking(userId, bookingDate, travelDate, destinationFrom, destinationTo)
VALUES (2, '22-09-2020', '2-01-2021', 'DELHI', 'GOA');

INSERT INTO Booking(userId, bookingDate, travelDate, destinationFrom, destinationTo)
VALUES (4, '22-09-2020', '18-10-2020', 'MUMBAI', 'JFK');

INSERT INTO Booking(userId, bookingDate, travelDate, destinationFrom, destinationTo)
VALUES (5, '24-09-2020', '13-12-2020', 'HUBLI', 'BENGALURU');

INSERT INTO Booking(userId, bookingDate, travelDate, destinationFrom, destinationTo)
VALUES (2, '22-09-2020', '12-12-2020', 'DUBAI', 'LONDON');


-- Insert data in booking agency
INSERT INTO BookingAGENCY VALUES (2, 1, 'Fare Portal');
INSERT INTO BookingAGENCY VALUES (3, 2, 'CLARK BOOKING');
INSERT INTO BookingAGENCY VALUES (4, 1, 'EASY Portal');
INSERT INTO BookingAGENCY VALUES (1, 3, 'READY GO');
INSERT INTO BookingAGENCY VALUES (5, 3, 'TRAVEL US');


-- -- Insert data in Accomodation
INSERT INTO Accomodation VALUES(2, 2, 'Black Cross Square Society, 9th Street, New York', 5);
INSERT INTO Accomodation VALUES(3, 1, 'Ava Jones Road, 9th Street, New York', 4);
INSERT INTO Accomodation VALUES(4, 1, 'Ava Jones Road, 9th Street, New York', 3);
INSERT INTO Accomodation VALUES(5, 2, 'Ava Jones Road, 9th Street, New York', 5);
INSERT INTO Accomodation VALUES(1, 3, 'Ava Jones Road, 9th Street, New York', 4);


-- Insert data in Advertisement
INSERT INTO Advertisement VALUES (1, 1, 5000);
INSERT INTO Advertisement VALUES (2, 1, 2000);
INSERT INTO Advertisement VALUES (3, 2, 500);
INSERT INTO Advertisement VALUES (4, 2, 3000);
INSERT INTO Advertisement VALUES (5, 2, 500);


SELECT * FROM Advertisement;

-- Insert data in Transport
INSERT INTO Transport VALUES (1, 1, 'Flight', 5000);
INSERT INTO Transport VALUES (2, 1, 'Flight', 10000);
INSERT INTO Transport VALUES (3, 1, 'Train', 2500);
INSERT INTO Transport VALUES (4, 1, 'Bus', 500);
INSERT INTO Transport VALUES (5, 1, 'Flight', 10000);




-- SELECT * FROM Admin;
-- SELECT * FROM User;
-- SELECT * FROM Payment;
-- SELECT * FROM Booking;
-- SELECT * FROM BookingAGENCY;
-- SELECT * FROM Accomodation;
-- SELECT * FROM Advertisement;
-- SELECT * FROM Transport;




--  A select query using logical and relational operators
SELECT transportType, charges, name, adminId FROM Transport as t, BookingAgency as b WHERE t.charges >= 2500 or b.bookingAgencyId = 1;




-- A sub-query using select
SELECT firstName, lastName, transportType FROM User as u, Transport as t WHERE transportType IN (SELECT transportType FROM Transport where transportType = 'Flight');



