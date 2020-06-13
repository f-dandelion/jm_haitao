const express=require("express");
var router=express.Router();
var query=require("./query");

router.get("/",(req,res)=>{
    var output={
        count:0,
        pageSize:8,
        pageCount:0,
        pno:req.query.pno||0,
        data:[]
    };
    var kw=req.query.kw;
    if(kw){
        var kws=kw.split(" ");
        kws.forEach((elem,i,arr)=>{
            arr[i]=`jname like '%${elem}%'`;
        })
        var where=kws.join(" and ");
        
        var sql=`select *,(select md from jm_search_pic where product_id=lid limit 1) as md from jm_product where ${where}`;
            query(sql,[]).then(result=>{
                output.count=result.length;
                output.pageCount= Math.ceil(output.count/output.pageSize);
                sql+=` limit ?,?`;
                return query(sql,[output.pageSize*output.pno,output.pageSize]);
            }).then(result=>{
                output.data=result;
                res.send(output);
            })
    }else{
        //res.send(noKw);
        res.send(output);
    }
})



module.exports=router;