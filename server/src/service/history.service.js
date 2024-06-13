import historyValidation from "../validation/history.validation.js";
import { validate } from "../validation/validation.js";
import { db } from "../db/db.js";

const createUserHistory = async (userId, req) => {
  const history = req;

  // console.log(userId, history);

  const newUserHistoryQuery =
    "INSERT INTO UserHistory (User_UserID) VALUES (?)";
  const [result] = await db.query(newUserHistoryQuery, [userId]);

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

const getUserHistoryById = async (req) => {
  const userId = req.user.UserID;
  const userHistoryQuery = "CALL ListUserHistoryByUserLogin(?)";
  const [userHistory] = await db.query(userHistoryQuery, [userId]);

  return userHistory[0];
};

export default {
  createUserHistory,
  listUserHistory,
  getAllUserHistory,
  getUserHistoryById,
};
