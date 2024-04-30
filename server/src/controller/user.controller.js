import userService from "../service/user.service.js";

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

const signIn = async (req, res, next) => {
  try {
    const result = await userService.signIn(req.body);

    res.cookie("jwt", result, {
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000,
    });

    res.status(200).json({
      data: result,
      message: `login success as ${req.body.email}`,
    });
  } catch (error) {
    next(error);
  }
};

export default {
  signUp,
  signIn,
};
