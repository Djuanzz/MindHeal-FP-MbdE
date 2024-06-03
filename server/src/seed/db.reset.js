import { db } from "../db/db.js";

const resetQuery = [
  "DELETE FROM Schedule;",
  "DELETE FROM Transaction;",
  "DELETE FROM UserHistory;",
  "DELETE FROM Session;",
  "DELETE FROM Psychologist;",
  "DELETE FROM User;",

  "DROP TABLE IF EXISTS Schedule;",
  "DROP TABLE IF EXISTS Transaction;",
  "DROP TABLE IF EXISTS UserHistory;",
  "DROP TABLE IF EXISTS Session;",
  "DROP TABLE IF EXISTS Psychologist;",
  "DROP TABLE IF EXISTS User;",
];

const resetDb = async () => {
  try {
    for (const query of resetQuery) {
      await db.query(query);
    }
    console.log("Reset queries executed successfully");
  } catch (err) {
    console.error("Error executing the reset query:", err);
    return;
  } finally {
    await db.end();
  }
};

resetDb();
