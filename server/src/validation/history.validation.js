import Joi from "joi";

const createUserHistoryValidation = Joi.object({
  User_UserID: Joi.number().required(),
  Schedule_ScheduleID: Joi.number().required(),
});

export default {
  createUserHistoryValidation,
};
