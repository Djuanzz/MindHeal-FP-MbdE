-- Active: 1699534311793@@127.0.0.1@3306@rawat_jalan
USE rawat_jalan;

-- INPUT USER
INSERT INTO User (Name, Email, Password) VALUES 
    ('Ziya', 'ziya@gmail.com', 'ziyaaja'),
    ('Yuli', 'yuli@gmail.com', 'yuliaja'),
    ('Yoyo', 'yoyo@gmail.com', 'yoyoaja'),
    ('Julia', 'julia@gmail.com', 'juliaaja'),
    ('Syukri', 'syukri@gmail.com', 'syukriaja'),
    ('Rizky', 'rizky@gmail.com', 'rizkyaja'),
    ('Lili', 'lili@gmail.com', 'liliaja');

SELECT * FROM User;

-- daftaPsikolog
INSERT INTO Psychologist (Name, Email) VALUES 
    ('Dr. John Doe', 'john@gmail.com'),
    ('Dr. Tup', 'tup@gmail.com'),
    ('Dr. Apep', 'apep@gmail.com'),
    ('Dr. Budi', 'budi@gmail.com'),
    ('Dr. Caca', 'caca@gmail.com'),
    ('Dr. Dede', 'dede@gmail.com'),
    ('Dr. Eko', 'eko@gmail.com');

SELECT * FROM Psychologist;

-- SESI JADWAL
INSERT INTO Session (SessionStart, SessionEnd) VALUES 
    ('10:00:00', '11:50:00'),
    ('13:10:00', '15:00:00'),
    ('16:00:00', '17:50:00');

SELECT * FROM Session;

-- PEMBUATAN JADWAL UNTUK PSIKOLOG
INSERT INTO Schedule (ScheduleDate, Psychologist_PsychologistID, Session_SessionID) VALUES 
    ('2024-05-06', 1, 1),
    ('2024-05-06', 2, 2),
    ('2024-05-06', 3, 3),
    ('2024-05-07', 4, 1),
    ('2024-05-07', 5, 2),
    ('2024-05-07', 6, 3),
    ('2024-05-08', 7, 1);

SELECT * FROM Schedule;

-- QUERY SCHDULE TANGAL 2024-05-06 
-- Delimiter to indicate the start and end of the procedure
-- Create the procedure
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

CALL GetSchedulesByDate('2024-05-07');
-- Reset the delimiter

-- DONE


-- INPUT USER HISTORY
INSERT INTO UserHistory (User_UserID, Schedule_ScheduleID) VALUES 
    (1, 4),
    (2, 5);

SELECT * FROM UserHistory;


INSERT INTO Transaction (PaymentType, Amount, User_UserID, UserHistory_UserHistoryID) VALUES 
    (1, 100000, 1, 1),
    (2, 100000, 2, 2);

SELECT * FROM Transaction;

CREATE TRIGGER update_schedule_booked
AFTER INSERT ON UserHistory
FOR EACH ROW
BEGIN
    UPDATE Schedule
    SET Booked = TRUE
    WHERE ScheduleID = NEW.Schedule_ScheduleID;
END

DROP TRIGGER update_schedule_booked;

CREATE TRIGGER update_schedule_booked_on_payment
AFTER UPDATE ON Transaction
FOR EACH ROW
BEGIN
    IF NEW.IsPayed = TRUE THEN
        UPDATE Schedule
        SET Booked = TRUE
        WHERE ScheduleID = (
            SELECT Schedule_ScheduleID
            FROM UserHistory
            WHERE UserHistoryID = NEW.UserHistory_UserHistoryID
        );
    END IF;
END

DROP TRIGGER update_schedule_booked_on_payment;

-- Buat Admin Dashboard (dapetin semua userHistory yang pernah dibuat)
SELECT
    u.name AS 'User Name',
    uh.DateCreated AS 'Booking Date',
    s.ScheduleDate AS 'Scheduled Date',
    CONCAT(se.SessionStart, ' - ', se.SessionEnd) AS 'Session Time',
    p.Name AS 'Psychologist Name'
FROM User u
JOIN UserHistory uh ON u.UserID = uh.User_UserID
JOIN Schedule s ON uh.Schedule_ScheduleID = s.ScheduleID
JOIN Session se ON s.Session_SessionID = se.SessionID
JOIN Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
ORDER BY
    u.name, uh.DateCreated;

CREATE VIEW GetAllUserHistory AS (
    SELECT
        u.name AS 'User Name',
        uh.DateCreated AS 'Booking Date',
        s.ScheduleDate AS 'Scheduled Date',
        CONCAT(se.SessionStart, ' - ', se.SessionEnd) AS 'Session Time',
        p.Name AS 'Psychologist Name'
    FROM User u
    JOIN UserHistory uh ON u.UserID = uh.User_UserID
    JOIN Schedule s ON uh.Schedule_ScheduleID = s.ScheduleID
    JOIN Session se ON s.Session_SessionID = se.SessionID
    JOIN Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
    ORDER BY
        u.name, uh.DateCreated
);

SELECT * FROM GetAllUserHistory;

-- Buat Tiap User
SELECT
    u.name AS 'User Name',
    uh.DateCreated AS 'Booking Date',
    s.ScheduleDate AS 'Scheduled Date',
    CONCAT(se.SessionStart, ' - ', se.SessionEnd) AS 'Session Time',
    p.Name AS 'Psychologist Name'
FROM User u
LEFT JOIN UserHistory uh ON u.UserID = uh.User_UserID
LEFT JOIN Schedule s ON uh.Schedule_ScheduleID = s.ScheduleID
LEFT JOIN Session se ON s.Session_SessionID = se.SessionID
LEFT JOIN Psychologist p ON s.Psychologist_PsychologistID = p.PsychologistID
WHERE u.UserID = 1
ORDER BY uh.DateCreated;

-- Update Payment
UPDATE Transaction
SET IsPayed = TRUE
WHERE TransactionID = 1;

INSERT INTO UserHistory (User_UserID, Schedule_ScheduleID) VALUES 
    (3, 6);
SELECT * FROM UserHistory;
SELECT * FROM Schedule;
INSERT INTO Transaction (IsPayed, PaymentType, Amount, User_UserID, UserHistory_UserHistoryID) VALUES 
    (FALSE, 1, 100000, 3, 3);
SELECT * FROM Transaction;

-- Fucntion Get User History for a user
CREATE FUNCTION TotalTransactionAmountPerMonth(month INT, year INT) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE total_amount FLOAT;

    SELECT SUM(Amount) INTO total_amount
    FROM Transaction
    JOIN UserHistory ON Transaction.UserHistory_UserHistoryID = UserHistory.UserHistoryID
    WHERE MONTH(UserHistory.DateCreated) = month AND YEAR(UserHistory.DateCreated) = year AND Transaction.IsPayed = TRUE;

    RETURN total_amount;
END;

DROP FUNCTION TotalTransactionAmountPerMonth;

SELECT TotalTransactionAmountPerMonth(5, 2024);

SELECT GetUserHistory(1);
SELECT * FROM 

SHOW TABLES;