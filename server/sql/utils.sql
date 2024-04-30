USE perspective;

SHOW TABLES;

-- DROP FUNCTION
DROP FUNCTION countPsiAtOffice;

-- RUN FUNCTION
SELECT offices.address, countPsiAtOffice(offices.office_id) FROM offices;

-- CREATE FUNCTION
CREATE FUNCTION `countPsiAtOffice`(office_id VARCHAR(191)) 
    RETURNS INT DETERMINISTIC
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM psychologists AS Psi WHERE Psi.office_id = office_id;
    RETURN count;
END;


