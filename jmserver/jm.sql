SET NAMES UTF8;
DROP DATABASE IF EXISTS jm;
CREATE DATABASE jm CHARSET=UTF8;
USE jm;

/*商品类目表*/
CREATE TABLE jm_product_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(32)
);

/*商品详情右边表*/
CREATE TABLE jm_product(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    family_id INT,         #所属类别
    jname VARCHAR(32),     #商品名称
    title VARCHAR(128),    #主标题
    subtitle VARCHAR(128), #副标题
    price DECIMAL(6,2),    #价格
    spec VARCHAR(64),      #规格
    details VARCHAR(1024) #商品详细说明
);

/*首页中的商品*/
CREATE TABLE jm_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    jname VARCHAR(32),    #商品名称
    price DECIMAL(6,2),   #价格
    lianjie VARCHAR(128)     #链接
);

/*日韩直邮部分*/
CREATE TABLE jm_korea_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pic_korea VARCHAR(128),#图片
    title VARCHAR(64),     #标题
    price DECIMAL(6,2),    #价格
    href VARCHAR(128)      #链接
);
/*欧洲直邮部分*/
CREATE TABLE jm_europe_product(  
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pic_europe VARCHAR(128),#图片
    title VARCHAR(64),     #标题
    price DECIMAL(6,2),    #价格
    href VARCHAR(128)      #链接
);
CREATE TABLE jm_search_pic(
    product_id INT,        #单个商品编号
    md VARCHAR(128)        #图片
);
/*详情商品左边图片表*/
CREATE TABLE jm_product_pic(
    pid INT  PRIMARY KEY AUTO_INCREMENT,
    product_id INT,              #单个商品编号
    sm VARCHAR(128),       #小图片路径
    md VARCHAR(128),       #中图片路径
    lg VARCHAR(128)        #大图片路径
);

/*用户信息表*/
CREATE TABLE jm_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),     #用户名
    upwd VARCHAR(32),      #用户密码
    email VARCHAR(64),     #用户邮箱
    phone VARCHAR(16),     #用户手机号
    avater VARCHAR(128),   #头像图片路径
    user_name VARCHAR(32), #用户真实姓名
    gender INT             #性别（0-女，1-男）
);

/*收货地址信息表*/
CREATE TABLE jm_receiver_address(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,           #用户编号
    receiver VARCHAR(16),  #收货人姓名
    province VARCHAR(16),  #省
    city VARCHAR(16),      #市
    county VARCHAR(16),    #县
    address VARCHAR(128),  #详细地址
    cellphone VARCHAR(16), #手机
    fixedphone VARCHAR(16),#固话 
    postcode CHAR(6),      #邮编
    tag VARCHAR(16),       #标签名
    is_default BOOLEAN     #是否为默认地址
);

/*购物车表*/
CREATE TABLE jm_cart(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,               #用户编号
    lid INT,               #商品编号
    jname  VARCHAR(255),   #商品名称
    price  DECIMAL(6,2),  #商品价格
    count INT,             #购买数量
    sm    VARCHAR(128)       #小图片路径
    /*is_checked BOOLEAN     #是否已勾选*/
);

/*用户订单表*/
CREATE TABLE jm_order(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,           #用户编号
    address_id INT,        #收货地址编号
    status INT,            #订单状态（1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消）
    order_time BIGINT,     #下单时间
    pay_time BIGINT,       #支付时间
    deliver_time BIGINT,   #发货时间
    received_time BIGINT   #签收时间
);

/*用户订单详情表*/
CREATE TABLE jm_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,          #订单编号
    lid INT,               #产品编号
    count INT              #购买数量
);




/*数据导入*/
/*商品类目表*/
INSERT INTO jm_product_family VALUES
(NULL,'护肤'),
(NULL,'彩妆'),
(NULL,'香氛'),
(NULL,'美发');

