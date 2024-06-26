SELECT *FROM `LatestConsultations` WHERE UserID = ?;
-- SELECT *FROM `LatestConsultations` WHERE UserID = 1;
-- Ntr gunanya buat nge return terakhir kali konsultasi tanggal berapa
-- Berdasarkan UserID

SELECT * FROM PsychologistScheduleCount LIMIT ?;
-- SELECT * FROM PsychologistScheduleCount LIMIT 1;
-- Ntr gunanya buat nge return Psychologist yang paling banyak ngurus konsultasi
-- BTW itu LIMIT-ny Opsional ya

SELECT * FROM UserConsultationCount LIMIT 5;