<template>
    <div class="address">
        <div class="address_top">地址管理</div>
        <span class="address_content_title">新建地址</span>
        <table class="ad_table" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="label_name">收&nbsp;货&nbsp;&nbsp;人：</td>
                <td>
                    <input v-model="name" name="" type="text"  class="add_text" style=" width:100px"/>
                    <i>*</i>
                </td>
            </tr>
            <tr>
                <td class="label_name">所在地区：</td>
                <td>
                    <!--<v-distpicker  class="city"></v-distpicker>-->
                    <input v-model="city" type="text" style="width:300px">
                    <i>*</i>
                </td>
            </tr>
            <tr>
                <td class="label_name">街道地址：</td>
                <td>
                    <input v-model="street" name="" cols="" rows="" style="width:500px">
                    <i>*</i>
                </td>
            </tr>
            <tr>
                <td class="label_name">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
                <td>
                    <input v-model="mail" name="" type="text" class="add_text" style=" width:100px"/>
                    <i>*</i>
                </td>
            </tr>
            <tr>
                <td class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
                <td>
                    <input v-model="phone" name="" type="text" class="add_text" style=" width:200px"/>&nbsp;&nbsp;(选填)
                </td>
            </tr>
        </table>
        <div class="center">
        <input @click="save" name="" type="submit" value="保存"  class="add_dzbtn"/>
        <input @click="clear" name="" type="reset" value="清空"  class="reset_btn"/>
        </div>
        <span class="address_content_title">收货地址</span>
        <div class="address_content">
            <table cellpadding="0" cellspacing="0" class="user_address" width="100%">
                <thead class="user_address_thead">
                    <tr class="label"><td width="80px;">收货人</td><td width="180px;">所在地</td><td width="220px;">详细地址</td><td width="80px;">邮编</td><td width="120px;">手机</td><td width="180px;">发票</td></tr>
                </thead>
                <tbody class="user_address_tbody">
                    <tr v-for="(item,i) of address" :key="i">
                        <td>{{item.name}}</td>
                        <td>{{item.city}}</td>
                        <td>{{item.street}}</td>
                        <td>{{item.mail}}</td>
                        <td>{{item.phone}}</td>
                        <td>个人</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
import VDistpicker from 'v-distpicker'
export default {
    data(){
        return{
            name:'',
            city:'',
            street:'',
            mail:'',
            phone:'',
            address:[],
            //[{name:'李明',city:'江苏南京雨花台区',street:'大件路4号软件大厦B栋102室',
            //mail:'210000',phone:'12343323221'}]
        }
    },
    methods:{
        save(){
            var newAdd={};
            newAdd.name=this.name;
            newAdd.city=this.city;
            newAdd.street=this.street;
            newAdd.mail=this.mail;
            newAdd.phone=this.phone;
            this.address.push(newAdd)
        },
        clear(){
            this.name='',
            this.city='',
            this.street='',
            this.mail='',
            this.phone=''
        }
    },
     components: { VDistpicker }
}
</script>
<style scoped>
.address{
    width:50%;
    background:#fff;
    margin-top:50px;
    margin-left:10px;
    margin-bottom:100px;
    padding-bottom:20px;
    padding-left:0;
    padding-right:0;
    text-align: left;
}
.address input{
    outline: none;
}
.address_top{
    width:100%;
    height:30px;
    background:#EEEEEE;
    line-height: 30px;
    font-weight:bold;
}
.ad_table input{
    margin-bottom:10px
}
.city{
    margin-bottom:10px
}
.center{
    display: flex;
    justify-content: center;
    margin-bottom:30px;
}
.add_dzbtn{
    margin-right:30px
}
.address_content_title{
    font-weight: bold;
}
.address_content{
    margin-top:8px;
}
.user_address_thead{
    background:#EEEEEE
}
.user_address td{
    text-align:center
}
.user_address_tbody td{
    border:1px solid #ccc;
}


</style>