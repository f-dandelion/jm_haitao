<template>
    <div class="mine">
        <div class="mine_top">我的信息</div>
        <div class="mine_img"><img :src="userInfo.avater"> </div>
        <div>用户名:<input type="text" v-model="userInfo.uname"></div>
        <div>性别:<label class="sex"><input type="radio" name="gender" checked="checked">男</label>
                  <label><input type="radio" name="gender">女</label>
        </div>
        <div>绑定电话:<input type="number" v-model="userInfo.phone"> <span>更改</span>  </div>
        <div>绑定邮箱:<input type="email" v-model="userInfo.email">  <span>更改</span>  </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            userInfo:{}
        }
    },
    methods:{
        user(){
            this.axios.get("/userCenter").then(res=>{
                 this.userInfo=res.data[0];
                 //console.log(this.userInfo)
            })
        },
    },
    created(){
        this.user()
    }
}
</script>
<style scoped>
.mine{
    width:50%;
    height:400px;
    background:#fff;
    margin-top:50px;
    margin-left:10px;
    margin-bottom:100px;
    padding:0;
    text-align: left;
}
.mine_top{
    width:100%;
    height:30px;
    background:#EEEEEE;
    line-height: 30px;
    font-weight:bold;
}
.mine_img{
    width:100px;
    height:100px;
    border:1px solid #E58336;
    border-radius: 3px;
    margin-top:-15px;
    margin-left:15px;
    overflow: hidden;
}
.mine input{
    outline: none;
}
.sex{
    margin-right:50px;
    margin-left:20px
}
.mine div{
    margin-bottom: 30px;
}
</style>