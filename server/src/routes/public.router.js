import express from "express";
import userController from "../controller/user.controller.js";
import psikologController from "../controller/psikolog.controller.js";
import historyController from "../controller/history.controller.js";

const router = express.Router();

// --- HARUSE ADMIN ONLY
router.get("/users", userController.getAllUsers);
router.get("/historys", historyController.getAllUserHistory);
router.get("/users/:id", userController.getUserByUserID);
router.get("/historys/:id", historyController.getUserHistoryByUserId);

router.post("/register", userController.register);
router.post("/login", userController.login);
router.get("/psikologs", psikologController.getAllPsikolog);

export { router };
