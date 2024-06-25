<template>
  <div class="admin-dashboard">
    <h1 class="dashboard-title">Admin Dashboard</h1>
    <div class="links-container">
      <div class="didalamnya">
        <router-link to="/admin/manage-psychologists" class="dashboard-link">
          <div class="link-card">
            <i class="fas fa-user-md icon"></i>
            <span class="link-text">Manage Psychologists</span>
          </div>
        </router-link>

        <router-link
          to="/admin/manage-psychologists-schedule"
          class="dashboard-link">
          <div class="link-card">
            <i class="fas fa-calendar-alt icon"></i>
            <span class="link-text">Manage Schedule</span>
          </div>
        </router-link>

        <router-link to="/admin/total-transaction" class="dashboard-link">
          <div class="link-card">
            <i class="fas fa-money-check-alt icon"></i>
            <span class="link-text">Total Transaction</span>
          </div>
        </router-link>
      </div>

      <div class="didalamnya">
        <router-link to="/admin/transaction-list" class="dashboard-link">
          <div class="link-card">
            <i class="fas fa-history icon"></i>
            <span class="link-text">List Transaction</span>
          </div>
        </router-link>

        <router-link to="/admin/users-list" class="dashboard-link">
          <div class="link-card">
            <i class="fas fa-users icon"></i>
            <span class="link-text">Users List</span>
          </div>
        </router-link>

        <router-link to="/admin/manage-diagnosis" class="dashboard-link">
          <div class="link-card">
            <i class="fas fa-clipboard icon"></i>
            <span class="link-text">Diagnosis</span>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<style scoped>
.admin-dashboard {
  padding: 20px;
  background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
  min-height: 100vh;
  color: white;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
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
  flex-direction: column;
  justify-content: space-around;
  flex-wrap: wrap;
  margin-top: 20px;
}

.didalamnya {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.dashboard-link {
  text-decoration: none;
  color: white;
  transition: color 0.3s;
  margin: 20px;
}

.dashboard-link:hover {
  color: #ccc;
}

.link-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  background: rgba(255, 255, 255, 0.1);
  padding: 20px;
  border-radius: 10px;
  transition: all 0.3s ease-in-out;
  width: 200px;
  height: 200px;
  justify-content: center;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.link-card:hover {
  transform: scale(1.05);
  background: rgba(255, 255, 255, 0.2);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.icon {
  font-size: 40px;
  margin-bottom: 10px;
}

.link-text {
  font-size: 1.2em;
  font-weight: bold;
  text-align: center;
}
</style>
