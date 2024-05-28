<template>
  <div class="auth-page">
    <div class="auth-card">
      <h2>Create Your Account</h2>
      <form @submit.prevent="submitSignUpForm">
        <div class="form-group">
          <input
            type="text"
            id="signup-name"
            placeholder="Name"
            v-model="signUpName"
            required />
        </div>
        <div class="form-group">
          <input
            type="text"
            id="signup-email"
            placeholder="Email Address"
            v-model="signUpEmail"
            required />
        </div>
        <div class="form-group">
          <input
            type="password"
            id="signup-password"
            placeholder="Password"
            v-model="signUpPassword"
            required />
          <span
            class="toggle-password"
            @click="togglePasswordVisibility('password')"
            >&#128065;</span
          >
        </div>
        <div class="form-group">
          <input
            type="password"
            id="confirm-password"
            placeholder="Confirm Password"
            v-model="confirmPassword"
            required />
          <span
            class="toggle-password"
            @click="togglePasswordVisibility('confirm')"
            >&#128065;</span
          >
        </div>
        <button type="submit">Create Account</button>
        <div class="form-footer">
          <p>
            Already have an account? <a href="#" @click="goToLogin">Log In</a>
          </p>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "SignUpPage",
  data() {
    return {
      signUpName: "",
      signUpEmail: "",
      signUpPassword: "",
      confirmPassword: "",
      showPassword: false,
      showConfirmPassword: false,
    };
  },
  methods: {
    submitSignUpForm() {
      console.log("Registering:", this.signUpEmail, this.signUpPassword);

      this.register();
    },
    async register() {
      try {
        const req = await fetch("http://localhost:5000/api/register", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            name: this.signUpName,
            email: this.signUpEmail,
            password: this.signUpPassword,
          }),
        });

        const res = await req.json();
        console.log(res);
        this.$router.push({ name: "LandingPage" });
      } catch (error) {
        console.error("Error registering:", error);
        alert(
          "Please ensure all fields are filled correctly and passwords match."
        );
      }

      // if (this.signUpEmail && this.signUpPassword === this.confirmPassword) {
      //   this.$router.push({ name: "LandingPage" });
      // } else {
      //   alert(
      //     "Please ensure all fields are filled correctly and passwords match."
      //   );
      // }
    },
    goToLogin() {
      this.$router.push("/login");
    },
    togglePasswordVisibility(type) {
      if (type === "password") {
        this.showPassword = !this.showPassword;
      } else {
        this.showConfirmPassword = !this.showConfirmPassword;
      }
    },
  },
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
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
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

.form-footer a,
.form-footer p {
  color: #666;
  text-decoration: none;
}

hr {
  margin: 20px 0;
}
</style>
