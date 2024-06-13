import { db } from "../db/db.js";
import { validate } from "../validation/validation.js";
import scheduleValidation from "../validation/schedule.validation.js";

const getAllSchedule = async () => {
  const [rows, fields] = await db.query("SELECT * FROM schedule");
  return rows;
};

const createSchedule = async (req) => {
  const schedule = validate(scheduleValidation.createScheduleValidation, req);
  const newScheduleQuery =
    "INSERT INTO schedule (ScheduleDate, ScheduleStatus, Psychologist_PsychologistID, Session_SessionID, UserHistory_UserHistoryID) VALUES (?, ?, ?, ?, ?)";

  const [result] = await db.query(newScheduleQuery, [
    schedule.ScheduleDate,
    schedule.ScheduleStatus,
    schedule.Psychologist_PsychologistID,
    schedule.Session_SessionID,
    schedule.UserHistory_UserHistoryID,
  ]);

  console.log(schedule);

  return schedule;
};

const getAllScheduleInWeek = async () => {
  const getAllScheduleInWeekQuery = "CALL GetScheduleForCurrentWeek()";

  const [result] = await db.query(getAllScheduleInWeekQuery);

  return result[0];
};

const getPsikologSchedule = async (req) => {
  const psikologId = req.body.date;
  const getPsikologScheduleQuery = "CALL GetPsychologistSchedule(?)";

  const [result] = await db.query(getPsikologScheduleQuery, [psikologId]);

  return result[0];
};

export default {
  getAllSchedule,
  createSchedule,
  getAllScheduleInWeek,
  getPsikologSchedule,
};
