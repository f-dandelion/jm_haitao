<template>
    <div>
        <myHeader></myHeader>
        <main class="container-fluid my-3">
            <div class="row">
                <!--左侧-->
                <div id="preview" class="col pr-5">
                    <div class="card bg-transparent mr-0 ">
                        <!--左上角大图-->
                        <img   class="card-img-top" :src="pics[i].md" alt="Card image cap" id="mImg">
                        <!--小遮罩层-->
                        <div id="mask" class="position-absolute" v-show="show" :style="maskStyle"></div>
                        <!--大图整张遮罩层-->
                        <div id="super-mask" @mouseover="toggle" @mouseout="toggle" @mousemove="drag" class="position-absolute" ></div>
                        <!--鼠标经过出现右放大镜-->
                        <div id="div-lg" class="position-absolute" v-show="show"  :style="{'background-image':`url(${pics[i].lg})`,'background-position':gbPosition}"></div>
                        <!--左下角小图-->
                        <div class="card-body p-0 text-center">
                            <!--中间小图-->
                            <div class="pt-2 pl-0 mx-0 m-auto">
                                <ul  class="list-unstyled" @mouseover="changei" :style="{width:pics.length*64+'px', 'margin-left':-64*times+'px'}" id="ulImgs">
                                    <li  class="ml-0 mr-2" v-for="(p,i) of pics" :key="i">
                                        <img :data-i="i" :src="p.sm">
                                    </li>
                                </ul>
                            </div>
                         </div>
                     </div>
                </div>
                <!--右侧-->
                <div id="details" class="col pl-0">
                    <!--标题-->
                    <h6 id="pTitle" class="font-weight-bold rightR" v-text="product.jname"></h6>
                    <h6>
                        <a class="small text-dark rightR" href="javascript:;"  id="p_sub_title" v-text="product.title"></a>
                    </h6>
                    <h6>
                        <a class="small text-dark rightR" href="javascript:;"  id="p_sub_title" v-text="product.subtitle"></a>
                    </h6>
                    <!--售价-->
                    <div class="alert alert-secondary small rightR mt-3">
                        <div>
                            <span>价格：</span>
                            <h3 class="d-inline  font-weight-bold"  id="pPrice">¥{{product.price.toFixed(2)}}</h3>
                        </div>
                        <div>
                            <span>服务承诺：✔假一赔十  ✔海外直邮  ✔7天无理由退货</span>
                        </div>
                    </div>
                    <!-- 客服 -->
                    <p class="mt-3 rightR">
                        <span class="small">客服：</span>
                        <span class="small">联系客服</span>
                        <img src="../../public/img/pic_detail/kefu.gif">
                    </p>
                    <!-- 规格 -->
                    <div style="margin-left:-12px" class="small rightR mt-3" id="specs">
                        规格：<span>{{product.spec}}</span>
                    </div>
                    <!-- 数量 -->
                    <div class="rightR mt-3 num">
                        <span class="small" style="margin-left:42px">数量：</span>
                        <button type="button" @click="countGoods(false)">-</button>
                        <input id="buyNum" class="mx-2" type="text" v-model="count">
                        <button type="button" @click="countGoods(true)">+</button>   
                    </div>
                    <!-- 购买部分 -->
                    <div class="mt-3">
                        <a class="btn px-5 py-3" href="javascript:;">
                            立即购买
                        </a>
                        <a class="btn p-3 " href="javascript:;" @click="addcart" :data-sm="pics[i].sm" :data-lid="product.lid" :data-price="product.price" :data-jname="product.jname"> 
                            <img src="../../public/img/pic_detail/jiagouwu.png"> 
                             加入购物车
                            <!--@click="addcart" :data-lid="product.lid" :data-price="product.price" :data-jname="product.jname"-->
                        </a>
                        <a class="btn p-3" href="javascript:;" @click="layout">
                            <img v-if="lay_type" src="../../public/img/pic_detail/shoucanga.png" >
                            <img  v-else  src="../../public/img/pic_detail/shoucangb.png">
                            收藏
                        </a>
                    </div>
                </div>
            </div>
            <hr class="row mt-5" style="border:1px solid #E58336;">
            <div class="row imgBo" style="background-color:rgb(240, 201, 172);">
                <img class="imgDetails" :src="product.details">           
            </div>

            <!--<div class="alsrtInfo" :style="{display: displayStsates}" >
                <div class="profPrompt_test">{{aletMsg}}</div>
            </div>-->
        </main>
        <myFooter></myFooter>
    </div>
