<template>
  <div>
    <h1>User History</h1>
    <ul>
      <li v-for="log in userLogs" :key="log.id">
        {{ log.description }} on {{ log.date }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userLogs: [], //Fetch dari server
    };
  },
  mounted() {
    // Fetch user logs
  },
};
</script>
