import express from "express";
import userController from "../controller/user.controller.js";
import authMiddleware from "../middleware/auth.middleware.js";
import psikologController from "../controller/psikolog.controller.js";
import scheduleController from "../controller/schedule.controller.js";
import historyController from "../controller/history.controller.js";
import transaksiController from "../controller/transaksi.controller.js";
import diagnosisController from "../controller/diagnosis.controller.js";
import locationController from "../controller/location.controller.js";
import sessionController from "../controller/session.controller.js";

const userRouter = new express.Router();
const psikologRouter = new express.Router();
const scheduleRouter = new express.Router();
const historyRouter = new express.Router();
const transaksiRouter = new express.Router();
const diagnosisRouter = new express.Router();
const locationRouter = new express.Router();
const sessionRouter = new express.Router();

userRouter.use(authMiddleware.auth);

userRouter.get("/me", userController.currUser);
userRouter.delete("/logout", userController.logout);
userRouter.patch("/", userController.updateUser);
userRouter.post("/history", historyController.createUserHistory);
userRouter.get("/history", historyController.getUserHistoryByUserLogin);
userRouter.post("/transaksi", transaksiController.createTransaksi);
userRouter.post("/transaksi/pay", transaksiController.userPayTheTransaction);
userRouter.delete("/history", historyController.deleteHistory);
userRouter.get("/count-consultation", userController.getCountConsultation);
userRouter.get("/top-location", userController.topLocation);

psikologRouter.get("/:id", psikologController.getPsikologById);
psikologRouter.post("/", psikologController.createPsikolog);
psikologRouter.delete("/", psikologController.deletePsikolog);
psikologRouter.get(
  "/total-patient/:PsychologistID",
  psikologController.getTotalPatientHandled
);

scheduleRouter.get("/", scheduleController.getAllSchedule);
scheduleRouter.post("/", scheduleController.createSchedule);
scheduleRouter.get("/week", scheduleController.getAllScheduleInWeek);
scheduleRouter.post("/day", scheduleController.getPsikologSchedule);
scheduleRouter.get("/psikolog", scheduleController.getAllPsychologistSchedule);
scheduleRouter.delete("/", scheduleController.deletePsikologSchedule);

transaksiRouter.get("/", transaksiController.getAllTransaksi);
transaksiRouter.post("/", transaksiController.createTransaksi);
transaksiRouter.patch("/", transaksiController.updateTransaksiByUserHistory);
transaksiRouter.delete("/", transaksiController.deleteTransaksiByUserHistory);
transaksiRouter.post("/revenue/month", transaksiController.getRevenueByMonth);
transaksiRouter.get("/detail", transaksiController.getDetailTransaksi);

diagnosisRouter.post("/", diagnosisController.createDiagnosis);
diagnosisRouter.get(
  "/:userHistoryId",
  diagnosisController.getDiagnosisByUserHistoryId
);
diagnosisRouter.patch(
  "/:diagnosisId",
  diagnosisController.updateDiagnosisByDiagnosisId
);

locationRouter.post("/", locationController.createLocation);
locationRouter.get("/", locationController.getAllLocation);

sessionRouter.get("/", sessionController.getAllSessions);

export default {
  userRouter,
  psikologRouter,
  scheduleRouter,
  historyRouter,
  transaksiRouter,
  diagnosisRouter,
  locationRouter,
  sessionRouter,
};
