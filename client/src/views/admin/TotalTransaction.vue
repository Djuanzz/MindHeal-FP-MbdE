<template>
    <div class="total-transaction">
      <h1>Total Transaction Amounts</h1>
      <div class="transaction-cards">
        <div class="transaction-card" v-for="(amount, month) in monthlyTransactionTotals" :key="month">
          <h2>{{ formatMonth(month) }}</h2>
          <p>Rp {{ formatCurrency(amount) }}</p>
        </div>
      </div>
      <router-link to="/admin/dashboard" class="back-link">Back to Dashboard</router-link>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        transactions: [
          { amount: 150000, date: '2024-01-01' },
          { amount: 200000, date: '2024-01-15' },
          { amount: 250000, date: '2024-02-01' },
        ],
      };
    },
    computed: {
      monthlyTransactionTotals() {
        const totals = {};
        this.transactions.forEach(transaction => {
          const month = transaction.date.substring(0, 7); 
          if (!totals[month]) {
            totals[month] = 0;
          }
          totals[month] += transaction.amount;
        });
        return totals;
      }
    },
    methods: {
      formatMonth(month) {
        const date = new Date(month + '-01');
        return date.toLocaleString('id-ID', { month: 'long', year: 'numeric' });
      },
      formatCurrency(amount) {
        return amount.toLocaleString('id-ID');
      }
    }
  };
  </script>
  
  <style scoped>
  .total-transaction {
    max-width: 800px;
    margin: 40px auto;
    padding: 20px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    text-align: center;
    color: #333;
  }
  
  .transaction-cards {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 20px;
  }
  
  .transaction-card {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    width: 200px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
  }
  
  .transaction-card:hover {
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
  