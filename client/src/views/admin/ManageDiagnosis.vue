<template>
  <div class="manage-diagnosis">
    <h1>Manage Diagnosis</h1>
    <form @submit.prevent="handleDiagnosisForm" class="psychologist-form">
      <div class="form-group">
        <label for="psychologist-select">Select Psychologist</label>
        <select
          id="psychologist-select"
          v-model="newPsychologist.PsychologistID"
          @change="fetchUserHistories"
          required>
          <option disabled value="">Select a psychologist</option>
          <option
            v-for="psychologist in psychologistList"
            :key="psychologist.PsychologistID"
            :value="psychologist.PsychologistID">
            {{ psychologist.Name }}
          </option>
        </select>
      </div>

      <div class="form-group">
        <label for="user-history-select">Select User History</label>
        <select
          id="user-history-select"
          v-model="selectedUserHistoryID"
          @change="fetchUserDiagnosis"
          required>
          <option disabled value="">Select a user history</option>
          <option
            v-for="userHistory in userHistoryList"
            :key="userHistory.UHistoryID"
            :value="userHistory.UHistoryID">
            {{ userHistory.UserName }} - {{ userHistory.ScheduleDate }} -
            {{ userHistory.VisitPrice }}
          </option>
        </select>
      </div>

      <div v-if="showDiagnosisForm" class="diagnosis-form">
        <div class="form-group">
          <label for="diagnosis-type">Diagnosis Type</label>
          <input
            id="diagnosis-type"
            type="text"
            v-model="newDiagnosis.DiagnosisType"
            placeholder="Diagnosis Type"
            required />
        </div>
        <div class="form-group">
          <label for="diagnosis-status">Diagnosis Status</label>
          <select
            id="diagnosis-status"
            v-model="newDiagnosis.DiagnosisStatus"
            required>
            <option value="active">Active</option>
            <option value="resolved">Resolved</option>
            <option value="re-evaluated">Re-evaluated</option>
          </select>
        </div>
        <div class="form-group">
          <label for="severity-level">Severity Level</label>
          <select
            id="severity-level"
            v-model="newDiagnosis.SeverityLevel"
            required>
            <option value="mild">Mild</option>
            <option value="moderate">Moderate</option>
            <option value="severe">Severe</option>
          </select>
        </div>
        <div class="form-group">
          <label for="symptoms-description">Symptoms Description</label>
          <textarea
            id="symptoms-description"
            v-model="newDiagnosis.SymptompsDescription"
            placeholder="Symptoms Description"
            required></textarea>
        </div>
        <div class="form-group">
          <label for="treatment-plan">Treatment Plan</label>
          <textarea
            id="treatment-plan"
            v-model="newDiagnosis.TreatmentPlan"
            placeholder="Treatment Plan"
            required></textarea>
        </div>
        <div class="form-group">
          <label for="diagnosis-date">Diagnosis Date</label>
          <input
            id="diagnosis-date"
            type="date"
            v-model="newDiagnosis.DiagnosisDate"
            required />
        </div>
        <div class="form-group">
          <label for="notes">Notes</label>
          <textarea
            id="notes"
            v-model="newDiagnosis.Notes"
            placeholder="Notes"
            required></textarea>
        </div>
        <div class="">
          <button
            v-if="!newDiagnosisExists"
            type="submit"
            :disabled="!isDiagnosisFormValid">
            Save Diagnosis
          </button>
          <button
            v-else
            type="button"
            @click="updateUserDiagnosis"
            :disabled="!isDiagnosisFormValid">
            Update Diagnosis
          </button>
        </div>
      </div>
    </form>

    <router-link to="/admin/dashboard" class="back-to-dashboard">
      Back to Dashboard
    </router-link>
  </div>
</template>

<script>
import { ref, computed, watch } from "vue";

