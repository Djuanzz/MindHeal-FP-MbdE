import scheduleService from "../service/schedule.service.js";

const getAllSchedule = async (req, res, next) => {
  try {
    const data = await scheduleService.getAllSchedule();
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const createSchedule = async (req, res, next) => {
  try {
    const data = await scheduleService.createSchedule(req.body);
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

export default {
  getAllSchedule,
  createSchedule,
};
