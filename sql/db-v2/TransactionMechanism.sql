-- Active: 1716893974313@@127.0.0.1@3306@rawat_jalan

SET GLOBAL event_scheduler = ON;
-- WAJIB EKSEKUSI

CREATE EVENT RevokeTransaction
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    DECLARE TimeNow TIMESTAMP;
    SET TimeNow = NOW();

    DELETE uh
    FROM UserHistory uh
    JOIN `Transaction` t ON uh.UserHistoryID = t.UserHistory_UserHistoryID
    WHERE t.IsPayed = FALSE 
    AND TIMESTAMPDIFF(MINUTE, t.DateCreated, TimeNow) >= 5;

END;

CREATE TRIGGER update_schedule_status
AFTER UPDATE ON Transaction
FOR EACH ROW
BEGIN
    IF NEW.IsPayed = TRUE THEN
        UPDATE Schedule
        JOIN UserHistory ON Schedule.UserHistory_UserHistoryID = UserHistory.UserHistoryID
        JOIN Transaction ON UserHistory.UserHistoryID = Transaction.UserHistory_UserHistoryID
        SET Schedule.ScheduleStatus = 'Booked'
        WHERE Transaction.TransactionID = NEW.TransactionID;
    END IF;
END 

CREATE TRIGGER revoke_schedule_status
BEFORE DELETE ON UserHistory
FOR EACH ROW
BEGIN
    UPDATE Schedule
    SET Schedule.ScheduleStatus = 'Available'
    WHERE Schedule.UserHistory_UserHistoryID = OLD.UserHistoryID;
END;

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

    INSERT INTO `Transaction`(Amount, User_UserID, UserHistory_UserHistoryID)
    VALUES(Amount_input, User_UserID_input, setUserHistoryID);

    UPDATE Schedule
    SET UserHistory_UserHistoryID = setUserHistoryID,
        ScheduleStatus = 'Waiting'
    WHERE ScheduleID = ScheduleID_input;

END;

CREATE PROCEDURE UpdateTransactionByUserHistoryID(
    IN p_UserHistoryID INT,
    IN p_PaymentType INT
)
BEGIN
    UPDATE Transaction 
    SET PaymentType = p_PaymentType,
        IsPayed = TRUE
    WHERE UserHistory_UserHistoryID = p_UserHistoryID;
END;


-- Contoh cara pemakaian PROCEDURE, dsb (Ada di API_sql_raw.sql)

CALL InputTransaction(1, 4, 100000.00);

CALL InputTransaction(2, 7, 100000.00);

SELECT * FROM Transaction;

SELECT * FROM UserHistory;

SELECT * FROM Schedule;

CALL UpdateTransactionByUserHistoryID(3,2);
DELETE FROM UserHistory WHERE UserHistoryID = 17;
DELETE FROM UserHistory WHERE UserHistoryID = 14;