/*商品详情右边表*/
INSERT INTO jm_product VALUES
(1,1,'A.H.C B5玻尿酸水合乳液','补水保湿控油 清爽润肤 加倍锁水','可以涂抹的“针剂”乳液，水润不油腻，补水效果看得见',69,'120ml/瓶','img/pic_detail/ahcxq.jpg'),
(2,1,'城野医生亲研收缩毛孔洁面乳','深层清洁,温和收毛孔,清爽控油','（新旧包装随机发货）日本原装正品授权,奶油般浓密泡沫,,清除深处污垢,黑头无负担',79,'120g/盒','img/pic_detail/cyxq.jpg'),
(3,1,'Sulwhasoo滋盈肌本紧致面霜礼盒','平衡紧致面霜+水乳','弹力滋润 修颜紧致',359,'1004/盒','img/pic_detail/xhxxq.jpg'),
(4,1,'香蒲丽绿公主眼膜贴','淡化细纹去黑眼圈眼袋抗皱补水','蕴含多种天然植物萃取,海藻眼膜,调整眼周肌肤,平衡纹理,恢复弹性',69,'60片/盒','img/pic_detail/xplxq.jpg'),
(5,1,'悦诗风吟绿茶籽精萃水分菁华乳','水润清爽,告别干燥','保湿滋养,深层锁水,柔润清爽',79,'100ml/瓶','img/pic_detail/ysxq.jpg'),
(6,1,'理肤泉B5多效保湿修复面膜','保湿修护敏肌面膜','多效修护受损肌肤，舒缓修护，保湿锁水',119,'双盒装10片','img/pic_detail/lfqxq.jpg'),
(7,1,'兰蔻Lancome清滢柔肤水','爽肤水保湿','保湿并滋养肌肤，令肌肤变得更柔软，清洁不刺激敏感肌肤',189,'400ml/瓶','img/pic_detail/lkxq.jpg'),
(8,1,'薇姿净颜无瑕控油祛痘洁面','抗油清洁不冒痘','细腻密集泡沫啫喱',129,'200ml/瓶','img/pic_detail/wzxq.jpg'),
(9,1,'雅漾Avene舒护喷雾',' 补水舒缓敏感肌','从根部舒缓敏肌症状，减少刺激，增强肌肤耐受性',69,'300ml/瓶','img/pic_detail/yyxq.jpg'),
(10,2,'age20s 爱敬三色拉花气垫粉底膏bb霜',' 精华保湿遮瑕控油','新款三色拉花,遮瑕修颜,适合瑕疵肌肤',119,'14g*2/盒','img/pic_detail/ajxq.jpg'),
(11,2,'DHC蝶翠诗橄榄润唇膏','保湿滋润不粘腻','24小时持久滋润,清爽不油腻',35,'1.5g/支','img/pic_detail/dhcxq.jpg'),
(12,2,'Laneige亮白聚光BB霜气垫','美白遮瑕,持久保湿',' 亮白亮泽,防晒遮瑕,保湿持久,自然遮瑕',119,'30g/盒','img/pic_detail/lzxq.jpg'),
(13,2,'香蒲丽保湿焕采精华隔离防晒','SPF50+,清爽不油腻','林允力推,抵御烈日,清爽轻薄低负担',69,'60ml/瓶','img/pic_detail/xplxq1.jpg'),
(14,2,'悦诗风吟innisfree控油无瑕蜜粉','定妆粉蜜粉持久轻薄遮瑕服帖 ','隐藏粗大的毛孔，打造嫩滑靓丽肌肤',35,'5g/盒','img/pic_detail/ysxq1.jpg'),
(15,2,'贝德玛舒妍多效卸妆水','安全卸妆,清爽不油腻','平衡皮脂，保持肌肤净润清爽，还原纯粹净肌体验',55,'500ml/瓶','img/pic_detail/bdmxq.jpg'),
(16,2,'娇兰臻彩宝石唇膏','214色号','丰盈滋润，饱和而鲜明色泽与细润质地巧妙平衡，轻松点亮宝石美唇',154,'3.5g/支','img/pic_detail/jlxq.jpg'),
(17,2,'玫珂菲全新防水眼线笔','防水防晕染','彩妆师级色彩体验',57,'1.5g/支','img/pic_detail/mkfxq.jpg'),
(18,2,'香奈儿四色眼影','226-里沃利','魅力电眼,质地顺滑,长效持妆',199,'2g/盒','img/pic_detail/xnexq.jpg'),
(19,3,'安宝笛香水身体乳','舒缓肌肤','特有丝柔护肤精华,滋润保湿,为您定制专业香氛',25,'400ml/瓶','img/pic_detail/onbxq.jpg'),
(20,3,'AnnaSui安娜苏美人鱼淡香水','女士淡香水','筑梦人鱼，花果香调，清新甜美，充满活力~',168,'50ml/瓶','img/pic_detail/annasxq.jpg'),
(21,3,'BVLGARI宝格丽晶艳纯香女士淡香水','意大利花香调','典雅奢华的化身',219,'40ml/瓶','img/pic_detail/bglxq.jpg'),
(22,3,'迪奥小姐花漾淡香氛','俏皮花香，青春活泼',' 清甜柑橘谐美领舞香氛中调，令人沉醉于自然纯净的芳香',279,'30ml/瓶','img/pic_detail/dixq.jpg'),
(23,3,'菲拉格慕晴空梦影女士淡香水','留香持久 清新花果香调','清新的香气,尽显自由本质',89,'30ml/瓶','img/pic_detail/flxq.jpg'),
(24,3,'范思哲爱纳斯女士淡香水','花果木质香调','从迷人的香氛到优雅的香水瓶身，和谐的配合，更显相得益彰',299,'30ml/瓶','img/pic_detail/fszxq.jpg'),
(25,3,'Chanel香奈儿邂逅柔情女士香水','美妆大佬强势种草的香奈儿明星款香水','前调悦动活泼，基调质感温润，日常百搭',179,'150ml/瓶','img/pic_detail/xnexq1.jpg'),
(26,3,'圣罗兰黑鸦片香水','独特的黑色浓郁咖啡香调','诠释大胆无畏的摇滚风格',169,'90ml/瓶','img/pic_detail/yslxq.jpg'),
(27,3,'祖玛珑香水','蓝风铃持久留香','遍布在铃兰与蔷薇之间,更流露出柿子的甜美气息',159,'30ml/瓶','img/pic_detail/zmlxq.jpg'),
(28,4,'氨基研升级氨基酸洗发水','向往的生活同款','无硅油氨基酸配方，清洁深层修复',87,'450ml/瓶','img/pic_detail/anjyxq.jpg'),
(29,4,'黑吕臻参宝秀发营养洗发水','中干性头皮用','含有珍贵的灵芝和五种参成分,韩方提取营养成分',32,'400ml/瓶','img/pic_detail/lvxq.jpg'),
(30,4,'POLA馥美修护护发素','抚平毛糙','帮助头皮胶原修复,滋养年轻健康秀发',139,'540g/瓶','img/pic_detail/polaxq.jpg'),
(31,4,'睿嫣韩方健康染发剂','自然栗色','韩方成分，掀起健康染发新风潮',37,'20g*6+8ml/盒','img/pic_detail/ryxq.jpg'),
(32,4,'资生堂Fino浸透护发美容液发膜','滋润修复','丰富矿物质,氨基酸成分美容液深入发芯滋润保湿修复',35,'230g/盒','img/pic_detail/zstxq.jpg'),
(33,4,'Kerastase卡诗柔韧芯机护发素','滋养秀发','令秀发顺滑柔韧同时养护发梢,减少秀发分叉的可能',129,'200ml/支','img/pic_detail/ksxq.jpg'),
(34,4,'Matin Rosie摩洛哥免洗护发精油','三秒柔亮立现','抚平秀发毛糙清爽不油腻',36,'75ml/瓶','img/pic_detail/mrxq.jpg'),
(35,4,'The body shop美体小铺生姜洗发水','防脱去屑','补充毛发所需的角质蛋白，促进毛囊正常细胞的代谢',79,'400ml/瓶','img/pic_detail/mtxq.jpg'),
(36,4,'三橡树天然植物染发剂','巧克力棕色系','天然植物提取，温和低敏配方，染护合一，染发不伤发',67,'60ml+60ml+15ml/盒','img/pic_detail/sxsxq.jpg');

