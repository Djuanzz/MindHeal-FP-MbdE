import { prisma } from "../db/database.js";
import { validate } from "../validation/validation.js";
import userValidation from "../validation/user.validation.js";
import { ResponseError } from "../error/err-handling.js";
import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";
import jwt from "jsonwebtoken";

const signUp = async (req) => {
  const user = validate(userValidation.signUpValidation, req);

  const countUser = await prisma.$queryRaw`
    SELECT COUNT(*) FROM users
    WHERE email = ${user.email}
  `;

  if (countUser[0].count > 0) {
    throw new ResponseError(400, "Email already exists");
  }

  user.password = await bcrypt.hash(user.password, 10);

  const id = uuidv4();

  const newUser = await prisma.$queryRaw`
    INSERT INTO users (user_id, email, password, name)
    VALUES (${id}, ${user.email}, ${user.password}, ${user.name})
  `;

  return user;
};

const signIn = async (req) => {
  const login = validate(userValidation.signInValidation, req);

  // const user = await prisma.user.findUnique({
  //   where: {
  //     email: login.email,
  //   },
  // });

  const user = await prisma.$queryRaw`
    SELECT * FROM users
    WHERE email = ${login.email}
  `;

  if (user.length === 0)
    throw new ResponseError(400, "username or password is invalid");

  // if (!user) throw new ResponseError(400, "username or password is invalid");

  const isValidPassword = await bcrypt.compare(
    login.password,
    user[0].password
  );
  // const isValidPassword = await bcrypt.compare(login.password, user.password);

  if (!isValidPassword)
    throw new ResponseError(400, "username or password is invalid");

  const token = jwt.sign({ id: user.user_id }, process.env.JWT_SECRET);

  return token;
};

export default {
  signUp,
  signIn,
};
