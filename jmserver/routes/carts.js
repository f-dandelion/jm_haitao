const express=require("express");
const router=express.Router();
const pool=require("../pool");

//查询指定用户购物车信息
router.get("/",(req,res)=>{
   var uid = req.session.uid;
   if(!uid){
     res.send({code:-1,msg:"请登录"});
     return;
   }

   var sql = "SELECT * FROM ";
   sql+=" jm_cart WHERE uid = ?";
   pool.query(sql,[uid],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"查询成功",data:result})
   })
});

module.exports=router;