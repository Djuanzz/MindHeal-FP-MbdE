<template>
  <div class="transaction container">
    <header class="text-center mb-4">
      <h1>Secure Checkout</h1>
    </header>
    <main>
      <div class="payment-options">
        <h2>Select Your Payment Method</h2>
        <p class="countdown">Time remaining: {{ countdownText }}</p>
        <form @submit.prevent="submitPayment" class="payment-form">
          <div
            class="payment-method"
            v-for="(method, index) in paymentMethods"
            :key="index">
            <input
              type="radio"
              :id="method"
              :value="method"
              v-model="selectedPaymentMethod" />
            <label
              :for="method"
              :class="{ active: selectedPaymentMethod === method }">
              <i :class="getIconClass(method)"></i> {{ method }}
            </label>
          </div>
          <button type="submit" class="btn-checkout">Proceed to Payment</button>
        </form>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: "TransactionPage",
  data() {
    return {
      selectedPaymentMethod: "",
      paymentMethods: ["Credit Card", "Debit Card", "Cash"],
      countdown: 300, // 5 minutes in seconds
      interval: null,
    };
  },
  computed: {
    countdownText() {
      const minutes = Math.floor(this.countdown / 60);
      const seconds = this.countdown % 60;
      return `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
    },
  },
  methods: {
    async submitPayment() {
      try {
        const res = await fetch(
          `http://localhost:5000/api/user/transaksi/pay`,
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("token")}`,
            },
            body: JSON.stringify({
              UserHistoryID: this.$route.params.userHistoryID,
              PaymentType: this.selectedPaymentMethod,
            }),
          }
        );

        const data = await res.json();
        console.log(data);

        this.$router.push({
          name: "MyHistoryPage",
        });
      } catch (error) {
        console.error(error);
      }
    },

    getIconClass(method) {
      switch (method) {
        case "Credit Card":
          return "fas fa-credit-card";
        case "Debit Card":
          return "fas fa-money-check-alt";
        case "Cash":
          return "fas fa-wallet";
        default:
          return "";
      }
    },
    startTimer() {
      this.interval = setInterval(() => {
        if (this.countdown > 0) {
          this.countdown--;
        } else {
          clearInterval(this.interval);
          this.timeoutAction();
        }
      }, 1000);
    },
    timeoutAction() {
      this.$router.push({ name: "LandingPage" });
      alert("Time is up! Your transaction canceled.");
      // this.selectedPaymentMethod = "";
      // this.countdown = 10;
      // this.startTimer();
    },
  },
  mounted() {
    this.startTimer();
  },
  // beforeDestroy() {
  //   clearInterval(this.interval);
  // },
};
</script>

<style scoped>
.transaction {
  font-family: "Helvetica Neue", Arial, sans-serif;
  max-width: 500px;
  margin: 50px auto;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  color: #343a40;
  text-align: center;
}

header h1 {
  color: #0056b3;
  font-size: 24px; /* Smaller and more elegant */
}

.payment-options h2 {
  color: #007bff;
  font-size: 20px; /* Reduced size for subheading */
}

.countdown {
  font-size: 18px;
  color: #dc3545;
  margin-bottom: 20px;
}

.payment-form {
  display: flex;
  flex-direction: column;
}

.payment-method {
  margin: 15px 0;
  display: flex;
  justify-content: center;
}

.payment-method input[type="radio"] {
  display: none; /* Hide the default radio input */
}

.payment-method label {
  padding: 8px 16px;
  font-size: 14px; /* Smaller font size */
  color: #343a40;
  border: 2px dashed #007bff; /* Dashed border for more flair */
  border-radius: 20px;
  width: 100%;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.payment-method label.active,
.payment-method label:hover {
  background-color: #007bff;
  color: white;
  border-color: #0056b3;
  transform: translateY(-2px);
}

.payment-method i {
  margin-right: 8px; /* Icon spacing */
}

.btn-checkout {
  background: linear-gradient(145deg, #0056b3, #007bff);
  color: white;
  padding: 12px;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  font-size: 16px;
  transition: background 0.3s ease;
  margin-top: 20px;
}

.btn-checkout:hover {
  background: linear-gradient(145deg, #004495, #0062cc);
}
</style>
