<template>
      <div>
          <myHeader></myHeader>
          <main class="container-fluid">
              <div class="row" >
                <img class="img-fluid" style="overflow: hidden;" src="../../public/img/pic_area/linQ.jpg">
            </div>
            <div class="row List">
                <div v-for="(p,i) of products" :key="i" class="col-lg-3 col-md-6" >
                    <router-link  :to="`/details/${p.lid}`">
                        <img :src="p.md">
                        <h6 v-text="p.jname"></h6>
                        <p>¥{{p.price.toFixed(2)}}</p>
                    </router-link>
                </div>
            </div>
            <div class="row">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                <li class="page-item" :class="{disabled:pno==0}"><a class="page-link bg-transparent" href="javascript:;" @click="change(-1, $event)">上一页</a></li>
                <li v-for="i of pcount" :key="i" class="page-item" :class="{active:i-1==pno}"><a class="page-link" :class="i-1==pno?'border':'bg-transparent'" href="javascript:;" v-text="i" @click="changepage(i-1)"></a></li>
                <li class="page-item" :class="{disabled:pno==pcount-1}"><a class="page-link bg-transparent" href="javascript:;" @click="change(+1, $event)">下一页</a></li>
              </ul>
            </nav>
            </div>
          </main>
          <myFooter></myFooter>
      </div>
</template>
<script>
export default {
  data(){
    return{
        pno:0, 
        pcount:0, 
        products:[] 
    }
  },
  props:["kw"],

  methods:{
    //点击上一页或下一页按钮，获得事件对象
    change(n,e){
      //如果当前按钮上没有class disabled
      if(e.target.className.indexOf("disabled")==-1){
        //才调用翻页的函数，传入当前页面+1或-1后的新页码
        this.changepage(parseInt(this.pno)+parseInt(n));
      }
    },
    //专门翻页到指定页码i，然后重新ajax请求服务端指定页码的数据
    changepage(i){
      //console.log(i);
      this.load(i);//重新请求第i页的数据
    },

    load(pno=0){
      this.axios.get(
        "/searchPro",
        {
          params:{
            kw:this.kw, 
            pno
          }
        }
      ).then(result=>{
        //console.log(result.data);
        this.pno=result.data.pno;
        this.products=result.data.data;
        this.pcount=result.data.pageCount;
      })
    }
  },
  created(){//当前组件创建完，立刻自动发送ajax请求，请求第一页的查询结果
    this.load()
  },
  watch:{
    kw(){
      this.load();
    }
  }
}
</script>
<style scoped>
.List{
    justify-content:flex-start;
    overflow: hidden;
    text-align: center;
    padding-left:100px;
    padding-right:100px;
    margin-top:30px;
}
.List h6{
    margin:10px 0;
    color:#272626;
}
.List h6:hover{
    color:#E58336;
}
.List p{
    color:#272626;
}
.List p:hover{
    color:#E58336;
}
.row nav{
    margin:0 auto
}
.page-item.active .page-link{
    background: #E58336;
}
</style>