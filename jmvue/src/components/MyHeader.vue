<template>
    <header class="container-fluid">
        <div class="row topBack">
            <div class="col-sm-4">
                <ul class="breadcrumb pl">
                    <li class="breadcrumb-item">
                        <router-link to="/index"><span class="fontS">欢迎来到桔猫</span></router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'/login'}" class="fontS pl-sm-0" >请登录</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'/register'}" class="fontS pl-sm-0" >注册</router-link>
                    </li>
                </ul>
            </div>
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#"><img class="smallPng  s11" src="../../public/img/pic_logo/me.png"></a>
                        <router-link to="/center" class="fontS" >个人中心</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <a href=""><img class="smallPng s12" src="../../public/img/pic_logo/heZuo.png"></a>
                        <a class="fontS">合作专区</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href=""><img class="smallPng s12" src="../../public/img/pic_logo/phone.png"></a>
                        <a class="fontS" >手机端</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-12 animated rubberBand ">
                <a class="navbar-brand  pli"><img class="logo img-fluid" src="../../public/img/pic_logo/logo.png"></a>
                <br>
                <span class="fontC fontL">桔猫海淘</span>
            </div>
            <div class="col-md-4 col-sm-12 mt">
                <div class="input-group">
                    <input class="form-control" v-model="kw" @keydown.13="search" placeholder="生姜洗发水" type="text">
                    <img class="imgS" @click="search" src="../../public/img/pic_logo/search.png">
                </div>   
                <div class="miniF" v-if="somePro">
                    <router-link :to="`/details/${somePro[32].lianjie}`" class="miniC" >卡诗护发</router-link>
                    <router-link :to="`/details/${somePro[22].lianjie}`" class="miniC" >菲拉格慕</router-link>
                    <router-link :to="`/details/${somePro[15].lianjie}`" class="miniC" >娇兰口红</router-link>
                    <router-link :to="`/details/${somePro[11].lianjie}`" class="miniC">兰芝气垫</router-link>
                    <router-link :to="`/details/${somePro[13].lianjie}`" class="miniC">悦诗风吟</router-link>
                </div>
            </div>
            <div class="col-md-4 col-sm-12 mt">
                <div class="mr">
                    <a  href=""><img src="../../public/img/pic_logo/shop.png"></a>
                    <router-link to="/carts" class="fontC" >购物袋</router-link>
                </div>
            </div>
        </div>
    </header>
</template>
<script>
export default {
    data(){
        return{
            kw:"",
            somePro:""
        }    
    },
    methods:{
        search(){
            if(!this.kw){
                this.$router.push("/details/35")
            }else{
                this.$router.push("/searchPro/"+this.kw)
            }
        },
        intro(){
            this.axios.get("/index").then(result=>{
            this.somePro=result.data;

        });
        }
    },
    created(){
        this.kw=this.$route.params.kw;
        this.intro()
    },
    watch:{
        $route(){
            this.kw=this.$route.params.kw;
        }
    }
}
</script>
<style scoped>
/*@import url("../assets/css/header.css");*/
.breadcrumb-item + .breadcrumb-item::before{
    content:""
}
.breadcrumb{
    background-color: transparent;
}
.topBack{
    background:#E58336;
    height:50px;
}
.fontS{
    font-size:16px;
    color:#434343;
}
.fontS:hover{
    color:rgb(192, 3, 3);
}
.smallPng{
    border-radius: 50%;
}
.s11{
    margin-left:-13px
}  
.s12{
    margin-left:5px
}
.pl{
    padding-left: 106px;
}
.pli{
    margin-left:-80px
}
.logo{
    border-radius: 50%;
}
.fontC{
    color:#E58336;
}
.fontC:hover{
    color:rgb(192, 3, 3);
}
.fontL{
    margin-left: -140px;
    font-style: italic;
}
.mt{
    top:50px;
}
.mr{
    /*position: absolute;
    right:126px;*/
    margin-top:15px;
    margin-right:-120px
}
.form-control:focus{
    border-color:#ced4da;
    box-shadow: none;
}
.form-control:focus::-webkit-input-placeholder{
    color: transparent;
}
.imgS{
    border: 1px solid #ced4da;
    border-radius:0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.miniF{
    display: flex;
    justify-content: space-around;
}
.miniC{
    color:#6C757D;
}
.miniC:hover{
    color:rgb(192, 3, 3);
}
.col-sm-4:nth-child(3)>.breadcrumb>.breadcrumb-item:nth-child(3):hover::after{
    content:"";
    width:110px;
    height:110px;
    border:0.3rem solid #E58336;
    border-top: none;
    background: url(../../public/img/pic_logo/ewm.png) top right;
    background: 100% auto;
    opacity: 0.8;
    position: absolute;
    top:50px;
    right:120px;/** 100*/
    z-index:15;
}

</style>