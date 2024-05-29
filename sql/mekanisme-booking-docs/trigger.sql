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
    (2, 5);

SELECT * FROM UserHistory;

INSERT INTO
    Transaction (
        PaymentType,
        Amount,
        User_UserID,
        UserHistory_UserHistoryID
    )
VALUES (1, 100000, 1, 1),
    (2, 100000, 2, 2);

SELECT * FROM Transaction;

SELECT * FROM Schedule;

INSERT INTO UserHistory(User_UserID, Schedule_ScheduleID) VALUES (1, 4)