import userService from "../service/user.service.js";

const getAllUsers = async (req, res) => {
  try {
    const data = await userService.getAllUsers();
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
  }
};

const register = async (req, res, next) => {
  try {
    const result = await userService.register(req.body);
    res.status(201).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const login = async (req, res, next) => {
  try {
    const { token, user } = await userService.login(req.body);
    res.cookie("jwt", token, {
      httpOnly: true,
      maxAge: 1 * 60 * 60 * 1000,
    });

    res.status(200).json({
      data: token,
      message: `login successfully as ${req.body.email}`,
      role: user.role,
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const logout = async (req, res, next) => {
  try {
    if (!req.user) {
      return res.status(401).json({
        message: "unauthenticated user",
      });
    }

    res.clearCookie("jwt");
    res.status(200).json({
      message: "logout successfully",
    });
  } catch (error) {
    next(error);
  }
};

const currUser = async (req, res, next) => {
  try {
    const user = await userService.currUser(req);
    res.status(200).json({
      data: user,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const updateUser = async (req, res, next) => {
  try {
    const UserID = req.user.UserID;
    const user = await userService.updateUser(req.body, UserID);
    res.status(200).json({
      data: user,
      message: "updated successfully",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

export default {
  getAllUsers,
  register,
  login,
  logout,
  currUser,
  updateUser,
};
