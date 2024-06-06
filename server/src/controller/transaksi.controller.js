import transaksiService from "../service/transaksi.service.js";

const getAllTransaksi = async (req, res, next) => {
  try {
    const transaksi = await transaksiService.getAllTransaksi();
    res.status(200).json({
      data: transaksi,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const createTransaksi = async (req, res, next) => {
  try {
    const result = await transaksiService.createTransaksi(req.body);
    res.status(201).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const updateTransaksiByUserHistory = async (req, res, next) => {
  try {
    const result = await transaksiService.updateTransaksiByUserHistory(
      req.body
    );
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

const deleteTransaksiByUserHistory = async (req, res, next) => {
  try {
    const result = await transaksiService.deleteTransaksiByUserHistory(
      req.body
    );
    res.status(200).json({
      data: result,
      message: "done",
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

export default {
  getAllTransaksi,
  createTransaksi,
  updateTransaksiByUserHistory,
  deleteTransaksiByUserHistory,
};
