<template>
  <div class="detail-history container mt-5">
    <!-- Back Button -->
    <div class="back-button mb-4">
      <button @click="goBack" class="btn btn-outline-primary">
        Back to History
      </button>
    </div>

    <!-- Appointment Details -->
    <div class="card">
      <div class="card-body">
        <h1 class="card-title">Appointment Details</h1>
        <p><strong>Date:</strong> {{ detailHistory.ScheduleDate }}</p>
        <p><strong>With:</strong> {{ detailHistory.PsychologistName }}</p>
        <p><strong>Location:</strong> {{ detailHistory.LocationName }}</p>
        <p>
          <strong>Time:</strong> {{ detailHistory.SessionStart }} -
          {{ detailHistory.SessionEnd }}
        </p>
        <p>
          <strong>Diagnosis:</strong> {{ detailHistory.Diagnosis || "N/A" }}
        </p>
      </div>
    </div>
  </div>
</template>

<script>
//import { ref } from "vue";

export default {
  name: "DetailHistory",
  props: ["id"],
  data() {
    return {
      detailHistory: {},
    };
  },
  methods: {
    goBack() {
      this.$router.push({ name: "MyHistoryPage" });
    },
    async fetchDetails() {
      try {
        const response = await fetch(
          `http://localhost:5000/api/historys/detail/${this.id}`,
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        const data = await response.json();
        this.detailHistory = data.data[0];
        console.log(data.data[0]);
      } catch (error) {
        console.error("Failed to fetch details:", error);
      }
    },
  },
  mounted() {
    this.fetchDetails();
  },
};
</script>

<style scoped>
.container {
  max-width: 800px;
  margin: auto;
  font-family: "Helvetica", sans-serif;
  background: #f8f9fa;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.card {
  background: #ffffff;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  margin-top: 20px;
}

.card-body {
  padding: 20px;
  background: linear-gradient(to right, #e9efff, #d0e0ff);
}

.card-title {
  color: #003366;
  font-weight: bold;
  font-size: 1.5rem;
}

.btn-outline-primary {
  color: #007bff;
  border-color: #007bff;
  padding: 0.375rem 0.75rem;
}

.btn-outline-primary:hover {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
}
</style>
