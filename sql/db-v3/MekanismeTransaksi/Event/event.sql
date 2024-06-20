SET GLOBAL event_scheduler = ON;

CREATE EVENT RevokeTransaction
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    DECLARE TimeNow TIMESTAMP;
    SET TimeNow = NOW();

    DELETE uh
    FROM UserHistory uh
    JOIN `TransactionBill` t ON uh.UserHistoryID = t.UserHistory_UserHistoryID
    WHERE t.IsPayed = FALSE 
    AND TimeDue < TimeNow;
END