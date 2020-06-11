const express=require("express");
const router=express.Router();
const pool=require("../pool");


router.get("/",(req,res)=>{
    var uid = req.session.uid;
 
    var sql = "SELECT * FROM jm_user WHERE uid = ?";
    pool.query(sql,[uid],(err,result)=>{
      if(err)throw err;
      res.send(result)
    })
 });
 
 module.exports=router;