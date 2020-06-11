<template>
    <div>
        <myHeader></myHeader>
        <main class="container-fluid">
            <div class="row">
            <div class="col-3">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a href="#collapseOne" data-toggle="collapse" data-parent="#accordion">全部订单</a>
                            </h5>
                        </div>
                        <div class="panel-collapse collapse" id="collapseOne">
                            <ul class="panel-body">
                                <li @click="tabChange(child1)">待付款</li>
                                <li @click="tabChange(child1)">待收货</li>
                                <li @click="tabChange(child1)">已完成</li>
                                <li @click="tabChange(child1)">已取消</li>
                            </ul>
                        </div>
                    </div>
            
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a href="#collapseTwo" data-toggle="collapse" data-parent="#accordion">优惠券</a>
                            </h5>
                        </div>
                        <div class="panel-collapse collapse" id="collapseTwo">
                            <ul class="panel-body">
                                <li>满100-10</li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a href="#collapseThree" data-toggle="collapse" data-parent="#accordion">收货地址</a>
                            </h5>
                        </div>
                        <div class="panel-collapse collapse" id="collapseThree">
                            <ul class="panel-body">
                                <li @click="tabChange(child2)">地址管理</li>
                            </ul>
                        </div>
                    </div>
 
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a href="#collapseFour" data-toggle="collapse" data-parent="#accordion">账号管理</a>
                            </h5>
                        </div>
                        <div class="panel-collapse collapse" id="collapseFour">
                            <ul class="panel-body">
                                <li @click="tabChange(child3)">个人信息</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 动态地绑定到它的 is 特性，让多个组件可以使用同一个挂载点，并动态切换 -->
            <div class="col-6" :is="currentView"></div>
            </div>
        </main>
        <myFooter></myFooter>
    </div>
</template>

<script>
import order from '../components/order';
import order_address from '../components/address';
import account from '../components/account';
export default {
    data(){
        return{
            child1: 'order',
            child2: 'order_address',
            child3: 'account',
            currentView: 'order'
        }
    },
    methods:{
        tabChange(tabItem) {
       this.currentView = tabItem;
     },

     
    },
    create(){
        
    },
    components:{
        order,
        order_address,
        account
   }
}
</script>

<style scoped>
.panel-group{
    margin-left:200px;
    margin-top:50px
}
.panel{
    width:120px;
    background:#E58336;
    opacity: 1;
    border-radius: 5px;
}
.panel-title{
    height:30px;
    line-height:30px
}
.panel-title a{
    color:#5d5858
}
.panel-collapse{
    background:#fff
}
.panel-title a:hover,.panel-body li:hover{
    color:rgb(192, 3, 3)
}
</style>