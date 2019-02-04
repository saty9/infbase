import Vue from 'vue/dist/vue.esm'
import App from '../src/App.vue'
import VueRouter from 'vue-router'
import Vuex from "vuex";
import router from "../src/router";
import store from "../src/store"
import Argon from "../src/plugins/argon-kit";
import axios from 'axios'
import VueAxios from 'vue-axios'


Vue.config.productionTip = false;

Vue.use(VueRouter);
Vue.use(Vuex);
Vue.use(Argon);
Vue.use(VueAxios, axios);
Vue.use(require('vue-cookies'));

document.addEventListener('DOMContentLoaded', () => {
  axios.defaults.headers.common['Accept'] = 'application/json';
  axios.defaults.headers.common['Content-Type'] = 'application/json';
  let v = new Vue({
    store,
    router,
    render: h => h(App)
  }).$mount("#app");
  store.$axios = v.axios;
  if (window.$cookies.get('userId') && window.$cookies.get('jwt')){
    v.$store.dispatch('signedIn',[window.$cookies.get('jwt'),window.$cookies.get('userId')])
  }
})

