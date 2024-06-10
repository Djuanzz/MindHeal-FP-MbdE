INSERT INTO Users (Name, Email, Password, DateOfBirth, Address, City, Mobile) VALUES
('John Doe', 'john.doe@example.com', 'password123', '1990-05-15', '123 Main St', 'Anytown', '5555555555'),
('Jane Smith', 'jane.smith@example.com', 'qwerty', '1985-11-22', '456 Oak Rd', 'Someville', '5555555556'),
('Bob Johnson', 'bob.johnson@example.com', 'letmein', '1978-03-01', '789 Maple Ave', 'Mytown', '5555555557'),
('Samantha Lee', 'samantha.lee@example.com', 'secure123', '1992-09-18', '246 Pine St', 'Yourtown', '5555555558'),
('Michael Brown', 'michael.brown@example.com', 'password!@#', '1987-07-03', '135 Elm Rd', 'Ourtown', '5555555559'),
('Emily Davis', 'emily.davis@example.com', 'qazwsx', '1995-02-28', '864 Cedar Ave', 'Mytown', '5555555560'),
('David Wilson', 'david.wilson@example.com', 'password123!', '1982-10-12', '753 Birch St', 'Yourtown', '5555555561'),
('Sophia Martinez', 'sophia.martinez@example.com', 'letmein123', '1990-06-25', '159 Walnut Rd', 'Anytown', '5555555562'),
('Christopher Garcia', 'christopher.garcia@example.com', 'securepass', '1988-04-09', '753 Oak Ave', 'Someville', '5555555563'),
('Olivia Rodriguez', 'olivia.rodriguez@example.com', 'password123!@#', '1993-12-31', '246 Maple St', 'Ourtown', '5555555564'),
('Andi Wibowo', 'andi.wibowo@example.com', 'password123', '1985-08-12', 'Jl. Sudirman No. 10', 'Jakarta', '081234567890'),
('Budi Santoso', 'budi.santoso@example.com', 'qwerty123', '1992-03-25', 'Jl. Gatot Subroto No. 5', 'Bandung', '082345678901'),
('Citra Rahmawati', 'citra.rahmawati@example.com', 'password456', '1988-11-07', 'Jl. Diponegoro No. 3', 'Semarang', '083456789012'),
('Dani Permana', 'dani.permana@example.com', 'letmein123', '1995-06-18', 'Jl. Sultan Agung No. 8', 'Surabaya', '084567890123'),
('Eka Wijaya', 'eka.wijaya@example.com', 'secure456', '1990-09-30', 'Jl. Pangeran Antasari No. 2', 'Medan', '085678901234'),
('Fina Kurniawan', 'fina.kurniawan@example.com', 'password789', '1987-02-14', 'Jl. Sriwijaya No. 15', 'Palembang', '086789012345'),
('Gina Susanti', 'gina.susanti@example.com', 'qwerty456', '1993-07-22', 'Jl. Laksda Adisucipto No. 7', 'Yogyakarta', '087890123456'),
('Hendra Wijaya', 'hendra.wijaya@example.com', 'letmein456', '1989-12-05', 'Jl. Veteran No. 12', 'Makassar', '088901234567'),
('Indah Pratiwi', 'indah.pratiwi@example.com', 'secure789', '1994-04-11', 'Jl. Tanjung Duren No. 9', 'Denpasar', '089012345678'),
('Joko Wibisono', 'joko.wibisono@example.com', 'password123', '1986-10-28', 'Jl. Sutoyo No. 6', 'Malang', '081123456789'),
('Kartika Dewi', 'kartika.dewi@example.com', 'qwerty789', '1991-05-16', 'Jl. Sisingamangaraja No. 13', 'Balikpapan', '082234567890'),
('Lenny Susanti', 'lenny.susanti@example.com', 'letmein789', '1997-09-03', 'Jl. Kusuma Bangsa No. 4', 'Pekanbaru', '083345678901'),
('Muhammad Rizki', 'muhammad.rizki@example.com', 'secure123', '1984-12-20', 'Jl. Sultan Iskandar Muda No. 11', 'Banjarmasin', '084456789012'),
('Nadia Permata', 'nadia.permata@example.com', 'password456', '1998-08-07', 'Jl. Gubernur Soebardjo No. 18', 'Palangka Raya', '085567890123'),
('Ovi Purwanto', 'ovi.purwanto@example.com', 'qwerty123', '1983-03-31', 'Jl. Panglima Sudirman No. 21', 'Samarinda', '086678901234'),
('Putri Rahmawati', 'putri.rahmawati@example.com', 'letmein456', '1996-11-15', 'Jl. Arifin Ahmad No. 16', 'Pontianak', '087789012345'),
('Raka Susanto', 'raka.susanto@example.com', 'secure789', '1990-07-08', 'Jl. Jenderal Sudirman No. 19', 'Bandar Lampung', '088890123456'),
('Siska Wijayanti', 'siska.wijayanti@example.com', 'password123', '1989-02-23', 'Jl. Raya Bogor No. 14', 'Bekasi', '089901234567'),
('Tono Prasetyo', 'tono.prasetyo@example.com', 'qwerty456', '1995-10-06', 'Jl. Veteran No. 17', 'Depok', '081012345678'),
('Umi Kartika', 'umi.kartika@example.com', 'letmein789', '1992-04-29', 'Jl. Pangeran Diponegoro No. 22', 'Tangerang', '082123456789');

