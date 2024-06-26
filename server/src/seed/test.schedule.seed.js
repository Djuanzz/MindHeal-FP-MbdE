import fs from "fs";

const countPsychologist = 10;
const countSession = 3;

// Generate schedules
const generateSchedules = () => {
  const startDate = new Date("2024-02-01");
  const endDate = new Date("2024-06-30");
  const schedules = [];

  while (startDate <= endDate) {
    for (let i = 0; i < 100; i++) {
      const randomPsychologist =
        Math.floor(Math.random() * countPsychologist) + 1;
      const randomSession = Math.floor(Math.random() * countSession) + 1;

      const scheduleDate = new Date(startDate);
      scheduleDate.setDate(
        startDate.getDate() + Math.floor(Math.random() * 29)
      );

      if (scheduleDate <= endDate) {
        schedules.push({
          ScheduleDate: scheduleDate.toISOString().split("T")[0],
          Psychologist_PsychologistID: randomPsychologist,
          Session_SessionID: randomSession,
        });
      }
    }
    startDate.setMonth(startDate.getMonth() + 1); // Move to the next month
  }

  return schedules;
};

const scheduleSeeds = generateSchedules();

fs.writeFileSync("scheduleSeeds.json", JSON.stringify(scheduleSeeds, null, 2));

console.log("Schedule seeds have been saved to scheduleSeeds.json");
