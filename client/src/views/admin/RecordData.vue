<template>
  <div class="user-profile container mt-5">
    <!-- Top 5 Psychologists Scheduled -->
    <section class="top-psychologists mb-4">
      <h2>Top 5 Psychologists Scheduled</h2>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Psychologist ID</th>
            <th>Name</th>
            <th>Schedule Count</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(psychologist, index) in topPsikolog" :key="index">
            <td>{{ psychologist.PsychologistID }}</td>
            <td>{{ psychologist.Name }}</td>
            <td>{{ psychologist.ScheduleCount }}</td>
          </tr>
          <!-- Display empty rows if less than 5 psychologists -->
          <tr v-for="index in emptyRows" :key="'empty' + index">
            <td colspan="3"></td>
          </tr>
        </tbody>
      </table>
    </section>

    <router-link to="/admin/dashboard" class="back-to-dashboard">
      Back to Dashboard
    </router-link>
  </div>
</template>
<script>
import { ref } from "vue";

export default {
  name: "RecordData",
  data() {
    return {
      topPsikolog: ref([]),
    };
  },
  computed: {},
  methods: {
    async getTopPsychologist() {
      try {
        const response = await fetch(
          "http://localhost:5000/api/psikolog/top/psikolog",
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        const responseData = await response.json();
        this.topPsikolog = responseData.data;
        // console.log(responseData.data);
      } catch (error) {
        console.error(error);
      }
    },
  },

  mounted() {
    this.getTopPsychologist();
  },
};
</script>
<style scoped>
.user-profile {
  max-width: 600px;
  margin: auto;
  font-family: "Helvetica", sans-serif;
  background: #ffffff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

.profile-form,
.password-form {
  background: #f4f4f8;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  color: #495057;
  font-weight: 500;
  margin-bottom: 0.5rem;
}

.form-control {
  display: block;
  width: 100%;
  padding: 0.75rem 1rem;
  font-size: 1rem;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control:focus {
  border-color: #80bdff;
  outline: 0;
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.btn-primary {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
  padding: 10px 20px;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
    border-color 0.15s ease-in-out;
}

.btn-primary:hover {
  background-color: #0056b3;
  border-color: #004085;
}

.btn-secondary {
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
  padding: 10px 20px;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
    border-color 0.15s ease-in-out;
}

.btn-secondary:hover {
  background-color: #0056b3;
  border-color: #004085;
}

.back-to-dashboard {
  display: block;
  margin-top: 30px;
  text-align: center;
  padding: 10px 20px;
  background: #3498db;
  color: white;
  border-radius: 8px;
  text-decoration: none;
  transition: background 0.3s;
}

.back-to-dashboard:hover {
  background: #2980b9;
}
</style>
