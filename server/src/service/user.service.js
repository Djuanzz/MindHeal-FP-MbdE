import { db } from "../db/db.js";
import userValidation from "../validation/user.validation.js";
import { validate } from "../validation/validation.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const getAllUsers = async () => {
  const [rows, fields] = await db.query("SELECT * FROM user");
  return rows;
};

const register = async (req) => {
  const user = validate(userValidation.registerValidation, req);

  const countUserQuery = "SELECT COUNT(*) as count FROM user WHERE email = ?";
  const [countUser] = await db.query(countUserQuery, [user.email]);

  if (countUser[0].count > 0) {
    throw new Error("Email already exists");
  }

  const newUserQuery =
    "INSERT INTO user (name, email, password) VALUES (?, ?, ?)";
  const [result] = await db.query(newUserQuery, [
    user.name,
    user.email,
    user.password,
  ]);

  return user;
};

const login = async (req) => {
  const login = validate(userValidation.loginValidation, req);

  const userQuery = "SELECT * FROM user WHERE email = ? AND password = ?";
  const [users] = await db.query(userQuery, [login.email, login.password]);

  if (users.length === 0) {
    throw new Error("Invalid email or password");
  }

  // console.log("pppppppppppppppppppppppppppppppppp", users[0]);

  const token = jwt.sign({ UserID: users[0].UserID }, process.env.JWT_SECRET);
  return { token, user: users[0] };
};

const currUser = async (req) => {
  const userQuery = "SELECT * FROM user WHERE UserID = ?";
  const [user] = await db.query(userQuery, [req.user.UserID]);

  return user[0];
};

const updateUser = async (req, UserID) => {
  const user = req;
  console.log("user", req);

  const userQuery = "SELECT * FROM user WHERE UserID = ?";
  const [users] = await db.query(userQuery, [UserID]);

  if (users.length === 0) {
    throw new Error("User not found");
  }

  const data = {};
  user.name ? (data.name = user.name) : (data.name = users[0].name);
  user.email ? (data.email = user.email) : (data.email = users[0].email);
  if (user.password !== "") {
    console.log("cek password", user.password, users[0].password);
    if (user.password !== users[0].password) {
      throw new Error("Invalid password");
    } else {
      data.password = user.new;
    }
    console.log(
      "data",
      data.password,
      user.new,
      user.password,
      users[0].password
    );
  } else {
    data.password = users[0].password;
  }

  const updateUserQuery =
    "UPDATE user SET name = ?, email = ?, password = ? WHERE UserID = ?";
  const [result] = await db.query(updateUserQuery, [
    data.name,
    data.email,
    data.password,
    UserID,
  ]);

  return user;
};

export default {
  getAllUsers,
  register,
  login,
  currUser,
  updateUser,
};
