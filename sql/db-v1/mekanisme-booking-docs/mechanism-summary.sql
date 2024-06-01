INSERT INTO
    UserHistory (
        User_UserID,
        Schedule_ScheduleID
    )
VALUES (7, 9);

INSERT INTO
    Transaction (
        PaymentType,
        Amount,
        User_UserID,
        UserHistory_UserHistoryID
    )
VALUES (2, 100000, 7, 9);

UPDATE Transaction SET IsPayed = TRUE WHERE TransactionID = 11;

SELECT * FROM Transaction;

SELECT * FROM User;

SELECT * FROM UserHistory;
SELECT * FROM Schedule;


