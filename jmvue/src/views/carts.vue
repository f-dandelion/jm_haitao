<template>
    <div>
        <myHeader></myHeader>
        <main class="container-fluid">
            <div class="row cTitle">
                <div class="col">
                    <img src="../../public/img/pic_detail/cart2.png" alt="">
                    
                </div>
            </div>
            <div class="row cBody">
                <div class="col">
                    <label>
                        <input  @click="selectProduct(isSelectAll)" v-bind:checked="isSelectAll"  type="checkbox" >
                        全选
                    </label>

                    <span class="pudc_top ">商品</span>
                    <span class="price_top">单价(元)</span>
                    <span class="num_top">数量</span>
                    <span class="totle_top">金额</span>
                    <span class="del_top">操作</span>
                </div>
            </div>
            <div class="row cartPro">
                <div class="col-12 cartList " v-for="(item,index) of list" :key="index">
                    <div class="cart-item my-3" >
                            <input type="checkbox" v-model="item.cb">
                            <img class="pudc_top" :src="item.sm">
                            <span class="lname">{{item.jname}}</span>
                            <span class="price">¥{{item.price}}</span>
                            <span  class="buyNum">
                            <button  @click="item.count>1?item.count--:''">-</button>
                            <button>{{item.count}}</button>
                            <button  @click="item.count++">+</button>
                            </span>
                            <span class="pC">¥{{(item.price*item.count).toFixed(2)}}</span>
                            <button class="del" :data-id="item.id"   @click="deletePro($event)">删除</button>
                    </div>
                </div>
            </div>
            <div class="row cFoot mb-5">
                <div class="col">
                       <label @click="deleteItems">删除选中商品</label>

                       <b>
                        已选<span class="">{{getTotal.totalNum}}</span>件商品
                        <span class=""></span>合计(不含运费):
                        <span class="">¥{{getTotal.totalPrice}}</span>
                        <span class="">元</span>
                    </b>
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
            list:[],
            
        }
    },

    methods:{


        //全选
        selectProduct(_isSelect){
            //遍历list，全部取反
            for (var i = 0; i < this.list.length; i++) {
                this.list[i].cb = !_isSelect;
            }
        },
        
        
        //删除单个
        deletePro(event){
            //this.list.splice(index,1);
            this.$confirm("是否删除指定数据").then(res=>{
            //将当前商品id传递函数
            var id = event.target.dataset.id;
            var url="/delItems/delItem";
            var obj={id:id};
            this.axios.get(url,{
                params:obj
            }).then(res=>{
                if(res.data.code==1){
                    this.$message("删除成功");
                    this.loadMore();//刷新
                }else{
                    this.$message("删除失败"); 
                }
            }) 
            }).catch(err=>{
           })
        },
        
        //删除多个
        deleteItems(){
            this.$confirm("是否删除指定宝贝").then(res=>{
                var id = "";
                for(var item of this.list){
                    if(item.cb){
                        id+=item.id+",";
                    }
                }
                id = id.slice(0,-1);
                if(id==""){
                    this.$message("请选择需要删除商品");
                    return;
                }
                var url = "/delItems";
                var obj = {id:id};
                this.axios.get(url,{params:obj}).then(res=>{
                    if(res.data.code==-1){
                        this.$message("删除失败");
                    }else{
                        this.$message("删除成功");
                        this.loadMore();
                    }
                })
            })
        },

        //请求数据
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
                        //console.log(this.list)
                }
            })
        },
        


    },
    
    computed:{
        //检测单个是否都选中
        isSelectAll:function(){
            //如果list中每一条数据的cb都为true，返回true，否则返回false;
            return this.list.every(function (val) { return val.cb});
        },
        
        //合计
        getTotal(){
			var prolist = this.list.filter(function(val){ return val.cb}),
			totalPri=0;
			for(var i = 0; i < prolist.length; i++){
				totalPri+=prolist[i].price*prolist[i].count;
			}
			return {totalNum:prolist.length,totalPrice:totalPri}
		},
    },
    created() {
        this.loadMore(); 
        
    }
        
}
</script>
<style scoped>
.cTitle{
    width:70%;
    height:50px;
    margin:0 auto;
    margin-top:50px;
}
.cTitle div{
    width:100%;
    background:#fff
}
.cTitle .col,.cBody .col,.cFoot .col{
    display: flex;
    justify-content: space-between;
}
b{
   line-height:50px;
}
.cBody,.cFoot{
    width:70%;
    height:50px;
    line-height:50px;
    background-color: #EEEEEE;
    margin:0 auto;
    border-top:1px solid #ccc;
    box-shadow:0px 0px 4px 0px #ccc outside;
}
.cartPro{
    width:70%;
    /*height:500px;*/
    background-color: #fff;
    margin:0 auto;
}
.pudc_top{
    margin-left:50px;
}
.price_top{
    margin-left:70px
}
.num_top,.totle_top{
    margin-left:-20px
}
.del_top{
   margin-right:40px
}
.lname{
    display: inline-block;
    width:300px;
}
.price{
    display: inline-block;
    width:80px;
    margin-left:-20px;
}
.buyNum{
    margin-left:55px;
}
.buyNum button{
    width:25px;
}
.pC{
    display: inline-block;
    width:80px;
    margin-left:40px
}
.del{
    margin-left:80px
}
.cartList{
    width:70%;
    /*height:300px;*/
    margin:0 auto;
    background:#fff;
    border-top:1px solid #ccc;
     display: flex;
    justify-content: space-between;
}
</style>