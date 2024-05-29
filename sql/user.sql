-- USER HISTORY Based on UserID
SELECT u.name AS 'User Name', uh.DateCreated AS 'Booking Date', s.ScheduleDate AS 'Scheduled Date', CONCAT(
        se.SessionStart, ' - ', se.SessionEnd
    ) AS 'Session Time', p.Name AS 'Psychologist Name'
FROM
    User u
    LEFT JOIN UserHistory uh ON u.UserID = uh.User_UserID
    LEFT JOIN Schedule s ON uh.Schedule_ScheduleID = s.ScheduleID
    LEFT JOIN Session se ON s.Session_SessionID = se.SessionID
    LEFT JOIN Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
WHERE
    u.UserID = 1
ORDER BY uh.DateCreated;