/*首页商品链接表
INSERT INTO jm_index_product VALUES
(1,'A.H.C B5玻尿酸水合乳液',69,'productDetail.html?lid=1'),
(2,'城野医生亲研收缩毛孔洁面乳',79,'productDetail.html?lid=2'),
(3,'Sulwhasoo滋盈肌本紧致面霜礼盒',359,'productDetail.html?lid=3'),
(4,'香蒲丽绿公主眼膜贴',69,'productDetail.html?lid=4'),
(5,'悦诗风吟绿茶籽精萃水分菁华乳',79,'productDetail.html?lid=5'),
(6,'理肤泉B5多效保湿修复面膜',119,'productDetail.html?lid=6'),
(7,'兰蔻Lancome清滢柔肤水',189,'productDetail.html?lid=7'),
(8,'薇姿净颜无瑕控油祛痘洁面',129,'productDetail.html?lid=8'),
(9,'雅漾Avene舒护喷雾',69,'productDetail.html?lid=9'),
(10,'age20s 爱敬三色拉花气垫粉底',119,'productDetail.html?lid=10'),
(11,'DHC蝶翠诗橄榄润唇膏',35,'productDetail.html?lid=11'),
(12,'Laneige亮白聚光BB霜气垫',119,'productDetail.html?lid=12'),
(13,'香蒲丽保湿焕采精华隔离防晒',69,'productDetail.html?lid=13'),
(14,'悦诗风吟innisfree控油无瑕蜜粉',35,'productDetail.html?lid=14'),
(15,'贝德玛舒妍多效卸妆水',55,'productDetail.html?lid=15'),
(16,'娇兰臻彩宝石唇膏',154,'productDetail.html?lid=16'),
(17,'玫珂菲全新防水眼线笔',57,'productDetail.html?lid=17'),
(18,'香奈儿四色眼影',199,'productDetail.html?lid=18'),
(19,'安宝笛香水身体乳',25,'productDetail.html?lid=19'),
(20,'AnnaSui安娜苏美人鱼淡香水',168,'productDetail.html?lid=20'),
(21,'BVLGARI宝格丽晶艳纯香淡香水',219,'productDetail.html?lid=21'),
(22,'迪奥小姐花漾淡香氛',279,'productDetail.html?lid=22'),
(23,'菲拉格慕晴空梦影女士淡香水',89,'productDetail.html?lid=23'),
(24,'范思哲爱纳斯女士淡香水',299,'productDetail.html?lid=24'),
(25,'Chanel香奈儿邂逅柔情女士香水',179,'productDetail.html?lid=25'),
(26,'圣罗兰黑鸦片香水',169,'productDetail.html?lid=26'),
(27,'祖玛珑香水',159,'productDetail.html?lid=27'),
(28,'氨基研升级氨基酸洗发水',87,'productDetail.html?lid=28'),
(29,'黑吕臻参宝秀发营养洗发水',32,'productDetail.html?lid=29'),
(30,'POLA馥美修护护发素',139,'productDetail.html?lid=30'),
(31,'睿嫣韩方健康染发剂',37,'productDetail.html?lid=31'),
(32,'资生堂Fino浸透护发美容液发膜',35,'productDetail.html?lid=32'),
(33,'Kerastase卡诗柔韧芯机护发素',129,'productDetail.html?lid=33'),
(34,'Matin Rosie摩洛哥免洗护发精油',36,'productDetail.html?lid=34'),
(35,'The body shop美体小铺洗发水',79,'productDetail.html?lid=35'),
(36,'三橡树天然植物染发剂',67,'productDetail.html?lid=36');*/

/*首页商品链接表*/
INSERT INTO jm_index_product VALUES
(1,'A.H.C B5玻尿酸水合乳液',69,'1'),
(2,'城野医生亲研收缩毛孔洁面乳',79,'2'),
(3,'Sulwhasoo滋盈肌本紧致面霜礼盒',359,'3'),
(4,'香蒲丽绿公主眼膜贴',69,'4'),
(5,'悦诗风吟绿茶籽精萃水分菁华乳',79,'5'),
(6,'理肤泉B5多效保湿修复面膜',119,'6'),
(7,'兰蔻Lancome清滢柔肤水',189,'7'),
(8,'薇姿净颜无瑕控油祛痘洁面',129,'8'),
(9,'雅漾Avene舒护喷雾',69,'9'),
(10,'age20s 爱敬三色拉花气垫粉底',119,'10'),
(11,'DHC蝶翠诗橄榄润唇膏',35,'11'),
(12,'Laneige亮白聚光BB霜气垫',119,'12'),
(13,'香蒲丽保湿焕采精华隔离防晒',69,'13'),
(14,'悦诗风吟innisfree控油无瑕蜜粉',35,'14'),
(15,'贝德玛舒妍多效卸妆水',55,'15'),
(16,'娇兰臻彩宝石唇膏',154,'16'),
(17,'玫珂菲全新防水眼线笔',57,'17'),
(18,'香奈儿四色眼影',199,'18'),
(19,'安宝笛香水身体乳',25,'19'),
(20,'AnnaSui安娜苏美人鱼淡香水',168,'20'),
(21,'BVLGARI宝格丽晶艳纯香淡香水',219,'21'),
(22,'迪奥小姐花漾淡香氛',279,'22'),
(23,'菲拉格慕晴空梦影女士淡香水',89,'23'),
(24,'范思哲爱纳斯女士淡香水',299,'24'),
(25,'Chanel香奈儿邂逅柔情女士香水',179,'25'),
(26,'圣罗兰黑鸦片香水',169,'26'),
(27,'祖玛珑香水',159,'27'),
(28,'氨基研升级氨基酸洗发水',87,'28'),
(29,'黑吕臻参宝秀发营养洗发水',32,'29'),
(30,'POLA馥美修护护发素',139,'30'),
(31,'睿嫣韩方健康染发剂',37,'31'),
(32,'资生堂Fino浸透护发美容液发膜',35,'32'),
(33,'Kerastase卡诗柔韧芯机护发素',129,'33'),
(34,'Matin Rosie摩洛哥免洗护发精油',36,'34'),
(35,'The body shop美体小铺洗发水',79,'35'),
(36,'三橡树天然植物染发剂',67,'36');



/*日韩直邮表*/
INSERT INTO jm_korea_product VALUES
(1,'img/pic_korea/hufu/ahc/ahc.jpg','A.H.C B5玻尿酸水合乳液',69,'productDetail.html?lid=1'),
(2,'img/pic_korea/hufu/cy/cy.jpg','城野医生亲研收缩毛孔洁面乳',79,'productDetail.html?lid=2'),
(3,'img/pic_korea/hufu/xhx/xhx.jpg','Sulwhasoo滋盈肌本紧致面霜礼盒',359,'productDetail.html?lid=3'),
(4,'img/pic_korea/hufu/xpl/xpl.jpg','香蒲丽绿公主眼膜贴',69,'productDetail.html?lid=4'),
(5,'img/pic_korea/hufu/ys/ys.jpg','悦诗风吟绿茶籽精萃水分菁华乳',79,'productDetail.html?lid=5'),
(6,'img/pic_korea/caizhuang/aj/aj.jpg','age20s 爱敬三色拉花气垫粉底',119,'productDetail.html?lid=10'),
(7,'img/pic_korea/caizhuang/dhc/dhc.jpg','DHC蝶翠诗橄榄润唇膏',35,'productDetail.html?lid=11'),
(8,'img/pic_korea/caizhuang/lz/lz.jpg','Laneige亮白聚光BB霜气垫',119,'productDetail.html?lid=12'),
(9,'img/pic_korea/caizhuang/xpl/xpl.jpg','香蒲丽保湿焕采精华隔离防晒',69,'productDetail.html?lid=13'),
(10,'img/pic_korea/caizhuang/ys/ys.jpg','悦诗风吟innisfree控油无瑕蜜粉',35,'productDetail.html?lid=14'),
(11,'img/pic_korea/xiangfen/onb/onb.jpg','安宝笛香水身体乳',25,'productDetail.html?lid=19'),
(12,'img/pic_korea/meifa/anjy/anjy.jpg','氨基研升级氨基酸洗发水',87,'productDetail.html?lid=28'),
(13,'img/pic_korea/meifa/lv/lv.jpg','黑吕臻参宝秀发营养洗发水',32,'productDetail.html?lid=29'),
(14,'img/pic_korea/meifa/pola/pola.jpg','POLA馥美修护护发素',139,'productDetail.html?lid=30'),
(15,'img/pic_korea/meifa/ry/ry.jpg','睿嫣韩方健康染发剂',37,'productDetail.html?lid=31'),
(16,'img/pic_korea/meifa/zst/zst.jpg','资生堂Fino浸透护发美容液发膜',35,'productDetail.html?lid=32');

