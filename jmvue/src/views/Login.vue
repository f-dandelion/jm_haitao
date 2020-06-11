<template>
    <div>
      <main class="container-fluid">
        <div class="row loginTop">
            <div>
                <span>桔猫海淘</span>
                <span>欢迎登录</span>
            </div>
        </div>
        <div class="row loginM">
            <div id="cover" class="rt">
                <form id="form-login">
                  <div class="txt">
                    <p>登录桔猫
                        <span>
                            <router-link :to="{path:'/register'}" class="zhuCe">新用户注册</router-link>
                        </span>
                    </p>    
                    <div class="text">
                      <input type="text" placeholder="请输入您的用户名" v-model="uname"  id="name" required="" autofocus="">
                      <span><img src="../../public/img/pic_login/user.png"></span>
                    </div>
                    <div class="text">
                      <input type="password" id="password" placeholder="请输入您的密码" v-model="upwd"   required="" minlength="6" maxlength="12">
                      <span><img src="../../public/img/pic_login/password.png"></span>
                    </div>
                    <div class="chose">
                      <input type="checkbox" class="checkbox" id="ck_rmbUser" value="0">
                      <span>自动登录</span>
                      <span>忘记密码？</span>
                    </div>
                    <input class="button_login" @click="loginIn" type="button" value="登录" id="bt-login">
                  </div>
                </form>
              </div>
              <!--错误提示
              <div id="showResult" style="color: red;">用户名不能为空！</div>-->
        </div>  
      </main>
      <myFooter></myFooter>
    </div>
</template>
<script>
export default {
      data(){
        return{
          uname:"",
          upwd:"",
        }
      },
      methods:{

        loginIn(){
            var u=this.uname;
            var p=this.upwd;
            var reg1=/^[0-9]{3,12}$/i;
            var reg2=/^[0-9a-z]{6,12}$/i;
            if(reg1.test(u)){
                this.$message.error("用户名格式不正确");
                return
            }
            if(!reg2.test(p)){
                this.$message.error("密码格式不正确");
                return
            }
            var obj={uname:u,upwd:p}
           this.axios.get("/login",{params:obj}).then(res=>{
                //console.log(res.data);
                if(res.data.code==200){
                    this.$message({message:"登录成功",type:'success',center:'true'});
                    this.$router.push("/index");
                    
                }else{
                    this.$message.error("用户名或密码有误")
                }
            })  
        }  
      }
}
</script>
<style scoped>
@import url("../assets/css/login.css");
</style>