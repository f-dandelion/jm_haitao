<template>
    <footer class="container-fluid foot">
        <hr style="border:2px solid #E58336">
        <div class="row footT">
            <img class="img-fluid" src="../../public/img/pic_foot/promise.jpg">
        </div>
        <hr>
        <div class="row footM">
            <div class="col-2 itemMl">
                <div class="itemFont">桔猫海淘</div>
                <div>
                    <span>关注我们</span>
                    <img src="../../public/img/pic_foot/weix.jpg">
                </div>
            </div>
            <div class="col-10 itemMr">
                <ul>关于桔猫海淘
                    <li><a href="#">桔猫国际合作伙伴</a></li>
                    <li><a href="#">入驻桔猫海淘</a></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
                <ul>购物指南
                    <li><a href="#">购物流程</a></li>
                    <li><a href="#">订单操作</a></li>
                    <li><a href="#">海关通关及关税</a></li>
                    <li><a href="#">免税额度查询</a></li>
                </ul>
                <ul>支付方式
                    <li><a href="#">网银支付</a></li>
                    <li><a href="#">快钱支付</a></li>
                    <li><a href="#">信用卡支付</a></li>
                    <li><a href="#">预存款支付</a></li>
                    <li><a href="#">网上支付小贴士</a></li>
                </ul>
                <ul>物流与配送
                    <li><a href="#">专业快递配送</a></li>
                    <li><a href="#">配送订单查询</a></li>
                    <li><a href="#">验货与签收</a></li>
                </ul>
                <ul>常见问题
                    <li><a href="#">退货说明</a></li>
                    <li><a href="#">换货说明</a></li>
                    <li><a href="#">常见问题</a></li>
                    <li><a href="#">退换货流程</a></li>
                </ul>
                <ul>服务保证
                    <li><a href="#">正品保证</a></li>
                    <li><a href="#">质量保证</a></li>
                    <li><a href="#">价格保证</a></li>
                    <li><a href="#">物流保证</a></li>
                    <li><a href="#">售后保证</a></li>
                </ul>
            </div>
        </div>
    </footer> 
</template>
<script>
export default{

}
</script>
<style scoped>
/*@import url("../assets/css/footer.css");*/
.foot{
    background: #FFFFFF;
    padding:0;
}
.footT{
    justify-content: center;
    margin:50px 0;   
}
hr{
    margin:0;
}
.footM{
    margin:50px 0;
    padding:0 50px;
    height:220px;
    overflow: hidden;
}
.itemMl{
    padding-left: 0px;
}
.itemMr{
    display: flex;
    justify-content: space-between;
    padding-left:30px;
}
.itemFont{
    color:#E58336;
    font-size:26px;
    margin-bottom:10px;
}
.itemMl span{
    color:#5d5858;
    font-size:14px;
    margin-right:10px;
}
.itemMr ul{
    color:#5d5858;
    font-size:18px;
}
.itemMr li a{
    color:#5d5858;
    font-size:14px;
}
</style>