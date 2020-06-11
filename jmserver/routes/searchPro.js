const express=require("express");
var router=express.Router();
var query=require("./query");

router.get("/",(req,res)=>{
    var output={
        count:0,
        pageSize:9,
        pageCount:0,
        pno:req.query.pno||0,
        data:[]
    };
    /*var noKw={
        count:0,
        pageSize:9,
        pageCount:0,
        pno:req.query.pno||0,
        data:[{lid:35,family_id:4,jname:'The body shop美体小铺生姜洗发水',title:'防脱去屑',subtitle:'补充毛发所需的角质蛋白，促进毛囊正常细胞的代谢',price:79,spec:'400ml/瓶',details:'img/pic_detail/mtxq.jpg',md:'img/pic_europe/meifa/mt/mt.jpg'}]
    }*/
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

router.get("/shelp",(req,res)=>{
    var kw=req.query.kw;
    var kws=kw.split(" ");
    kws.forEach((elem,i,arr)=>{
        arr[i]=`jname like '%${elem}%'`;
    })
    var where=kws.join(" and ");
    var sql1=`select lid,jname from jm_product where ${where} limit 10`;
    query(sql1,[]).then(result=>{
        res.send(result);
    })
})

module.exports=router;