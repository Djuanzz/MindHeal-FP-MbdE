import psikologService from "../service/psikolog.service.js";

const getAllPsikolog = async (req, res, next) => {
  try {
    const data = await psikologService.getAllPsikolog();
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const getPsikologById = async (req, res, next) => {
  try {
    const data = await psikologService.getPsikologById(req.params.id);
    res.status(200).json({
      data: data,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const createPsikolog = async (req, res, next) => {
  try {
    const data = await psikologService.createPsikolog(req.body);
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
  getAllPsikolog,
  getPsikologById,
  createPsikolog,
};