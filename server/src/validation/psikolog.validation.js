import Joi from "joi";

const registerValidation = Joi.object({
  Name: Joi.string().required(),
  Email: Joi.string().email().required(),
});

export default {
  registerValidation,
};
