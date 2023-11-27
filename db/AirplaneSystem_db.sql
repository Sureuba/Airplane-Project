<<<<<<< HEAD:db/Airplane-System.sql
CREATE TABLE Passenger ( //USER
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
=======
DROP DATABASE IF EXISTS AIRPLANESYSTEM_DB;

CREATE DATABASE AIRPLANESYSTEM_DB;

USE AIRPLANESYSTEM_DB;



CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
>>>>>>> 2bb5c6ac0123eccc3a14d150af7474f4e72af62e:db/AirplaneSystem_db.sql
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    Address VARCHAR(100),
    Email VARCHAR(100),
    MemberStatus ENUM('Guest', 'Member') DEFAULT 'Guest'
    UNIQUE (Email)
);

CREATE TABLE PaymentInfo (
    MemberID INT PRIMARY KEY,
    CardNumber VARCHAR(16),
    CardExpYear INT(4),
    CardCSV INT(3),
    FOREIGN KEY (MemberID) REFERENCES Passenger(PassengerID)
);

CREATE TABLE Admin(
	AdminID INT PRIMARY KEY
);

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    DepartureLocation VARCHAR(100),
    Destination VARCHAR(100),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    SeatNumber VARCHAR(10),
    IsAvailable BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID),
    FOREIGN KEY (CrewID) REFERENCES Crew(CrewID)
);

CREATE TABLE FlightSeats (
    SeatID INT AUTO_INCREMENT PRIMARY KEY,
    SeatType ENUM('Business', 'Ordinary', 'Comfort')
);

CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    PassengerID INT, 
    FlightID INT,
	ReservationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	IsCancelled BOOLEAN DEFAULT FALSE,
    TicketInsurance BOOL,
	FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

CREATE TABLE Aircraft (
    AircraftID INT PRIMARY KEY,
    Model VARCHAR(100),
    Capacity INT,
    AircraftCondition BOOL 
);

CREATE TABLE Crew (
    CrewID INT PRIMARY KEY,
    CrewName VARCHAR(100)
);

GRANT INSERT, DELETE ON Crew TO AdminRole;
GRANT INSERT, DELETE ON Aircraft TO AdminRole;
GRANT INSERT, DELETE ON Flights TO AdminRole;

