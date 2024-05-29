-- Update Payment
SELECT * FROM Transaction;

SELECT * FROM UserHistory;

SELECT * FROM Schedule;

UPDATE Transaction SET IsPayed = TRUE WHERE TransactionID = 1;

INSERT INTO
    UserHistory (
        User_UserID,
        Schedule_ScheduleID
    )
VALUES (3, 6);

INSERT INTO UserHistory(User_UserID, Schedule_ScheduleID) 
VALUES (1, 3);

SELECT * FROM UserHistory;

SELECT * FROM Schedule;

INSERT INTO
    Transaction (
        IsPayed,
        PaymentType,
        Amount,
        User_UserID,
        UserHistory_UserHistoryID
    )
VALUES (FALSE, 1, 100000, 3, 3);

SELECT * FROM Transaction;

INSERT INTO
    UserHistory (
        User_UserID,
        Schedule_ScheduleID
    )
VALUES (7, 1);

SELECT * FROM UserHistory

SELECT * FROM Schedule;

INSERT INTO
    Transaction (
        IsPayed,
        PaymentType,
        Amount,
        User_UserID,
        UserHistory_UserHistoryID
    )
VALUES (FALSE, 2, 100000, 7, 4);

SELECT * FROM Transaction;

SELECT * FROM Schedule;

UPDATE Transaction SET IsPayed = TRUE WHERE TransactionID = 3;