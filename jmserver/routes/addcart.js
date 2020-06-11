const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请先登录"});
    return;
  }
    //console.log(req.query)
    var lid = req.query.lid;
    var price = req.query.price;
    var jname = req.query.jname;
    var count=req.query.count;
    var sm=req.query.sm;
    //console.log(sm)
    //创建查询sql:当前用户是否购买 此商品var sql = "SELECT id FROM jm_cart";
    var sql = "SELECT id FROM jm_cart";
    sql+=" WHERE uid = ? AND lid = ?";
    //5:执行sql语句
    pool.query(sql,[uid,lid],(err,result)=>{
      if(err)throw err;
      //在回调函数中判断下一步操作
      //  没购买过此商品  添加
      //  己购买过此商品  更新
      if(result.length==0){
       var sql = `INSERT INTO jm_cart VALUES(null,${uid},${lid},'${jname}',${price},${count},'${sm}')`;
      }else{
       var sql = `UPDATE jm_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
      }
      //执行sql获取返回结果
      pool.query(sql,(err,result)=>{
        if(err)throw err;
        //如果sql UPDATE INSERT DELETE
        //判断执行成功 result.affectedRows 影响行数
        if(result.affectedRows>0){
          console.log(result)
         res.send({code:1,msg:"商品添加成功"});
        }else{
         res.send({code:-2,msg:"添加失败"}); 
        }
      })
    })
})

module.exports=router;