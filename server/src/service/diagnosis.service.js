import { db } from "../db/db.js";

const createDiagnosis = async (req) => {
  const diagnosis = req;
  const newDiagnosisQuery =
    "INSERT INTO UserDiagnosis (DiagnosisType, DiagnosisStatus, SeverityLevel, SymptompsDescription, TreatmentPlan, DiagnosisDate, Notes, UserHistory_UserHistoryID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
  const [result] = await db.query(newDiagnosisQuery, [
    diagnosis.DiagnosisType,
    diagnosis.DiagnosisStatus,
    diagnosis.SeverityLevel,
    diagnosis.SymptompsDescription,
    diagnosis.TreatmentPlan,
    diagnosis.DiagnosisDate,
    diagnosis.Notes,
    diagnosis.UserHistory_UserHistoryID,
  ]);

  return diagnosis;
};

export default {
  createDiagnosis,
};