export default {
  name: "ManageDiagnosis",
  setup() {
    const newPsychologist = ref({
      PsychologistID: "",
    });
    const selectedUserHistoryID = ref("");
    const psychologistList = ref([]);
    const userHistoryList = ref([]);
    const newDiagnosis = ref({
      DiagnosisType: "",
      DiagnosisStatus: "active",
      SeverityLevel: "mild",
      SymptompsDescription: "",
      TreatmentPlan: "",
      DiagnosisDate: "",
      Notes: "",
    });
    const showDiagnosisForm = ref(false);
    const newDiagnosisExists = ref(false);

    const fetchPsychologists = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/psikologs");
        const data = await response.json();
        psychologistList.value = data.data;
        console.log(data);
      } catch (error) {
        console.error(error);
      }
    };

    const fetchUserHistories = async () => {
      try {
        const response = await fetch(
          `http://localhost:5000/api/historys/psychologist/${newPsychologist.value.PsychologistID}`
        );
        const data = await response.json();
        userHistoryList.value = data.data;
        selectedUserHistoryID.value = "";
        showDiagnosisForm.value = false;
      } catch (error) {
        console.error(error);
      }
    };

    const fetchUserDiagnosis = async () => {
      if (selectedUserHistoryID.value) {
        try {
          const response = await fetch(
            `http://localhost:5000/api/diagnosis/${selectedUserHistoryID.value}`
          );
          const data = await response.json();
          console.log(data.data);
          if (data.data[0]) {
            newDiagnosis.value = data.data[0];
            newDiagnosisExists.value = true;
          } else {
            newDiagnosis.value = {
              DiagnosisType: "",
              DiagnosisStatus: "active",
              SeverityLevel: "mild",
              SymptompsDescription: "",
              TreatmentPlan: "",
              DiagnosisDate: "",
              Notes: "",
            };
            newDiagnosisExists.value = false;
          }
          showDiagnosisForm.value = true;
        } catch (error) {
          console.error(error);
        }
      }
    };

    const handleDiagnosisForm = async () => {
      if (newDiagnosisExists.value) {
        await updateUserDiagnosis();
      } else {
        await addUserDiagnosis();
      }
    };

    const addUserDiagnosis = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/diagnosis", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            ...newDiagnosis.value,
            UserHistory_UserHistoryID: selectedUserHistoryID.value,
          }),
        });
        const data = await response.json();
        console.log(data);
      } catch (error) {
        console.error(error);
      }
    };

    const updateUserDiagnosis = async () => {
      try {
        const response = await fetch(
          `http://localhost:5000/api/diagnosis/${newDiagnosis.value.DiagnosisID}`,
          {
            method: "PATCH",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(newDiagnosis.value),
          }
        );
        const data = await response.json();
        console.log(data);
      } catch (error) {
        console.error(error);
      }
    };

    const isDiagnosisFormValid = computed(() => {
      return (
        newDiagnosis.value.DiagnosisType &&
        newDiagnosis.value.DiagnosisStatus &&
        newDiagnosis.value.SeverityLevel &&
        newDiagnosis.value.SymptompsDescription &&
        newDiagnosis.value.TreatmentPlan &&
        newDiagnosis.value.DiagnosisDate &&
        newDiagnosis.value.Notes
      );
    });

    watch(
      () => newPsychologist.value.PsychologistID,
      (newPsychologistID) => {
        if (newPsychologistID) {
          fetchUserHistories(newPsychologistID);
        }
      }
    );

    return {
      newPsychologist,
      selectedUserHistoryID,
      psychologistList,
      userHistoryList,
      newDiagnosis,
      showDiagnosisForm,
      newDiagnosisExists,
      fetchPsychologists,
      fetchUserHistories,
      fetchUserDiagnosis,
      handleDiagnosisForm,
      addUserDiagnosis,
      updateUserDiagnosis,
      isDiagnosisFormValid,
    };
  },
  created() {
    this.fetchPsychologists();
  },
};
</script>

<style scoped>
.manage-diagnosis {
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

.form-group {
  display: flex;
  flex-direction: column;
}

.form-group label {
  font-weight: bold;
  margin-bottom: 5px;
}

.psychologist-form select,
.psychologist-form input,
.psychologist-form textarea,
.psychologist-form button {
  padding: 15px;
  border-radius: 8px;
  border: 2px solid #bdc3c7;
  font-size: 16px;
}

.psychologist-form select:focus,
.psychologist-form input:focus,
.psychologist-form textarea:focus {
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
  padding: 12px;
  background: linear-gradient(to right, #ecf0f1, #bdc3c7);
  border-radius: 8px;
  border-left: 5px solid #3498db;
  margin: 10px 0;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
