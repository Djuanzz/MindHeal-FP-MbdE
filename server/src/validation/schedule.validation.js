import Joi from "joi";

const createScheduleValidation = Joi.object({
  ScheduleDate: Joi.date().required(),
  Psychologist_PsychologistID: Joi.number().required(),
  Session_SessionID: Joi.number().required(),
});

export default {
  createScheduleValidation,
};
