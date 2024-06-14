<template>
  <div class="landing-page container mt-5">
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">MindHeal.com</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNavAltMarkup"
          aria-controls="navbarNavAltMarkup"
          aria-expanded="false"
          aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav ms-auto">
            <router-link
              to="/my-history"
              class="nav-link btn-outline-secondary mx-2"
              >My History</router-link
            >
            <router-link
              to="/user-profile"
              class="nav-link btn-outline-secondary mx-2"
              >Profile</router-link
            >
          </div>
        </div>
      </div>
    </nav>

    <header class="text-center mb-5">
      <h1>Welcome to MindHeal.com</h1>
      <p>Select a location and day to view available sessions and book your appointment.</p>
    </header>
    <main>
      <div class="mb-3">
        <label for="locationSelect" class="form-label">Select Location</label>
        <select id="locationSelect" class="form-select" v-model="selectedLocation" @change="fetchSchedules">
          <option v-for="location in locations" :key="location.id" :value="location.name">{{ location.name }}</option>
        </select>
      </div>

      <ul class="nav nav-pills nav-fill mb-3">
        <li class="nav-item" v-for="day in dateDay" :key="day.day">
          <a
            class="nav-link btn"
            :class="{ active: selectedDay === day.day }"
            @click="selectDay(day)">
            {{ day.day }}
          </a>
        </li>
      </ul>

      <div class="schedule-cards">
        <div v-if="schedules.length === 0">
          <p>No schedules available.</p>
        </div>
        <div
          v-else
          class="card mb-4 shadow-sm"
          v-for="(schedule, index) in schedules"
          :key="index">
          <div class="card-body">
            <h5 class="card-title">{{ schedule.ScheduleDate }}</h5>
            <p class="card-text">
              {{ schedule.PsychologistName }}<br />{{ schedule.SessionStart }}
              -
              {{ schedule.SessionEnd }}
            </p>
            <button class="btn btn-success" @click="bookAppointment(schedule)">
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
        { day: "Monday", date: ref("") },
        { day: "Tuesday", date: ref("") },
        { day: "Wednesday", date: ref("") },
        { day: "Thursday", date: ref("") },
        { day: "Friday", date: ref("") },
        { day: "Saturday", date: ref("") },
      ],
      selectedDay: ref(""),
      currDate: ref(""),
      schedules: ref([]),
      locations: ref([]),
      selectedLocation: ref(""),
    };
  },
  methods: {
    async fetchSchedules() {
      try {
        const req = await fetch("http://localhost:5000/api/schedule/day-location", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            date: this.currDate,
            location: this.selectedLocation,
          }),
        });

        const data = await req.json();
        this.schedules = data.data;
      } catch (error) {
        console.error(error);
        alert("Error fetching schedules");
      }
    },
    async selectDay(day) {
      this.selectedDay = day.day;
      this.currDate = day.date;
      await this.fetchSchedules();
    },
    async initDateDay() {
      try {
        const response = await fetch("http://localhost:5000/api/schedule/week");
        const data = await response.json();

        if (data.data.length > 0) {
          for (let i = 0; i < this.dateDay.length; i++) {
            for (let j = 0; j < data.data.length; j++) {
              if (this.dateDay[i].day == data.data[j].DayName) {
                this.dateDay[i].date = data.data[j].ScheduleDate;
              }
            }
          }
        }

        data.data.forEach((d, i) => {
          if (this.dateDay[i].day == d.DayName) {
            this.dateDay[i].date = d.ScheduleDate;
          }
        });
      } catch (error) {
        console.error(error);
      }
    },
    async fetchLocations() {
      try {
        const response = await fetch("http://localhost:5000/api/locations");
        const data = await response.json();
        this.locations = data.data;
      } catch (error) {
        console.error(error);
      }
    },
    async bookAppointment(schedule) {
      try {
        const response = await fetch("http://localhost:5000/api/book", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
          body: JSON.stringify({
            scheduleId: schedule.id,
            location: this.selectedLocation,
          }),
        });

        if (response.ok) {
          this.$router.push({ name: "MyHistory" });
        } else {
          alert("Error booking appointment");
        }
      } catch (error) {
        console.error(error);
      }
    },
    initSelectedDay() {
      const today = new Date();
      const da = String(today.getDate()).padStart(2, "0");
      const month = String(today.getMonth() + 1).padStart(2, "0");
      const year = today.getFullYear();
      const formattedDate = `${year}-${month}-${da}`;

      let dayName;

      today.getDay() === 0
        ? (dayName = "Sunday")
        : (dayName = this.dateDay[today.getDay() - 1].day);

      return { dayName, formattedDate };
    },
  },
  mounted() {
    this.initDateDay();
    this.fetchLocations();
    const { dayName, formattedDate } = this.initSelectedDay();
    this.selectedDay = dayName;
    this.currDate = formattedDate;
    this.selectDay({ day: this.selectedDay, date: this.currDate });
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
