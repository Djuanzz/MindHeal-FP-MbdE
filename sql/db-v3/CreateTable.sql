-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-06-09 10:16:11.555

-- tables
-- Table: Department
CREATE TABLE Department (
    Department_ID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Phone varchar(20)  NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY (Department_ID)
);

-- Table: Psychologist
CREATE TABLE Psychologist (
    PsychologistID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Email varchar(255)  NOT NULL,
    Bio varchar(255)  NOT NULL,
    Mobile varchar(50)  NOT NULL,
    Department_Department_ID int  NOT NULL,
    CONSTRAINT Psychologist_pk PRIMARY KEY (PsychologistID)
);

-- Table: Schedule
CREATE TABLE Schedule (
    ScheduleID int  NOT NULL,
    ScheduleDate date  NOT NULL,
    SessionStart time  NOT NULL,
    SessionEnd time  NOT NULL,
    Psychologist_PsychologistID int  NOT NULL,
    UserHistory_UserHistoryID int  NOT NULL,
    CONSTRAINT Schedule_pk PRIMARY KEY (ScheduleID)
);

-- Table: TransactionBill
CREATE TABLE TransactionBill (
    TransactionID int  NOT NULL,
    isPayed boolean  NOT NULL,
    PaymentType int  NOT NULL,
    Amount int  NOT NULL,
    TimeDue timestamp  NOT NULL,
    CONSTRAINT TransactionBill_pk PRIMARY KEY (TransactionID)
);

-- Table: UserDiagnosis
CREATE TABLE UserDiagnosis (
    UserDiagnosisID int  NOT NULL,
    DiagnosisStatus varchar(50)  NOT NULL,
    DiagnosisDate date  NOT NULL,
    DiagnosisType varchar(50)  NOT NULL,
    SeverityLevel varchar(50)  NOT NULL,
    Symptoms Text  NOT NULL,
    TreatmentPlan Text  NOT NULL,
    Notes Text  NOT NULL,
    UserHistory_UserHistoryID int  NOT NULL,
    CONSTRAINT UserDiagnosis_pk PRIMARY KEY (UserDiagnosisID)
);

-- Table: UserHistory
CREATE TABLE UserHistory (
    UserHistoryID int  NOT NULL,
    Notes longtext  NOT NULL,
    DateCreated date  NOT NULL,
    Users_UserID int  NOT NULL,
    TransactionBill_TransactionID int  NOT NULL,
    CONSTRAINT UserHistory_pk PRIMARY KEY (UserHistoryID)
);

-- Table: Users
CREATE TABLE Users (
    UserID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Email varchar(255)  NOT NULL,
    Password varchar(255)  NOT NULL,
    DateOfBirth date  NOT NULL,
    Address varchar(50)  NOT NULL,
    City varchar(50)  NOT NULL,
    Mobile varchar(50)  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (UserID)
);

-- foreign keys
-- Reference: Psychologist_Department (table: Psychologist)
ALTER TABLE Psychologist ADD CONSTRAINT Psychologist_Department FOREIGN KEY Psychologist_Department (Department_Department_ID)
    REFERENCES Department (Department_ID);

-- Reference: Schedule_Psychologist (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Psychologist FOREIGN KEY Schedule_Psychologist (Psychologist_PsychologistID)
    REFERENCES Psychologist (PsychologistID);

-- Reference: Schedule_UserHistory (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_UserHistory FOREIGN KEY Schedule_UserHistory (UserHistory_UserHistoryID)
    REFERENCES UserHistory (UserHistoryID);

-- Reference: UserDiagnosis_UserHistory (table: UserDiagnosis)
ALTER TABLE UserDiagnosis ADD CONSTRAINT UserDiagnosis_UserHistory FOREIGN KEY UserDiagnosis_UserHistory (UserHistory_UserHistoryID)
    REFERENCES UserHistory (UserHistoryID);

-- Reference: UserHistory_Transaction (table: UserHistory)
ALTER TABLE UserHistory ADD CONSTRAINT UserHistory_Transaction FOREIGN KEY UserHistory_Transaction (TransactionBill_TransactionID)
    REFERENCES TransactionBill (TransactionID);

-- Reference: UserHistory_User (table: UserHistory)
ALTER TABLE UserHistory ADD CONSTRAINT UserHistory_User FOREIGN KEY UserHistory_User (Users_UserID)
    REFERENCES Users (UserID);

-- End of file.
