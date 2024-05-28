const validate = (schema, data) => {
  const { err, value } = schema.validate(data, {
    abortEarly: false,
    stripUnknown: true,
  });

  if (err) {
    const errors = {};
    err.details.forEach((error) => {
      errors[error.path] = error.message;
    });
    return errors;
  }

  return value;
};

export { validate };
