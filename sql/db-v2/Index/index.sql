-- Active: 1716893974313@@127.0.0.1@3306@rawat_jalan


SHOW INDEXES FROM User;
SELECT *FROM `User`;

CREATE INDEX user_email_idx
ON User(email);

SELECT * FROM `User` WHERE name LIKE 'L%'

SELECT * FROM User WHERE `UserID` = 244;

SELECT * FROM `User` WHERE email = 'warnahijau243@gmail.com';

EXPLAIN SELECT * FROM `User` WHERE email = 'warnahijau243@gmail.com';

ALTER TABLE `User` DROP INDEX user_email_idx;