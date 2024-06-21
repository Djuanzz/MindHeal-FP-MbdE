CREATE PROCEDURE InputTransaction(
    IN User_UserID_input INT,
    IN ScheduleID_input INT,
    IN Amount_input DECIMAL(10,2),
    OUT Created_UserHistoryID INT -- Tambah Line Ini
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

    SET Created_UserHistoryID = setUserHistoryID;
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

DROP PROCEDURE IF EXISTS InputTransaction;
DROP PROCEDURE IF EXISTS UpdateTransactionByUserHistoryID;