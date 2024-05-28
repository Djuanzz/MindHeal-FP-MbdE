<template>
  <div class="auth-page">
    <div class="auth-card">
      <h2>Login to Mindheal</h2>
      <form @submit.prevent="submitLoginForm">
        <div class="form-group">
          <input type="text" id="login-name" placeholder="Enter your name" v-model="loginEmail" required>
        </div>
        <div class="form-group">
          <input type="password" id="login-password" placeholder="Enter your password" v-model="loginPassword" required>
          <span class="toggle-password" @click="togglePasswordVisibility">&#128065;</span>
        </div>
        <button type="submit">Log In</button>
        <div class="form-footer">
          <p>By continuing, you agree to the <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>.</p>
          <a href="#">Forgot your password?</a>
        </div>
      </form>
      <hr>
      <div class="create-account">
        <p>New to Mindheal?</p>
        <button @click="goToSignUp">Create an Account</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LoginPage',
  data() {
    return {
      loginEmail: '',
      loginPassword: '',
      passwordFieldType: 'password'
    };
  },
  methods: {
    submitLoginForm() {
      console.log('Login with:', this.loginEmail, this.loginPassword);
      
      this.login();
    },
    login() {
      
      if (this.loginEmail === 'example@example.com' && this.loginPassword === 'password') {
        this.$router.push({ name: 'LandingPage' }); 
      } else {
        alert('Invalid credentials'); 
      }
    },
    goToSignUp() {
      this.$router.push({ name: 'SignUpPage' });
    },
    togglePasswordVisibility() {
      this.passwordFieldType = this.passwordFieldType === 'password' ? 'text' : 'password';
    }
  }
};
</script>


<style scoped>
.auth-page {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
}

.auth-card {
  width: 100%;
  max-width: 350px;
  padding: 20px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.2);
  background-color: #fff;
  border-radius: 8px;
}

.auth-card h2 {
  text-align: center;
  color: #333;
}

.form-group {
  position: relative;
  margin-bottom: 20px;
}

.form-group input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.toggle-password {
  position: absolute;
  right: 10px;
  top: 11px;
  cursor: pointer;
  color: #666;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  border: none;
  color: white;
  cursor: pointer;
  border-radius: 4px;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #0056b3;
}

.form-footer a, .form-footer p {
  color: #666;
  text-decoration: none;
}

.create-account p, .form-footer p {
  margin-bottom: 5px;
}

hr {
  margin: 20px 0;
}
</style>
