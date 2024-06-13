CREATE PROCEDURE InsertUser(IN name VARCHAR(255), email VARCHAR(255), password VARCHAR(255), dateOfBirth DATE, address VARCHAR(50), city VARCHAR(50), mobile VARCHAR(50))
BEGIN
    INSERT INTO Users (Name, Email, Password, DateOfBirth, Address, City, Mobile) VALUES (name, email, password, dateOfBirth, address, city, mobile);
END;