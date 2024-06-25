import diagnosisService from "../service/diagnosis.service.js";

const createDiagnosis = async (req, res) => {
  try {
    const result = await diagnosisService.createDiagnosis(req.body);
    res.status(201).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
  }
};

const getDiagnosisByUserHistoryId = async (req, res) => {
  try {
    const result = await diagnosisService.getDiagnosisByUserHistoryId(
      req.params.userHistoryId
    );
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
  }
};

export default {
  createDiagnosis,
  getDiagnosisByUserHistoryId,
};