INSERT INTO `Session` (SessionStart, SessionEnd) VALUES 
    ('10:00:00', '11:50:00'),
    ('13:10:00', '15:00:00'),
    ('16:00:00', '17:50:00');

INSERT INTO Locations (Name, Address, City, Phone) VALUES
('RSU Nasional Dr. Cipto Mangunkusumo', 'Jl. Diponegoro No.71', 'Jakarta', '021-3153081'),
('RSU Persahabatan', 'Jl. Persahabatan Raya No.1', 'Jakarta', '021-6391719'),
('RSU Sanglah', 'Jl. Diponegoro', 'Denpasar', '0361-227911'),
('RSU Dr. Sardjito', 'Jl. Kesehatan No.1', 'Yogyakarta', '0274-587333'),
('RSU Dr. Mohammad Hoesin', 'Jl. Soekarno-Hatta No.1', 'Palembang', '0711-354088'),
('RS Pusat Dr. Soetomo', 'Jl. Mayjen Prof. Dr. Moestopo No.6-8', 'Surabaya', '031-5501078'),
('RSU Dr. Soetomo', 'Jl. Mayjen Prof. Dr. Moestopo No.6-8', 'Surabaya', '031-5342634'),
('RSU Sidoarjo', 'Jl. Mojopahit No.667', 'Sidoarjo', '031-8961649');

INSERT INTO Psychologist (Name, Email, Specialty, Mobile, VisitPrice, Location_LocationID) VALUES
('John Doe', 'john.doe@example.com', 'Child Psychology', '081234567890', 500000.00, 1),
('Jane Smith', 'jane.smith@example.com', 'Clinical Psychology', '082345678901', 600000.00, 1),
('Bob Johnson', 'bob.johnson@example.com', 'Counseling Psychology', '083456789012', 450000.00, 2),
('Samantha Lee', 'samantha.lee@example.com', 'Forensic Psychology', '084567890123', 700000.00, 2),
('Michael Brown', 'michael.brown@example.com', 'Health Psychology', '085678901234', 550000.00, 3),
('Emily Davis', 'emily.davis@example.com', 'Industrial-Organizational Psychology', '086789012345', 650000.00, 3),
('David Wilson', 'david.wilson@example.com', 'Neuropsychology', '087890123456', 800000.00, 4),
('Sophia Martinez', 'sophia.martinez@example.com', 'School Psychology', '088901234567', 500000.00, 4),
('Christopher Garcia', 'christopher.garcia@example.com', 'Sports Psychology', '089012345678', 600000.00, 5),
('Olivia Rodriguez', 'olivia.rodriguez@example.com', 'Trauma Psychology', '081123456789', 650000.00, 5),
('Daniel Johnson', 'daniel.johnson@example.com', 'Child Psychology', '082234567890', 550000.00, 6),
('Ava Williams', 'ava.williams@example.com', 'Clinical Psychology', '083345678901', 700000.00, 6),
('Matthew Jones', 'matthew.jones@example.com', 'Counseling Psychology', '084456789012', 600000.00, 7),
('Isabella Brown', 'isabella.brown@example.com', 'Forensic Psychology', '085567890123', 750000.00, 7),
('Andrew Miller', 'andrew.miller@example.com', 'Health Psychology', '086678901234', 650000.00, 8),
('Emma Davis', 'emma.davis@example.com', 'Industrial-Organizational Psychology', '087789012345', 700000.00, 8),
('Joshua Wilson', 'joshua.wilson@example.com', 'Neuropsychology', '088890123456', 850000.00, 1),
('Abigail Rodriguez', 'abigail.rodriguez@example.com', 'School Psychology', '089901234567', 600000.00, 2),
('Joseph Thompson', 'joseph.thompson@example.com', 'Sports Psychology', '081012345678', 650000.00, 3),
('Mia Garcia', 'mia.garcia@example.com', 'Trauma Psychology', '082123456789', 700000.00, 4),
('William Martinez', 'william.martinez@example.com', 'Child Psychology', '083234567890', 550000.00, 5),
('Sophia Anderson', 'sophia.anderson@example.com', 'Clinical Psychology', '084345678901', 750000.00, 6),
('Michael Taylor', 'michael.taylor@example.com', 'Counseling Psychology', '085456789012', 650000.00, 7),
('Olivia Thomas', 'olivia.thomas@example.com', 'Forensic Psychology', '086567890123', 800000.00, 8),
('David Jackson', 'david.jackson@example.com', 'Health Psychology', '087678901234', 700000.00, 1),
('Ava Harris', 'ava.harris@example.com', 'Industrial-Organizational Psychology', '088789012345', 750000.00, 2),
('Joseph Clark', 'joseph.clark@example.com', 'Neuropsychology', '089890123456', 900000.00, 3),
('Mia Lewis', 'mia.lewis@example.com', 'School Psychology', '081901234567', 650000.00, 4),
('William Robinson', 'william.robinson@example.com', 'Sports Psychology', '082012345678', 700000.00, 5),
('Sophia Walker', 'sophia.walker@example.com', 'Trauma Psychology', '083123456789', 750000.00, 6);