/*欧洲直邮表*/
INSERT INTO jm_europe_product VALUES
(1,'img/pic_europe/hufu/lfq/lfq.jpg','理肤泉B5多效保湿修复面膜',119,'productDetail.html?lid=6'),
(2,'img/pic_europe/hufu/lk/lk.jpg','兰蔻Lancome清滢柔肤水',189,'productDetail.html?lid=7'),
(3,'img/pic_europe/hufu/wz/wz.jpg','薇姿净颜无瑕控油祛痘洁面',129,'productDetail.html?lid=8'),
(4,'img/pic_europe/hufu/yy/yy.jpg','雅漾Avene舒护喷雾',69,'productDetail.html?lid=9'),
(5,'img/pic_europe/caizhuang/bdm/bdm.jpg','贝德玛舒妍多效卸妆水',55,'productDetail.html?lid=15'),
(6,'img/pic_europe/caizhuang/jl/jl.jpg','娇兰臻彩宝石唇膏',154,'productDetail.html?lid=16'),
(7,'img/pic_europe/caizhuang/mkf/mkf.jpg','玫珂菲全新防水眼线笔',57,'productDetail.html?lid=17'),
(8,'img/pic_europe/caizhuang/xne/xne.jpg','香奈儿四色眼影',199,'productDetail.html?lid=18'),
(9,'img/pic_europe/xiangfen/annas/annas.jpg','AnnaSui安娜苏美人鱼淡香水',168,'productDetail.html?lid=20'),
(10,'img/pic_europe/xiangfen/bgl/bgl.jpg','BVLGARI宝格丽晶艳纯香女士淡香水',219,'productDetail.html?lid=21'),
(11,'img/pic_europe/xiangfen/di/di.jpg','迪奥小姐花漾淡香氛',279,'productDetail.html?lid=22'),
(12,'img/pic_europe/xiangfen/fl/fl.jpg','菲拉格慕晴空梦影女士淡香水',89,'productDetail.html?lid=23'),
(13,'img/pic_europe/xiangfen/fsz/fsz.jpg','范思哲爱纳斯女士淡香水',299,'productDetail.html?lid=24'),
(14,'img/pic_europe/xiangfen/xne/xne.jpg','Chanel香奈儿邂逅柔情女士香水',179,'productDetail.html?lid=25'),
(15,'img/pic_europe/xiangfen/ysl/ysl.jpg','圣罗兰黑鸦片香水',169,'productDetail.html?lid=26'),
(16,'img/pic_europe/xiangfen/zml/zml.jpg','祖玛珑香水',159,'productDetail.html?lid=27'),
(17,'img/pic_europe/meifa/ks/ks.jpg','Kerastase卡诗柔韧芯机护发素',129,'productDetail.html?lid=33'),
(18,'img/pic_europe/meifa/mr/mr.jpg','Matin Rosie摩洛哥免洗护发精油',36,'productDetail.html?lid=34'),
(19,'img/pic_europe/meifa/mt/mt.jpg','The body shop美体小铺生姜洗发水',79,'productDetail.html?lid=35'),
(20,'img/pic_europe/meifa/sxs/sxs.jpg','三橡树天然植物染发剂',67,'productDetail.html?lid=36');

