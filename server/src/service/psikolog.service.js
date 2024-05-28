import { db } from "../db/db.js";
import { validate } from "../validation/validation.js";
import psikologValidation from "../validation/psikolog.validation.js";

const getAllPsikolog = async () => {
  const [rows, fields] = await db.query("SELECT * FROM psychologist");
  return rows;
};

const getPsikologById = async (id) => {
  const [rows, fields] = await db.query(
    "SELECT * FROM psychologist WHERE PsychologistID = ?",
    [id]
  );
  return rows;
};

const createPsikolog = async (req) => {
  console.log(req);
  const psikolog = validate(psikologValidation.registerValidation, req);

  console.log(psikolog);

  const countPsikologQuery =
    "SELECT COUNT(*) as count FROM psychologist WHERE Email = ?";
  const [countPsi] = await db.query(countPsikologQuery, [psikolog.Email]);

  if (countPsi[0].count > 0) {
    throw new Error("Email already exists");
  }

  const newPsikologQuery =
    "INSERT INTO psychologist (Name, Email) VALUES (?, ?)";

  const [result] = await db.query(newPsikologQuery, [
    psikolog.Name,
    psikolog.Email,
  ]);

  return psikolog;
};

export default {
  getAllPsikolog,
  getPsikologById,
  createPsikolog,
};
