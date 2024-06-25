SELECT * FROM PsychologistUserDiagnosisView WHERE `UHistoryID` = 2;
SELECT * FROM PsychologistUserDiagnosisView WHERE `PsychologistName` = "Dr. Jane Smith";
SELECT * FROM PsychologistUserDiagnosisView WHERE `PsychologistID` = 2;
-- Untuk query menggunakan VIEW
-- Biar tahu pyschologist dan UserDiagnosis



SELECT * FROM UserFavoriteLocation WHERE UserID = ? LIMIT 1;
-- SELECT * FROM UserFavoriteLocation WHERE UserID = 3 LIMIT 1;
-- VIEW BUAT USER FAVORITE LOCATION yoww


SELECT * FROM UserPsychologistVisitCount WHERE UserID = ?;
-- SELECT * FROM UserPsychologistVisitCount WHERE UserID = 1;
-- VIEW BUAT USER PSYCHOLOGIST VISIT COUNT