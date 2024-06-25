import { db } from "../db/db.js";

const createDiagnosis = async (req) => {
  const diagnosis = req;
  const newDiagnosisQuery = "CALL InsertUserDiagnosis(?, ?, ?, ?, ?, ?, ?, ?);";
  const [result] = await db.query(newDiagnosisQuery, [
    diagnosis.UserHistory_UserHistoryID,
    diagnosis.DiagnosisType,
    diagnosis.DiagnosisStatus,
    diagnosis.SeverityLevel,
    diagnosis.SymptompsDescription,
    diagnosis.TreatmentPlan,
    diagnosis.DiagnosisDate,
    diagnosis.Notes,
  ]);

  return diagnosis;
};

const getDiagnosisByUserHistoryId = async (userHistoryId) => {
  const diagnosisQuery =
    "SELECT * FROM UserDiagnosis WHERE UserHistory_UserHistoryID = ?";
  const [diagnosis] = await db.query(diagnosisQuery, [userHistoryId]);

  return diagnosis;
};

const updateDiagnosisByDiagnosisId = async (req) => {
  const diagnosis = req;
  const updateDiagnosisQuery =
    "CALL UpdateUserDiagnosis (?, ?, ?, ?, ?, ?, ?, ?)";
  const [result] = await db.query(updateDiagnosisQuery, [
    diagnosis.UserDiagnosisID,
    diagnosis.DiagnosisType,
    diagnosis.DiagnosisStatus,
    diagnosis.SeverityLevel,
    diagnosis.SymptompsDescription,
    diagnosis.TreatmentPlan,
    diagnosis.DiagnosisDate,
    diagnosis.Notes,
  ]);

  return diagnosis;
};

export default {
  createDiagnosis,
  getDiagnosisByUserHistoryId,
  updateDiagnosisByDiagnosisId,
};
