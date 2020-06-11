const express=require('express');
const router=express.Router();
const pool=require('../pool');


router.get("/",(req,res)=>{
    var sql=`SELECT * FROM jm_index_product where pid order by pid`;
    pool.query(sql,[],(err,result)=>{
        if(err){
            //res.send(result);
            console.log(err);
        }else{
            res.send(result);
        }
    })
    
})

module.exports=router;