<template>
   <div>
      <myHeader></myHeader>
      <main class="container">
        <!--导航栏-->
        <div class="row">
            <div class="col-sm-12">
                <ul class="nav"  >
                    <li class="nav-item" >
                            <span class="nav-link">商品分类</span>
                    </li>
                    <li class="nav-item">
                        <router-link to="/index">
                            <span class="nav-link" >首页</span>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/productk">
                            <span class="nav-link">日韩直邮</span>               
                        </router-link>  
                    </li>
                    <li class="nav-item">
                        <router-link to="/producte">
                            <span class="nav-link">欧洲直邮</span>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/products">
                            <span class="nav-link">临期特价</span>
                       </router-link>   
                    </li>
                </ul>
            </div>
        </div>
        <!--轮播图:height="autoHeight"-->
        <el-carousel height="380px" arrow="never"  :interval="5000"  >
            <el-carousel-item  v-for="item in imagesbox" :key="item.id">
                 <img class="banner_img"  :src="item.idView" >
            </el-carousel-item>
            <div class="menu position-absolute">
                <div class="menuList" @mouseenter="enter($event)" @mouseleave="leave($event)">
                    <h3>
                        <a title="所有">所有</a>
                    </h3>
                    <div class="pList L1">
                        <p class="proAb"><a >日韩直邮</a></p>
                        <p class="proAb"><a >欧洲直邮</a></p>
                        <p class="proAb"><a >临期特价</a></p>
                    </div>
                </div>
                <div class="menuList" @mouseenter="enter($event)" @mouseleave="leave($event)">
                    <h3>
                        <a title="护肤">护肤</a>
                    </h3>
                    <div class="pList L2" v-if="others">
                        <p><router-link :to="`/details/${others[6].lianjie}`">化妆水</router-link></p>
                        <p><router-link :to="`/details/${others[0].lianjie}`">面部精华</router-link></p>
                        <p><router-link :to="`/details/${others[1].lianjie}`">洁面乳</router-link></p>
                        <p><router-link :to="`/details/${others[5].lianjie}`">面膜</router-link></p>
                        <p><router-link :to="`/details/${others[2].lianjie}`">套装</router-link></p>
                    </div>
                </div>
                <div class="menuList" @mouseenter="enter($event)" @mouseleave="leave($event)">
                    <h3>
                        <a title="彩妆">彩妆</a>
                    </h3>
                    <div class="pList L3" v-if="others">
                        <p><router-link :to="`/details/${others[11].lianjie}`">气垫BB</router-link></p>
                        <p><router-link :to="`/details/${others[13].lianjie}`">散粉</router-link></p>
                        <p><router-link :to="`/details/${others[10].lianjie}`">唇膏</router-link></p>
                        <p><router-link :to="`/details/${others[17].lianjie}`">眼影</router-link></p>
                        <p><router-link :to="`/details/${others[14].lianjie}`">卸妆水</router-link></p>
                    </div>
                </div>
                <div class="menuList" @mouseenter="enter($event)" @mouseleave="leave($event)">
                    <h3>   
                        <a title="香氛">香氛</a>
                    </h3>
                    <div class="pList L4" v-if="others">
                        <p><router-link :to="`/details/${others[18].lianjie}`">沐浴露</router-link></p>
                        <p><router-link :to="`/details/${others[19].lianjie}`">淡香</router-link></p>
                        <p><router-link :to="`/details/${others[24].lianjie}`">浓香</router-link></p>
                        <p><router-link :to="`/details/${others[26].lianjie}`">古龙</router-link></p>
                        <p><router-link :to="`/details/${others[21].lianjie}`">礼盒</router-link></p>
                    </div>
                </div>
                <div class="menuList" @mouseenter="enter($event)" @mouseleave="leave($event)">
                    <h3>
                        <a title="美发">美发</a>
                    </h3>
                    <div class="pList L5" v-if="others">
                        <p><router-link :to="`/details/${others[27].lianjie}`">洗发水</router-link></p>
                        <p><router-link :to="`/details/${others[29].lianjie}`">护发素</router-link></p>
                        <p><router-link :to="`/details/${others[30].lianjie}`">染发剂</router-link></p>
                        <p><router-link :to="`/details/${others[31].lianjie}`">发膜</router-link></p>
                        <p><router-link :to="`/details/${others[33].lianjie}`">护发精油</router-link></p>
                    </div>
                </div>
            </div>
      </el-carousel>
       
        <!--今日疯抢-->
        <div class="fq">
            <div>今日疯抢</div>
            <div>
                <span id="day"></span>
                <span id="hour"></span>
                <span id="minute"></span>
                <span id="second"></span>
            </div>
        </div>
        <div class="row fp">
            <div class="col">
                <div class="face front" v-if="others">
                    <router-link  :to="`/details/${others[13].lianjie}`">
                        <img src="../../public/img/pic_fp/ys.jpg">
                        <h6 v-text="others[13].jname"></h6>
                        <p>¥{{others[13].price.toFixed(2)}}</p>
                    </router-link>
                </div>
                <div class="face back" v-if="others">
                    <router-link  :to="`/details/${others[9].lianjie}`">
                        <img src="../../public/img/pic_fp/aj.jpg">
                        <h6 v-text="others[9].jname"></h6>
                        <p>¥{{others[9].price.toFixed(2)}}</p>
                    </router-link>
                </div>
            </div>
            <div class="col">
                <div class="face front" v-if="others">
                    <router-link  :to="`/details/${others[14].lianjie}`">
                        <img src="../../public/img/pic_fp/bdm.jpg">
                        <h6 v-text="others[14].jname"></h6>
                        <p>¥{{others[14].price.toFixed(2)}}</p>
                    </router-link>
                </div>
                <div class="face back" v-if="others">
                    <router-link  :to="`/details/${others[6].lianjie}`">
                        <img src="../../public/img/pic_fp/lk.jpg">
                        <h6 v-text="others[6].jname"></h6>
                        <p>¥{{others[6].price.toFixed(2)}}</p>
                    </router-link>
                </div>
            </div>
            <div class="col">
                <div class="face front" v-if="others">
                    <router-link  :to="`/details/${others[17].lianjie}`">
                        <img src="../../public/img/pic_fp/xne.jpg">
                        <h6 v-text="others[17].jname"></h6>
                        <p>¥{{others[17].price.toFixed(2)}}</p>
                    </router-link>
                </div>
                <div class="face back" v-if="others">
                    <router-link  :to="`/details/${others[31].lianjie}`">
                        <img src="../../public/img/pic_fp/zst.jpg">
                        <h6 v-text="others[31].jname"></h6>
                        <p>¥{{others[31].price.toFixed(2)}}</p>
                    </router-link>
                </div>
            </div>
            <div class="col">
                <div class="face front" v-if="others">
                    <router-link  :to="`/details/${others[4].lianjie}`">
                        <img src="../../public/img/pic_fp/ys1.jpg">
                        <h6 v-text="others[4].jname"></h6>
                        <p>¥{{others[4].price.toFixed(2)}}</p>
                    </router-link>
                </div>
                <div class="face back" v-if="others">
                    <router-link  :to="`/details/${others[7].lianjie}`">
                        <img src="../../public/img/pic_fp/wz.jpg">
                        <h6 v-text="others[7].jname"></h6>
                        <p>¥{{others[7].price.toFixed(2)}}</p>
                    </router-link>
                </div>
            </div>
        </div>
        <!--商品列表 护肤-->
        <div class="fq">护肤品类</div>
        <div class="row no-gutters">
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <router-link  :to="`/details/${others[4].lianjie}`">
                    <img src="../../public/img/pic_show/hufu/ys1.jpg">
                </router-link>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/wz.jpg">
                        <router-link  :to="`/details/${others[7].lianjie}`">
                            <p v-text="others[7].jname"></p>
                            <p>¥{{others[7].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/xhx.jpg">
                        <router-link  :to="`/details/${others[2].lianjie}`">
                            <p v-text="others[2].jname"></p>
                            <p>¥{{others[2].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">   
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/lfq.jpg">
                        <router-link  :to="`/details/${others[5].lianjie}`">
                            <p v-text="others[5].jname"></p>
                            <p>¥{{others[5].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/xpl.jpg">
                        <router-link  :to="`/details/${others[3].lianjie}`">
                            <p v-text="others[3].jname"></p>
                            <p>¥{{others[3].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/ahc.jpg">
                        <router-link  :to="`/details/${others[0].lianjie}`">
                            <p v-text="others[0].jname"></p>
                            <p>¥{{others[0].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/lk.jpg">
                        <router-link  :to="`/details/${others[6].lianjie}`">
                            <p v-text="others[6].jname"></p>
                            <p>¥{{others[6].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">    
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/yy.jpg">
                        <router-link  :to="`/details/${others[8].lianjie}`">
                            <p v-text="others[8].jname"></p>
                            <p>¥{{others[8].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/hufu/cy.jpg">
                        <router-link  :to="`/details/${others[1].lianjie}`">
                            <p v-text="others[1].jname"></p>
                            <p>¥{{others[1].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <!--彩妆品类-->
        <div class="fq">美妆品类</div>
        <div class="row no-gutters">
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <router-link  :to="`/details/${others[17].lianjie}`">
                    <img src="../../public/img/pic_show/caizhaung/xne1.jpg">
                </router-link>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/aj.jpg">
                        <router-link  :to="`/details/${others[9].lianjie}`">
                            <p v-text="others[9].jname"></p>
                            <p>¥{{others[9].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/bdm.jpg">
                        <router-link  :to="`/details/${others[14].lianjie}`">
                            <p v-text="others[14].jname"></p>
                            <p>¥{{others[14].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">   
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/dhc.jpg">
                        <router-link  :to="`/details/${others[10].lianjie}`">
                            <p v-text="others[10].jname"></p>
                            <p>¥{{others[10].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/jl.jpg">
                        <router-link  :to="`/details/${others[15].lianjie}`">
                            <p v-text="others[15].jname"></p>
                            <p>¥{{others[15].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/lz.jpg">
                        <router-link  :to="`/details/${others[11].lianjie}`">
                            <p v-text="others[11].jname"></p>
                            <p>¥{{others[11].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/mkf.jpg">
                        <router-link  :to="`/details/${others[16].lianjie}`">
                            <p v-text="others[16].jname"></p>
                            <p>¥{{others[16].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">    
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/xpl.jpg">
                        <router-link  :to="`/details/${others[12].lianjie}`">
                            <p v-text="others[12].jname"></p>
                            <p>¥{{others[12].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/caizhaung/ys.jpg">
                        <router-link  :to="`/details/${others[13].lianjie}`">
                            <p v-text="others[13].jname"></p>
                            <p>¥{{others[13].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <!--香氛品类-->
        <div class="fq">香氛品类</div>
        <div class="row no-gutters">
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <router-link  :to="`/details/${others[22].lianjie}`">
                    <img src="../../public/img/pic_show/xiangfen/fl1.jpg">
                </router-link>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/annas.jpg">
                        <router-link  :to="`/details/${others[19].lianjie}`">
                            <p v-text="others[19].jname"></p>
                            <p>¥{{others[19].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/bgl.jpg">
                        <router-link  :to="`/details/${others[20].lianjie}`">
                            <p v-text="others[20].jname"></p>
                            <p>¥{{others[20].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">   
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/di.jpg">
                        <router-link  :to="`/details/${others[21].lianjie}`">
                            <p v-text="others[21].jname"></p>
                            <p>¥{{others[21].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/fsz.jpg">
                        <router-link  :to="`/details/${others[23].lianjie}`">
                            <p v-text="others[23].jname"></p>
                            <p>¥{{others[23].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/onb.jpg">
                        <router-link  :to="`/details/${others[18].lianjie}`">
                            <p v-text="others[18].jname"></p>
                            <p>¥{{others[18].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/xne.jpg">
                        <router-link  :to="`/details/${others[24].lianjie}`">
                            <p v-text="others[24].jname"></p>
                            <p>¥{{others[24].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">    
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/ysl.jpg">
                        <router-link  :to="`/details/${others[25].lianjie}`">
                            <p v-text="others[25].jname"></p>
                            <p>¥{{others[25].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/xiangfen/zml.jpg">
                        <router-link  :to="`/details/${others[26].lianjie}`">
                            <p v-text="others[26].jname"></p>
                            <p>¥{{others[26].price.toFixed(2)}}</p>
                         </router-link>
                    </div>
                </div>
            </div>
        </div>
        <!--美发品类--> 
        <div class="fq">美发品类</div>
        <div class="row no-gutters">
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <router-link  :to="`/details/${others[27].lianjie}`">
                    <img src="../../public/img/pic_show/meifa/anjy1.jpg">
                </router-link>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/ks.jpg">
                        <router-link  :to="`/details/${others[32].lianjie}`">
                            <p v-text="others[32].jname"></p>
                            <p>¥{{others[32].price.toFixed(2)}}</p>
                         </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/lv.jpg">
                        <router-link  :to="`/details/${others[28].lianjie}`">
                            <p v-text="others[28].jname"></p>
                            <p>¥{{others[28].price.toFixed(2)}}</p>
                         </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">   
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/mr.jpg">
                        <router-link  :to="`/details/${others[33].lianjie}`">
                            <p v-text="others[33].jname"></p>
                            <p>¥{{others[33].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/mt.jpg">
                        <router-link  :to="`/details/${others[34].lianjie}`">
                            <p v-text="others[34].jname"></p>
                            <p>¥{{others[34].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12" v-if="others">
                <div class="row no-gutters">
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/pola.jpg">
                        <router-link  :to="`/details/${others[29].lianjie}`">
                            <p v-text="others[29].jname"></p>
                            <p>¥{{others[29].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/ry.jpg">
                        <router-link  :to="`/details/${others[30].lianjie}`">
                            <p v-text="others[30].jname"></p>
                            <p>¥{{others[30].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>    
                <div class="row no-gutters">    
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/sxs.jpg">
                        <router-link  :to="`/details/${others[35].lianjie}`">
                            <p v-text="others[35].jname"></p>
                            <p>¥{{others[35].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                    <div class="col-6 topBorder">
                        <img src="../../public/img/pic_show/meifa/zst.jpg">
                        <router-link  :to="`/details/${others[25].lianjie}`">
                            <p v-text="others[31].jname"></p>
                            <p>¥{{others[31].price.toFixed(2)}}</p>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <!--猜你喜欢-->
        <div class="fq">猜你喜欢</div>
        <div class="row uLike">
            <div class="col-lg-3 col-md-6" v-if="others">
                <img src="../../public/img/pic_like/xpl4.jpg">
                <router-link  :to="`/details/${others[12].lianjie}`">
                    <h6 v-text="others[12].jname"></h6>
                    <p>¥{{others[12].price.toFixed(2)}}</p>
                </router-link>
            </div>
            <div class="col-lg-3 col-md-6" v-if="others">
                <img src="../../public/img/pic_like/jl1.jpg">
                <router-link  :to="`/details/${others[15].lianjie}`">
                    <h6 v-text="others[15].jname"></h6>
                    <p>¥{{others[15].price.toFixed(2)}}</p>
                </router-link>
            </div>
            <div class="col-lg-3 col-md-6" v-if="others">
                <img src="../../public/img/pic_like/ys1.jpg">
                <router-link  :to="`/details/${others[13].lianjie}`">
                    <h6 v-text="others[13].jname"></h6>
                    <p>¥{{others[13].price.toFixed(2)}}</p>
                </router-link>
            </div>
            <div class="col-lg-3 col-md-6" v-if="others">
                <img src="../../public/img/pic_like/mkf1.jpg">
                <router-link  :to="`/details/${others[16].lianjie}`">
                    <h6 v-text="others[16].jname"></h6>
                    <p>¥{{others[16].price.toFixed(2)}}</p>
                </router-link>
            </div>
        </div>
      </main>
      <myFooter></myFooter>
   </div>
</template>
<script>
//import {indexPre} from '../assets/js/index.js'
export default {
    data(){
        return{
            others:"",

            imagesbox:[{id:0,idView:require("../../public/img/pic_lunbo/banner1.jpg")},
                       {id:1,idView:require("../../public/img/pic_lunbo/banner2.jpg")},
                       {id:2,idView:require("../../public/img/pic_lunbo/banner3.jpg")},
                       {id:3,idView:require("../../public/img/pic_lunbo/banner4.jpg")}
            ]
        } 
    },
    props:[],
    methods:{
        enter(e){
            $(e.target).find(".pList").fadeIn()
        },
        leave(e){
            $(e.target).find(".pList").fadeOut()
        },   
        flip(){
            var i=0;
            $(".fp").eq(i).toggleClass('card-flipped'); 
            i++;
            if(i==3){
                i=0
            };      
        },
        
        getDetail(){
            this.axios.get("/index").then(result=>{
            //console.log(result.data);
            this.others=result.data;
            //console.log( this.others[13]);

        })
        }
    },
    created(){
        
         /*(async ()=>{
        var result=await this.axios.get("/index").then(result=>{
            console.log(result.data);
            this.others=result.data;})
        })();*/  
    },
    mounted(){
        this.getDetail()

        //翻转
        var timer1=null;
        this.flip();
        timer1=setInterval(this.flip, 5000);
        this.$once("hook:beforeDestroy",()=>{
            clearInterval(timer1)
        });
        
        
        window.onload =function (){
            var timer2=null;
            var day=2;
            var hour=23;
            var minute=59;
            var second=60;
            var timer2=setInterval(function(){
                second--;
                if(day<=0 && hour<=0 && second<=0 && minute<=0){
                    day="02";    
                    hour=23;
                    minute=59;
                    second=60;
                };
                if(second<=0){
                    minute--;
                    second=60;
                        if(minute<=0){
                            hour--;
                            minute = 59;
                                if(hour<=0){
                                    day--;
                                    hour=23;
                                }
                        }
                }; 
                $("#day").text("距结束还剩:"+day+"天"); 
                $("#hour").text(hour+"时");
                $("#minute").text(minute+"分");
                $("#second").text(second+"秒");
            }, 1000);  
        }
    },
}
</script>
<style scoped>
/*@import url("../assets/css/index.css");*/
.nav{
    justify-content: space-around;
    width:100%;
    height:35px;
    background-color: #E58336;
    line-height: 20px;
    margin-bottom: -16px;
    margin-top: 10px;
}
.nav-link{
    color:#272626;
    font-size:18px;
}
.nav-link:hover{
    color:rgb(192, 3, 3);
}
.banner_img{
    height:100%;
    width:100%;
    margin-top:16px
}
.menu{
    width:20%;
    height:364px;
    background-color: #272626;
    opacity: 0.7;
    top:16px;
    z-index:9
}
.menuList{
    position: relative;
    width:100%;
    z-index:1;
}
.menuList h3{
    position: relative;
    width: 100%;
    height: 25px;
    line-height: 25px;
    font-size: 16px;
    text-align: center;
    margin: 38px 0;
	color:whitesmoke;
    z-index: 2;
}
.menuList:hover h3{
    background-color: whitesmoke;
    color:#272626;
    transform: scale(1.1);
    transition: all .3s ease;
    cursor: pointer;
}
.menuList h3 a:link, .menuList h3 a:visited {
    color: #E58336;
}
.menuList .pList{
    position:absolute;
    display: none;
    width:100%;
    height:364px;
    left:222px;
    background-color: whitesmoke;
    opacity: 0.8;
    padding: 15px 15px;
    overflow: hidden;
    z-index:3;
}
.pList p{
    border-top: 1px solid #ccc;
    text-align: center;
    padding-top: 18px;
    margin: 18px 0;
	font-size:15px;
}
.pList p:last-child{
    border-bottom: 1px solid #ccc;
    padding-bottom: 18px;
}
.menuList .pList a{
	width:100%;
    height:30px;
    color:rgb(14, 13, 13);
}
.menuList .pList a:hover{
    color:#ec192e
}
.L1 {
    top: -38px; 
}
.L2 {
   top: -101px;
}
.L3 {
   top: -164px;
}
.L4 {
    top: -227px; 
}
.L5 {
   top: -290px;
}
.fq{
    display: flex;
    justify-content: space-between;
    margin-top:50px;
    margin-bottom:10px;
    color: #E58336;
    font-weight: bold;
    font-size:20px;
}
.fp{
    text-align: center;
    height:326px;
    background: #ccc;
    margin: 0;
    padding-left: 10px;
    perspective: 1000;
    -webkit-perspective: 1000;
}
.fp h6{
    margin:10px 0;
}
.fp h6,.fp p,.row.no-gutters p,.uLike h6,.uLike p{
    color:#272626
}
.container h6:hover{
    color:#E58336
}
.container p:hover{
    color:#E58336;
}
.face{
    position: absolute;
    -webkit-transition: all 2s ease;
    -moz-transition: all 2s ease;
    transition: all 2s ease;
    backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -webkit-backface-visibility: hidden;
    -o-backface-visibility: hidden;
}
.front {
    z-index: 10;
}
.back{
    transform:rotate3d(0,1,0,-180deg);
    -ms-transform:rotate3d(0,1,0,-180deg);  /* IE 9 */
    -moz-transform:rotate3d(0,1,0,-180deg); /* Firefox */
    -webkit-transform:rotate3d(0,1,0,-180deg); /* Safari 和 Chrome */
    -o-transform:rotateY(0,1,0,-180deg);  /* Opera */
    z-index: 8;
}
.card-flipped .front{
    transform:rotate3d(0,1,0,180deg);
    -ms-transform:rotate3d(0,1,0,180deg);/* IE 9 */
    -moz-transform:rotate3d(0,1,0,180deg);/* Firefox */
    -webkit-transform:rotate3d(0,1,0,180deg);/* Safari 和 Chrome */
    -o-transform:rotate3d(0,1,0,180deg);  /* Opera */
    z-index: 8;
}
.card-flipped .back{
    transform:rotate3d(0,1,0,0deg);
    -ms-transform:rotate3d(0,1,0,0deg);/* IE 9 */
    -moz-transform:rotate3d(0,1,0,0deg);/* Firefox */
    -webkit-transform:rotate3d(0,1,0,0deg);/* Safari 和 Chrome */
    -o-transform:rotate3d(0,1,0,0deg);  /* Opera */
    z-index: 10;
}
.topBorder{
    border:1px solid #ccc;
    overflow: hidden;
    background: white;
    font-size:10px;
    height:247px;
    text-align: center;
}
.topBorder p{
    height:10px;
}
.uLike{
    justify-content: space-between;
    overflow: hidden;
    text-align: center;
    margin: 10px 0;
    margin-bottom: 100px;
}
.uLike h6{
    margin:10px 0;
}
.topBorder img:hover{
    transform: translateX(-10px);
    transition: 1s ;
}
.uLike img:hover{
    transform: scale(1.1,1.1);
    transition: 1s;
    box-shadow:0px 20px 40px -20px #5a5151
}
</style>