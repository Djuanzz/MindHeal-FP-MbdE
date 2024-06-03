import { db } from "../db/db.js";

const resetQuery = [
  "DELETE FROM Transaction;",
  "DELETE FROM UserHistory;",
  "DELETE FROM Schedule;",
  "DELETE FROM Session;",
  "DELETE FROM Psychologist;",
  "DELETE FROM User;",

  "DROP TABLE Transaction;",
  "DROP TABLE UserHistory;",
  "DROP TABLE Schedule;",
  "DROP TABLE Session;",
  "DROP TABLE Psychologist;",
  "DROP TABLE User;",

  "ALTER TABLE Psychologist AUTO_INCREMENT = 1;",
  "ALTER TABLE Schedule AUTO_INCREMENT = 1;",
  "ALTER TABLE Session AUTO_INCREMENT = 1;",
  "ALTER TABLE Transaction AUTO_INCREMENT = 1;",
  "ALTER TABLE User AUTO_INCREMENT = 1;",
  "ALTER TABLE UserHistory AUTO_INCREMENT = 1;",
];
