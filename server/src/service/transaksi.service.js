import { db } from "../db/db.js";
import { validate } from "../validation/validation.js";
import transaksiValidation from "../validation/transaksi.validation.js";

const getAllTransaksi = async () => {
  const [rows, fields] = await db.query("SELECT * FROM transaction");
  return rows;
};

const createTransaksi = async (req) => {
  const transaksi = validate(
    transaksiValidation.createTransaksiValidation,
    req
  );
  const newTransaksiQuery = "CALL InputTransaction(?, ?, 100000)";
  const [result] = await db.query(newTransaksiQuery, [
    transaksi.User_UserID,
    transaksi.ScheduleID,
  ]);

  return result;
};

export default {
  getAllTransaksi,
  createTransaksi,
};
