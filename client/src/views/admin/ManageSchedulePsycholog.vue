<template>
  <div class="manage-psychologists">
    <h1>Manage Psychologists Schedule</h1>
    <form @submit.prevent="addPsychologist" class="psychologist-form">
      <select v-model="newPsychologist.name" required>
        <option disabled value="">Select a psychologist</option>
        <option
          v-for="psychologist in psychologistList"
          :key="psychologist.PsychologistID"
          :value="psychologist.PsychologistID">
          {{ psychologist.Name }}
        </option>
      </select>
      <input type="date" v-model="newPsychologist.schedule" required />
      <select v-model="newPsychologist.location" required>
        <option disabled value="">Select a location</option>
        <option
          v-for="location in locationList"
          :key="location.LocationID"
          :value="location.LocationID">
          {{ location.Name }}
        </option>
      </select>
      <select v-model="newPsychologist.session" required>
        <option disabled value="">Select a session</option>
        <option
          v-for="session in sessionList"
          :key="session.SessionID"
          :value="session.SessionID">
          {{ session.SessionStart }} - {{ session.SessionEnd }}
        </option>
      </select>
      <button type="submit" :disabled="!isValid">
        Add Psychologist Schedule
      </button>
    </form>
    <div class="psychologist-list">
      <div
        v-for="psychologist in psychologists"
        :key="psychologist.ScheduleID"
        class="psychologist-item">
        <p>
          {{ psychologist.ScheduleDate }} - {{ psychologist.ScheduleStatus }} -
          {{ psychologist.location }} - {{ psychologist.session }}
        </p>
      </div>
    </div>
    <router-link to="/admin/dashboard" class="back-to-dashboard"
      >Back to Dashboard</router-link
    >
  </div>
</template>

<script>
import { ref, computed } from "vue";

export default {
  name: "ManageSchedulePsycholog",
  setup() {
    const newPsychologist = ref({
      name: "",
      schedule: "",
      location: "",
      session: "",
    });

    const psychologistList = ref([]);

    const locationList = ref([]);

    const sessionList = ref([]);

    const psychologists = ref([]);

    const isValid = computed(() => {
      return (
        newPsychologist.value.name &&
        newPsychologist.value.schedule &&
        newPsychologist.value.location &&
        newPsychologist.value.session
      );
    });

    const addPsychologist = () => {
      if (isValid.value) {
        psychologists.value.push({
          ...newPsychologist.value,
          id: psychologists.value.length + 1,
        });
        newPsychologist.value.name = "";
        newPsychologist.value.schedule = "";
        newPsychologist.value.location = "";
        newPsychologist.value.session = "";
        console.log(psychologists.value);
      }
    };

    const getAllPsychologists = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/psikologs");
        const data = await response.json();
        psychologistList.value = data.data;
      } catch (error) {
        console.error(error);
      }
    };

    const getAllLocation = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/location");
        const data = await response.json();
        locationList.value = data.data;
      } catch (error) {
        console.error(error);
      }
    };

    const getAllSessions = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/session");
        const data = await response.json();
        sessionList.value = data.data;
      } catch (error) {
        console.error(error);
      }
    };

    const getAllSchedules = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/schedule");
        const data = await response.json();
        psychologists.value = data.data;
        console.log(data);
      } catch (error) {
        console.error(error);
      }
    };

    return {
      newPsychologist,
      psychologistList,
      locationList,
      sessionList,
      psychologists,
      addPsychologist,
      isValid,
      getAllPsychologists,
      getAllLocation,
      getAllSessions,
      getAllSchedules,
    };
  },
  created() {
    this.getAllPsychologists();
    this.getAllLocation();
    this.getAllSessions();
    this.getAllSchedules();
  },
};
</script>

<style scoped>
.manage-psychologists {
  max-width: 600px;
  margin: 50px auto;
  padding: 30px;
  background: #ffffff;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
  color: #333;
}

h1 {
  text-align: center;
  color: #2c3e50;
  font-weight: bold;
  margin-bottom: 20px;
}

.psychologist-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
  margin-bottom: 40px;
}

.psychologist-form select,
.psychologist-form input,
.psychologist-form button {
  padding: 15px;
  border-radius: 8px;
  border: 2px solid #bdc3c7;
  font-size: 16px;
}

.psychologist-form select:focus,
.psychologist-form input:focus {
  border-color: #3498db;
  box-shadow: 0 0 8px rgba(52, 152, 219, 0.5);
  outline: none;
}

.psychologist-form button {
  background: linear-gradient(to right, #3498db, #2980b9);
  color: white;
  cursor: pointer;
  border: none;
  transition: background 0.3s ease-in-out;
}

.psychologist-form button:hover {
  background: linear-gradient(to right, #2980b9, #3498db);
}

.psychologist-form button:disabled {
  background-color: #bdc3c7;
  cursor: not-allowed;
}

.psychologist-item p {
  padding: 12px;
  background: linear-gradient(to right, #ecf0f1, #bdc3c7);
  border-radius: 8px;
  border-left: 5px solid #3498db;
  margin: 10px 0;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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

.psychologist-form input[type="date"] {
  padding: 15px;
  border-radius: 8px;
  border: 2px solid #bdc3c7;
  font-size: 16px;
}

.psychologist-form input[type="date"]:focus {
  border-color: #3498db;
  box-shadow: 0 0 8px rgba(52, 152, 219, 0.5);
  outline: none;
}
</style>
