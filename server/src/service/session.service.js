import { db } from "../db/db.js";

const getAllSessions = async () => {
  const query = "SELECT * FROM Session";
  const [sessions] = await db.query(query);

  return sessions;
};

export default {
  getAllSessions,
};
