import { db } from "../db/db.js";
import { validate } from "../validation/validation.js";
import transaksiValidation from "../validation/transaksi.validation.js";

const getAllTransaksi = async () => {
  const [rows, fields] = await db.query("SELECT * FROM TransactionBill");
  return rows;
};

const createTransaksi = async (req) => {
  const transaksi = validate(
    transaksiValidation.createTransaksiValidation,
    req
  );
  const newTransaksiQuery =
    "INSERT INTO TransactionBill (PaymentType, Amount, TimeDue, UserHistory_UserHistoryID) VALUES (?, ?, ?, ?)";
  const [result] = await db.query(newTransaksiQuery, [
    transaksi.PaymentType,
    transaksi.Amount,
    transaksi.TimeDue,
    transaksi.UserHistory_UserHistoryID,
  ]);

  return result;
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

export default {
  getAllTransaksi,
  createTransaksi,
  updateTransaksiByUserHistory,
  deleteTransaksiByUserHistory,
};
