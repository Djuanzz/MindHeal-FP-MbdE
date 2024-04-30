USE perspective;

SHOW TABLES;

-- DROP FUNCTION
DROP FUNCTION countPsiAtOffice;
DROP FUNCTION getPsiSchedule;

-- RUN FUNCTION
SELECT offices.name, countPsiAtOffice(offices.office_id) AS jumlah_psikolog FROM offices;

SELECT psychologists.name, getPsiSchedule(psychologists.psychologist_id) AS jadwal_psikolog FROM psychologists;

-- CREATE FUNCTION
CREATE FUNCTION `countPsiAtOffice`(office_id VARCHAR(191)) 
    RETURNS INT DETERMINISTIC
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM psychologists AS Psi WHERE Psi.office_id = office_id;
    RETURN count;
END;

-- CREATE PROCEDURE
CREATE PROCEDURE getPsychologistSchedule(IN psychologist_id VARCHAR(191))
BEGIN
    SELECT psychologists.name AS psychologist_name, schedules.*
    FROM psychologists 
    JOIN schedules ON psychologists.psychologist_id = schedules.psychologist_id
    WHERE psychologists.psychologist_id = psychologist_id;
END

-- RUN PROCEDURE
CALL getPsychologistSchedule('4');

-- DROP PROCEDURE
DROP PROCEDURE `getPsychologistSchedule`;
