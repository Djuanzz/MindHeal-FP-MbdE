import jwt from "jsonwebtoken";
import { db } from "../db/db.js";

const auth = async (req, res, next) => {
  const cookie = req.cookies.jwt;

  // console.log("JWT Cookie:", cookie);

  if (!cookie) {
    console.log("No JWT cookie found");
    return res.status(401).send({
      message: "Unauthenticated user",
    });
  }

  try {
    const payload = jwt.verify(cookie, process.env.JWT_SECRET);
    // console.log("JWT Payload:", payload);

    const userQuery = "SELECT * FROM user WHERE UserID = ?";
    const [user] = await db.query(userQuery, [payload.UserID]);

    if (!user || user.length === 0) {
      console.log("No user found with ID:", payload.UserID);
      return res.status(401).send({
        message: "Unauthenticated user",
      });
    }

    req.user = user[0];

    next();
  } catch (err) {
    console.error("JWT verification error:", err);
    return res.status(401).send({
      message: "Unauthenticated user",
    });
  }
};

export default { auth };
