import historyService from "../service/history.service.js";

const createUserHistory = async (req, res, next) => {
  try {
    console.log(req.user);
    const result = await historyService.createUserHistory(
      req.user.UserID,
      req.body
    );
    res.status(201).json({
      data: {
        "logined user": req.user.email,
      },
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const listUserHistory = async (req, res, next) => {
  try {
    const result = await historyService.listUserHistory(req);
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const getAllUserHistory = async (req, res, next) => {
  try {
    const result = await historyService.getAllUserHistory();
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const getUserHistoryByUserLogin = async (req, res, next) => {
  try {
    const result = await historyService.getUserHistoryByUserLogin(req);
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const getUserHistoryByUserId = async (req, res, next) => {
  try {
    const result = await historyService.getUserHistoryByUserId(req.params.id);
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const getDetailUserHistoryByUserHistoryID = async (req, res, next) => {
  try {
    const result = await historyService.getDetailUserHistoryByUserHistoryID(
      req.params.id
    );
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const deleteHistory = async (req, res, next) => {
  try {
    const result = await historyService.deleteHistory(req.body);
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

export default {
  createUserHistory,
  listUserHistory,
  getAllUserHistory,
  getUserHistoryByUserLogin,
  getUserHistoryByUserId,
  getDetailUserHistoryByUserHistoryID,
  deleteHistory,
};
