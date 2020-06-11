const express=require("express");
var router=express.Router();
var pool=require("../pool.js");


router.get("/",(req,res)=>{
        //console.log(req.query);
    var u=req.query.uname;
    var p=req.query.upwd;
    //upwd=md5(?)
    var sql="SELECT uid FROM jm_user WHERE uname=? AND upwd=?";
    pool.query(sql,[u,p],(err,result)=>{
        if(err) throw err;
        //console.log(result)
	    if(result.length>0){
            var uid = result[0].uid;
            req.session.uid = uid;
	        res.send({code:200,msg:"登录成功"});
	    }else{
	        res.send({code:301,msg:"用户名或密码错误"});
	    }
    })
});

module.exports=router;