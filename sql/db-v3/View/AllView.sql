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

-- VIEW buat Location favorite user
CREATE VIEW UserFavoriteLocation AS
SELECT 
    u.UserID,
    u.Name AS UserName,
    l.LocationID,
    l.Name AS LocationName,
    l.Address,
    l.City,
    COUNT(*) AS VisitCount
FROM 
    Users u
JOIN 
    UserHistory uh ON u.UserID = uh.User_UserID
JOIN 
    Schedule s ON uh.UserHistoryID = s.UserHistory_UserHistoryID
JOIN 
    Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
JOIN 
    Locations l ON p.Location_LocationID = l.LocationID
GROUP BY 
    u.UserID, l.LocationID
ORDER BY 
    VisitCount DESC;