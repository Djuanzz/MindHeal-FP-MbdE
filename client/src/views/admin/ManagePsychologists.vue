<template>
    <div class="manage-psychologists">
      <h1>Manage Psychologists</h1>
      <form @submit.prevent="addPsychologist" class="psychologist-form">
        <input type="text" v-model="newPsychologist.name" placeholder="Name" required>
        <input type="text" v-model="newPsychologist.schedule" placeholder="schedule" required>
        <button type="submit" :disabled="!isValid">Add Psychologist</button>
      </form>
      <div class="psychologist-list">
        <div v-for="psychologist in psychologists" :key="psychologist.id" class="psychologist-item">
          <p>{{ psychologist.name }} - {{ psychologist.schedule }}</p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        newPsychologist: {
          name: '',
          specialization: ''
        },
        psychologists: []
      };
    },
    computed: {
      isValid() {
        return this.newPsychologist.name && this.newPsychologist.specialization;
      }
    },
    methods: {
      addPsychologist() {
        if (this.isValid) {
          this.psychologists.push({
            ...this.newPsychologist,
            id: this.psychologists.length + 1 
          });
  
          this.newPsychologist.name = '';
          this.newPsychologist.specialization = '';
        }
      }
    }
  };
  </script>
  
  <style scoped>
  .manage-psychologists {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  }
  
  h1 {
    text-align: center;
  }
  
  .psychologist-form {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-bottom: 20px;
  }
  
  .psychologist-form input, .psychologist-form button {
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
  }
  
  .psychologist-form button {
    background-color: #2575fc;
    color: white;
    cursor: pointer;
    border: none;
  }
  
  .psychologist-form button:disabled {
    background-color: #ccc;
  }
  
  .psychologist-item p {
    padding: 10px;
    background: white;
    border-bottom: 1px solid #eee;
  }
  </style>
  