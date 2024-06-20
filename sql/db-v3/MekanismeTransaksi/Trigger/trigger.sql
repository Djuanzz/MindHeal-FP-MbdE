CREATE TRIGGER update_schedule_status
AFTER UPDATE ON `TransactionBill`
FOR EACH ROW
BEGIN
    IF NEW.IsPayed = TRUE THEN
        UPDATE Schedule
        JOIN UserHistory ON Schedule.UserHistory_UserHistoryID = UserHistory.UserHistoryID
        JOIN `TransactionBill` ON UserHistory.UserHistoryID = `TransactionBill`.UserHistory_UserHistoryID
        SET Schedule.ScheduleStatus = 'Booked'
        WHERE `TransactionBill`.TransactionBillID = NEW.TransactionBillID;
    END IF;
END

CREATE TRIGGER revoke_schedule_status
BEFORE DELETE ON UserHistory
FOR EACH ROW
BEGIN
    UPDATE Schedule
    JOIN UserHistory ON Schedule.UserHistory_UserHistoryID = UserHistory.UserHistoryID
    SET Schedule.ScheduleStatus = 'Available'
    WHERE UserHistory.UserHistoryID = OLD.UserHistoryID;
END