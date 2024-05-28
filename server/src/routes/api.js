import express from "express";
import userController from "../controller/user.controller.js";
import authMiddleware from "../middleware/auth.middleware.js";
import psikologController from "../controller/psikolog.controller.js";
import scheduleController from "../controller/schedule.controller.js";
import historyController from "../controller/history.controller.js";

const userRouter = new express.Router();
const psikologRouter = new express.Router();
const scheduleRouter = new express.Router();
const historyRouter = new express.Router();

userRouter.use(authMiddleware.auth);

userRouter.get("/me", userController.currUser);
userRouter.delete("/logout", userController.logout);
userRouter.patch("/", userController.updateUser);
userRouter.post("/history", historyController.createUserHistory);
userRouter.get("/history", historyController.listUserHistory);

psikologRouter.get("/:id", psikologController.getPsikologById);
psikologRouter.post("/", psikologController.createPsikolog);

scheduleRouter.get("/", scheduleController.getAllSchedule);
scheduleRouter.post("/", scheduleController.createSchedule);

export default {
  userRouter,
  psikologRouter,
  scheduleRouter,
  historyRouter,
};
