USE perspective;

SHOW TABLES;

-- DELETE
DELETE FROM users;
DELETE FROM offices;
DELETE FROM schedules;
DELETE FROM transactions;
DELETE FROM psychologists;

-- SELECT
SELECT * FROM users;
SELECT * FROM offices;
SELECT * FROM schedules;
SELECT * FROM transactions;
SELECT * FROM psychologists;

INSERT INTO offices (office_id, name, province, city, address, phone_number) VALUES
    ('1', 'İstanbul Psikoloji', 'İstanbul', 'Kadıköy', 'Kadıköy', '0216 123 45 67'),
    ('2', 'Ankara Psikoloji', 'Ankara', 'Çankaya', 'Çankaya', '0312 123 45 67'),
    ('3', 'İzmir Psikoloji', 'İzmir', 'Karşıyaka', 'Karşıyaka', '0232 123 45 67'),
    ('4', 'Antalya Psikoloji', 'Antalya', 'Muratpaşa', 'Muratpaşa', '0242 123 45 67'),
    ('5', 'Bursa Psikoloji', 'Bursa', 'Osmangazi', 'Osmangazi', '0224 123 45 67'),
    ('6', 'Adana Psikoloji', 'Adana', 'Seyhan', 'Seyhan', '0322 123 45 67');
    

INSERT INTO psychologists (psychologist_id, name, email, description, session_count, office_id) VALUES
    ('1', 'Dr. Ahmet', 'ahmed@gmail.com', 'Psikolog Ahmet', 10, '1'),
    ('2', 'Dr. Mehmet', 'mehmet@gmail.com', 'Psikolog Mehmet', 10, '2'),
    ('3', 'Dr. Ayşe', 'ayse@gmail.com', 'Psikolog Ayşe', 10, '3'),
    ('4', 'Dr. Fatma', 'fatma@gmail.com', 'Psikolog Fatma', 10, '4'),
    ('5', 'Dr. Zeynep', 'zeynep@gmail.com', 'Psikolog Zeynep', 10, '5'),
    ('6', 'Dr. Merve', 'merve@gmail.com', 'Psikolog Merve', 10, '1'),
    ('7', 'Dr. Emre', 'erme@gmail.com', 'Psikolog Emre', 10, '1'),
    ('8', 'Dr. Cem', 'cem@gmail.com', 'Psikolog Cem', 10, '3'),
    ('9', 'Dr. Ceren', 'ceren@gmail.com', 'Psikolog Ceren', 10, '3'),
    ('10', 'Dr. Zeki', 'zeki@gmail.com', 'Psikolog Zeki', 10, '5'),
    ('11', 'Dr. Emma', 'emma@gmail.com', 'Psikolog Emma', 10, '1'),
    ('12', 'Dr. Eren', 'eren@gmail.com', 'Psikolog Eren', 10, '1'),
    ('13', 'Dr. Kola', 'kola@gmail.com', 'Psikolog Kola', 10, '3'),
    ('14', 'Dr. Juzy', 'juzy@gmail.com', 'Psikolog Juzy', 10, '5'),
    ('15', 'Dr. Zara', 'zara@gmail.com', 'Psikolog Zara', 10, '2'),
    ('16', 'Dr. vuyzi', 'vuyzi@gmail.com', 'Psikolog vuyzi', 10, '1'),
    ('17', 'Dr. Mert', 'mert@gmail.com,', 'Psikolog Mert', 10, '5'),
    ('18', 'Dr. Float', 'float@gmail.com', 'Psikolog Float', 10, '3');

INSERT INTO schedules (schedule_id, days, session, occupied, psychologist_id) VALUES
    ('1', '2021-06-01 09:00:00', 1, false, '1'),
    ('2', '2021-06-01 10:00:00', 1, false, '1'),
    ('3', '2021-06-01 11:00:00', 1, false, '1'),
    ('4', '2021-06-01 12:00:00', 1, false, '1'),
    ('5', '2021-06-01 13:00:00', 1, false, '1'),
    ('6', '2021-06-01 14:00:00', 1, false, '1'),
    ('7', '2021-06-01 15:00:00', 1, false, '1'),
    ('8', '2021-06-01 16:00:00', 1, false, '1'),
    ('9', '2021-06-01 17:00:00', 1, false, '1'),
    ('10', '2021-06-01 18:00:00', 1, false, '1'),
    ('11', '2021-06-01 09:00:00', 1, false, '2'),
    ('12', '2021-06-01 10:00:00', 1, false, '2'),
    ('13', '2021-06-01 11:00:00', 1, false, '2'),
    ('14', '2021-06-01 12:00:00', 1, false, '2'),
    ('15', '2021-06-01 13:00:00', 1, false, '2'),
    ('16', '2021-06-01 14:00:00', 1, false, '2'),
    ('17', '2021-06-01 15:00:00', 1, false, '2'),
    ('18', '2021-06-01 16:00:00', 1, false, '2'),
    ('19', '2021-06-01 17:00:00', 1, false, '2'),
    ('20', '2021-06-01 18:00:00', 1, false, '2'),
    ('21', '2021-06-01 09:00:00', 1, false, '3'),
    ('22', '2021-06-01 10:00:00', 1, false, '3'),
    ('23', '2021-06-01 11:00:00', 1, false, '3'),
    ('24', '2021-06-01 12:00:00', 1, false, '3'),
    ('25', '2021-06-01 13:00:00', 1, false, '3'),
    ('26', '2021-06-01 14:00:00', 1, false, '3'),
    ('27', '2021-06-01 15:00:00', 1, false, '3'),
    ('28', '2021-06-01 16:00:00', 1, false, '3'),
    ('29', '2021-06-01 17:00:00', 1, false, '3'),
    ('30', '2021-06-01 18:00:00', 1, false, '3'),
    ('31', '2021-06-01 09:00:00', 1, false, '4'),
    ('32', '2021-06-01 10:00:00', 1, false, '4'),
    ('33', '2021-06-01 11:00:00', 1, false, '4');