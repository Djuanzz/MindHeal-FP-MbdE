-- Active: 1716893974313@@127.0.0.1@3306@rawat_jalan
USE rawat_jalan;

-- Table: User
CREATE TABLE User (
    UserID int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    CONSTRAINT User_pk PRIMARY KEY (UserID)
);

CREATE TABLE Session (
    SessionID int NOT NULL AUTO_INCREMENT,
    SessionStart time,
    SessionEnd time,
    CONSTRAINT Session_pk PRIMARY KEY (SessionID)
);

CREATE TABLE Psychologist (
    PsychologistID int NOT NULL AUTO_INCREMENT,
    Name varchar(255),
    Email varchar(255),
    CONSTRAINT Psychologist_pk PRIMARY KEY (PsychologistID)
);

CREATE TABLE UserHistory (
    UserHistoryID int NOT NULL AUTO_INCREMENT,
    User_UserID int,
    CONSTRAINT UserHistory_pk PRIMARY KEY (UserHistoryID),
    FOREIGN KEY (User_UserID) REFERENCES User (UserID)
);

CREATE TABLE Transaction (
    TransactionID int NOT NULL AUTO_INCREMENT,
    PaymentType int,
    Amount FLOAT,
    IsPayed boolean DEFAULT FALSE,
    DateCreated timestamp DEFAULT CURRENT_TIMESTAMP,
    DateExpired TIMESTAMP GENERATED ALWAYS AS (DATE_ADD(DateCreated, INTERVAL 5 MINUTE)) VIRTUAL,
    User_UserID int,
    UserHistory_UserHistoryID int,
    CONSTRAINT Transaction_pk PRIMARY KEY (TransactionID),
    FOREIGN KEY (User_UserID) REFERENCES User (UserID),
    FOREIGN KEY (UserHistory_UserHistoryID) REFERENCES UserHistory (UserHistoryID) ON DELETE CASCADE
);

CREATE TABLE Schedule (
    ScheduleID int NOT NULL AUTO_INCREMENT,
    ScheduleDate DATE,
    ScheduleStatus ENUM('Available','Booked', 'Waiting') DEFAULT 'Available',
    Psychologist_PsychologistID INT,
    Session_SessionID INT,
    UserHistory_UserHistoryID INT,
    CONSTRAINT Schedule_pk PRIMARY KEY (ScheduleID),
    FOREIGN KEY (Session_SessionID) REFERENCES Session (SessionID),
    FOREIGN KEY (Psychologist_PsychologistID) REFERENCES Psychologist (PsychologistID),
    FOREIGN KEY (UserHistory_UserHistoryID) REFERENCES UserHistory (UserHistoryID) ON DELETE SET NULL
);
