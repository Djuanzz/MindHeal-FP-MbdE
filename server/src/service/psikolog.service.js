import { db } from "../db/db.js";
import { validate } from "../validation/validation.js";
import psikologValidation from "../validation/psikolog.validation.js";

const getAllPsikolog = async () => {
  const [rows, fields] = await db.query("SELECT * FROM Psychologist");
  return rows;
};

const getPsikologById = async (id) => {
  const [rows, fields] = await db.query(
    "SELECT * FROM Psychologist WHERE PsychologistID = ?",
    [id]
  );
  return rows;
};

const createPsikolog = async (req) => {
  const psikolog = validate(psikologValidation.registerValidation, req);

  const countPsikologQuery =
    "SELECT COUNT(*) as count FROM Psychologist WHERE Email = ?";
  const [countPsi] = await db.query(countPsikologQuery, [psikolog.Email]);

  if (countPsi[0].count > 0) {
    throw new Error("Email already exists");
  }

  const newPsikologQuery =
    "INSERT INTO Psychologist (Name, Email, Specialty, Mobile, VisitPrice, Location_LocationID) VALUES (?, ?, ?, ?, ?, ?)";

  const [result] = await db.query(newPsikologQuery, [
    psikolog.Name,
    psikolog.Email,
    psikolog.Specialty,
    psikolog.Mobile,
    psikolog.VisitPrice,
    psikolog.Location_LocationID,
  ]);

  return psikolog;
};

const deletePsikolog = async (req) => {
  const id = req.PsychologistID;
  const deletePsikologQuery = `
  DELETE FROM Psychologist
  WHERE PsychologistID = ?
  `;

  const [result] = await db.query(deletePsikologQuery, [id]);

  return result;
};

const getTotalPatientHandled = async (psychologistId) => {
  const getTotalPatientHandledQuery = `
SELECT GetTotalPatientsHandled(?) AS TotalPatients
  `;

  const [result] = await db.query(getTotalPatientHandledQuery, [
    psychologistId,
  ]);

  return result;
};

export default {
  getAllPsikolog,
  getPsikologById,
  createPsikolog,
  deletePsikolog,
  getTotalPatientHandled,
};
