-- IMPLEMENTATION OF TRIGGERS
-- THE "INSERT INTO" IS FOR TESTING ONLY

DROP TRIGGER update_schedule_booked;

DROP TRIGGER update_schedule_booked_on_payment;

CREATE TRIGGER update_schedule_booked
AFTER INSERT ON UserHistory
FOR EACH ROW
BEGIN
    UPDATE Schedule
    SET Booked = TRUE
    WHERE ScheduleID = NEW.Schedule_ScheduleID;
END

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

INSERT INTO
    UserHistory (
        User_UserID,
        Schedule_ScheduleID
    )
VALUES (1, 4),
    (2, 7);

SELECT * FROM UserHistory;

SELECT *FROM Schedule;

SELECT *FROM Session;

INSERT INTO
    Transaction (
        PaymentType,
        Amount,
        User_UserID,
        UserHistory_UserHistoryID
    )
VALUES (1, 100000, 1, 1),
    (2, 100000, 2, 7);

SELECT * FROM Transaction;

SELECT * FROM Schedule;

INSERT INTO UserHistory(User_UserID, Schedule_ScheduleID) VALUES (1, 4)

INSERT INTO
    Transaction (
        PaymentType,
        Amount,
        User_UserID,
        UserHistory_UserHistoryID
    )
VALUES (2, 100000, 4, 9);

UPDATE Transaction SET IsPayed = TRUE WHERE TransactionID = 7;
INSERT INTO
    UserHistory (
        User_UserID,
        Schedule_ScheduleID
    )
VALUES (4, 8);




CREATE TRIGGER update_status
BEFORE UPDATE ON Schedule
FOR EACH ROW
BEGIN
    DECLARE current_time TIMESTAMP;
    DECLARE waiting_time TIMESTAMP;
    
    -- Get the current time
    SET current_time = NOW();
    
    -- Check if the session is booked and marked as waiting
    IF OLD.Booked = FALSE AND NEW.Booked = TRUE THEN
        -- Mark the session as waiting
        SET NEW.inWaiting = TRUE;
    END IF;

    -- Check if the session is still in waiting state after 5 minutes
    IF OLD.inWaiting = TRUE AND NEW.inWaiting = TRUE THEN
        -- Get the waiting time from the NEW row
        SET waiting_time = NEW.ScheduleDate; -- Assuming there's a column named ScheduleDate
        
        -- Check if 5 minutes have passed
        IF TIMEDIFF(current_time, waiting_time) >= '00:05:00' THEN
            -- Check if the transaction is paid
            DECLARE isPaid BOOLEAN;
            SELECT IsPayed INTO isPaid FROM Transaction WHERE UserHistory_UserHistoryID = NEW.UserHistory_UserHistoryID;
            
            -- Update the status based on payment status
            IF isPaid = TRUE THEN
                SET NEW.Status = 'confirmed';
                SET NEW.Booked = TRUE; -- Set Booked to TRUE if status is confirmed
            ELSE
                SET NEW.Status = 'revoked';
            END IF;
        END IF;
    END IF;
END;








