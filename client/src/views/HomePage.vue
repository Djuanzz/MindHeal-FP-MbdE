<template>
  <div id="app">
    <header class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Mindheal.com</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <router-link to="/login" class="nav-link active">Home</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/services" class="nav-link">Services</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/about" class="nav-link">About Us</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/contact" class="nav-link">Contact</router-link>
            </li>
          </ul>
        </div>
      </div>
    </header>
    <section class="hero d-flex justify-content-center align-items-center text-white">
      <div class="text-center">
        <h1 class="display-4">Explore Your Inner World</h1>
        <p class="lead">Discover pathways to better mental health with Mindheal.</p>
        <button class="btn btn-lg btn-light" @click="startJourney">Get Started</button>
      </div>
    </section>
    <footer class="bg-dark text-center text-white py-3">
      © 2024 Mindheal. All rights reserved.
    </footer>
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  methods: {
    startJourney() {
      this.$router.push('/login');
    }
  }
}
</script>

<style scoped>
.hero {
  height: 90vh;
  background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
  display: flex;
  align-items: center;
  justify-content: center;
}
.hero h1 {
  font-size: 2.5rem;
  color: #fff;
  text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  animation: fadeIn 2s ease-out;
}
.hero p {
  font-size: 1.2rem;
  color: #dcdcdc;
  margin-top: 20px;
  animation: fadeIn 2.5s ease-out;
}
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translatey(50px);
  }
  to {
    opacity: 1;
    transform: translatey(0);
  }
}
.navbar .nav-link {
  color: #fff;
  transition: color 0.3s ease-in-out;
}
.navbar .nav-link:hover, .navbar .nav-link.active {
  color: #a2d2ff;
}
</style>
