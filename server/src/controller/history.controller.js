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
        "success create schedule at id": result.Schedule_ScheduleID,
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

const getUserHistoryById = async (req, res, next) => {
  try {
    const result = await historyService.getUserHistoryById(req);
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
  getUserHistoryById,
};
