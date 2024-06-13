import Joi from "joi";

const registerValidation = Joi.object({
  Name: Joi.string().required(),
  Email: Joi.string().email().required(),
  Password: Joi.string().required(),
  DateOfBirth: Joi.string(),
  Address: Joi.string().required(),
  City: Joi.string().required(),
  Mobile: Joi.string().required(),
});

const loginValidation = Joi.object({
  Email: Joi.string().email().required(),
  Password: Joi.string().required(),
});

const updateUserValidation = Joi.object({
  Name: Joi.string().optional(),
  Email: Joi.string().email().optional(),
  Password: Joi.string().optional(),
});

export default {
  registerValidation,
  loginValidation,
  updateUserValidation,
};
