<template>
  <div>
    <h1>Schedule Management</h1>
    <div v-for="(schedule, index) in schedules" :key="index">
      <p>{{ schedule.date }} at {{ schedule.time }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      schedules: [
        { date: "2024-05-01", time: "10:00" },
        { date: "2024-05-02", time: "12:00" },
      ],
    };
  },
};
</script>
