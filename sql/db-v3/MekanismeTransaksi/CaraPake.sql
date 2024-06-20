CALL `InputTransaction`(?, ?, ?);
-- InputTransaction( User_UserID INT, ScheduleID INT, Amount DECIMAL(10,2))
-- Procedure yang digunakan untuk:
-- 1. UserHistory (INSERT INTO)
-- 2. Transaction (INSERT INTO)
-- 3. Schedule (UPDATE)
-- Meng-INIT semua tabel yang dibutuhkan untuk melakukan transaksi
-- Pada proses ini juga perlu diperhatikan bahwa apabila sudah lewat 5 menit:
-- ScheduleStatus = 'Waiting' -> ScheduleStatus = 'Available'
-- Dan UserHistory yang berhubungan akan dihapus
-- Hal tersebut dapat terjadi dikarenakan EVENT

CALL `UpdateTransactionByUserHistoryID`(?, ?);
-- UpdateTransactionByUserHistoryID(UserHistoryID INT, PaymentType VARCHAR(50))
-- Procedure yang digunakan untuk UPDATE Transaction dimana:
-- 1. IsPayed = TRUE
-- 2. PaymentType = ?
-- Digunakan untuk men-CONFIRM apakah user telah melakukan transaksi
-- Apabila sudah, maka TRIGGER akan meng-update ScheduleStatus
-- dari ScheduleStatus = 'Waiting' menjadi ScheduleStatus = 'Booked'

DELETE FROM UserHistory WHERE UserHistoryID = ?;
-- Menghapus UserHistory berdasarkan UserHistoryID
-- Digunakan apabila user ingin MEMBATALKAN transaksi