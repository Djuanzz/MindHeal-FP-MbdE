-- Implementation Of Procedure

CREATE PROCEDURE GetSchedulesByDate(IN givenDate DATE)
BEGIN
    SELECT
        Schedule.ScheduleID,
        Schedule.ScheduleDate,
        Psychologist.Name,
        Psychologist.Email,
        Session.SessionStart,
        Session.SessionEnd
    FROM
        Schedule
    JOIN
        Psychologist ON Schedule.Psychologist_PsychologistID = Psychologist.PsychologistID
    JOIN
        Session ON Schedule.Session_SessionID = Session.SessionID
    WHERE
        Schedule.ScheduleDate = givenDate;
END

CALL GetSchedulesByDate ('2024-05-07');
CALL GetSchedulesByDate ('2024-05-06');

CREATE PROCEDURE GetScheduleForCurrentWeek()
BEGIN
    SELECT
      s.ScheduleDate,
      DAYNAME(s.ScheduleDate) AS DayName
    FROM
      schedule s
    WHERE
      s.ScheduleDate BETWEEN
        DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY)
        AND DATE_ADD(DATE_SUB(CURDATE(), INTERVAL (DAYOFWEEK(CURDATE()) - 2) DAY), INTERVAL 5 DAY)
    ORDER BY
      s.ScheduleDate;
END 

CALL GetScheduleForCurrentWeek();