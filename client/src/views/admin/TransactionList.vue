<template>
  <div class="list-transactions">
    <h1>List of Transactions</h1>
    <table v-if="transactions.length">
      <thead>
        <tr>
          <th>Date</th>
          <th>Amount</th>
          <th>Payment Type</th>
          <th>User</th>
          <th>Psychologist</th>
          <th>Session Start</th>
          <th>Session End</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="transaction in transactions"
          :key="transaction.TransactionBillID">
          <td>{{ transaction.ScheduleDate }}</td>
          <td>{{ formatCurrency(transaction.Amount) }}</td>
          <td>{{ transaction.PaymentType }}</td>
          <td>{{ transaction.UserName }}</td>
          <td>{{ transaction.PsychologistName }}</td>
          <td>{{ transaction.SessionStart }}</td>
          <td>{{ transaction.SessionEnd }}</td>
        </tr>
      </tbody>
    </table>
    <router-link to="/admin/dashboard" class="back-link"
      >Back to Dashboard</router-link
    >
  </div>
</template>

<script>
export default {
  data() {
    return {
      transactions: [],
    };
  },
  methods: {
    formatCurrency(amount) {
      return new Intl.NumberFormat("id-ID", {
        style: "currency",
        currency: "IDR",
        currencyDisplay: "narrowSymbol",
      }).format(amount);
    },
    async getDetailTransaction() {
      try {
        const response = await fetch(
          "http://localhost:5000/api/transaksi/detail"
        );
        const data = await response.json();
        this.transactions = data.data[0];
      } catch (error) {
        console.error(error);
      }
    },
  },
  mounted() {
    this.getDetailTransaction();
  },
};
</script>

<style scoped>
.list-transactions {
  max-width: 800px;
  margin: 50px auto;
  padding: 25px;
  background: #ffffff;
  border-radius: 12px;
  box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
  color: #2c3e50;
}

h1 {
  text-align: center;
  color: #2c3e50;
  font-weight: bold;
  margin-bottom: 20px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

th,
td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
  color: #2c3e50;
}

tr:hover {
  background-color: #f5f5f5;
}

.back-link {
  display: block;
  margin-top: 20px;
  text-align: center;
  padding: 10px 20px;
  background: #3498db;
  color: white;
  border-radius: 8px;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.back-link:hover {
  background-color: #2980b9;
}
</style>
