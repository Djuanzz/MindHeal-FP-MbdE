CREATE PROCEDURE InsertUser(IN name VARCHAR(255), email VARCHAR(255), password VARCHAR(255), dateOfBirth DATE, address VARCHAR(50), city VARCHAR(50), mobile VARCHAR(50))
BEGIN
    INSERT INTO Users (Name, Email, Password, DateOfBirth, Address, City, Mobile) VALUES (name, email, password, dateOfBirth, address, city, mobile);
END;

CREATE PROCEDURE InsertUserDiagnosis(
    IN p_UserHistoryID INT,
    IN p_DiagnosisType VARCHAR(50),
    IN p_DiagnosisStatus ENUM('active','resolved','re-evaluated'),
    IN p_SeverityLevel ENUM('mild','moderate','severe'),
    IN p_SymptompsDescription TEXT,
    IN p_TreatmentPlan TEXT,
    IN p_DiagnosisDate DATE,
    IN p_Notes TEXT
)
BEGIN
    INSERT INTO UserDiagnosis (
        DiagnosisType, 
        DiagnosisStatus, 
        SeverityLevel, 
        SymptompsDescription, 
        TreatmentPlan, 
        DiagnosisDate, 
        Notes, 
        UserHistory_UserHistoryID
    ) VALUES (
        p_DiagnosisType, 
        p_DiagnosisStatus, 
        p_SeverityLevel, 
        p_SymptompsDescription, 
        p_TreatmentPlan, 
        p_DiagnosisDate, 
        p_Notes, 
        p_UserHistoryID
    );
END;
