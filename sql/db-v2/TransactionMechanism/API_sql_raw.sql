-- Active: 1716893974313@@127.0.0.1@3306@rawat_jalan

CALL InputTransaction(?, ?, ?);
-- InputTransaction( User_UserID INT, ScheduleID INT, Amount FLOAT)
-- Procedure yang digunakan untuk:
-- 1. UserHistory (INSERT INTO)
-- 2. Transaction (INSERT INTO)
-- 3. Schedule (UPDATE)
-- Meng-INIT semua tabel yang dibutuhkah untuk melakukan transaksi
-- Pada proses ini juga perlu diperhatikan bahwa apabila sudah lewat 5 menit:
-- ScheduleStatus = 'Waiting' -> ScheduleStatus = 'Available'
-- Dan UserHistory yang berhubungan akan dihapus

CALL UpdateTransactionByUserHistoryID(?, ?);
-- UpdateTransactionByUserHistoryID(UserHistoryID INT, PaymentType INT)
-- Procedure yang digunakan untuk UPDATE Transaction dimana:
-- 1. IsPayed = TRUE
-- 2. PaymentType = ?
-- Digunakan untuk men-CONFIRM apakah user telah melakukan transaksi
-- Apabila sudah, maka TRIGGER akan meng-update ScheduleStatus
-- dari ScheduleStatus = 'Waiting' menjadi ScheduleStatus = 'Booked'

DELETE FROM UserHistory WHERE UserHistoryID = ?;
-- Menghapus UserHistory berdasarkan UserHistoryID
-- Digunakan apabila user ingin MEMBATALKAN transaksi
