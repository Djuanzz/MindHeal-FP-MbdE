import Joi from "joi";

const registerValidation = Joi.object({
  Name: Joi.string().required(),
  Email: Joi.string().email().required(),
  Specialty: Joi.string().required(),
  Mobile: Joi.string().required(),
  VisitPrice: Joi.number().required(),
  Location_LocationID: Joi.number().required(),
});

export default {
  registerValidation,
};
