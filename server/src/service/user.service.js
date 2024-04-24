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

// const signUp = async (req) => {
//   const user = validate(userValidation.signUpValidation, req);

//   const countUser = await prisma.user.count({
//     where: {
//       email: user.email,
//     },
//   });

//   if (countUser > 0) {
//     throw new ResponseError(400, "user already exists");
//   }

//   user.password = await bcrypt.hash(user.password, 10);

//   return prisma.user.create({
//     data: user,
//     select: {
//       email: true,
//       name: true,
//       password: true,
//     },
//   });
// };

export default {
  signUp,
};
