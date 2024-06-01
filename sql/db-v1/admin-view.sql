-- Buat Admin Dashboard (dapetin semua userHistory yang pernah dibuat)
-- yang pertama merupakan QUERY userHistory
-- yang kedua merupakan VIEW dari query userHistory
SELECT u.name AS 'User Name', uh.DateCreated AS 'Booking Date', s.ScheduleDate AS 'Scheduled Date', CONCAT(
        se.SessionStart, ' - ', se.SessionEnd
    ) AS 'Session Time', p.Name AS 'Psychologist Name'
FROM
    User u
    JOIN UserHistory uh ON u.UserID = uh.User_UserID
    JOIN Schedule s ON uh.Schedule_ScheduleID = s.ScheduleID
    JOIN Session se ON s.Session_SessionID = se.SessionID
    JOIN Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
ORDER BY u.name, uh.DateCreated;

CREATE VIEW GetAllUserHistory AS (
    SELECT u.name AS 'User Name', uh.DateCreated AS 'Booking Date', s.ScheduleDate AS 'Scheduled Date', CONCAT(
            se.SessionStart, ' - ', se.SessionEnd
        ) AS 'Session Time', p.Name AS 'Psychologist Name'
    FROM
        User u
        JOIN UserHistory uh ON u.UserID = uh.User_UserID
        JOIN Schedule s ON uh.Schedule_ScheduleID = s.ScheduleID
        JOIN Session se ON s.Session_SessionID = se.SessionID
        JOIN Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
    ORDER BY u.name, uh.DateCreated
);

SELECT * FROM GetAllUserHistory;