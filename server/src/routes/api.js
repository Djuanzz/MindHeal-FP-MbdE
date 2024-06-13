import express from "express";
import userController from "../controller/user.controller.js";
import authMiddleware from "../middleware/auth.middleware.js";
import psikologController from "../controller/psikolog.controller.js";
import scheduleController from "../controller/schedule.controller.js";
import historyController from "../controller/history.controller.js";
import transaksiController from "../controller/transaksi.controller.js";
import diagnosisController from "../controller/diagnosis.controller.js";
import locationController from "../controller/location.controller.js";

const userRouter = new express.Router();
const psikologRouter = new express.Router();
const scheduleRouter = new express.Router();
const historyRouter = new express.Router();
const transaksiRouter = new express.Router();
const diagnosisRouter = new express.Router();
const locationRouter = new express.Router();

userRouter.use(authMiddleware.auth);

userRouter.get("/me", userController.currUser);
userRouter.delete("/logout", userController.logout);
userRouter.patch("/", userController.updateUser);
userRouter.post("/history", historyController.createUserHistory);
userRouter.get("/history", historyController.getUserHistoryById);

psikologRouter.get("/:id", psikologController.getPsikologById);
psikologRouter.post("/", psikologController.createPsikolog);

scheduleRouter.get("/", scheduleController.getAllSchedule);
scheduleRouter.post("/", scheduleController.createSchedule);
scheduleRouter.get("/week", scheduleController.getAllScheduleInWeek);
scheduleRouter.post("/day", scheduleController.getPsikologSchedule);

transaksiRouter.get("/", transaksiController.getAllTransaksi);
transaksiRouter.post("/", transaksiController.createTransaksi);
transaksiRouter.patch("/", transaksiController.updateTransaksiByUserHistory);
transaksiRouter.delete("/", transaksiController.deleteTransaksiByUserHistory);

diagnosisRouter.post("/", diagnosisController.createDiagnosis);

locationRouter.post("/", locationController.createLocation);
locationRouter.get("/", locationController.getAllLocation);

export default {
  userRouter,
  psikologRouter,
  scheduleRouter,
  historyRouter,
  transaksiRouter,
  diagnosisRouter,
  locationRouter,
};