INSERT INTO Schedule (ScheduleDate, ScheduleStatus, Psychologist_PsychologistID, Session_SessionID, UserHistory_UserHistoryID) VALUES
('2024-06-01', 'Available', 1, 1, NULL),
('2024-06-01', 'Available', 2, 2, NULL),
('2024-06-01', 'Available', 3, 3, NULL),
('2024-06-01', 'Available', 4, 1, NULL),
('2024-06-01', 'Available', 5, 2, NULL),
('2024-06-02', 'Available', 6, 3, NULL),
('2024-06-02', 'Available', 7, 1, NULL),
('2024-06-02', 'Available', 8, 2, NULL),
('2024-06-02', 'Available', 9, 3, NULL),
('2024-06-02', 'Available', 10, 1, NULL),
('2024-06-03', 'Available', 11, 2, NULL),
('2024-06-03', 'Available', 12, 3, NULL),
('2024-06-03', 'Available', 13, 1, NULL),
('2024-06-03', 'Available', 14, 2, NULL),
('2024-06-03', 'Available', 15, 3, NULL),
('2024-06-04', 'Available', 16, 1, NULL),
('2024-06-04', 'Available', 17, 2, NULL),
('2024-06-04', 'Available', 18, 3, NULL),
('2024-06-04', 'Available', 19, 1, NULL),
('2024-06-04', 'Available', 20, 2, NULL),
('2024-06-05', 'Available', 21, 3, NULL),
('2024-06-05', 'Available', 22, 1, NULL),
('2024-06-05', 'Available', 23, 2, NULL),
('2024-06-05', 'Available', 24, 3, NULL),
('2024-06-05', 'Available', 25, 1, NULL),
('2024-06-06', 'Available', 26, 2, NULL),
('2024-06-06', 'Available', 27, 3, NULL),
('2024-06-06', 'Available', 28, 1, NULL),
('2024-06-06', 'Available', 29, 2, NULL),
('2024-06-06', 'Available', 30, 3, NULL),
('2024-06-07', 'Available', 1, 1, NULL),
('2024-06-07', 'Available', 2, 2, NULL),
('2024-06-07', 'Available', 3, 3, NULL),
('2024-06-07', 'Available', 4, 1, NULL),
('2024-06-07', 'Available', 5, 2, NULL),
('2024-06-07', 'Available', 6, 3, NULL),
('2024-06-07', 'Available', 7, 1, NULL),
('2024-06-07', 'Available', 8, 2, NULL),
('2024-06-07', 'Available', 9, 3, NULL),
('2024-06-07', 'Available', 10, 1, NULL),
('2024-06-07', 'Available', 11, 2, NULL),
('2024-06-07', 'Available', 12, 3, NULL),
('2024-06-07', 'Available', 13, 1, NULL),
('2024-06-07', 'Available', 14, 2, NULL),
('2024-06-07', 'Available', 15, 3, NULL),
('2024-06-07', 'Available', 16, 1, NULL),
('2024-06-07', 'Available', 17, 2, NULL),
('2024-06-07', 'Available', 18, 3, NULL),
('2024-06-07', 'Available', 19, 1, NULL),
('2024-06-07', 'Available', 20, 2, NULL);