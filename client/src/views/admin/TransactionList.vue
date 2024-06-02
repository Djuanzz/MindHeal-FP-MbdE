<template>
    <div class="list-transactions">
      <h1>List of Transactions</h1>
      <ul>
        <li v-for="transaction in transactions" :key="transaction.id">
          {{ transaction.date }} - {{ formatCurrency(transaction.amount) }} - {{ transaction.description }}
        </li>
      </ul>
      <router-link to="/admin/dashboard" class="back-link">Back to Dashboard</router-link>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        transactions: [
          { id: 1, date: '2024-06-01', amount: 100000, description: 'Session with Dr. Juan' },
          { id: 2, date: '2024-06-02', amount: 100000, description: 'Session with Dr. X' },
        ]
      };
    },
    methods: {
      formatCurrency(amount) {
        return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR', currencyDisplay: 'narrowSymbol' }).format(amount);
      }
    }
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
  
  ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
  }
  
  li {
    background: #eceff1; 
    padding: 15px;
    border-radius: 8px;
    margin: 10px 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.06); 
    color: #333; 
    font-size: 16px;
    transition: all 0.3s ease;
  }
  
  li:hover {
    background: #e0e0e0; 
    transform: translateY(-3px);
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
  