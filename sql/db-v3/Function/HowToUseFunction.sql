SELECT GetTotalRevenue() AS TotalRevenue;
-- Total Pendapatan

SELECT GetTotalPatientsHandled(?) AS TotalPatients;
-- Total Pasien yang di-Handle
-- Parameter = `p_PsychologistID`

SELECT GetBusiestDay() AS BusiestDay;
-- Hari Paling Banyak Transaksi
-- berdasarkan ScheduleStatus = 'Booked'