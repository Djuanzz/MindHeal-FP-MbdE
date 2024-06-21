<template>
  <div class="my-history container mt-5">
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
            <router-link to="/landing" class="nav-link btn-outline-primary"
              >Schedule</router-link
            >
            <router-link
              to="/user-profile"
              class="nav-link btn-outline-secondary"
              >Profile</router-link
            >
          </div>
        </div>
      </div>
    </nav>
    <header class="text-center mb-5">
      <h1>Your Appointment History</h1>
      <p>Review your past appointments and transaction details here.</p>
    </header>
    <main>
      <div class="history-list">
        <div
          class="card mb-4 shadow-sm"
          v-for="history in histories"
          :key="history.UserHistoryID"
          @click="goToDetail(history.UserHistoryID)">
          <div class="card-body">
            <h5 class="card-title">
              {{ history.ScheduleDate }}
            </h5>
            <p class="card-text">
              Time: {{ history.SessionStart }} - {{ history.SessionEnd }}<br />
              Detail: Click card for more details.
            </p>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import { ref } from "vue";

export default {
  name: "MyHistory",
  data() {
    return {
      histories: ref([]),
    };
  },
  methods: {
    async myHistory() {
      try {
        const response = await fetch("http://localhost:5000/api/user/history", {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });
        const data = await response.json();
        console.log(data);
        this.histories = data.data;
      } catch (error) {
        console.error(error);
      }
    },
    goToDetail(id) {
      this.$router.push({ name: "DetailHistory", params: { id } });
    },
  },
  mounted() {
    this.myHistory();
  },
};
</script>

<style scoped>
.my-history {
  max-width: 800px;
  margin: auto;
  font-family: "Helvetica", sans-serif;
  background: #f8f9fa;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

header h1 {
  color: #333;
  font-weight: bold;
  font-size: 1.8rem;
}

header p {
  color: #666;
  font-size: 1rem;
}

.navbar {
  background: #ffffff;
  border-radius: 8px;
  padding: 0.5rem 1rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
  color: #007bff;
  font-weight: bold;
}

.navbar-toggler {
  border: none;
}

.navbar-nav .nav-link {
  color: #007bff;
  border: 1px solid transparent;
  padding: 0.5rem 1rem;
  margin-left: 0.5rem;
  transition: all 0.3s ease-in-out;
  border-radius: 5px;
}

.navbar-nav .btn-outline-primary {
  border-color: #007bff;
}

.navbar-nav .btn-outline-secondary {
  border-color: #6c757d;
}

.navbar-nav .nav-link:hover,
.navbar-nav .nav-link:focus {
  border-color: #007bff;
  background-color: #f8f9fa;
}

.card {
  background: #ffffff;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.2s ease-in-out;
}

.card:hover {
  transform: translateY(-5px);
}

.card-body {
  padding: 20px;
  background: linear-gradient(to right, #e9efff, #d0e0ff);
}

.card-title {
  color: #003366;
  font-weight: bold;
  font-size: 1.2rem;
}

.card-text {
  color: #333;
  font-size: 1rem;
  line-height: 1.5;
}
</style>
