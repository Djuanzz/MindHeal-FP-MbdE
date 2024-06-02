<template>
  <div class="admin-dashboard">
    <h1 class="dashboard-title">Admin Dashboard</h1>
    <div class="links-container">
      <router-link to="/admin/manage-psychologists" class="dashboard-link">
        <div class="link-card">
          <i class="fas fa-user-md icon"></i>
          <span class="link-text">Manage Psychologists</span>
        </div>
      </router-link>
      <router-link to="/admin/total-transaction" class="dashboard-link">
        <div class="link-card">
          <i class="fas fa-calendar-alt icon"></i>
          <span class="link-text">Total Transaction</span>
        </div>
      </router-link>
      <router-link to="/admin/transaction-list" class="dashboard-link">
        <div class="link-card">
          <i class="fas fa-history icon"></i>
          <span class="link-text">List Transaction</span>
        </div>
      </router-link>
    </div>
  </div>
</template>

<style scoped>
.admin-dashboard {
  padding: 20px;
  background: linear-gradient(to right, #6a11cb, #2575fc);
  min-height: 100vh;
  color: white;
}

.dashboard-title {
  text-align: center;
  margin-bottom: 30px;
  font-size: 2.5em;
  font-weight: bold;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.links-container {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  margin-top: 20px;
}

.dashboard-link {
  text-decoration: none;
  color: white;
}

.link-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  background: rgba(255, 255, 255, 0.1);
  padding: 20px;
  border-radius: 10px;
  transition: transform 0.3s ease-in-out, background 0.3s ease;
  width: 200px;
  height: 200px;
  justify-content: center;
}

.link-card:hover {
  transform: scale(1.05);
  background: rgba(255, 255, 255, 0.2);
}

.icon {
  font-size: 40px;
  margin-bottom: 15px;
}

.link-text {
  font-size: 1.2em;
  font-weight: bold;
  text-align: center;
}
</style>
