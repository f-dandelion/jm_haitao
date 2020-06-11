<template>
    <div class="order">
        <table>
           <tbody>
               <tr>
                   <th>选择</th>
                   <th>商品</th>
                   <th>金额</th>
                   <th>删除</th>
               </tr>
                <tr v-for="(item,index) of list" :key="index">
                    <td>
                        <input type="checkbox" v-model="item.cb">
                    </td>
                    <td   class="orderImg">
                        <img :src="item.sm" >
                        <span>{{item.jname}}</span>
                    </td>
                    <td   class="order_price">
                        <span>¥{{(item.price*item.count).toFixed(2)}}</span>
                    </td>
                    <td>
                        <img :data-index="index"   @click="deletePro($event)" src="../../public/img/pic_detail/close.png" >
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
        }
    },
    methods:{
        deletePro(event){
            for(var item of this.list){
                if(item.cb){
                        this.$confirm("是否删除指定数据").then(res=>{
                            var id = event.target.dataset.index;
                            var url="/delItems/delItem";
                            var obj={id:id};
                            this.axios.get(url,{ params:obj}).then(res=>{
                                if(res.data.code==1){
                                    this.$message("删除成功");
                                    this.loadMore();
                                }else{
                                    this.$message("删除失败"); 
                                }
                            }) 
                        }).catch(err=>{
                        })
                }
            }
        },

        loadMore(){
            this.axios.get("/carts").then(res=>{
                if(res.data.code == -1){
                    this.$confirm("请登录").then(res=>{
                        this.$router.push("/login")
                    })
                }else{
                    var rows = res.data.data;
                    for(var item of rows){
                        item.cb = false;
                    }
                        this.list=rows;
                }
            })
        },
        
    },
    created(){
        this.loadMore()
    }
}
</script>
<style scoped>
.order{
    width:50%;
    background:#fff;
    margin-top:50px;
    margin-left:10px;
    margin-bottom:100px;
    padding:0
}
.order table{
    width:100%
}
.order tr:first-child{
    background:#EEEEEE;
    height:30px
}
.orderImg{
    text-align: left;
    padding-left:70px
}
.order_price{
    width:220px;
}
</style>