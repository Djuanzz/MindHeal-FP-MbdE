import { json } from "express";
import sessionService from "../service/session.service.js";

const getAllSessions = async (req, res) => {
  try {
    const sessions = await sessionService.getAllSessions();
    res.status(200).json({
      data: sessions,
      message: "done",
    });
  } catch (error) {
    res.status(500).send(error.message);
  }
};

export default {
  getAllSessions,
};
