import { db } from "../db/db.js";
import { psikologSeeds } from "./psikolog.seed.js";
import { scheduleSeeds } from "./schedule.seed.js";
import { sessionSeeds } from "./session.seed.js";
import { userSeeds } from "./user.seed.js";
import { locationSeeds } from "./location.seed.js";

const deleteQuery = [
  "DELETE FROM Schedule;",
  "DELETE FROM TransactionBill;",
  "DELETE FROM UserDiagnosis;",
  "DELETE FROM UserHistory;",
  "DELETE FROM Session;",
  "DELETE FROM Psychologist;",
  "DELETE FROM Locations;",
  "DELETE FROM Users;",

  "ALTER TABLE Schedule AUTO_INCREMENT = 1;",
  "ALTER TABLE TransactionBill AUTO_INCREMENT = 1;",
  "ALTER TABLE UserDiagnosis AUTO_INCREMENT = 1;",
  "ALTER TABLE UserHistory AUTO_INCREMENT = 1;",
  "ALTER TABLE Session AUTO_INCREMENT = 1;",
  "ALTER TABLE Psychologist AUTO_INCREMENT = 1;",
  "ALTER TABLE Locations AUTO_INCREMENT = 1;",
  "ALTER TABLE Users AUTO_INCREMENT = 1;",
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
      const userQuery =
        "INSERT INTO Users (Name, Email, Password, DateOfBirth, Address, City, Mobile, Role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
      await db.query(userQuery, [
        element.Name,
        element.Email,
        element.Password,
        element.DateOfBirth,
        element.Address,
        element.City,
        element.Mobile,
        element.Role,
      ]);
      console.log("User seeded:", element);
    }
    console.log("User seed done");

    for (const element of locationSeeds) {
      const locationQuery =
        "INSERT INTO Locations (Name, Address, City, Phone) VALUES (?, ?, ?, ?)";
      await db.query(locationQuery, [
        element.Name,
        element.Address,
        element.City,
        element.Phone,
      ]);
      console.log("Location seeded:", element);
    }
    console.log("Location seed done");

    for (const element of sessionSeeds) {
      const sessionQuery =
        "INSERT INTO session (sessionStart, sessionEnd) VALUES (?, ?)";
      await db.query(sessionQuery, [element.sessionStart, element.sessionEnd]);
      console.log("Session seeded:", element);
    }
    console.log("Session seed done");

    for (const element of psikologSeeds) {
      const psikologQuery =
        "INSERT INTO Psychologist (Name, Email, Specialty, Mobile, VisitPrice, Location_LocationID) VALUES (?, ?, ?, ?, ?, ?)";
      await db.query(psikologQuery, [
        element.Name,
        element.Email,
        element.Specialty,
        element.Mobile,
        element.VisitPrice,
        element.Location_LocationID,
      ]);
      console.log("Psychologist seeded:", element);
    }
    console.log("Psychologist seed done");

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
