<template>
  <div class="manage-psychologists">
    <h1>Manage Psychologists</h1>
    <form @submit.prevent="addPsychologist" class="psychologist-form">
      <input
        type="text"
        v-model="newPsychologist.Name"
        placeholder="Name"
        required />
      <input
        type="email"
        v-model="newPsychologist.Email"
        placeholder="Email"
        required />
      <input
        type="text"
        v-model="newPsychologist.Mobile"
        placeholder="Mobile"
        required />
      <input
        type="text"
        v-model="newPsychologist.Specialty"
        placeholder="Specialty"
        required />

      <select v-model="newPsychologist.VisitPrice" required>
        <option disabled value="">Select a Price</option>
        <option v-for="price in priceList" :key="price.id" :value="price.price">
          {{ price.price }}
        </option>
      </select>

      <select v-model="newPsychologist.Location_LocationID" required>
        <option disabled value="">Select a location</option>
        <option
          v-for="location in locationList"
          :key="location.LocationID"
          :value="location.LocationID">
          {{ location.Name }}
        </option>
      </select>
      <button type="submit" :disabled="!isValid">Add Psychologist</button>
    </form>
    <router-link to="/admin/dashboard" class="back-to-dashboard">
      Back to Dashboard
    </router-link>
    <div class="psychologist-list">
      <div
        v-for="psychologist in psychologists"
        :key="psychologist.PsychologistID"
        class="psychologist-item">
        <p>
          {{ psychologist.Name }} - {{ psychologist.Email }}
          <span class="actions">
            <router-link
              :to="`/admin/psychologist-profile/${psychologist.PsychologistID}`"
              class="btn btn-info">
              Details
            </router-link>
          </span>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, computed } from "vue";

export default {
  setup() {
    const newPsychologist = ref({
      Name: "",
      Email: "",
      Mobile: "",
      Specialty: "",
      VisitPrice: "",
      Location_LocationID: "",
    });

    const priceList = [
      { id: 1, price: 300000 },
      { id: 2, price: 400000 },
      { id: 3, price: 500000 },
      { id: 4, price: 600000 },
      { id: 5, price: 700000 },
    ];

    const psychologists = ref([]);
    const locationList = ref([]);

    const isValid = computed(() => {
      return (
        newPsychologist.value.Name &&
        newPsychologist.value.Email &&
        newPsychologist.value.Mobile &&
        newPsychologist.value.Specialty &&
        newPsychologist.value.VisitPrice
      );
    });

    const createNewPsikolog = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/psikolog", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(newPsychologist.value),
        });
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        const data = await response.json();
        return data;
      } catch (error) {
        console.error("There was a problem with the fetch operation:", error);
        throw error;
      }
    };

    const addPsychologist = async () => {
      console.log(newPsychologist.value);
      if (isValid.value) {
        try {
          await createNewPsikolog();
          await getAllPsikolog();

          newPsychologist.value.Name = "";
          newPsychologist.value.Email = "";
          newPsychologist.value.Mobile = "";
          newPsychologist.value.Specialty = "";
          newPsychologist.value.VisitPrice = "";
          newPsychologist.value.Location_LocationID = "";
        } catch (error) {
          alert("Failed to add psychologist. Please try again.");
        }
      }
    };

    const getAllPsikolog = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/psikologs", {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
          },
        });
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        const data = await response.json();
        psychologists.value = data.data;
      } catch (error) {
        console.error("There was a problem with the fetch operation:", error);
      }
    };

    const getAllLocation = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/location", {
          method: "GET",
        });
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        const data = await response.json();
        locationList.value = data.data;
        console.log(data);
      } catch (error) {
        console.error("There was a problem with the fetch operation:", error);
      }
    };

    const detailPsikolog = (id) => {
      console.log(id);
      // this.$router.push({ name: "ManageDetailPsychologist", params: { id } });
      this.$router.push({
        path: "/admin/psychologist-profile/:psychologistId?",
        params: { id },
      });
    };

    return {
      newPsychologist,
      psychologists,
      addPsychologist,
      isValid,
      getAllPsikolog,
      locationList,
      getAllLocation,
      priceList,
      createNewPsikolog,
      detailPsikolog,
    };
  },

  mounted() {
    this.getAllPsikolog();
    this.getAllLocation();
  },
};
</script>

<style scoped>
.manage-psychologists {
  max-width: 600px;
  margin: 50px auto;
  padding: 30px;
  background: #ffffff;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
  color: #333;
}

h1 {
  text-align: center;
  color: #2c3e50;
  font-weight: bold;
  margin-bottom: 20px;
}

.psychologist-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
  margin-bottom: 40px;
}

.psychologist-form input,
.psychologist-form select,
.psychologist-form button {
  padding: 15px;
  border-radius: 8px;
  border: 2px solid #bdc3c7;
  font-size: 16px;
}

.psychologist-form input:focus,
.psychologist-form select:focus {
  border-color: #3498db;
  box-shadow: 0 0 8px rgba(52, 152, 219, 0.5);
  outline: none;
}

.psychologist-form button {
  background: linear-gradient(to right, #3498db, #2980b9);
  color: white;
  cursor: pointer;
  border: none;
  transition: background 0.3s ease-in-out;
}

.psychologist-form button:hover {
  background: linear-gradient(to right, #2980b9, #3498db);
}

.psychologist-form button:disabled {
  background-color: #bdc3c7;
  cursor: not-allowed;
}

.psychologist-item p {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px;
  background: linear-gradient(to right, #ecf0f1, #bdc3c7);
  border-radius: 8px;
  border-left: 5px solid #3498db;
  margin: 10px 0;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.actions {
  display: flex;
  align-items: center;
}

.btn-info {
  background-color: #3498db;
  color: white;
  border: none;
  padding: 10px 15px;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.3s;
}

.btn-info:hover {
  background-color: #2980b9;
}

.back-to-dashboard {
  display: block;
  margin-top: 30px;
  text-align: center;
  padding: 10px 20px;
  background: #3498db;
  color: white;
  border-radius: 8px;
  text-decoration: none;
  transition: background 0.3s;
}

.back-to-dashboard:hover {
  background: #2980b9;
}

.psychologist-form input[type="date"] {
  padding: 15px;
  border-radius: 8px;
  border: 2px solid #bdc3c7;
  font-size: 16px;
}

.psychologist-form input[type="date"]:focus {
  border-color: #3498db;
  box-shadow: 0 0 8px rgba(52, 152, 219, 0.5);
  outline: none;
}
</style>
