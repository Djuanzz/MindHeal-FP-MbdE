

CREATE PROCEDURE InsertScheduleForCurrentWeek()
BEGIN
    -- Define the start date of the current week (Monday)
    SET @startOfWeek = DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY);

    -- Insert schedule entries for the current week
    INSERT INTO Schedule (ScheduleDate, Psychologist_PsychologistID, Session_SessionID) VALUES 
        (@startOfWeek, 1, 1),
        (@startOfWeek, 2, 2),
        (@startOfWeek, 3, 3),
        (DATE_ADD(@startOfWeek, INTERVAL 1 DAY), 4, 1),
        (DATE_ADD(@startOfWeek, INTERVAL 1 DAY), 5, 2),
        (DATE_ADD(@startOfWeek, INTERVAL 1 DAY), 6, 3),
        (DATE_ADD(@startOfWeek, INTERVAL 2 DAY), 7, 1);
END;
-- BIAR gausah ribet2 klo ngetest
-- Basically, biar klo udh ganti minggu selanjutnya langsung insert ini aja lgsung
-- Klo bingung TANYA YOO :D
CALL InsertScheduleForCurrentWeek();


CREATE PROCEDURE ListUserHistoryByUserLogin(IN userID INT)
BEGIN
    SELECT
        UserHistory.UserHistoryID,
        Schedule.ScheduleDate,
        Psychologist.Name AS PsychologistName,
        Session.SessionStart,
        Session.SessionEnd
    FROM
        UserHistory
    JOIN
        Schedule ON UserHistory.UserHistoryID = Schedule.UserHistory_UserHistoryID
    JOIN
        Psychologist ON Schedule.Psychologist_PsychologistID = Psychologist.PsychologistID
    JOIN
        Session ON Schedule.Session_SessionID = Session.SessionID
    WHERE
        UserHistory.User_UserID = userID;
END;

CALL ListUserHistoryByUserLogin(1);

CREATE PROCEDURE GetScheduleForCurrentWeek()
BEGIN
    SELECT DISTINCT
        s.ScheduleDate,
        DAYNAME(s.ScheduleDate) AS DayName
    FROM
        Schedule s
    WHERE
        s.ScheduleDate BETWEEN
            DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY)
            AND DATE_ADD(DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY), INTERVAL 5 DAY)
    ORDER BY
        s.ScheduleDate;
END;

CALL GetScheduleForCurrentWeek();

CREATE PROCEDURE GetPsychologistSchedule(IN requestedDate DATE)
BEGIN
    SELECT 
        p.Name AS PsychologistName, 
        s.SessionStart, 
        s.SessionEnd,
        sch.ScheduleDate
    FROM 
        Psychologist p
    JOIN 
        Schedule sch ON p.PsychologistID = sch.Psychologist_PsychologistID
    JOIN 
        Session s ON sch.Session_SessionID = s.SessionID
    WHERE 
        sch.ScheduleDate = requestedDate;
END;

CALL GetPsychologistSchedule('2024-06-04');


-- user buat update profile

-- psikolog buat update apa gatau


