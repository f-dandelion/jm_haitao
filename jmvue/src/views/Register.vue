<template>
    <div>
       <main class="container-fluid">
        <div class="row loginTop">
            <div>
                <span>桔猫海淘</span>
                <span>请注册</span>
            </div>
        </div>
        <div class="row loginM">
            <div class="panel">
                <form id="form-register">
                  <div class="txt">
                    <p>新用户注册
                      <span>
                        <router-link to="/login">直接登录</router-link>
                      </span>
                    </p>
                  </div>
                  <div class="form-group">
                    <label for="uname">用户名：</label>
                    <input  v-model="uname" @blur="checkRegular1" autocomplete="" required="" minlength="3" maxlength="12" type="text" placeholder="请输入用户名" autofocus="" id="name">
                  </div>
                  <div class="form-group">
                    <label for="upwd">登录密码：</label>
                    <input v-model="upwd"  @blur="checkRegular2" required="" type="password" minlength="6" maxlength="12" placeholder="请输入密码"  autofocus="" id="password">
                  </div>
                  <div class="form-group">
                    <label for="upwdconfirm">确认密码：</label>
                    <input v-model="confirmPwd" @blur="checkRegular3" required="" type="password" minlength="6" maxlength="12" placeholder="请确认密码" autofocus="" id="upwdconfirm">
                  </div>
                  <div class="form-group">
                    <label for="email">邮箱：</label>
                    <input v-model="email" @blur="checkRegular4" autocomplete="" required="" type="email" placeholder="请输入邮箱地址"  id="email">
                  </div>
                  <div class="form-group">
                    <label for="phone">手机号：</label>
                    <input v-model="phone" @blur="checkRegular5" id="phone"  placeholder="请输入您的手机号"  required="" type="text">
                  </div> 
                  <div class="form-group">
                    <label></label>
                    <input @click="register" type="button" value="提交注册信息" id="bt-register">
                  </div>
                </form>
              </div>
        </div>
       </main>
       <myFooter></myFooter>
    </div>
</template>
<script>
import qs from 'qs'

export default {
    data(){
      return{
        uname:'',
        upwd:'',
        confirmPwd:'',
        email:'',
        phone:''
      }
    },
    methods:{
      checkRegular1(){if(this.uname == '' || this.uname == null) {
              this.$message('用户名不能为空！');
              return;
      }},
      checkRegular2(){if(!/^(\w){6,12}$/.test(this.upwd)) { 
              this.$message('密码为6-12位！');
              return;
      }},
      checkRegular3(){if(this.upwd != this.confirmPwd) { 
              this.$message('两次密码不一致！');
              return;
      }},
      checkRegular4(){if(!/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/.test(this.email)) { 
              this.$message('请输入正确的邮箱');
              return;
      }},
      checkRegular5(){if(!/^((13|14|15|17|18)[0-9]{1}\d{8})$/.test(this.phone)) { 
              this.$message('请输入正确的手机号');
              return;
      }},      
   

      register(){
        var param={
            uname: this.uname,
            upwd: this.upwd,
            confirmPwd: this.confirmPwd,
            email: this.email,
            phone: this.phone
        }
        this.axios.post("/register", 
                  qs.stringify(param),
                  {headers:{'Content-Type':'application/x-www-form-urlencoded'}}).then((res) => {
                  res = res.data;
                  if(res.code == 200) {
                    this.uname = '';
                    this.upwd = '';
                    this.confirmPwd = '';
                    this.email = '';
                    this.phone='';
                    this.$message('注册成功');
                    this.$router.push('/')
                  }else{
                    this.$message( '请按要求完成您的注册');
                  }
                })
      }
    },
    created(){
      
    }
}
</script>
<style scoped>
@import url("../assets/css/login.css");
</style>