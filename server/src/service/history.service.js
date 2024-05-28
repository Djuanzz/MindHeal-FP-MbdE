import historyValidation from "../validation/history.validation.js";
import { validate } from "../validation/validation.js";
import { db } from "../db/db.js";

const createUserHistory = async (userId, req) => {
  const history = validate(historyValidation.createUserHistoryValidation, req);

  if (history.Schedule_ScheduleID == null) {
    throw new Error("err found");
  }

  const newUserHistoryQuery =
    "INSERT INTO UserHistory (User_UserID, Schedule_ScheduleID) VALUES (?, ?)";
  const [result] = await db.query(newUserHistoryQuery, [
    userId,
    history.Schedule_ScheduleID,
  ]);

  console.log(history);

  return history;
};

const listUserHistory = async (req) => {
  const userHistoryQuery = "SELECT * FROM UserHistory WHERE User_UserID = ?";
  const [userHistory] = await db.query(userHistoryQuery, [req.user.UserID]);

  return userHistory;
};

const getAllUserHistory = async () => {
  const userHistoryQuery = "SELECT * FROM UserHistory";
  const [userHistory] = await db.query(userHistoryQuery);

  return userHistory;
};

export default {
  createUserHistory,
  listUserHistory,
  getAllUserHistory,
};
