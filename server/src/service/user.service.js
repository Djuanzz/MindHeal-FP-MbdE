import { db } from "../db/db.js";
import userValidation from "../validation/user.validation.js";
import { validate } from "../validation/validation.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const getAllUsers = async () => {
  const [rows, fields] = await db.query("SELECT * FROM Users");
  return rows;
};

const register = async (req) => {
  const user = validate(userValidation.registerValidation, req);

  const countUserQuery = "SELECT COUNT(*) as count FROM Users WHERE Email = ?";
  const [countUser] = await db.query(countUserQuery, [user.Email]);

  if (countUser[0].count > 0) {
    throw new Error("Email already exists");
  }

  const newUserQuery =
    "INSERT INTO Users (Name, Email, Password, DateOfBirth, Address, City, Mobile) VALUES (?, ?, ?, ?, ?, ?, ?)";
  const [result] = await db.query(newUserQuery, [
    user.Name,
    user.Email,
    user.Password,
    user.DateOfBirth,
    user.Address,
    user.City,
    user.Mobile,
  ]);

  return user;
};

const login = async (req) => {
  const login = validate(userValidation.loginValidation, req);
  // console.log("login", login);

  const userQuery = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
  const [users] = await db.query(userQuery, [login.Email, login.Password]);

  if (users.length === 0) {
    throw new Error("Invalid Email or Password");
  }

  // console.log("pppppppppppppppppppppppppppppppppp", users[0]);

  const token = jwt.sign({ UserID: users[0].UserID }, process.env.JWT_SECRET);
  return { token, user: users[0] };
};

const currUser = async (req) => {
  const userQuery = "SELECT * FROM Users WHERE UserID = ?";
  const [user] = await db.query(userQuery, [req.user.UserID]);

  return user[0];
};

const updateUser = async (req, UserID) => {
  const user = req;

  const userQuery = "SELECT * FROM Users WHERE UserID = ?";
  const [users] = await db.query(userQuery, [UserID]);

  if (users.length === 0) {
    throw new Error("User not found");
  }

  const data = {};
  user.Name ? (data.Name = user.Name) : (data.Name = users[0].Name);
  user.Email ? (data.Email = user.Email) : (data.Email = users[0].Email);
  if (user.Password !== "") {
    console.log("cek Password", user.Password, users[0].Password);
    if (user.Password !== users[0].Password) {
      throw new Error("Invalid Password");
    } else {
      data.Password = user.NewPassword;
    }
    console.log(
      "data",
      data.Password,
      user.NewPassword,
      user.Password,
      users[0].Password
    );
  } else {
    data.Password = users[0].Password;
  }

  const updateUserQuery =
    "UPDATE Users SET Name = ?, Email = ?, Password = ? WHERE UserID = ?";
  const [result] = await db.query(updateUserQuery, [
    data.Name,
    data.Email,
    data.Password,
    UserID,
  ]);

  return user;
};

const getUserByUserID = async (UserID) => {
  const userQuery = "SELECT * FROM Users WHERE UserID = ?";
  const [users] = await db.query(userQuery, [UserID]);

  return users[0];
};

export default {
  getAllUsers,
  register,
  login,
  currUser,
  updateUser,
  getUserByUserID,
};