/*详情商品左边图片表*/
INSERT INTO jm_product_pic VALUES
(NULL,1,'img/pic_korea/hufu/ahc/simg/simg1.jpg','img/pic_korea/hufu/ahc/simg/md1.jpg','img/pic_korea/hufu/ahc/simg/lg1.jpg'),
(NULL,1,'img/pic_korea/hufu/ahc/simg/simg2.jpg','img/pic_korea/hufu/ahc/simg/md2.jpg','img/pic_korea/hufu/ahc/simg/lg2.jpg'),
(NULL,1,'img/pic_korea/hufu/ahc/simg/simg3.jpg','img/pic_korea/hufu/ahc/simg/md3.jpg','img/pic_korea/hufu/ahc/simg/lg3.jpg'),
(NULL,2,'img/pic_korea/hufu/cy/simg/simg1.jpg','img/pic_korea/hufu/cy/simg/md1.jpg','img/pic_korea/hufu/cy/simg/lg1.jpg'),
(NULL,2,'img/pic_korea/hufu/cy/simg/simg2.jpg','img/pic_korea/hufu/cy/simg/md2.jpg','img/pic_korea/hufu/cy/simg/lg2.jpg'),
(NULL,2,'img/pic_korea/hufu/cy/simg/simg3.jpg','img/pic_korea/hufu/cy/simg/md3.jpg','img/pic_korea/hufu/cy/simg/lg3.jpg'),
(NULL,2,'img/pic_korea/hufu/cy/simg/simg4.jpg','img/pic_korea/hufu/cy/simg/md4.jpg','img/pic_korea/hufu/cy/simg/lg4.jpg'),
(NULL,2,'img/pic_korea/hufu/cy/simg/simg5.jpg','img/pic_korea/hufu/cy/simg/md5.jpg','img/pic_korea/hufu/cy/simg/lg5.jpg'),
(NULL,3,'img/pic_korea/hufu/xhx/simg/simg1.jpg','img/pic_korea/hufu/xhx/simg/md1.jpg','img/pic_korea/hufu/xhx/simg/lg1.jpg'),
(NULL,3,'img/pic_korea/hufu/xhx/simg/simg2.jpg','img/pic_korea/hufu/xhx/simg/md2.jpg','img/pic_korea/hufu/xhx/simg/lg2.jpg'),
(NULL,4,'img/pic_korea/hufu/xpl/simg/simg1.jpg','img/pic_korea/hufu/xpl/simg/md1.jpg','img/pic_korea/hufu/xpl/simg/lg1.jpg'),
(NULL,4,'img/pic_korea/hufu/xpl/simg/simg2.jpg','img/pic_korea/hufu/xpl/simg/md2.jpg','img/pic_korea/hufu/xpl/simg/lg2.jpg'),
(NULL,5,'img/pic_korea/hufu/ys/simg/simg1.jpg','img/pic_korea/hufu/ys/simg/md1.jpg','img/pic_korea/hufu/ys/simg/lg1.jpg'),
(NULL,6,'img/pic_europe/hufu/lfq/simg/simg1.jpg','img/pic_europe/hufu/lfq/simg/md1.jpg','img/pic_europe/hufu/lfq/simg/lg1.jpg'),
(NULL,6,'img/pic_europe/hufu/lfq/simg/simg2.jpg','img/pic_europe/hufu/lfq/simg/md2.jpg','img/pic_europe/hufu/lfq/simg/lg2.jpg'),
(NULL,6,'img/pic_europe/hufu/lfq/simg/simg3.jpg','img/pic_europe/hufu/lfq/simg/md3.jpg','img/pic_europe/hufu/lfq/simg/lg3.jpg'),
(NULL,6,'img/pic_europe/hufu/lfq/simg/simg4.jpg','img/pic_europe/hufu/lfq/simg/md4.jpg','img/pic_europe/hufu/lfq/simg/lg4.jpg'),
(NULL,6,'img/pic_europe/hufu/lfq/simg/simg5.jpg','img/pic_europe/hufu/lfq/simg/md5.jpg','img/pic_europe/hufu/lfq/simg/lg5.jpg'),
(NULL,7,'img/pic_europe/hufu/lk/simg/simg1.jpg','img/pic_europe/hufu/lk/simg/md1.jpg','img/pic_europe/hufu/lk/simg/lg1.jpg'),
(NULL,7,'img/pic_europe/hufu/lk/simg/simg2.jpg','img/pic_europe/hufu/lk/simg/md2.jpg','img/pic_europe/hufu/lk/simg/lg2.jpg'),
(NULL,7,'img/pic_europe/hufu/lk/simg/simg3.jpg','img/pic_europe/hufu/lk/simg/md3.jpg','img/pic_europe/hufu/lk/simg/lg3.jpg'),
(NULL,7,'img/pic_europe/hufu/lk/simg/simg4.jpg','img/pic_europe/hufu/lk/simg/md4.jpg','img/pic_europe/hufu/lk/simg/lg4.jpg'),
(NULL,7,'img/pic_europe/hufu/lk/simg/simg5.jpg','img/pic_europe/hufu/lk/simg/md5.jpg','img/pic_europe/hufu/lk/simg/lg5.jpg'),
(NULL,8,'img/pic_europe/hufu/wz/simg/simg1.jpg','img/pic_europe/hufu/wz/simg/md1.jpg','img/pic_europe/hufu/wz/simg/lg1.jpg'),
(NULL,8,'img/pic_europe/hufu/wz/simg/simg2.jpg','img/pic_europe/hufu/wz/simg/md2.jpg','img/pic_europe/hufu/wz/simg/lg2.jpg'),
(NULL,9,'img/pic_europe/hufu/yy/simg/simg1.jpg','img/pic_europe/hufu/yy/simg/md1.jpg','img/pic_europe/hufu/yy/simg/lg1.jpg'),
(NULL,9,'img/pic_europe/hufu/yy/simg/simg2.jpg','img/pic_europe/hufu/yy/simg/md2.jpg','img/pic_europe/hufu/yy/simg/lg2.jpg'),
(NULL,10,'img/pic_korea/caizhuang/aj/simg/simg1.jpg','img/pic_korea/caizhuang/aj/simg/md1.jpg','img/pic_korea/caizhuang/aj/simg/lg1.jpg'),
(NULL,10,'img/pic_korea/caizhuang/aj/simg/simg2.jpg','img/pic_korea/caizhuang/aj/simg/md2.jpg','img/pic_korea/caizhuang/aj/simg/lg2.jpg'),
(NULL,10,'img/pic_korea/caizhuang/aj/simg/simg3.jpg','img/pic_korea/caizhuang/aj/simg/md3.jpg','img/pic_korea/caizhuang/aj/simg/lg3.jpg'),
(NULL,10,'img/pic_korea/caizhuang/aj/simg/simg4.jpg','img/pic_korea/caizhuang/aj/simg/md4.jpg','img/pic_korea/caizhuang/aj/simg/lg4.jpg'),
(NULL,10,'img/pic_korea/caizhuang/aj/simg/simg5.jpg','img/pic_korea/caizhuang/aj/simg/md5.jpg','img/pic_korea/caizhuang/aj/simg/lg5.jpg'),
(NULL,11,'img/pic_korea/caizhuang/dhc/simg/simg1.jpg','img/pic_korea/caizhuang/dhc/simg/md1.jpg','img/pic_korea/caizhuang/dhc/simg/lg1.jpg'),
(NULL,11,'img/pic_korea/caizhuang/dhc/simg/simg2.jpg','img/pic_korea/caizhuang/dhc/simg/md2.jpg','img/pic_korea/caizhuang/dhc/simg/lg2.jpg'),
(NULL,11,'img/pic_korea/caizhuang/dhc/simg/simg3.jpg','img/pic_korea/caizhuang/dhc/simg/md3.jpg','img/pic_korea/caizhuang/dhc/simg/lg3.jpg'),
(NULL,12,'img/pic_korea/caizhuang/lz/simg/simg1.jpg','img/pic_korea/caizhuang/lz/simg/md1.jpg','img/pic_korea/caizhuang/lz/simg/lg1.jpg'),
(NULL,12,'img/pic_korea/caizhuang/lz/simg/simg2.jpg','img/pic_korea/caizhuang/lz/simg/md2.jpg','img/pic_korea/caizhuang/lz/simg/lg2.jpg'),
(NULL,13,'img/pic_korea/caizhuang/xpl/simg/simg1.jpg','img/pic_korea/caizhuang/xpl/simg/md1.jpg','img/pic_korea/caizhuang/xpl/simg/lg1.jpg'),
(NULL,13,'img/pic_korea/caizhuang/xpl/simg/simg2.jpg','img/pic_korea/caizhuang/xpl/simg/md2.jpg','img/pic_korea/caizhuang/xpl/simg/lg2.jpg'),
(NULL,13,'img/pic_korea/caizhuang/xpl/simg/simg3.jpg','img/pic_korea/caizhuang/xpl/simg/md3.jpg','img/pic_korea/caizhuang/xpl/simg/lg3.jpg'),
(NULL,14,'img/pic_korea/caizhuang/ys/simg/simg1.jpg','img/pic_korea/caizhuang/ys/simg/md1.jpg','img/pic_korea/caizhuang/ys/simg/lg1.jpg'),
(NULL,14,'img/pic_korea/caizhuang/ys/simg/simg2.jpg','img/pic_korea/caizhuang/ys/simg/md2.jpg','img/pic_korea/caizhuang/ys/simg/lg2.jpg'),
(NULL,15,'img/pic_europe/caizhuang/bdm/simg/simg1.jpg','img/pic_europe/caizhuang/bdm/simg/md1.jpg','img/pic_europe/caizhuang/bdm/simg/lg1.jpg'),
(NULL,15,'img/pic_europe/caizhuang/bdm/simg/simg2.jpg','img/pic_europe/caizhuang/bdm/simg/md2.jpg','img/pic_europe/caizhuang/bdm/simg/lg2.jpg'),
(NULL,15,'img/pic_europe/caizhuang/bdm/simg/simg3.jpg','img/pic_europe/caizhuang/bdm/simg/md3.jpg','img/pic_europe/caizhuang/bdm/simg/lg3.jpg'),
(NULL,16,'img/pic_europe/caizhuang/jl/simg/simg1.jpg','img/pic_europe/caizhuang/jl/simg/md1.jpg','img/pic_europe/caizhuang/jl/simg/lg1.jpg'),
(NULL,16,'img/pic_europe/caizhuang/jl/simg/simg2.jpg','img/pic_europe/caizhuang/jl/simg/md2.jpg','img/pic_europe/caizhuang/jl/simg/lg2.jpg'),
(NULL,16,'img/pic_europe/caizhuang/jl/simg/simg3.jpg','img/pic_europe/caizhuang/jl/simg/md3.jpg','img/pic_europe/caizhuang/jl/simg/lg3.jpg'),
(NULL,16,'img/pic_europe/caizhuang/jl/simg/simg4.jpg','img/pic_europe/caizhuang/jl/simg/md4.jpg','img/pic_europe/caizhuang/jl/simg/lg4.jpg'),
(NULL,16,'img/pic_europe/caizhuang/jl/simg/simg5.jpg','img/pic_europe/caizhuang/jl/simg/md5.jpg','img/pic_europe/caizhuang/jl/simg/lg5.jpg'),
(NULL,16,'img/pic_europe/caizhuang/jl/simg/simg6.jpg','img/pic_europe/caizhuang/jl/simg/md6.jpg','img/pic_europe/caizhuang/jl/simg/lg6.jpg'),
(NULL,17,'img/pic_europe/caizhuang/mkf/simg/simg1.jpg','img/pic_europe/caizhuang/mkf/simg/md1.jpg','img/pic_europe/caizhuang/mkf/simg/lg1.jpg'),
(NULL,17,'img/pic_europe/caizhuang/mkf/simg/simg2.jpg','img/pic_europe/caizhuang/mkf/simg/md2.jpg','img/pic_europe/caizhuang/mkf/simg/lg2.jpg'),
(NULL,17,'img/pic_europe/caizhuang/mkf/simg/simg3.jpg','img/pic_europe/caizhuang/mkf/simg/md3.jpg','img/pic_europe/caizhuang/mkf/simg/lg3.jpg'),
(NULL,18,'img/pic_europe/caizhuang/xne/simg/simg1.jpg','img/pic_europe/caizhuang/xne/simg/md1.jpg','img/pic_europe/caizhuang/xne/simg/lg1.jpg'),
(NULL,18,'img/pic_europe/caizhuang/xne/simg/simg2.jpg','img/pic_europe/caizhuang/xne/simg/md2.jpg','img/pic_europe/caizhuang/xne/simg/lg2.jpg'),
(NULL,18,'img/pic_europe/caizhuang/xne/simg/simg3.jpg','img/pic_europe/caizhuang/xne/simg/md3.jpg','img/pic_europe/caizhuang/xne/simg/lg3.jpg'),
(NULL,18,'img/pic_europe/caizhuang/xne/simg/simg4.jpg','img/pic_europe/caizhuang/xne/simg/md4.jpg','img/pic_europe/caizhuang/xne/simg/lg4.jpg'),
(NULL,18,'img/pic_europe/caizhuang/xne/simg/simg5.jpg','img/pic_europe/caizhuang/xne/simg/md5.jpg','img/pic_europe/caizhuang/xne/simg/lg5.jpg'),
(NULL,18,'img/pic_europe/caizhuang/xne/simg/simg6.jpg','img/pic_europe/caizhuang/xne/simg/md6.jpg','img/pic_europe/caizhuang/xne/simg/lg6.jpg'),
(NULL,19,'img/pic_korea/xiangfen/onb/simg/simg1.jpg','img/pic_korea/xiangfen/onb/simg/md1.jpg','img/pic_korea/xiangfen/onb/simg/lg1.jpg'),
(NULL,19,'img/pic_korea/xiangfen/onb/simg/simg2.jpg','img/pic_korea/xiangfen/onb/simg/md2.jpg','img/pic_korea/xiangfen/onb/simg/lg2.jpg'),
(NULL,19,'img/pic_korea/xiangfen/onb/simg/simg3.jpg','img/pic_korea/xiangfen/onb/simg/md3.jpg','img/pic_korea/xiangfen/onb/simg/lg3.jpg'),
(NULL,19,'img/pic_korea/xiangfen/onb/simg/simg4.jpg','img/pic_korea/xiangfen/onb/simg/md4.jpg','img/pic_korea/xiangfen/onb/simg/lg4.jpg'),
(NULL,20,'img/pic_europe/xiangfen/annas/simg/simg1.jpg','img/pic_europe/xiangfen/annas/simg/md1.jpg','img/pic_europe/xiangfen/annas/simg/lg1.jpg'),
(NULL,20,'img/pic_europe/xiangfen/annas/simg/simg2.jpg','img/pic_europe/xiangfen/annas/simg/md2.jpg','img/pic_europe/xiangfen/annas/simg/lg2.jpg'),
(NULL,20,'img/pic_europe/xiangfen/annas/simg/simg3.jpg','img/pic_europe/xiangfen/annas/simg/md3.jpg','img/pic_europe/xiangfen/annas/simg/lg3.jpg'),
(NULL,21,'img/pic_europe/xiangfen/bgl/simg/simg1.jpg','img/pic_europe/xiangfen/bgl/simg/md1.jpg','img/pic_europe/xiangfen/bgl/simg/lg1.jpg'),
(NULL,21,'img/pic_europe/xiangfen/bgl/simg/simg2.jpg','img/pic_europe/xiangfen/bgl/simg/md2.jpg','img/pic_europe/xiangfen/bgl/simg/lg2.jpg'),
(NULL,21,'img/pic_europe/xiangfen/bgl/simg/simg3.jpg','img/pic_europe/xiangfen/bgl/simg/md3.jpg','img/pic_europe/xiangfen/bgl/simg/lg3.jpg'),
(NULL,21,'img/pic_europe/xiangfen/bgl/simg/simg4.jpg','img/pic_europe/xiangfen/bgl/simg/md4.jpg','img/pic_europe/xiangfen/bgl/simg/lg4.jpg'),
(NULL,22,'img/pic_europe/xiangfen/di/simg/simg1.jpg','img/pic_europe/xiangfen/di/simg/md1.jpg','img/pic_europe/xiangfen/di/simg/lg1.jpg'),
(NULL,22,'img/pic_europe/xiangfen/di/simg/simg2.jpg','img/pic_europe/xiangfen/di/simg/md2.jpg','img/pic_europe/xiangfen/di/simg/lg2.jpg'),
(NULL,22,'img/pic_europe/xiangfen/di/simg/simg3.jpg','img/pic_europe/xiangfen/di/simg/md3.jpg','img/pic_europe/xiangfen/di/simg/lg3.jpg'),
(NULL,22,'img/pic_europe/xiangfen/di/simg/simg4.jpg','img/pic_europe/xiangfen/di/simg/md4.jpg','img/pic_europe/xiangfen/di/simg/lg4.jpg'),
(NULL,23,'img/pic_europe/xiangfen/fl/simg/simg1.jpg','img/pic_europe/xiangfen/fl/simg/md1.jpg','img/pic_europe/xiangfen/fl/simg/lg1.jpg'),
(NULL,23,'img/pic_europe/xiangfen/fl/simg/simg2.jpg','img/pic_europe/xiangfen/fl/simg/md2.jpg','img/pic_europe/xiangfen/fl/simg/lg2.jpg'),
(NULL,23,'img/pic_europe/xiangfen/fl/simg/simg3.jpg','img/pic_europe/xiangfen/fl/simg/md3.jpg','img/pic_europe/xiangfen/fl/simg/lg3.jpg'),
(NULL,24,'img/pic_europe/xiangfen/fsz/simg/simg1.jpg','img/pic_europe/xiangfen/fsz/simg/md1.jpg','img/pic_europe/xiangfen/fsz/simg/lg1.jpg'),
(NULL,24,'img/pic_europe/xiangfen/fsz/simg/simg2.jpg','img/pic_europe/xiangfen/fsz/simg/md2.jpg','img/pic_europe/xiangfen/fsz/simg/lg2.jpg'),
(NULL,24,'img/pic_europe/xiangfen/fsz/simg/simg3.jpg','img/pic_europe/xiangfen/fsz/simg/md3.jpg','img/pic_europe/xiangfen/fsz/simg/lg3.jpg'),
(NULL,24,'img/pic_europe/xiangfen/fsz/simg/simg4.jpg','img/pic_europe/xiangfen/fsz/simg/md4.jpg','img/pic_europe/xiangfen/fsz/simg/lg4.jpg'),
(NULL,24,'img/pic_europe/xiangfen/fsz/simg/simg5.jpg','img/pic_europe/xiangfen/fsz/simg/md5.jpg','img/pic_europe/xiangfen/fsz/simg/lg5.jpg'),
(NULL,25,'img/pic_europe/xiangfen/xne/simg/simg1.jpg','img/pic_europe/xiangfen/xne/simg/md1.jpg','img/pic_europe/xiangfen/xne/simg/lg1.jpg'),
(NULL,25,'img/pic_europe/xiangfen/xne/simg/simg2.jpg','img/pic_europe/xiangfen/xne/simg/md2.jpg','img/pic_europe/xiangfen/xne/simg/lg2.jpg'),
(NULL,26,'img/pic_europe/xiangfen/ysl/simg/simg1.jpg','img/pic_europe/xiangfen/ysl/simg/md1.jpg','img/pic_europe/xiangfen/ysl/simg/lg1.jpg'),
(NULL,26,'img/pic_europe/xiangfen/ysl/simg/simg2.jpg','img/pic_europe/xiangfen/ysl/simg/md2.jpg','img/pic_europe/xiangfen/ysl/simg/lg2.jpg'),
(NULL,27,'img/pic_europe/xiangfen/zml/simg/simg1.jpg','img/pic_europe/xiangfen/zml/simg/md1.jpg','img/pic_europe/xiangfen/zml/simg/lg1.jpg'),
(NULL,27,'img/pic_europe/xiangfen/zml/simg/simg2.jpg','img/pic_europe/xiangfen/zml/simg/md2.jpg','img/pic_europe/xiangfen/zml/simg/lg2.jpg'),
(NULL,27,'img/pic_europe/xiangfen/zml/simg/simg3.jpg','img/pic_europe/xiangfen/zml/simg/md3.jpg','img/pic_europe/xiangfen/zml/simg/lg3.jpg'),
(NULL,27,'img/pic_europe/xiangfen/zml/simg/simg4.jpg','img/pic_europe/xiangfen/zml/simg/md4.jpg','img/pic_europe/xiangfen/zml/simg/lg4.jpg'),
(NULL,28,'img/pic_korea/meifa/anjy/simg/simg1.jpg','img/pic_korea/meifa/anjy/simg/md1.jpg','img/pic_korea/meifa/anjy/simg/lg1.jpg'),
(NULL,28,'img/pic_korea/meifa/anjy/simg/simg2.jpg','img/pic_korea/meifa/anjy/simg/md2.jpg','img/pic_korea/meifa/anjy/simg/lg2.jpg'),
(NULL,28,'img/pic_korea/meifa/anjy/simg/simg3.jpg','img/pic_korea/meifa/anjy/simg/md3.jpg','img/pic_korea/meifa/anjy/simg/lg3.jpg'),
(NULL,28,'img/pic_korea/meifa/anjy/simg/simg4.jpg','img/pic_korea/meifa/anjy/simg/md4.jpg','img/pic_korea/meifa/anjy/simg/lg4.jpg'),
(NULL,28,'img/pic_korea/meifa/anjy/simg/simg5.jpg','img/pic_korea/meifa/anjy/simg/md5.jpg','img/pic_korea/meifa/anjy/simg/lg5.jpg'),
(NULL,29,'img/pic_korea/meifa/lv/simg/simg1.jpg','img/pic_korea/meifa/lv/simg/md1.jpg','img/pic_korea/meifa/lv/simg/lg1.jpg'),
(NULL,29,'img/pic_korea/meifa/lv/simg/simg2.jpg','img/pic_korea/meifa/lv/simg/md2.jpg','img/pic_korea/meifa/lv/simg/lg2.jpg'),
(NULL,30,'img/pic_korea/meifa/pola/simg/simg1.jpg','img/pic_korea/meifa/pola/simg/md1.jpg','img/pic_korea/meifa/pola/simg/lg1.jpg'),
(NULL,30,'img/pic_korea/meifa/pola/simg/simg2.jpg','img/pic_korea/meifa/pola/simg/md2.jpg','img/pic_korea/meifa/pola/simg/lg2.jpg'),
(NULL,30,'img/pic_korea/meifa/pola/simg/simg3.jpg','img/pic_korea/meifa/pola/simg/md3.jpg','img/pic_korea/meifa/pola/simg/lg3.jpg'),
(NULL,31,'img/pic_korea/meifa/ry/simg/simg1.jpg','img/pic_korea/meifa/ry/simg/md1.jpg','img/pic_korea/meifa/ry/simg/lg1.jpg'),
(NULL,31,'img/pic_korea/meifa/ry/simg/simg2.jpg','img/pic_korea/meifa/ry/simg/md2.jpg','img/pic_korea/meifa/ry/simg/lg2.jpg'),
(NULL,32,'img/pic_korea/meifa/zst/simg/simg1.jpg','img/pic_korea/meifa/zst/simg/md1.jpg','img/pic_korea/meifa/zst/simg/lg1.jpg'),
(NULL,32,'img/pic_korea/meifa/zst/simg/simg2.jpg','img/pic_korea/meifa/zst/simg/md2.jpg','img/pic_korea/meifa/zst/simg/lg2.jpg'),
(NULL,33,'img/pic_europe/meifa/ks/simg/simg1.jpg','img/pic_europe/meifa/ks/simg/md1.jpg','img/pic_europe/meifa/ks/simg/lg1.jpg'),
(NULL,33,'img/pic_europe/meifa/ks/simg/simg2.jpg','img/pic_europe/meifa/ks/simg/md2.jpg','img/pic_europe/meifa/ks/simg/lg2.jpg'),
(NULL,34,'img/pic_europe/meifa/mr/simg/simg1.jpg','img/pic_europe/meifa/mr/simg/md1.jpg','img/pic_europe/meifa/mr/simg/lg1.jpg'),
(NULL,34,'img/pic_europe/meifa/mr/simg/simg2.jpg','img/pic_europe/meifa/mr/simg/md2.jpg','img/pic_europe/meifa/mr/simg/lg2.jpg'),
(NULL,35,'img/pic_europe/meifa/mt/simg/simg1.jpg','img/pic_europe/meifa/mt/simg/md1.jpg','img/pic_europe/meifa/mt/simg/lg1.jpg'),
(NULL,35,'img/pic_europe/meifa/mt/simg/simg2.jpg','img/pic_europe/meifa/mt/simg/md2.jpg','img/pic_europe/meifa/mt/simg/lg2.jpg'),
(NULL,35,'img/pic_europe/meifa/mt/simg/simg3.jpg','img/pic_europe/meifa/mt/simg/md3.jpg','img/pic_europe/meifa/mt/simg/lg3.jpg'),
(NULL,35,'img/pic_europe/meifa/mt/simg/simg4.jpg','img/pic_europe/meifa/mt/simg/md4.jpg','img/pic_europe/meifa/mt/simg/lg4.jpg'),
(NULL,36,'img/pic_europe/meifa/sxs/simg/simg1.jpg','img/pic_europe/meifa/sxs/simg/md1.jpg','img/pic_europe/meifa/sxs/simg/lg1.jpg'),
(NULL,36,'img/pic_europe/meifa/sxs/simg/simg2.jpg','img/pic_europe/meifa/sxs/simg/md2.jpg','img/pic_europe/meifa/sxs/simg/lg2.jpg'),
(NULL,36,'img/pic_europe/meifa/sxs/simg/simg3.jpg','img/pic_europe/meifa/sxs/simg/md3.jpg','img/pic_europe/meifa/sxs/simg/lg3.jpg'),
(NULL,36,'img/pic_europe/meifa/sxs/simg/simg4.jpg','img/pic_europe/meifa/sxs/simg/md4.jpg','img/pic_europe/meifa/sxs/simg/lg4.jpg');

