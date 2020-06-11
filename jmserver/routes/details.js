const express=require("express")
const router=express.Router();
const pool=require("../pool")

router.get("/",(req,res)=>{
    var lid=req.query.lid;
    var proGroup={
        product:{},
        pics:[]
    }
    if(lid!==undefined){
        var sql1=`select * from jm_product where lid=?`;
        pool.query(sql1,[lid],(err,result)=>{
            if(err) console.log(err);
            proGroup.product=result[0];

            var sql3=`select * from jm_product_pic where product_id=?`;
            pool.query(sql3,[lid],(err,result)=>{
                if(err) console.log(err);
                proGroup.pics=result;
                res.send(proGroup);
            })
       
        })
    }else{
        res.send(proGroup);
    }
 })

module.exports=router;