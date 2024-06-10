CREATE TABLE Users (
    UserID INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255)  NOT NULL,
    Email VARCHAR(255)  NOT NULL,
    Password VARCHAR(255)  NOT NULL,
    DateOfBirth DATE  NOT NULL,
    Address VARCHAR(50)  NOT NULL,
    City VARCHAR(50)  NOT NULL,
    Mobile VARCHAR(50)  NOT NULL
);

CREATE TABLE Session (
    SessionID INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    SessionStart TIME NOT NULL,
    SessionEnd TIME NOT NULL
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255)  NOT NULL UNIQUE,
    Address VARCHAR(50)  NOT NULL,
    City VARCHAR(50)  NOT NULL,
    Phone VARCHAR(20)  NOT NULL
);

CREATE TABLE Psychologist (
    PsychologistID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Specialty VARCHAR(255)  NOT NULL,
    Mobile VARCHAR(50)  NOT NULL,
    VisitPrice DECIMAL(10,2)  NOT NULL,
    Department_DepartmentID INT NOT NULL,
    FOREIGN KEY (Department_DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE UserHistory (
    UserHistoryID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DateCreated DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    User_UserID INT,
    FOREIGN KEY (User_UserID) REFERENCES Users(UserID)
);

CREATE TABLE TransactionBill(
    TransactionBillID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IsPayed BOOLEAN DEFAULT FALSE NOT NULL,
    PaymentType VARCHAR(50)  NOT NULL,
    Amount DECIMAL(10,2)  NOT NULL,
    TimeDue TIMESTAMP NOT NULL,
    UserHistory_UserHistoryID INT NOT NULL,
    FOREIGN KEY (UserHistory_UserHistoryID) REFERENCES UserHistory(UserHistoryID)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ScheduleDate DATE,
    ScheduleStatus ENUM('Available','Booked', 'Waiting') DEFAULT 'Available',
    Psychologist_PsychologistID INT,
    Session_SessionID INT,
    UserHistory_UserHistoryID INT,
    FOREIGN KEY (Session_SessionID) REFERENCES Session(SessionID),
    FOREIGN KEY (Psychologist_PsychologistID) REFERENCES Psychologist(PsychologistID),
    FOREIGN KEY (UserHistory_UserHistoryID) REFERENCES UserHistory(UserHistoryID) ON DELETE SET NULL
);

CREATE TABLE UserDiagnosis(
    UserDiagnosisID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DiagnosisType VARCHAR(50) NOT NULL, -- Depression, Anxiety, Bipolar, Disorder, etc
    DiagnosisStatus ENUM('active','resolved','re-evaluated')  NOT NULL,
    SeverityLevel ENUM('mild','moderate','severe')  NOT NULL,
    SymptompsDescription TEXT NOT NULL,
    TreatmentPlan TEXT NOT NULL,
    DiagnosisDate DATE NOT NULL,
    Notes TEXT,
    UserHistory_UserHistoryID INT,
    FOREIGN KEY (UserHistory_UserHistoryID) REFERENCES UserHistory(UserHistoryID)
);