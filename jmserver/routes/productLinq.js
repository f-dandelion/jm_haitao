const express=require("express");
var router=express.Router();
const pool=require('../pool');

router.get("/",(req,res)=>{
    var products={
        korea:[],
        europe:[]
    }
   
    var sql1=`select * from jm_korea_product where pid order by pid`;
        pool.query(sql1,[],(err,result)=>{
            if(err) console.log(err);
            products.korea=result;

    var sql2=`select * from jm_europe_product where pid order by pid`;
        pool.query(sql2,[],(err,result)=>{
            if(err) console.log(err);
            products.europe=result;
            res.send(products);
        })   
    })    
 })

module.exports=router;