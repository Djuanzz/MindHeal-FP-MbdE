import Joi from "joi";

const createTransaksiValidation = Joi.object({
  User_UserID: Joi.number().required(),
  ScheduleID: Joi.number().required(),
});

export default {
  createTransaksiValidation,
};
