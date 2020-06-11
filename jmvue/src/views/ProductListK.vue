<template>
    <div>
        <myHeader></myHeader>
        <main class="container-fluid">
            <div class="row">
                <img class="img-fluid" style="overflow: hidden;" src="../../public/img/pic_area/korea.jpg">
            </div>
            <div class="row List">
                <div class="col-lg-3 col-md-6" v-for="(k,i) of korea" :key="i">
                    <img :src="k.pic_korea">
                    <router-link  :to="`/details/${k.href.split('=')[1]}`">
                        <h6>{{k.title}}</h6>
                        <p>¥{{k.price}}</p>
                    </router-link>
                </div>
            </div>
        </main>
        <myFooter></myFooter>
    </div>
</template>
<script>
export default {
    data(){
        return{
            korea:[{pic_korea:"",title:"",price:"",href:""}]
        }
    },
    created(){
        this.axios.get("/productLinq").then(result=>{
            //console.log(result.data);
            this.korea=result.data.korea;
        });    
    },
}
</script>
<style scoped>
@import url("../assets/css/productList.css");
</style>