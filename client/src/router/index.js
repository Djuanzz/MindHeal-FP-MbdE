import { createRouter, createWebHistory } from "vue-router";
import HomePage from "@/views/HomePage.vue";
import LoginPage from "@/views/LoginPage.vue";
import SignUpPage from "@/views/SignUpPage.vue";
import LandingPage from "@/views/LandingPage.vue";
import TransactionPage from "@/views/Transaction.vue";
import AdminDashboard from "@/views/admin/AdminDashboard.vue";
import ManagePsychologists from "@/views/admin/ManagePsychologists.vue";
import TransactionList from "@/views/admin/TransactionList.vue";
import UsersList from "@/views/admin/UsersList.vue";
import TotalTransaction from "@/views/admin/TotalTransaction.vue";
import UserProfile from "@/views/UserProfile.vue";
import MyHistoryPage from "@/views/MyHistory.vue";
import ManageUserProfile from "@/views/admin/ManageUserProfile.vue";
import ManageUserHistory from "@/views/admin/ManageUserHistory.vue";
import ManageSchedulePsycholog from "@/views/admin/ManageSchedulePsycholog.vue";
import DetailHistory from "@/views/DetailHistory.vue";
import ManageDiagnosis from "@/views/admin/ManageDiagnosis.vue";

const routes = [
  {
    path: "/",
    name: "HomePage",
    component: HomePage,
    meta: { title: "Home" },
  },
  {
    path: "/login",
    name: "LoginPage",
    component: LoginPage,
    meta: { title: "Login" },
  },
  {
    path: "/signup",
    name: "SignUpPage",
    component: SignUpPage,
    meta: { title: "Sign Up" },
  },
  {
    path: "/landing",
    name: "LandingPage",
    component: LandingPage,
    meta: { title: "Landing" },
  },
  {
    path: "/transaction/:userHistoryID?",
    name: "TransactionPage",
    component: TransactionPage,
    meta: { title: "Transaction" },
  },
  {
    path: "/user-profile/:userId?",
    name: "UserProfile",
    component: UserProfile,
    meta: { title: "User Profile" },
  },
  {
    path: "/my-history",
    name: "MyHistoryPage",
    component: MyHistoryPage,
    meta: { title: "My History" },
  },
  {
    path: "/detail-history/:id",
    name: "DetailHistory",
    component: DetailHistory,
    props: true,
  },
  // Admin routes
  {
    path: "/admin/dashboard",
    name: "AdminDashboard",
    component: AdminDashboard,
    meta: { title: "Admin Dashboard", requiresAuth: true, role: "admin" },
  },
  {
    path: "/admin/manage-psychologists",
    name: "ManagePsychologists",
    component: ManagePsychologists,
    meta: { title: "Manage Psychologists", requiresAuth: true, role: "admin" },
  },
  {
    path: "/admin/transaction-list",
    name: "TransactionList",
    component: TransactionList,
    meta: { title: "Transaction List", requiresAuth: true, role: "admin" },
  },
  {
    path: "/admin/total-transaction",
    name: "TotalTransaction",
    component: TotalTransaction,
    meta: { title: "Total Transactions", requiresAuth: true, role: "admin" },
  },
  {
    path: "/admin/users-list",
    name: "UsersList",
    component: UsersList,
    meta: { title: "Users List", requiresAuth: true, role: "admin" },
  },
  {
    path: "/admin/user-profile/:userId?",
    name: "ManageUserProfile",
    component: ManageUserProfile,
    meta: { title: "Manage User Profile", requiresAuth: true, role: "admin" },
  },
  {
    path: "/admin/user-history/:userId?",
    name: "ManageUserHistory",
    component: ManageUserHistory,
    meta: { title: "Manage User History", requiresAuth: true, role: "admin" },
  },
  {
    path: "/admin/manage-psychologists-schedule",
    name: "ManageSchedulePsycholog",
    component: ManageSchedulePsycholog,
    meta: {
      title: "Manage Psycholog Schedule",
      requiresAuth: true,
      role: "admin",
    },
  },
  {
    path: "/admin/manage-diagnosis",
    name: "ManageDiagnosis",
    component: ManageDiagnosis,
    meta: {
      title: "Manage Diagnosis",
      requiresAuth: true,
      role: "admin",
    },
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
