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

INSERT INTO offices (office_id, province, city, address, phone_number) VALUES
    ('1', 'İstanbul', 'Kadıköy', 'Bağdat Caddesi', '0216 123 45 67'),
    ('2', 'İstanbul', 'Beşiktaş', 'Levazım Mahallesi', '0212 123 45 67'),
    ('3', 'İstanbul', 'Şişli', 'Harbiye Mahallesi', '0212 123 45 67'),
    ('4', 'Ankara', 'Çankaya', 'Kızılay Meydanı', '0312 123 45 67'),
    ('5', 'İzmir', 'Konak', 'Kordonboyu', '0232 123 45 67');

INSERT INTO psychologists (psychologist_id, name, email, description, session_count, office_id) VALUES
    ('1', 'Dr. Ahmet', 'ahmed@gmail.com', 'Psikolog Ahmet', 10, '1'),
    ('2', 'Dr. Mehmet', 'mehmet@gmail.com', 'Psikolog Mehmet', 10, '2'),
    ('3', 'Dr. Ayşe', 'ayse@gmail.com', 'Psikolog Ayşe', 10, '3'),
    ('4', 'Dr. Fatma', 'fatma@gmail.com', 'Psikolog Fatma', 10, '4'),
    ('5', 'Dr. Zeynep', 'zeynep@gmail.com', 'Psikolog Zeynep', 10, '5'),
    ('6', 'Dr. Merve', 'merve@gmail.com', 'Psikolog Merve', 10, '1');
