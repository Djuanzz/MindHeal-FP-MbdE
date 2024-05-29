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

SELECT TotalTransactionAmountPerMonth (5, 2024);

DROP FUNCTION TotalTransactionAmountPerMonth;