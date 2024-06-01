-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-05-06 11:17:39.924
CREATE DATABASE rawat_jalan;

USE rawat_jalan;

ALTER TABLE Psychologist AUTO_INCREMENT = 1;

ALTER TABLE Schedule AUTO_INCREMENT = 1;

ALTER TABLE Session AUTO_INCREMENT = 1;

ALTER TABLE Transaction AUTO_INCREMENT = 1;

ALTER TABLE User AUTO_INCREMENT = 1;

ALTER TABLE UserHistory AUTO_INCREMENT = 1;

DELETE FROM Psychologist;

DELETE FROM Schedule;

DELETE FROM Session;

DELETE FROM Transaction;

DELETE FROM User;

DELETE FROM UserHistory;

DROP TABLE Session;

DROP TABLE Schedule;

DROP TABLE Psychologist;

DROP TABLE Transaction;

DROP TABLE User;

DROP TABLE UserHistory;

DESCRIBE Psychologist;

DESCRIBE Schedule;

DESCRIBE Session;

DESCRIBE Transaction;

DESCRIBE User;

DESCRIBE UserHistory;

-- tables
-- Table: Psychologist
CREATE TABLE Psychologist (
    PsychologistID int NOT NULL AUTO_INCREMENT,
    Name varchar(255),
    Email varchar(255),
    CONSTRAINT Psychologist_pk PRIMARY KEY (PsychologistID)
);

-- Table: Schedule
CREATE TABLE Schedule (
    ScheduleID int NOT NULL AUTO_INCREMENT,
    ScheduleDate DATE,
    Psychologist_PsychologistID int,
    Session_SessionID int,
    UserHistory_UserHistoryID int,
    -- Booked boolean DEFAULT FALSE,
    CONSTRAINT Schedule_pk PRIMARY KEY (ScheduleID),
    FOREIGN KEY (Session_SessionID) REFERENCES Session (SessionID),
    FOREIGN KEY (Psychologist_PsychologistID) REFERENCES Psychologist (PsychologistID)
    FOREIGN KEY (UserHistory_UserHistoryID) REFERENCES UserHistory (UserHistoryID)
);

ALTER TABLE Schedule ADD COLUMN inWaiting BOOLEAN DEFAULT FALSE;

SELECT *FROM Schedule;

-- Table: Session
CREATE TABLE Session (
    SessionID int NOT NULL AUTO_INCREMENT,
    SessionStart time,
    SessionEnd time,
    CONSTRAINT Session_pk PRIMARY KEY (SessionID)
);

-- Table: Transaction
CREATE TABLE Transaction (
    TransactionID int NOT NULL AUTO_INCREMENT,
    IsPayed boolean DEFAULT FALSE,
    PaymentType int,
    Amount FLOAT,
    DateCreated timestamp DEFAULT CURRENT_TIMESTAMP,
    DateExpired timestamp DEFAULT GENERATED ALWAYS AS (DATE_ADD(DateCreated, INTERVAL 5 MINUTE)),
    User_UserID int,
    UserHistory_UserHistoryID int,
    CONSTRAINT Transaction_pk PRIMARY KEY (TransactionID),
    FOREIGN KEY (User_UserID) REFERENCES User (UserID),
    FOREIGN KEY (UserHistory_UserHistoryID) REFERENCES UserHistory (UserHistoryID)
);

-- Table: User
CREATE TABLE User (
    UserID int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    CONSTRAINT User_pk PRIMARY KEY (UserID)
);

-- Table: UserHistory
CREATE TABLE UserHistory (
    UserHistoryID int NOT NULL AUTO_INCREMENT,
    -- DateCreated timestamp DEFAULT CURRENT_TIMESTAMP,
    User_UserID int,
    Schedule_ScheduleID int,
    CONSTRAINT UserHistory_pk PRIMARY KEY (UserHistoryID),
    -- FOREIGN KEY (Schedule_ScheduleID) REFERENCES Schedule (ScheduleID),
    FOREIGN KEY (User_UserID) REFERENCES User (UserID)
);

ALTER TABLE UserHistory ADD COLUMN Status VARCHAR(10);
 
-- foreign keys
-- Reference: Schedule_Psychologist (table: Schedule)
-- ALTER TABLE Schedule ADD CONSTRAINT Schedule_Psychologist FOREIGN KEY Schedule_Psychologist (Psychologist_PsychologistID)
--     REFERENCES Psychologist (PsychologistID);

-- Reference: Schedule_UserHistory (table: Schedule)
-- ALTER TABLE Schedule ADD CONSTRAINT Schedule_UserHistory FOREIGN KEY Schedule_UserHistory (UserHistory_UserHistoryID)
--     REFERENCES UserHistory (UserHistoryID);

-- ALTER TABLE Schedule ADD CONSTRAINT Session_SessionID FOREIGN KEY Session_SessionID (UserHistory_UserHistoryID)
--     REFERENCES UserHistory (UserHistoryID);

-- Reference: Session_Schedule (table: Session)
-- ALTER TABLE Session ADD CONSTRAINT Session_Schedule FOREIGN KEY Session_Schedule (Schedule_ScheduleID)
--     REFERENCES Schedule (ScheduleID);

-- Reference: Transaction_User (table: Transaction)
-- ALTER TABLE Transaction ADD CONSTRAINT Transaction_User FOREIGN KEY Transaction_User (User_UserID)
--     REFERENCES User (UserID);

-- Reference: Transaction_UserHistory (table: Transaction)
-- ALTER TABLE Transaction ADD CONSTRAINT Transaction_UserHistory FOREIGN KEY Transaction_UserHistory (UserHistory_UserHistoryID)
--     REFERENCES UserHistory (UserHistoryID);

-- Reference: UserHistory_User (table: UserHistory)
-- ALTER TABLE UserHistory ADD CONSTRAINT UserHistory_User FOREIGN KEY UserHistory_User (User_UserID)
--     REFERENCES User (UserID);

-- End of file.