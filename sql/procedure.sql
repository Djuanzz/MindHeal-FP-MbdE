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
