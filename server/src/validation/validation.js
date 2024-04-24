import Joi from "joi";

const validate = (schema, req) => {
  const { error, value } = schema.validate(req, {
    abortEarly: false,
    stripUnknown: true,
  });

  if (error) {
    throw new Error(error.message);
  }

  return value;
};

export { validate };
