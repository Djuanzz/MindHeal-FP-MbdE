import { db } from "../db/db.js";
import { psikologSeeds } from "./psikolog.seed.js";
import { scheduleSeeds } from "./schedule.seed.js";
import { sessionSeeds } from "./session.seed.js";
import { userSeeds } from "./user.seed.js";

const deleteQuery = [
  "DELETE FROM UserHistory;",
  "DELETE FROM Transaction;",
  "DELETE FROM Schedule;",
  "DELETE FROM Session;",
  "DELETE FROM Psychologist;",
  "DELETE FROM User;",
  "ALTER TABLE Psychologist AUTO_INCREMENT = 1;",
  "ALTER TABLE Schedule AUTO_INCREMENT = 1;",
  "ALTER TABLE Session AUTO_INCREMENT = 1;",
  "ALTER TABLE Transaction AUTO_INCREMENT = 1;",
  "ALTER TABLE User AUTO_INCREMENT = 1;",
  "ALTER TABLE UserHistory AUTO_INCREMENT = 1;",
];

const seed = async () => {
  try {
    for (const query of deleteQuery) {
      await db.query(query);
    }
    console.log("Delete and reset queries executed successfully");
  } catch (err) {
    console.error("Error executing the delete query:", err);
    return;
  }

  try {
    for (const element of userSeeds) {
      const role = element.role ? element.role : "user";
      const userQuery =
        "INSERT INTO user (name, email, password, role) VALUES (?, ?, ?, ?)";
      await db.query(userQuery, [
        element.name,
        element.email,
        element.password,
        role,
      ]);
      console.log("User seeded:", element);
    }
    console.log("User seed done");

    for (const element of psikologSeeds) {
      const psikologQuery =
        "INSERT INTO psychologist (Name, Email) VALUES (?, ?)";
      await db.query(psikologQuery, [element.Name, element.Email]);
      console.log("Psychologist seeded:", element);
    }
    console.log("Psychologist seed done");

    for (const element of sessionSeeds) {
      const sessionQuery =
        "INSERT INTO session (sessionStart, sessionEnd) VALUES (?, ?)";
      await db.query(sessionQuery, [element.sessionStart, element.sessionEnd]);
      console.log("Session seeded:", element);
    }
    console.log("Session seed done");

    for (const element of scheduleSeeds) {
      const scheduleQuery =
        "INSERT INTO schedule (ScheduleDate, Psychologist_PsychologistID, Session_SessionID) VALUES (?, ?, ?)";
      await db.query(scheduleQuery, [
        element.ScheduleDate,
        element.Psychologist_PsychologistID,
        element.Session_SessionID,
      ]);
      console.log("Schedule seeded:", element);
    }
  } catch (err) {
    console.error("Error seeding data:", err);
  } finally {
    await db.end();
    console.log("Database connection closed");
  }
};

seed();
