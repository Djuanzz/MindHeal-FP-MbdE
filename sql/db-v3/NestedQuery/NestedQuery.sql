-- Nested query buat nge return terakhir kali konsultasi tanggal berapa
CREATE VIEW LatestConsultations AS
SELECT 
    u.UserID, 
    u.Name AS UserName, 
    (
        SELECT MAX(s.ScheduleDate)
        FROM Schedule s
        JOIN UserHistory uh ON s.UserHistory_UserHistoryID = uh.UserHistoryID
        WHERE uh.User_UserID = u.UserID
        AND s.ScheduleStatus = 'Booked'
    ) AS LastConsultationDate
FROM 
    Users u
ORDER BY 
    LastConsultationDate DESC;




-- Nested Query buat buat nampilin Psychologist yang paling banyak ngurus konsultasi
CREATE VIEW PsychologistScheduleCount AS
SELECT 
    p.PsychologistID, 
    p.Name, 
    (SELECT COUNT(s.ScheduleID)
     FROM Schedule s
     WHERE s.Psychologist_PsychologistID = p.PsychologistID
     AND s.ScheduleStatus = 'Booked') AS ScheduleCount
FROM 
    Psychologist p
ORDER BY 
    ScheduleCount DESC;