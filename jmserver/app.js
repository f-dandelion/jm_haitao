//使用express构建web服务器
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const session = require("express-session");
//引入路由模块
const index=require("./routes/index");
const details=require("./routes/details");
const searchPro=require("./routes/searchPro");
const login=require("./routes/login");
const register=require("./routes/register");
const productLinq=require("./routes/productLinq");
const addcart=require("./routes/addcart");
const carts=require("./routes/carts");
const delItems=require("./routes/delItems");
const userCenter=require("./routes/userCenter");

var app = express();
var server = app.listen(5050);
app.use(cors({
    origin:["http://localhost:8080","http://127.0.0.1:8080"],
    credentials:true
}));
//session配置
app.use(session({
    secret:"128位字符串",    
    resave:true,            
    saveUninitialized:true 
 }));
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static("public"));
//使用路由器来管理路由
app.use("/index",index);
app.use("/details",details);
app.use("/searchPro",searchPro);
app.use("/login",login);
app.use("/register",register);
app.use("/productLinq",productLinq);
app.use("/addcart",addcart);
app.use("/carts",carts);
app.use("/delItems",delItems);
app.use("/userCenter",userCenter);