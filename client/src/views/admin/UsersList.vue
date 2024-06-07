<template>
    <div class="user-list container mt-5">
      <header class="text-center mb-5">
        <h1>User List</h1>
        <router-link to="/admin/dashboard" class="back-link">Back to Dashboard</router-link>
      </header>
      <main>
        <ul class="list-group">
          <li v-for="user in users" :key="user.id" class="list-group-item">
            <div class="user-details">
              {{ user.username }} - {{ user.email }}
              <button class="dropdown-button" @click="toggleDropdown(user.id)">
                <i class="fas fa-chevron-down"></i> 
              </button>
            </div>
            <div v-if="dropdownOpen === user.id" class="dropdown-content">
              <router-link :to="{ name: 'UserProfile', params: { userId: user.id } }">Profile</router-link>
              <router-link :to="{ name: 'MyHistoryPage', params: { userId: user.id } }">History</router-link>
            </div>
          </li>
        </ul>
      </main>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        users: [
          { id: 1, username: 'usr1', email: 'usr1@example.com' },
          { id: 2, username: 'usr2', email: 'usr2@example.com' },
        ],
        dropdownOpen: null 
      };
    },
    methods: {
      toggleDropdown(userId) {
        this.dropdownOpen = this.dropdownOpen === userId ? null : userId; 
      }
    }
  };
  </script>
  
  <style scoped>
  .user-list {
    max-width: 800px;
    margin: auto;
    padding: 20px;
    background: #f8f9fa;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }
  
  .list-group-item {
    display: flex;
    flex-direction: column;
    align-items: start;
    position: relative;
    padding: 10px;
    border-bottom: 1px solid #ccc;
  }
  
  .user-details {
    display: flex;
    justify-content: space-between;
    width: 100%;
  }
  
  .dropdown-button {
    background: none;
    border: none;
    cursor: pointer;
    color: #333;
  }
  
  .dropdown-content {
    display: flex;
    flex-direction: column;
    padding: 5px 0;
  }
  
  .dropdown-content a {
    padding: 5px 10px;
    text-decoration: none;
    color: #007bff;
  }
  
  .dropdown-content a:hover {
    background-color: #e8f0fe;
  }
  
  .back-link {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background: linear-gradient(to right, #3498db, #2980b9);
    color: white;
    border-radius: 8px;
    text-decoration: none;
    transition: background 0.3s;
  }
  
  .back-link:hover {
    background: linear-gradient(to right, #2980b9, #3498db);
  }
  
  .fas {
    font-size: 16px;
  }
  </style>
  