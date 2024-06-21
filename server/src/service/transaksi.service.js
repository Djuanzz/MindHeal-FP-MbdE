import { db } from "../db/db.js";
import { validate } from "../validation/validation.js";
import transaksiValidation from "../validation/transaksi.validation.js";

const getAllTransaksi = async () => {
  const [rows, fields] = await db.query("SELECT * FROM TransactionBill");
  return rows;
};

const createTransaksi = async (userId, req) => {
  const transaksi = req;
  const newTransaksiQuery =
    "CALL `InputTransaction`(?, ?, ?, @Created_UserHistoryID)";

  const [result] = await db.query(newTransaksiQuery, [
    userId,
    transaksi.ScheduleID,
    transaksi.Amount,
  ]);

  const userHistoryID = await db.query(
    "SELECT @Created_UserHistoryID as UserHistoryID"
  );

  return userHistoryID[0][0];
};

const updateTransaksiByUserHistory = async (req) => {
  const updateTransaksiQuery = "CALL UpdateTransactionByUserHistoryID(?, ?)";
  const [result] = await db.query(updateTransaksiQuery, [
    req.UserHistoryID,
    req.Status,
  ]);

  return result;
};

const deleteTransaksiByUserHistory = async (req) => {
  const deleteTransaksiQuery =
    "DELETE FROM UserHistory WHERE UserHistoryID = ?";
  const [result] = await db.query(deleteTransaksiQuery, [req.UserHistoryID]);

  return result;
};

const userPayTheTransaction = async (req) => {
  const userPayTheTransactionQuery =
    "CALL `UpdateTransactionByUserHistoryID`(?, ?);";
  const [result] = await db.query(userPayTheTransactionQuery, [
    req.UserHistoryID,
    req.PaymentType,
  ]);

  return result;
};

export default {
  getAllTransaksi,
  createTransaksi,
  updateTransaksiByUserHistory,
  deleteTransaksiByUserHistory,
  userPayTheTransaction,
};
