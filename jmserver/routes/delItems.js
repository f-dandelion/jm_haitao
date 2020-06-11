const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    //0:判断用户是否登录
    //1:获取参数 id=1,2,3
    var id = req.query.id;
    //console.log(id)
    //2:创建 sql语句
    var sql=`DELETE FROM jm_cart`;
    sql+=` WHERE id IN (${id})`; 
    //3:执行sql语句
    pool.query(sql,(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
        res.send({code:1,msg:"删除成功"})
      }else{
        res.send({code:-1,msg:"删除失败"})
      }
    })
   })

   router.get("/delItem",(req,res)=>{
    
    //1：获取客户端发送数据id
    var id = req.query.id;
    //2: 创建sql语句
    var sql = "DELETE FROM jm_cart WHERE id=?";
    //3: 执行sql语句
    pool.query(sql,[id],(err,result)=>{
       if(err)throw err;
       //4: 获取服务器获取结果判断删除是否成功
       if(result.affectedRows>0){
         res.send({code:1,msg:"删除成功"});
       }else{
         res.send({code:-1,msg:"删除失败"});
       }
    })
   })


module.exports=router;