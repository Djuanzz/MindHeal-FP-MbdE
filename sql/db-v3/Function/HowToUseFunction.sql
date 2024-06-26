SELECT GetTotalRevenue() AS TotalRevenue;
-- Total Pendapatan

SELECT GetTotalPatientsHandled(2) AS TotalPatients;
-- Total Pasien yang di-Handle
-- Parameter = `p_PsychologistID`

SELECT GetBusiestDay() AS BusiestDay;
-- Hari Paling Banyak Transaksi
-- berdasarkan ScheduleStatus = 'Booked'

SELECT GetMonthlyRevenue(?, ?);
--SELECT GetMonthlyRevenue(2024, 5);
-- Pendapatan Bulanan


SELECT GetUserConsultationCount(?) AS ConsultationCount;
-- SELECT GetUserConsultationCount(2) AS ConsultationCount;
-- Total Konsultasi per User berdasarkan UserID

SELECT 
    COUNT(*) AS TotalSchedules
FROM 
    Schedule
WHERE 
    YEAR(ScheduleDate) = 2024
    AND MONTH(ScheduleDate) = 6;