import Vue from 'vue'
import Router from 'vue-router'
import Index from '../views/Index.vue'
import Products from '../views/ProductLinq.vue'
import Producte from '../views/ProductListE.vue'
import Productk from '../views/ProductListK.vue'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import carts from '../views/carts.vue'
import searchPro from '../views/searchPro.vue'
import center from '../views/center.vue'
import NotFound from "../views/NotFound.vue"
import Details from '../views/ProductDetail.vue'

Vue.use(Router)

export default new Router({
  //mode:'history',   //打开history图片不加载

  scrollBehavior (to, from, savedPosition) {     
    if(savedPosition) {       
      return savedPosition     
    }else{       
      return { x: 0, y: 0 }     
    }   
  },
  routes:[
    {path:'/',component:Index},
    {path:'/index',component:Index},
    {path:'/details/:lid',component:Details,props:true},
    {path:'/products',component:Products},
    {path:'/producte',component:Producte},
    {path:'/productk',component:Productk},
    {path:'/login',component:Login},
    {path:'/register',component:Register},
    {path:'/carts',component:carts},
    {path:'/searchPro/:kw',component:searchPro,props:true},
    {path:'/center',component:center},
    {path:'/*',component:NotFound},
    //{ 
      //path: '/details/:lid',
      /*lazyLoad解释route level code-splitting
     this generates a separate chunk (about.[hash].js) for this route
     which is lazy-loaded when the route is visited.*/
      //component: () => import(/* webpackChunkName: "details" */ '../views/ProductDetail.vue'),
      //props:true
    //}
  ] 
})


