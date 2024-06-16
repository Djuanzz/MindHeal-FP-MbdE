import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import cookieParser from "cookie-parser";
import { router as publicRouter } from "./routes/public.router.js";
import api from "./routes/api.js";

dotenv.config();

const app = express();
app.use(
  cors({
    credentials: true,
    origin: "http://localhost:8080",
  })
);
app.use(express.json());
app.use(cookieParser());

app.use("/api", publicRouter);
app.use("/api/user", api.userRouter);
app.use("/api/psikolog", api.psikologRouter);
app.use("/api/schedule", api.scheduleRouter);
app.use("/api/transaksi", api.transaksiRouter);
app.use("/api/diagnosis", api.diagnosisRouter);
app.use("/api/location", api.locationRouter);
app.use("/api/session", api.sessionRouter);

app.listen(process.env.PORT, () => {
  console.log(`Server is running on port ${process.env.PORT}`);
});
