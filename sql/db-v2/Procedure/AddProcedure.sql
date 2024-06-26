

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
    uh.UserHistoryID,
    s.ScheduleDate,
    se.SessionStart,
    se.SessionEnd
  FROM UserHistory uh
  INNER JOIN Schedule s ON uh.UserHistoryID = s.UserHistory_UserHistoryID
  INNER JOIN Session se ON s.Session_SessionID = se.SessionID
  WHERE uh.User_UserID = userID;
END;

CALL ListUserHistoryByUserLogin(1);
DROP PROCEDURE IF EXISTS `ListUserHistoryByUserLogin`;

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



CALL GetDatesForCurrentWeek();
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

CALL CreateUserHistory(1, 2);

DROP PROCEDURE IF EXISTS `CreateUserHistory`;

CREATE PROCEDURE InputTransaction(
    IN User_UserID_input INT,
    IN ScheduleID_input INT,
    IN Amount_input FLOAT
)
BEGIN

    DECLARE setUserHistoryID INT;

    INSERT INTO UserHistory(User_UserID) 
    VALUES(User_UserID_input);

    SET setUserHistoryID = LAST_INSERT_ID();

    INSERT INTO transactionbill(Amount, User_UserID, UserHistory_UserHistoryID)
    VALUES(Amount_input, User_UserID_input, setUserHistoryID);

    UPDATE Schedule
    SET UserHistory_UserHistoryID = setUserHistoryID,
        ScheduleStatus = 'Waiting'
    WHERE ScheduleID = ScheduleID_input;

END;

CALL InputTransaction(1, 1, 1000000);
DROP PROCEDURE IF EXISTS `InputTransaction`;