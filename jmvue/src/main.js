import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import MyHeader from './components/MyHeader.vue'
import MyFooter from './components/MyFooter.vue'
import ElementUI from 'element-ui'; 
import 'element-ui/lib/theme-chalk/index.css';
import VDistpicker from 'v-distpicker'

//配置请求时保存session信息
axios.defaults.withCredentials=true
Vue.config.productionTip = false
axios.defaults.baseURL="http://127.0.0.1:5050";
Vue.prototype.axios=axios;
Vue.component("myHeader",MyHeader);
Vue.component("myFooter",MyFooter);
Vue.component('v-distpicker', VDistpicker);

Vue.use(ElementUI);



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
