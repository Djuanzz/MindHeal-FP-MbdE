-- View JOIN dari UserDiagnosis -> Psychologist
CREATE VIEW PsychologistUserDiagnosisView AS
SELECT 
    p.PsychologistID,
    p.Name AS PsychologistName,
    p.Email AS PsychologistEmail,
    p.Specialty,
    p.Mobile AS PsychologistMobile,
    p.VisitPrice,
    ud.UserDiagnosisID,
    ud.DiagnosisType,
    ud.DiagnosisStatus,
    ud.SeverityLevel,
    ud.SymptompsDescription,
    ud.TreatmentPlan,
    ud.DiagnosisDate,
    ud.Notes,
    uh.User_UserID AS UserID,
    uh.UserHistoryID AS UHistoryID
FROM 
    Psychologist p
JOIN 
    Schedule s ON p.PsychologistID = s.Psychologist_PsychologistID
JOIN 
    UserHistory uh ON s.UserHistory_UserHistoryID = uh.UserHistoryID
JOIN 
    UserDiagnosis ud ON uh.UserHistoryID = ud.UserHistory_UserHistoryID;

CREATE VIEW PsychologistUserHistoryView AS
SELECT 
    p.PsychologistID,
    p.Name AS PsychologistName,
    p.Email AS PsychologistEmail,
    p.Mobile AS PsychologistMobile,
    p.VisitPrice,
    s.ScheduleID,
    s.`ScheduleDate`,
    uh.User_UserID AS UserID,
    uh.UserHistoryID AS UHistoryID,
    u.Name AS UserName
FROM
    Psychologist p
JOIN
    Schedule s ON p.PsychologistID = s.Psychologist_PsychologistID
JOIN
    UserHistory uh ON s.UserHistory_UserHistoryID = uh.UserHistoryID
JOIN
    Users u ON uh.User_UserID = u.UserID;

DROP VIEW IF EXISTS PsychologistUserHistoryView;