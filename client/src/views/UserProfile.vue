<template>
  <div class="user-profile container mt-5">
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
            <router-link to="/landing" class="nav-link btn-outline-primary mx-2"
              >Schedule</router-link
            >
            <router-link
              to="/my-history"
              class="nav-link btn-outline-secondary mx-2"
              >My History</router-link
            >
            <button
              class="nav-link btn-outline-secondary mx-2 logout"
              @click="logout">
              Logout
            </button>
          </div>
        </div>
      </div>
    </nav>
    <header class="text-center mb-5">
      <h1>Your Profile</h1>
      <p>Manage your personal information and settings.</p>
    </header>

    <section class="profile-data mb-4">
      <h2>Your Information</h2>
      <table class="table table-striped">
        <tbody>
          <tr>
            <th>Name</th>
            <td>{{ user.Name }}</td>
          </tr>
          <tr>
            <th>Email</th>
            <td>{{ user.Email }}</td>
          </tr>
          <tr>
            <th>Date of Birth</th>
            <td>{{ user.DateOfBirth }}</td>
          </tr>
          <tr>
            <th>Address</th>
            <td>{{ user.Address }}</td>
          </tr>
          <tr>
            <th>City</th>
            <td>{{ user.City }}</td>
          </tr>
          <tr>
            <th>Mobile</th>
            <td>{{ user.Mobile }}</td>
          </tr>
          <tr>
            <th>Count Consultation</th>
            <td>{{ countConsultation }}</td>
          </tr>
        </tbody>
      </table>
    </section>

    <!-- Top 3 Locations Visited -->
    <section class="top-locations mb-4">
      <h2>Top 3 Locations Visited</h2>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Location Name</th>
            <th>Address</th>
            <th>City</th>
            <th>Visit Count</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(location, index) in topLocations" :key="index">
            <td>{{ location.LocationName || "" }}</td>
            <td>{{ location.Address || "" }}</td>
            <td>{{ location.City || "" }}</td>
            <td>{{ location.VisitCount || "" }}</td>
          </tr>
          <!-- Display empty rows if less than 3 locations -->
          <tr v-for="index in emptyRows" :key="'empty' + index">
            <td colspan="4"></td>
          </tr>
        </tbody>
      </table>
    </section>

    <main>
      <form @submit.prevent="updateProfile" class="profile-form mb-4">
        <div class="form-group mb-4">
          <label for="username">Name:</label>
          <input
            type="text"
            id="name"
            v-model="user.Name"
            class="form-control" />
        </div>
        <div class="form-group mb-4">
          <label for="email">Email:</label>
          <input
            type="email"
            id="email"
            v-model="user.Email"
            class="form-control" />
        </div>
        <button type="submit" class="btn btn-primary">Update Profile</button>
      </form>
      <form @submit.prevent="updatePassword" class="password-form">
        <div class="form-group mb-4">
          <label for="current-password">Current Password:</label>
          <input
            type="password"
            id="current-password"
            v-model="passwords.Password"
            class="form-control" />
        </div>
        <div class="form-group mb-4">
          <label for="new-password">New Password:</label>
          <input
            type="password"
            id="new-password"
            v-model="passwords.NewPassword"
            class="form-control" />
        </div>
        <div class="form-group mb-4">
          <label for="confirm-password">Confirm New Password:</label>
          <input
            type="password"
            id="confirm-password"
            v-model="passwords.Confirm"
            class="form-control" />
        </div>
        <button type="submit" class="btn btn-secondary">Update Password</button>
      </form>
    </main>
  </div>
</template>
<script>
import { ref } from "vue";

export default {
  name: "UserProfile",
  data() {
    return {
      user: ref({}),
      countConsultation: ref(0),
      topLocations: ref([]),
      passwords: {
        Password: "",
        NewPassword: "",
        Confirm: "",
      },
    };
  },
  computed: {
    emptyRows() {
      return 3 - this.topLocations.length;
    },
  },
  methods: {
    async updateProfile() {
      try {
        const response = await fetch("http://localhost:5000/api/user", {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
          body: JSON.stringify(this.user),
        });
        const data = await response.json();
        this.user = data.data;
        console.log("Profile updated:", data);
      } catch (err) {
        console.error("Error:", err);
      }
    },
    async updatePassword() {
      try {
        if (this.passwords.NewPassword !== this.passwords.Confirm) {
          alert("New passwords do not match.");
          return;
        }

        const response = await fetch("http://localhost:5000/api/user", {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
          body: JSON.stringify(this.passwords),
        });

        const data = await response.json();
        console.log(data);
        alert("Password updated successfully.");
      } catch (err) {
        alert("Failed to update password.");
      }
    },
    async currentUser() {
      try {
        const response = await fetch("http://localhost:5000/api/user/me", {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });
        const data = await response.json();
        this.user = data.data;
        console.log("User:", data);
      } catch (error) {
        console.error("Error:", error);
      }
    },

    async logout() {
      try {
        const response = await fetch("http://localhost:5000/api/user/logout", {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        });
        const data = await response.json();
        console.log("Logout:", data);
        localStorage.removeItem("token");
        this.$router.push({ name: "HomePage" });
      } catch (err) {
        console.error("Error:", err);
      }
    },

    async fetchCountConsultation() {
      try {
        const response = await fetch(
          "http://localhost:5000/api/user/count-consultation",
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        const data = await response.json();
        this.countConsultation = data.data.ConsultationCount;
        console.log("Consultation count:", this.countConsultation);
      } catch (error) {
        console.error("Error:", error);
      }
    },

    async fetchTopLocations() {
      try {
        const response = await fetch(
          "http://localhost:5000/api/user/top-location",
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
          }
        );
        const data = await response.json();
        this.topLocations = data.data.slice(0, 3); // Limit to top 3 locations
        console.log("Top locations:", this.topLocations);
      } catch (error) {
        console.error("Error:", error);
      }
    },
  },

  mounted() {
    this.currentUser();
    this.fetchCountConsultation();
    this.fetchTopLocations();
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
</style>
