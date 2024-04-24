import userService from "../service/user.service.js";
import jwt from "jsonwebtoken";

const signUp = async (req, res, next) => {
  try {
    const result = await userService.signUp(req.body);
    res.status(201).json({
      data: result,
      message: "user created",
    });
  } catch (error) {
    next(error);
  }
};

export default {
  signUp,
};
