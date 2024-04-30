import express from "express";
import userController from "../controller/user.controller.js";

const router = new express.Router();

// router.get("/", (req, res) => {
//   res.send("wokeyy sudah bekerja yagesyak");
// });

router.post("/signup", userController.signUp);
router.post("/signin", userController.signIn);

export { router };