/*用户信息表*/
INSERT INTO jm_user VALUES
(NULL, 'tom', '123456', 'tom@qq.com', '13501234567', 'img/pic_avater/liming.png', '汤姆', '1'),
(NULL, 'wanghong', '123456', 'wanghong@qq.com', '13501234568', 'img/pic_avater/wanghong.png', '王红', '0'),
(NULL, 'zhangsan', '123456', 'zhangsan@qq.com', '13501234569', 'img/pic_avater/zhangsan.png', '张三', '1');


INSERT INTO jm_search_pic VALUES
(1,'img/pic_korea/hufu/ahc/ahc.jpg'),
(2,'img/pic_korea/hufu/cy/cy.jpg'),
(3,'img/pic_korea/hufu/xhx/xhx.jpg'),
(4,'img/pic_korea/hufu/xpl/xpl.jpg'),
(5,'img/pic_korea/hufu/ys/ys.jpg'),
(6,'img/pic_europe/hufu/lfq/lfq.jpg'),
(7,'img/pic_europe/hufu/lk/lk.jpg'),
(8,'img/pic_europe/hufu/wz/wz.jpg'),
(9,'img/pic_europe/hufu/yy/yy.jpg'),
(10,'img/pic_korea/caizhuang/aj/aj.jpg'),
(11,'img/pic_korea/caizhuang/dhc/dhc.jpg'),
(12,'img/pic_korea/caizhuang/lz/lz.jpg'),
(13,'img/pic_korea/caizhuang/xpl/xpl.jpg'),
(14,'img/pic_korea/caizhuang/ys/ys.jpg'),
(15,'img/pic_europe/caizhuang/bdm/bdm.jpg'),
(16,'img/pic_europe/caizhuang/jl/jl.jpg'),
(17,'img/pic_europe/caizhuang/mkf/mkf.jpg'),
(18,'img/pic_europe/caizhuang/xne/xne.jpg'),
(19,'img/pic_korea/xiangfen/onb/onb.jpg'),
(20,'img/pic_europe/xiangfen/annas/annas.jpg'),
(21,'img/pic_europe/xiangfen/bgl/bgl.jpg'),
(22,'img/pic_europe/xiangfen/di/di.jpg'),
(23,'img/pic_europe/xiangfen/fl/fl.jpg'),
(24,'img/pic_europe/xiangfen/fsz/fsz.jpg'),
(25,'img/pic_europe/xiangfen/xne/xne.jpg'),
(26,'img/pic_europe/xiangfen/ysl/ysl.jpg'),
(27,'img/pic_europe/xiangfen/zml/zml.jpg'),
(28,'img/pic_korea/meifa/anjy/anjy.jpg'),
(29,'img/pic_korea/meifa/lv/lv.jpg'),
(30,'img/pic_korea/meifa/pola/pola.jpg'),
(31,'img/pic_korea/meifa/ry/ry.jpg'),
(32,'img/pic_korea/meifa/zst/zst.jpg'),
(33,'img/pic_europe/meifa/ks/ks.jpg'),
(34,'img/pic_europe/meifa/mr/mr.jpg'),
(35,'img/pic_europe/meifa/mt/mt.jpg'),
(36,'img/pic_europe/meifa/sxs/sxs.jpg')
