</template>
<script>
export default {
    data(){
        return{

            product:{price:0,details:""},
            pics:[
                {pid:1, sm:"", md:"",  lg:""}
            ],
            show:false,
            times:0,
            i:0,
            maskStyle:{left:0, top:0},
            count:1,
            lay_type:1
        }
    },
    props:["lid"],

    methods:{
        layout(){
            if(this.lay_type==1){
                this.lay_type=0
            }else{
                this.lay_type=1
            }
        },

        //加减
        countGoods (flag){
            if(flag){
                this.count++;
            }else{
                if(this.count <= 1) {
                    this.count = 1;
                    return};
                this.count--;
            }
        },
        
        drag(e){
            var left=e.offsetX-112.5;
            var top=e.offsetY-112.5;
            if(left<0){left=0}
            else if(left>225){left=225}
            if(top<0){top=0}
            else if(top>225){top=225}
            left=left+"px";
            top=top+"px";
            this.maskStyle={left,top};
        },
    
        toggle(){
            this.show=!this.show;
        },
    
        changei(e){
            if(e.target.nodeName=="IMG"){
                this.i=e.target.dataset.i;
            }
        },
    
        load(){
            (async ()=>{
                var result=await this.axios.get("/details",{
                    params:{ lid:this.$route.params.lid
                    }
                });
                //console.log(result.data);
                this.product=result.data.product;
                this.pics=result.data.pics;
            })();
        },
        
        addcart(event){
            var lid = event.target.dataset.lid;
            var jname=event.target.dataset.jname;
            var price=event.target.dataset.price;
            var sm=event.target.dataset.sm;
            var url = "/addcart";
            var obj = {lid:lid,jname:jname,price:price,count:this.count,sm:sm};
            this.axios.get(url,{params:obj}).then(res=>{
                if(res.data.code == -1){
                   this.$confirm("请登录").then(()=>{this.$router.push("/login")})
                }else if(res.data.code == 1){
                    this.$message("添加成功");
                    this.$router.push({path:"/carts"})
                }else{
                    this.$message("添加失败")
                }
            })

        }
        
    },
    computed:{
        gbPosition(){
            return `${-parseInt(this.maskStyle.left)*2}px ${-parseInt(this.maskStyle.top)*2}px`;
        }
    },
    created(){
        this.load();
    },
    watch:{
        $route(){
            this.times=0;
            this.i=0;
            this.maskStyle={left:0,top:0};
            this.show=false;
            this.load();
        }
    }
}
</script>
<style scoped>
/*@import url("../assets/css/productDetail.css");*/
.container-fluid.my-3 .row{
    padding-left: 100px;
    padding-right: 100px;
}
#preview>div>img{
    width:450px;
    height:450px;
}
#mask{
    width:225px; height:225px;
    background-color:#ffa;
    opacity:.5;
}
#super-mask{
    width:450px; height:450px;
}
#div-lg{
    width:450px; height:450px;
    left:450px;
    z-index:1000;
    border: 1px solid #d6d1d1;
    background-repeat: no-repeat;
    background-size: 900px 900px;
}
#preview .card{
    border: none;
    right:-30px;
}
#preview>.card>.card-body{
    width:450px;
}
#preview>.card>.card-body>div>ul>li{
    width:64px; 
    height:64px;

}
#preview>.card>.card-body>div>ul img:hover{
    border:1px solid #E58336;
}
#preview>.card>.card-body>div>ul{
    transition:margin-left .5s linear;
    display: flex;
    justify-content: flex-start;
}
#preview>.card>.card-body>div{
    width:100%;
    overflow:hidden; 
}
#details{
    margin-right:30px;
}
#pTitle{
    font-size:20px;
}
.rightR{
    padding-left:10px;
}
#pPrice{
    color:#E58336
}
.num{
    display: flex;
    justify-content: center;
}
.num button,.num input{
    width:30px;
    height:30px;
}
.num input{
    text-align: center;
    line-height: 30px;
}
#details>div:last-child a{
    background: #E58336;
    height:50px;
    color:#fff;
    line-height:20px;
}
#details>div:last-child a:visited,
#details>div:last-child a:hover,
#details>div:last-child a:active{
    background: rgb(177, 80, 5);
}
#details>div:last-child a:nth-child(2),
#details>div:last-child a:nth-child(3){
    margin-left:30px;
}
#details>div:last-child a:nth-child(3) img{
    margin-right: 5px;
}
.imgDetails{
    margin:0 auto
}
.imgBo{
    margin-bottom:-15px
}
.btn:focus, .btn.focus {
    outline: 0;
    box-shadow: none;
}

.alsrtInfo{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 10;
    background: rgba(0, 0, 0, 0.1);
}
.profPrompt_test{
    padding: 30px 10px;
    width: 480px;
    overflow: hidden;
    line-height: 28px;
    border: 1px solid #4eb6d3;
    color: #4eb6d3;
    position: absolute;
    background-color: #fbfbfb;
    top: 356px;
    left: 50%;
    font-size: 14px;
    font-family: Gotham-Book;
    /*opacity: 1;*/
    /* z-index: 1; */
    text-align: center;
    transform: translate(-50%, -50%);
    }
  
</style>