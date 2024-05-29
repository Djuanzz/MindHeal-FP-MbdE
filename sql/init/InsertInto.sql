USE rawat_jalan;

-- INPUT USER
INSERT INTO
    User (Name, Email, Password)
VALUES (
        'Ziya',
        'ziya@gmail.com',
        'ziyaaja'
    ),
    (
        'Yuli',
        'yuli@gmail.com',
        'yuliaja'
    ),
    (
        'Yoyo',
        'yoyo@gmail.com',
        'yoyoaja'
    ),
    (
        'Julia',
        'julia@gmail.com',
        'juliaaja'
    ),
    (
        'Syukri',
        'syukri@gmail.com',
        'syukriaja'
    ),
    (
        'Rizky',
        'rizky@gmail.com',
        'rizkyaja'
    ),
    (
        'Lili',
        'lili@gmail.com',
        'liliaja'
    );

SELECT * FROM User;

-- daftaPsikolog
INSERT INTO
    Psychologist (Name, Email)
VALUES (
        'Dr. John Doe',
        'john@gmail.com'
    ),
    ('Dr. Tup', 'tup@gmail.com'),
    ('Dr. Apep', 'apep@gmail.com'),
    ('Dr. Budi', 'budi@gmail.com'),
    ('Dr. Caca', 'caca@gmail.com'),
    ('Dr. Dede', 'dede@gmail.com'),
    ('Dr. Eko', 'eko@gmail.com');

SELECT * FROM Psychologist;

-- SESI JADWAL
INSERT INTO
    Session (SessionStart, SessionEnd)
VALUES ('10:00:00', '11:50:00'),
    ('13:10:00', '15:00:00'),
    ('16:00:00', '17:50:00');

SELECT * FROM Session;

-- PEMBUATAN JADWAL UNTUK PSIKOLOG
INSERT INTO
    Schedule (
        ScheduleDate,
        Psychologist_PsychologistID,
        Session_SessionID
    )
VALUES ('2024-05-06', 1, 1),
    ('2024-05-06', 2, 2),
    ('2024-05-06', 3, 3),
    ('2024-05-07', 4, 1),
    ('2024-05-07', 5, 2),
    ('2024-05-07', 6, 3),
    ('2024-05-08', 7, 1);

SELECT * FROM Schedule;