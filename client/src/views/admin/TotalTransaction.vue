<template>
  <div class="total-revenue">
    <h1>Total Monthly Revenue for {{ year }}</h1>
    <div class="revenue-cards">
      <div
        class="revenue-card"
        v-for="(revenue, month) in monthlyRevenueTotals"
        :key="month">
        <h2>{{ formatMonth(Number(month)) }}</h2>
        <p>Rp {{ formatCurrency(revenue) }}</p>
      </div>
    </div>
    <router-link to="/admin/dashboard" class="back-link"
      >Back to Dashboard</router-link
    >
  </div>
</template>
<script>
export default {
  data() {
    return {
      monthlyRevenueTotals: {},
      year: 2024,
    };
  },
  mounted() {
    this.fetchMonthlyRevenues();
  },
  methods: {
    async fetchMonthlyRevenues() {
      try {
        const promises = [];
        for (let month = 1; month <= 12; month++) {
          promises.push(this.fetchMonthlyRevenue(month));
        }
        await Promise.all(promises);
      } catch (error) {
        console.error(error);
      }
    },
    async fetchMonthlyRevenue(month) {
      try {
        const response = await fetch(
          "http://localhost:5000/api/transaksi/revenue/month",
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ Year: this.year, Month: month }),
          }
        );
        const data = await response.json();
        const revenue = data.data || 0;
        // console.log(`Revenue for month ${month}:`, revenue[0].RevenuePerMonth);
        this.monthlyRevenueTotals[month] = revenue[0].RevenuePerMonth;
      } catch (error) {
        console.error(`Error fetching revenue for month ${month}:`, error);
        this.monthlyRevenueTotals[month] = 0;
      }
    },

    formatMonth(month) {
      const date = new Date(this.year, month - 1, 1);
      return date.toLocaleString("id-ID", { month: "long", year: "numeric" });
    },
    formatCurrency(amount) {
      return amount.toLocaleString("id-ID");
    },
  },
};
</script>

<style scoped>
.total-revenue {
  max-width: 800px;
  margin: 40px auto;
  padding: 20px;
  background: #ffffff;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
  text-align: center;
  color: #333;
}

.revenue-cards {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  gap: 20px;
  margin-top: 20px;
}

.revenue-card {
  background: #f8f9fa;
  padding: 20px;
  border-radius: 8px;
  width: 200px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.revenue-card:hover {
  transform: translateY(-5px);
}

h1 {
  color: #2c3e50;
  font-weight: bold;
  margin-bottom: 20px;
}

h2 {
  color: #3498db;
  font-size: 1.6em;
}

p {
  font-size: 1.4em;
  color: #666;
  font-weight: bold;
}

.back-link {
  display: block;
  margin-top: 30px;
  text-align: center;
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
</style>
