import { db } from "../db/db.js";

const createLocation = async (req) => {
  const location = req;
  const newLocationQuery =
    "INSERT INTO Locations (Name, Address, City, Phone) VALUES (?, ?, ?, ?)";
  const [result] = await db.query(newLocationQuery, [
    location.Name,
    location.Address,
    location.City,
    location.Phone,
  ]);

  return location;
};

const getAllLocation = async () => {
  const locationQuery = "SELECT * FROM Locations";
  const [location] = await db.query(locationQuery);

  return location;
};

export default {
  createLocation,
  getAllLocation,
};
