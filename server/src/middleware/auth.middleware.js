import jwt from "jsonwebtoken";
import { db } from "../db/db.js";

const auth = async (req, res, next) => {
  const token =
    req.cookies.jwt ||
    (req.headers.authorization && req.headers.authorization.split(" ")[1]);

  if (!token) {
    console.log("Token JWT tidak ditemukan");
    return res.status(401).send({
      message: "Pengguna tidak diautentikasi",
    });
  }

  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET);
    const userQuery = "SELECT * FROM Users WHERE UserID = ?";
    const [user] = await db.query(userQuery, [payload.UserID]);

    if (!user || user.length === 0) {
      console.log("Pengguna tidak ditemukan dengan ID:", payload.UserID);
      return res.status(401).send({
        message: "Pengguna tidak diautentikasi",
      });
    }

    req.user = user[0];
    next();
  } catch (err) {
    console.error("Kesalahan verifikasi JWT:", err);
    return res.status(401).send({
      message: "Pengguna tidak diautentikasi",
    });
  }
};

export default { auth };
