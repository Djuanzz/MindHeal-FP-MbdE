import Joi from "joi";

const signUpValidation = Joi.object({
  email: Joi.string().email().required(),
  password: Joi.string().min(6).required(),
  name: Joi.string().required(),
});

export default {
  signUpValidation,
};
