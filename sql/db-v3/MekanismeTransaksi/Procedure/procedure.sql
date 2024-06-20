CREATE PROCEDURE InputTransaction(
    IN User_UserID_input INT,
    IN ScheduleID_input INT,
    IN Amount_input DECIMAL(10,2)
)
BEGIN 

    DECLARE setUserHistoryID INT;

    INSERT INTO `UserHistory`(User_UserID)
    VALUES(User_UserID_input);

    SET setUserHistoryID = LAST_INSERT_ID();

    INSERT INTO TransactionBill(Amount, TimeDue, UserHistory_UserHistoryID)
    VALUES(Amount_input, NOW()+INTERVAL 5 MINUTE, setUserHistoryID);

    UPDATE `Schedule`
    SET `UserHistory_UserHistoryID` = setUserHistoryID,
    `ScheduleStatus` = 'Waiting'
    WHERE `ScheduleID` = ScheduleID_input;

END;

CREATE PROCEDURE UpdateTransactionByUserHistoryID(
    IN p_UserHistoryID INT,
    IN p_PaymentType VARCHAR(255)
)
BEGIN
    UPDATE `TransactionBill` 
    SET PaymentType = p_PaymentType,
        IsPayed = TRUE
    WHERE UserHistory_UserHistoryID = p_UserHistoryID;
END;
