<template>
    <div class="landing-page container mt-5">
      <header class="text-center mb-5">
        <h1>Welcome to MindHeal.com</h1>
        <p>Select a day to view available sessions and book your appointment.</p>
      </header>
      <main>
        <ul class="nav nav-pills nav-fill mb-3">
          <li class="nav-item" v-for="day in days" :key="day">
            <a class="nav-link" :class="{ active: selectedDay === day }" @click="selectDay(day)">
              {{ day }}
            </a>
          </li>
        </ul>
        <div class="schedule-cards">
          <div class="card mb-4 shadow-sm" v-for="(schedule, index) in schedules" :key="index">
            <div class="card-body">
              <h5 class="card-title">{{ schedule.date }}</h5>
              <p class="card-text">{{ schedule.name }}<br>{{ schedule.time }}</p>
              <button class="btn btn-success" @click="goToTransaction">Book Appointment</button>
            </div>
          </div>
        </div>
      </main>
    </div>
  </template>

<script>
export default {
  name: 'LandingPage',
  data() {
    return {
      days: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
      selectedDay: 'Tuesday',
      schedules: [
        { name: 'Dr. Adnan Abdullah Juan S.Psi', time: '10:00 AM - 11:50 AM', date: 'DD-MM-YYYY' },
        { name: 'Dr. Adnan Abdullah Juan S.Psi', time: '1:10 PM - 3:00 PM', date: 'DD-MM-YYYY' },
        { name: 'Dr. Adnan Abdullah Juan S.Psi', time: '4:00 PM - 5:50 PM', date: 'DD-MM-YYYY' }
      ]
    };
  },
  methods: {
    selectDay(day) {
      this.selectedDay = day;
      
    },
    goToTransaction() {
      this.$router.push({ name: 'TransactionPage' });
    }
  }
};
</script>

<style scoped>
.landing-page {
  font-family: 'Helvetica Neue', Arial, sans-serif;
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
  box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
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
