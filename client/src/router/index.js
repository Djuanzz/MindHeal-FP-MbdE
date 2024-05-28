import { createRouter, createWebHistory } from 'vue-router';
import HomePage from '@/views/HomePage.vue';
import LoginPage from '@/views/LoginPage.vue';
import SignUpPage from '@/views/SignUpPage.vue';
import LandingPage from '@/views/LandingPage.vue';
import TransactionPage from '@/views/Transaction.vue';
import AdminDashboard from '@/views/admin/AdminDashboard.vue';
import ManagePsychologists from '@/views/admin/ManagePsychologists.vue';
import ScheduleManagement from '@/views/admin/ScheduleManagement.vue';
import UserHistory from '@/views/admin/UserHistory.vue';

const routes = [
  {
    path: '/',
    name: 'HomePage',
    component: HomePage,
    meta: { title: 'Home' }  
  },
  {
    path: '/login',
    name: 'LoginPage',
    component: LoginPage,
    meta: { title: 'Login' }
  },
  {
    path: '/signup',
    name: 'SignUpPage',
    component: SignUpPage,
    meta: { title: 'Sign Up' }
  },
  {
    path: '/landing',
    name: 'LandingPage',
    component: LandingPage,
    meta: { title: 'Landing' }
  },
  {
    path: '/transaction',
    name: 'TransactionPage',
    component: TransactionPage,
    meta: { title: 'Transaction' }
  },
  // Admin routes
  {
    path: '/admin/dashboard',
    name: 'AdminDashboard',
    component: AdminDashboard,
    meta: { title: 'Admin Dashboard', requiresAuth: true, role: 'admin' }
  },
  {
    path: '/admin/manage-psychologists',
    name: 'ManagePsychologists',
    component: ManagePsychologists,
    meta: { title: 'Manage Psychologists', requiresAuth: true, role: 'admin' }
  },
  {
    path: '/admin/schedule-management',
    name: 'ScheduleManagement',
    component: ScheduleManagement,
    meta: { title: 'Schedule Management', requiresAuth: true, role: 'admin' }
  },
  {
    path: '/admin/user-history',
    name: 'UserHistory',
    component: UserHistory,
    meta: { title: 'User History', requiresAuth: true, role: 'admin' }
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
