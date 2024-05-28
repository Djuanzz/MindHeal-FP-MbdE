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
    "INSERT INTO schedule (ScheduleDate, Psychologist_PsychologistID, Session_SessionID) VALUES (?, ?, ?)";

  const [result] = await db.query(newScheduleQuery, [
    schedule.ScheduleDate,
    schedule.Psychologist_PsychologistID,
    schedule.Session_SessionID,
  ]);

  console.log(schedule);

  return schedule;
};

export default {
  getAllSchedule,
  createSchedule,
};
