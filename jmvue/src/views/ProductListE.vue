<template>
    <div>
        <myHeader></myHeader>
        <main class="container-fluid">
            <div class="row">
                <img class="img-fluid" style="overflow: hidden;" src="../../public/img/pic_area/europe.jpg">
            </div>
            <div class="row List">
                <div class="col-lg-3 col-md-6" v-for="(eu,i) of europe" :key="i">
                    <img :src="eu.pic_europe">
                        <router-link  :to="`/details/${eu.href.split('=')[1]}`">
                            <h6>{{eu.title}}</h6>
                            <p>¥{{eu.price}}</p>
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
            europe:[{pic_europe:"",title:"",price:"",href:""}]
        }
    },
    created(){
        this.axios.get("/productLinq").then(result=>{
            //console.log(result.data);
            this.europe=result.data.europe;
        });    
    },
}
</script>
<style scoped>
@import url("../assets/css/productList.css");
</style>