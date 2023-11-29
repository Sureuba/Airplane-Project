DROP DATABASE IF EXISTS AIRPLANESYSTEM_DB;
CREATE DATABASE AIRPLANESYSTEM_DB;

USE AIRPLANESYSTEM_DB;

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    Address VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    MemberStatus ENUM('Guest', 'Member') DEFAULT 'Guest'
);

CREATE TABLE PaymentInfo (
    PaymentInfoID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CardNumber VARCHAR(16),
    CardExpYear INT,
    CardCSV VARCHAR(3),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Aircraft (
    AircraftID INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(100),
    Capacity INT,
    AircraftCondition BOOL 
);

CREATE TABLE Crew (
    CrewID INT AUTO_INCREMENT PRIMARY KEY,
    CrewName VARCHAR(100)
);

CREATE TABLE Flights (
    FlightID INT AUTO_INCREMENT PRIMARY KEY,
    DepartureLocation VARCHAR(100),
    Destination VARCHAR(100),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    AircraftID INT,
    CrewID INT,
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID),
    FOREIGN KEY (CrewID) REFERENCES Crew(CrewID)
);

CREATE TABLE FlightSeats (
    SeatID INT AUTO_INCREMENT PRIMARY KEY,
    FlightID INT,
    IsAvailable BOOLEAN DEFAULT TRUE,
    SeatType ENUM('Business', 'Ordinary', 'Comfort'),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT, 
    FlightID INT,
    SeatID INT,
    ReservationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsCancelled BOOLEAN DEFAULT FALSE,
    TicketInsurance BOOL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (SeatID) REFERENCES FlightSeats(SeatID)
);

GRANT INSERT, DELETE ON Crew TO AdminRole;
GRANT INSERT, DELETE ON Aircraft TO AdminRole;
GRANT INSERT, DELETE ON Flights TO AdminRole;


-- Inserting data into Customer
INSERT INTO Customer (Name, ContactInfo, Address, Email, MemberStatus) VALUES
('John Doe', '123-456-7890', '1234 Main St, Anytown, USA', 'johndoe@email.com', 'Member'),
('Jane Smith', '987-654-3210', '4321 Second St, Othertown, USA', 'janesmith@email.com', 'Guest');

-- Inserting data into PaymentInfo
INSERT INTO PaymentInfo (CustomerID, CardNumber, CardExpYear, CardCSV) VALUES
(1, '1111222233334444', 2025, '123'),
(2, '5555666677778888', 2024, '321');

-- Inserting data into Aircraft
INSERT INTO Aircraft (Model, Capacity, AircraftCondition) VALUES
('Boeing 747', 366, TRUE),
('Airbus A320', 150, TRUE);

-- Inserting data into Crew
INSERT INTO Crew (CrewName) VALUES
('Captain Morgan'),
('First Officer Smith');

-- Inserting data into Flights
INSERT INTO Flights (DepartureLocation, Destination, DepartureTime, ArrivalTime, SeatNumber, AircraftID, CrewID) VALUES
('New York', 'London', '2023-12-15 08:00:00', '2023-12-15 20:00:00', '1A', 1, 1),
('Los Angeles', 'Tokyo', '2023-12-20 11:00:00', '2023-12-21 15:00:00', '2B', 2, 2);

-- Inserting Seats for a Flight
INSERT INTO FlightSeats (FlightID, SeatType, IsAvailable) VALUES
(1, 'Business', FALSE),
(1, 'Ordinary', FALSE),
(1, 'Comfort', TRUE);

-- Inserting Reservations
INSERT INTO Reservations (CustomerID, FlightID, SeatID, TicketInsurance) VALUES
(1, 1, 1, TRUE),
(2, 1, 2, FALSE);
DROP DATABASE IF EXISTS AIRPLANESYSTEM_DB;
CREATE DATABASE AIRPLANESYSTEM_DB;

USE AIRPLANESYSTEM_DB;

CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
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
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
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

