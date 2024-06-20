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

const getAllScheduleInWeek = async (req, res, next) => {
  try {
    const data = await scheduleService.getAllScheduleInWeek();
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const getPsikologSchedule = async (req, res, next) => {
  try {
    const data = await scheduleService.getPsikologSchedule(req);
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const getAllPsychologistSchedule = async (req, res, next) => {
  try {
    const data = await scheduleService.getAllPsychologistSchedule();
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const deletePsikologSchedule = async (req, res, next) => {
  try {
    const data = await scheduleService.deletePsikologSchedule(req);
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
  getAllScheduleInWeek,
  getPsikologSchedule,
  getAllPsychologistSchedule,
  deletePsikologSchedule,
};
