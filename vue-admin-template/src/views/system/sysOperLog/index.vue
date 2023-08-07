<template>
  <div class="container">

    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row>
          <el-col :span="8">
            <el-form-item label="关 键 字">
              <el-input style="width: 95%" v-model="searchObj.keyword" placeholder="登录用户"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="操作时间">
              <el-date-picker
                v-model="createTimes"
                type="datetimerange"
                range-separator="至"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                value-format="yyyy-MM-dd HH:mm:ss"
                style="margin-right: 10px;width: 100%;"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="display:flex">
          <el-button type="primary" icon="el-icon-search" size="mini"  @click="fetchData()">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetData">重置</el-button>
        </el-row>
      </el-form>
    </div>
    <!-- 列表 -->
    <el-table
      v-loading="listLoading"
      :data="allOperLogs"
      stripe
      border
      style="width: 100%;margin-top: 10px;">

      <el-table-column
        label="序号"
        width="70"
        align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>

      <el-table-column prop="title" label="系统模块" width="100"/>
      <el-table-column prop="businessType" label="操作类型" />
      <el-table-column prop="requestMethod" label="请求方式" />
      <el-table-column prop="operName" label="操作人员" />
      <el-table-column prop="method" label="请求方法" />
      <el-table-column prop="operIp" label="操作IP" width="200"/>




      <el-table-column label="操作状态" width="80">
        <template slot-scope="scope">
          <div v-if="scope.row.status === 1">成功</div>
          <div v-else >失败</div>
        </template>
      </el-table-column>
      <el-table-column prop="createTime" label="创建时间" />
      <el-table-column prop="jsonResult" label="操作详情" />
      <el-table-column prop="operUrl" label="请求地址" />


    </el-table>

    <!-- 分页组件 -->
    <el-pagination
      :current-page="page"
      :total="total"
      :page-size="limit"
      style="padding: 30px 0; text-align: center;"
      layout="total, prev, pager, next, jumper"
      @current-change="fetchData"
    />

  </div>
</template>

<script>

import api from '@/api/log/operLog.js'


export default {
  name: 'index',
  data(){
    return{
      listLoading: true, // 数据是否正在加载
      total: 0, // 数据库中的总记录数
      page: 1, // 默认页码
      limit: 5, // 每页记录数
      searchObj: {}, // 查询表单对象
      allOperLogs:null,// 所有登录日志记录

      createTimes: [],// 操作时间查询参数
    }
  },
  // 生命周期函数：内存准备完毕，页面尚未渲染
  created() {
    console.log('list created......')
    this.fetchData()
  },
  // 生命周期函数：内存准备完毕，页面渲染成功
  mounted() {
    console.log('list mounted......')
  },
  methods:{
    // async fetchData(page = 1){
    fetchData(page = 1){
      this.page = page;
      // 查询参数加上了操作时间，并且判断是否同时有开始时间和结束时间
      if (this.createTimes && this.createTimes.length == 2){
        this.searchObj.createTimesBegin = this.createTimes[0]
        this.searchObj.createTimeEnd = this.createTimes[1]
      }
      console.log(this.searchObj)

      api.getPageList(this.page,this.limit,this.searchObj).then(
        response => {
          //this.list = response.data.list
          this.allOperLogs = response.data.records
          this.total = response.data.total
          console.log(response)
          // 数据加载并绑定成功
          this.listLoading = false
        }
      )
      // try {
      //   let result = await api.getPageList(this.page,this.limit,this.searchObj);
      //   console.log(result)
      //   this.allLoginLogs = result.data.records
      //   this.total = result.data.total
      //   // 数据加载并绑定成功
      //   this.listLoading = false
      // }catch (err){
      //   console.log("error:"+err);
      //
      // }

    },
    // 重置查询表单
    resetData() {
      console.log('重置查询表单')
      this.searchObj = {}
      this.createTimes = []
      this.fetchData()
    },
  }

}
</script>

<style scoped>
.search-div {
  padding:10px;border: 1px solid #EBEEF5;border-radius:3px;
}
.tools-div {
  margin-top: 10px;padding:10px;border: 1px solid #EBEEF5;border-radius:3px;
}
</style>
