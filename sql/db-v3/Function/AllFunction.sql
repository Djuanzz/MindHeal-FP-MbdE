-- Mendapatkan Total Income(Revenue)
CREATE FUNCTION GetTotalRevenue()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalRevenue DECIMAL(10, 2);

    SELECT SUM(Amount) INTO totalRevenue
    FROM TransactionBill
    WHERE IsPayed = TRUE;

    RETURN totalRevenue;
END;


-- Mendapatkan Total Patients yang telah di-Handle
-- Berdasarkan PsyhchologistID
CREATE FUNCTION GetTotalPatientsHandled(p_PsychologistID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalPatients INT;

    SELECT COUNT(DISTINCT uh.User_UserID) INTO totalPatients
    FROM Schedule s
    JOIN UserHistory uh ON s.UserHistory_UserHistoryID = uh.UserHistoryID
    WHERE s.Psychologist_PsychologistID = p_PsychologistID;

    RETURN totalPatients;
END;


-- Mendapatkan Busiest Day
-- Hari Tersibuk
CREATE FUNCTION GetBusiestDay()
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE busiestDay DATE;

    SELECT ScheduleDate INTO busiestDay
    FROM Schedule
    WHERE ScheduleStatus = 'Booked'
    GROUP BY ScheduleDate
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    RETURN busiestDay;
END;

-- Mendapatkan User Consultation Count
CREATE FUNCTION GetUserConsultationCount(p_UserID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE consultationCount INT;

    SELECT 
        COUNT(s.ScheduleID) INTO consultationCount
    FROM 
        Users u
    JOIN 
        UserHistory uh ON u.UserID = uh.User_UserID
    JOIN 
        Schedule s ON uh.UserHistoryID = s.UserHistory_UserHistoryID
    WHERE 
        u.UserID = p_UserID
        AND s.ScheduleStatus = 'Booked';

    RETURN consultationCount;
END;



-- REVENUE PER MONTH
CREATE FUNCTION GetMonthlyRevenue(year_input INT, month_input INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE monthlyRevenue DECIMAL(10, 2);

    SELECT COALESCE(SUM(tb.Amount), 0) INTO monthlyRevenue
    FROM TransactionBill tb
    JOIN UserHistory uh ON tb.UserHistory_UserHistoryID = uh.UserHistoryID
    JOIN Schedule s ON uh.UserHistoryID = s.UserHistory_UserHistoryID
    WHERE tb.IsPayed = TRUE
    AND YEAR(s.ScheduleDate) = year_input
    AND MONTH(s.ScheduleDate) = month_input;

    RETURN monthlyRevenue;
END;

DROP FUNCTION IF EXISTS GetMonthlyRevenue;

SELECT GetMonthlyRevenue(2024, 6) AS JuneRevenue;


