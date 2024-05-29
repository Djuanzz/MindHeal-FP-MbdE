<template>
  <div class="landing-page container mt-5">
    <header class="text-center mb-5">
      <h1>Welcome to MindHeal.com</h1>
      <p>Select a day to view available sessions and book your appointment.</p>
    </header>
    <main>
      <ul class="nav nav-pills nav-fill mb-3">
        <li class="nav-item" v-for="day in dateDay" :key="day.day">
          <a
            class="nav-link"
            :class="{ active: selectedDay === day.day }"
            @click="selectDay(day)">
            {{ day.day }}
          </a>
        </li>
      </ul>

      <div class="schedule-cards">
        <div
          class="card mb-4 shadow-sm"
          v-for="(schedule, index) in schedules"
          :key="index">
          <div class="card-body">
            <h5 class="card-title">{{ schedule.date }}</h5>
            <p class="card-text">
              {{ schedule.name }}<br />{{ schedule.time }}
            </p>
            <button class="btn btn-success" @click="goToTransaction">
              Book Appointment
            </button>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import { ref } from "vue";

export default {
  name: "LandingPage",
  data() {
    return {
      dateDay: [
        {
          day: "Monday",
          date: ref(""),
        },
        {
          day: "Tuesday",
          date: ref(""),
        },
        {
          day: "Wednesday",
          date: ref(""),
        },
        {
          day: "Thursday",
          date: ref(""),
        },
        {
          day: "Friday",
          date: ref(""),
        },
        {
          day: "Saturday",
          date: ref(""),
        },
      ],
      selectedDay: ref(""),
      schedules: [
        {
          name: "Dr. Adnan Abdullah Juan S.Psi",
          time: "10:00 AM - 11:50 AM",
          date: "DD-MM-YYYY",
        },
        {
          name: "Dr. Adnan Abdullah Juan S.Psi",
          time: "1:10 PM - 3:00 PM",
          date: "DD-MM-YYYY",
        },
        {
          name: "Dr. Adnan Abdullah Juan S.Psi",
          time: "4:00 PM - 5:50 PM",
          date: "DD-MM-YYYY",
        },
      ],
    };
  },
  methods: {
    selectDay(day) {
      this.selectedDay = day.day;
      console.log(`Selected day: ${day.day}`);
      console.log(`Selected date: ${day.date}`);
    },
    goToTransaction() {
      this.$router.push({ name: "TransactionPage" });
    },
    initSelectedDay() {
      const today = new Date();
      const da = String(today.getDate()).padStart(2, "0");
      const month = String(today.getMonth() + 1).padStart(2, "0");
      const year = today.getFullYear();
      const formattedDate = `${da}/${month}/${year}`;

      let dayName;

      today.getDay() === 0
        ? (dayName = "Sunday")
        : (dayName = this.dateDay[today.getDay() - 1].day);

      console.log(`Tanggal: ${formattedDate}`);
      console.log(`Hari: ${dayName}`);
      return dayName;
    },

    async initDateDay() {
      try {
        const response = await fetch("http://localhost:5000/api/schedule/week");
        const data = await response.json();
        // console.log(data.data);

        for (let i = 0; i < this.dateDay.length; i++) {
          this.dateDay[i].date = data.data[i].ScheduleDate;
        }
        // this.dateDay.forEach((d) => {
        //   console.log(d);
        // });
      } catch (error) {
        console.error(error);
      }
    },
  },
  mounted() {
    this.initDateDay();
    this.selectedDay = this.initSelectedDay();
  },
};
</script>

<style scoped>
.landing-page {
  font-family: "Helvetica Neue", Arial, sans-serif;
  color: #333;
}

header h1 {
  color: #007bff;
  font-weight: 300;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

header p {
  color: #6c757d;
  font-size: 1.2rem;
}

.nav-pills .nav-link {
  border-radius: 0.25rem;
  font-weight: bold;
  color: #007bff;
  background-color: #e7f0fd;
  transition: background-color 0.3s, color 0.3s;
}

.nav-pills .nav-link.active {
  background-color: #0056b3;
  color: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
}

.card {
  transition: transform 0.2s ease-in-out;
  border: 1px solid #b8daff;
  background: linear-gradient(to bottom right, #cce5ff, #99ccff);
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-title {
  color: #0056b3;
  font-weight: bold;
}

.card-text {
  margin-bottom: 1rem;
  font-size: 1rem;
  color: #333;
}

.btn-primary {
  background-color: #007bff;
  border-color: #006fe6;
  transition: background-color 0.2s, border-color 0.2s;
}

.btn-primary:hover {
  background-color: #0062cc;
  border-color: #005cbf;
}

.schedule-cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1rem;
}
</style>
