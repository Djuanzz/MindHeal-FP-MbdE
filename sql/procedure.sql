-- Implementation Of Procedure

CREATE PROCEDURE GetSchedulesByDate(IN givenDate DATE)
BEGIN
    SELECT
        Schedule.ScheduleID,
        Schedule.ScheduleDate,
        Psychologist.Name,
        Psychologist.Email,
        Session.SessionStart,
        Session.SessionEnd
    FROM
        Schedule
    JOIN
        Psychologist ON Schedule.Psychologist_PsychologistID = Psychologist.PsychologistID
    JOIN
        Session ON Schedule.Session_SessionID = Session.SessionID
    WHERE
        Schedule.ScheduleDate = givenDate;
END

CALL GetSchedulesByDate ('2024-05-07');
CALL GetSchedulesByDate ('2024-05-06');

-- CREATE PROCEDURE GetScheduleForCurrentWeek()
-- BEGIN
--     SELECT
--       s.ScheduleDate,
--       DAYNAME(s.ScheduleDate) AS DayName
--     FROM
--       schedule s
--     WHERE
--       s.ScheduleDate BETWEEN
--         DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY)
--         AND DATE_ADD(DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY), INTERVAL 5 DAY)
--     ORDER BY
--       s.ScheduleDate;
-- END 

CREATE PROCEDURE GetScheduleForCurrentWeek()
BEGIN
    SELECT DISTINCT
        s.ScheduleDate,
        DAYNAME(s.ScheduleDate) AS DayName
    FROM
        schedule s
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
    SELECT p.Name AS PsychologistName, 
            s.SessionStart, 
            s.SessionEnd,
            sch.ScheduleDate
    FROM Psychologist p
    JOIN Schedule sch ON p.PsychologistID = sch.Psychologist_PsychologistID
    JOIN Session s ON sch.Session_SessionID = s.SessionID
    WHERE sch.ScheduleDate = requestedDate;
END 

CALL GetPsychologistSchedule('2024-05-28');

CREATE PROCEDURE ListUserHistoryByUserLogin(IN userID INT)
BEGIN
    SELECT
        UserHistory.UserHistoryID,
        Schedule.ScheduleDate,
        Psychologist.Name,
        Session.SessionStart,
        Session.SessionEnd
    FROM UserHistory
    JOIN Schedule ON UserHistory.Schedule_ScheduleID = Schedule.ScheduleID
    JOIN Psychologist ON Schedule.Psychologist_PsychologistID = Psychologist.PsychologistID
    JOIN Session ON Schedule.Session_SessionID = Session.SessionID
    WHERE UserHistory.User_UserID = userID;
END;

CALL ListUserHistoryByUserLogin(1);
