<template>
  <div class="manage-psychologists">
    <h1>Manage Psychologists</h1>
    <form @submit.prevent="addPsychologist" class="psychologist-form">
      <input
        type="text"
        v-model="newPsychologist.name"
        placeholder="Name"
        required />
      <input type="date" v-model="newPsychologist.schedule" required />
      <button type="submit" :disabled="!isValid">Add Psychologist</button>
    </form>
    <div class="psychologist-list">
      <div
        v-for="psychologist in psychologists"
        :key="psychologist.id"
        class="psychologist-item">
        <p>{{ psychologist.name }} - {{ psychologist.schedule }}</p>
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
  setup() {
    const newPsychologist = ref({
      name: "",
      schedule: "",
    });
    const psychologists = ref([]);

    const isValid = computed(() => {
      return newPsychologist.value.name && newPsychologist.value.schedule;
    });

    const addPsychologist = () => {
      if (isValid.value) {
        psychologists.value.push({
          ...newPsychologist.value,
          id: psychologists.value.length + 1,
        });
        newPsychologist.value.name = "";
        newPsychologist.value.schedule = "";
        console.log(psychologists.value);
      }
    };

    return { newPsychologist, psychologists, addPsychologist, isValid };
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

.psychologist-form input,
.psychologist-form button {
  padding: 15px;
  border-radius: 8px;
  border: 2px solid #bdc3c7;
  font-size: 16px;
}

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
