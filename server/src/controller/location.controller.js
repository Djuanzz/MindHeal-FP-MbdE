import locationService from "../service/location.service.js";

const createLocation = async (req, res) => {
  try {
    const result = await locationService.createLocation(req.body);
    res.status(201).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
  }
};

const getAllLocation = async (req, res) => {
  try {
    const result = await locationService.getAllLocation();
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
  }
};

export default {
  createLocation,
  getAllLocation,
};
