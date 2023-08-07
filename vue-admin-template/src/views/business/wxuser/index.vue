<template>
  <div class="app-container">
    <!-- 列表 -->
    <el-table
      v-loading="listLoading"
      :data="list"
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

      <el-table-column prop="nickName" label="用户昵称" width="180"/>
      <el-table-column prop="openid" label="open_id" width="150"/>
      <el-table-column prop="avatarUrl" label="用户头像" width="100" >
        <template  v-slot="scope">
          <img  :src="scope.row.avatarUrl" width="75" height="80"/>
        </template>
      </el-table-column>

      <el-table-column prop="registerDate" label="注册时间" />
      <el-table-column prop="lastLoginDate" label="最后登录时间" />
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
import api from '@/api/wxuser/wxUser'

const defaultForm = {
  id: '',
  username: '',
  password: '',
  name: '',
  phone: '',
  status: 1
}
export default {
  data() {
    return {
      listLoading: true, // 数据是否正在加载
      list: null, // 微信用户列表
      total: 0, // 数据库中的总记录数
      page: 1, // 默认页码
      limit: 5, // 每页记录数
    }
  },

  // 生命周期函数：内存准备完毕，页面尚未渲染
  created() {
    this.fetchData()
  },

  // 生命周期函数：内存准备完毕，页面渲染成功
  mounted() {
    console.log('list mounted......')
  },

  methods: {
    // 加载banner列表数据
    fetchData() {


      api.getAllWxUser().then(resp => {
        console.log(resp.data.wxUserInfoList.length)
        this.list = resp.data.wxUserInfoList
        // 数据加载并绑定成功
        this.listLoading = false
      })

    },

    //切换用户状态
    switchStatus(row) {
      // TODO 三元表达式实现取反
      row.status = row.status === 1 ? 0 : 1
      api.updateStatus(row.id, row.status)
        .then(response => {
          if (response.code) {
            this.$message.success(response.message || '操作成功')
            this.fetchData()
          }
        })
    },
  }
}
</script>
<style>

</style>
