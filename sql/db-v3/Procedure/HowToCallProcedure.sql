-- UNTUK ...
CALL InsertScheduleForCurrentWeek();

-- UNTUK MENAMPILKAN USER HISTORY BERDASARKAN USER LOGIN / USER ID
CALL ListUserHistoryByUserLogin(1);

-- UNTUK MENDAPATKAN TANGGAL PADA MINGGU SAAT INI 
CALL GetDatesForCurrentWeek();

-- UNTUK MEMBUAT USER HISTORY SECARA MANUAL TANPA INSERT TRANSAKSI
CALL CreateUserHistory(1, 2);

-- UNTUK MENDAPATKAN JADWAL PSIKOLOG BERDASARKAN TANGGAL
CALL GetPsychologistSchedule('2024-06-04');

-- UNTUK MENAMBAHKAN DIAGNOSIS KE USER HISTORY BERDASARKAN ID USER HISTORY
-- CALL InsertUserDiagnosis(?, ?, ?, ?, ?, ?, ?, ?);
CALL InsertUserDiagnosis(2, 'Autism', 'active', 'moderate', 'SAKIT', 'SEHATIN DIRI SENDIRI', '2024-06-24', 'Additional notes');
-- Parameter

CALL GetTransactionDetails();
-- Procedure terbaru nihhh monggo