const express=require('express');
var router=express.Router();
const pool=require('../pool.js');

router.post('/',function(req,res){
  //console.log(req.body);

  var u=req.body.uname;
  var p=req.body.upwd;
  var email=req.body.email;
  var phone=req.body.phone;     
 // var sql=`INSERT INTO jm_user SET ?`;  [obj],
  var sql=`insert into jm_user(uname,upwd,email,phone) values('${u}','${p}','${email}','${phone}')`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    //console.log(result);
    var uid = result.insertId;
    req.session.uid = uid;
	  res.send({code:200,msg:"注册成功"});
  })
});

module.exports=router;