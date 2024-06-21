-- HALO GES SEMANGAT YA GES
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

CREATE PROCEDURE ListUserHistoryByUserLogin(IN userID INT)
BEGIN
  SELECT
    uh.UserHistoryID,
    s.ScheduleDate,
    se.SessionStart,
    se.SessionEnd
  FROM UserHistory uh
  INNER JOIN Schedule s ON uh.UserHistoryID = s.UserHistory_UserHistoryID
  INNER JOIN Session se ON s.Session_SessionID = se.SessionID
  WHERE uh.User_UserID = userID;
END;

DROP PROCEDURE IF EXISTS `ListUserHistoryByUserLogin`;

CREATE PROCEDURE GetPsychologistSchedule(IN requestedDate DATE)
BEGIN
    SELECT 
        sch.ScheduleID,
        sch.`ScheduleStatus`,
        p.Name AS PsychologistName, 
        p.`VisitPrice` as Price,
        s.SessionStart, 
        s.SessionEnd,
        sch.ScheduleDate,
        loc.LocationID,
        loc.Name as LocationName
    FROM 
        Psychologist p
    JOIN 
        Schedule sch ON p.PsychologistID = sch.Psychologist_PsychologistID
    JOIN 
        Session s ON sch.Session_SessionID = s.SessionID
    JOIN
        Locations loc ON p.Location_LocationID = loc.LocationID
    WHERE 
        sch.ScheduleDate = requestedDate;
END;

DROP PROCEDURE IF EXISTS `GetPsychologistSchedule`;

CREATE PROCEDURE GetDatesForCurrentWeek()
BEGIN
    DECLARE startOfWeek DATE;
    SET startOfWeek = DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY);

    SELECT 
        startOfWeek AS ScheduleDate,
        DAYNAME(startOfWeek) AS DayName
    UNION ALL
    SELECT 
        DATE_ADD(startOfWeek, INTERVAL 1 DAY),
        DAYNAME(DATE_ADD(startOfWeek, INTERVAL 1 DAY))
    UNION ALL
    SELECT 
        DATE_ADD(startOfWeek, INTERVAL 2 DAY),
        DAYNAME(DATE_ADD(startOfWeek, INTERVAL 2 DAY))
    UNION ALL
    SELECT 
        DATE_ADD(startOfWeek, INTERVAL 3 DAY),
        DAYNAME(DATE_ADD(startOfWeek, INTERVAL 3 DAY))
    UNION ALL
    SELECT 
        DATE_ADD(startOfWeek, INTERVAL 4 DAY),
        DAYNAME(DATE_ADD(startOfWeek, INTERVAL 4 DAY))
    UNION ALL
    SELECT 
        DATE_ADD(startOfWeek, INTERVAL 5 DAY),
        DAYNAME(DATE_ADD(startOfWeek, INTERVAL 5 DAY));
END;

DROP PROCEDURE IF EXISTS `GetDatesForCurrentWeek`

CREATE PROCEDURE CreateUserHistory(IN userID INT, IN scheduleID INT)
BEGIN
  DECLARE newHistoryID INT;

  INSERT INTO UserHistory (User_UserID) VALUES (userID);
  SET newHistoryID = LAST_INSERT_ID(); 

  UPDATE Schedule s
  SET s.UserHistory_UserHistoryID = newHistoryID,
      s.ScheduleStatus = 'Booked'
  WHERE s.ScheduleID = scheduleID;

END;

DROP PROCEDURE IF EXISTS `CreateUserHistory`;

CREATE PROCEDURE GetAllPsychologistsSchedules()
BEGIN
    SELECT 
        sch.ScheduleID,
        p.Name AS PsychologistName, 
        sch.ScheduleStatus,
        s.SessionStart, 
        s.SessionEnd,
        sch.ScheduleDate,
        loc.LocationID,
        loc.Name as LocationName
    FROM 
        Psychologist p
    JOIN 
        Schedule sch ON p.PsychologistID = sch.Psychologist_PsychologistID
    JOIN 
        Session s ON sch.Session_SessionID = s.SessionID
    JOIN 
        Locations loc ON p.Location_LocationID = loc.LocationID
    ORDER BY sch.ScheduleDate DESC;
END;

DROP PROCEDURE IF EXISTS `GetAllPsychologistsSchedules`;

SELECT u.Name, s.`ScheduleDate`, l.`Name`, p.`Name` FROM UserHistory uh
JOIN Users u ON uh.User_UserID = u.UserID
JOIN Schedule s ON uh.UserHistoryID = s.UserHistory_UserHistoryID
JOIN Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
JOIN Locations l ON p.Location_LocationID = l.LocationID
-- JOIN UserDiagnosis ud ON uh.UserHistoryID = ud.UserHistory_UserHistoryID
WHERE uh.`UserHistoryID` = 3;

CREATE PROCEDURE GetDetailedUserHistoryByUserHistoryID(IN userHistoryID INT)
BEGIN
    SELECT 
        u.Name AS UserName,
        uh.UserHistoryID,
        s.ScheduleID,
        s.ScheduleDate,
        s.ScheduleStatus,
        p.Name AS PsychologistName,
        se.SessionStart,
        se.SessionEnd,
        l.Name AS LocationName
    FROM 
        UserHistory uh
    JOIN 
        Users u ON uh.User_UserID = u.UserID
    JOIN 
        Schedule s ON uh.UserHistoryID = s.UserHistory_UserHistoryID
    JOIN 
        Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
    JOIN 
        Session se ON s.Session_SessionID = se.SessionID
    JOIN 
        Locations l ON p.Location_LocationID = l.LocationID
    WHERE 
        uh.UserHistoryID = userHistoryID;
END;

CALL GetDetailedUserHistoryByUserHistoryID(3);

DROP PROCEDURE IF EXISTS `GetDetailedUserHistoryByUserHistoryID`;