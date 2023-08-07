<template>
  <div class="app-container">
    角色列表
    <!--查询表单-->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row>
          <el-col :span="24">
            <el-form-item label="申请人">
              <el-input style="width: 100%" v-model="searchObj.username" placeholder="请输入申请人姓名......"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="display:flex">
          <el-button type="primary" icon="el-icon-search" size="mini"  @click="fetchData()">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetData">重置</el-button>

        </el-row>

      </el-form>

    </div>
    <!-- 工具条 -->
    <div class="tools-div">
<!--      <el-button type="success" icon="el-icon-plus" size="mini" @click="add" :disabled="$hasBP('bnt.sysRole.add')  === false">添 加</el-button>-->
      <el-button type="success" icon="el-icon-plus" size="mini" @click="add">添 加</el-button>
      <el-button type="danger" class="btn-add" size="mini" @click="batchRemove()" >批量删除</el-button>
    </div>
    <!-- 表格 -->
    <el-table
      v-loading="listLoading"
      :data="list"
      stripe
      border
      style="width: 100%;margin-top: 10px;"
      @selection-change="handleSelectionChange">
      <el-table-column type="selection"/>

      <el-table-column
        label="序号"
        width="70"
        align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>

      <el-table-column prop="username" label="申请人名称" width="100"/>
      <el-table-column prop="nickName" label="微信昵称" width="120"/>
      <el-table-column prop="phone" label="联系电话" width="120"/>
      <el-table-column prop="address" label="报修地址" />
      <el-table-column prop="equname" label="设备名称" width="80" />
      <el-table-column prop="equtype" label="设备类型" width="80"/>

      <el-table-column prop="image" label="设备图片" width="130" >
        <template  v-slot="scope">
<!--          <img  :src="scope.row.image" width="80" height="80"/>-->
          <el-image
            style="width: 100px; height: 100px"
            :src="scope.row.image"
            :preview-src-list="[scope.row.image]">
          </el-image>
        </template>
      </el-table-column>

      <el-table-column label="维修状态" width="80">
        <template slot-scope="scope">
          <div v-if="scope.row.status === 1">新报修</div>
          <div v-if="scope.row.status === 2">维修中</div>
          <div v-if="scope.row.status === 3">已完成</div>
        </template>
      </el-table-column>
      <el-table-column prop="description" label="故障描述" />

      <el-table-column prop="createTime" label="创建时间" width="160"/>
      <el-table-column label="操作" width="240" align="center">
        <template slot-scope="scope">
          <el-button type="primary" icon="el-icon-edit" size="mini" @click="edit(scope.row.id)" title="修改" />
          <el-button type="danger" icon="el-icon-delete" size="mini" @click="removeDataById(scope.row.id)" title="删除"/>
        </template>
      </el-table-column>
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

    <!--定义弹出层-->
    <el-dialog title="添加/修改" :visible.sync="dialogVisible" width="40%" >
      <el-form ref="dataForm" :model="repRecord" label-width="150px" size="small" style="padding-right: 40px;">
        <el-form-item label="申请人名称" >
          <el-input v-model="repRecord.username" />
        </el-form-item>
        <el-form-item label="联系方式">
          <el-input v-model="repRecord.phone"/>
        </el-form-item>
        <el-form-item label="报修地址">
          <el-input v-model="repRecord.address"/>
        </el-form-item>
        <el-form-item label="设备类型">
          <template slot-scope="scope">
            <el-select v-model="repRecord.equtype" placeholder="请选择">
              <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.value">
              </el-option>
            </el-select>
          </template>
        </el-form-item>
        <el-form-item label="设备名称">
          <el-input v-model="repRecord.equname"/>
        </el-form-item>
        <el-form-item label="设备图片" >
          <el-upload
            class="avatar-uploader"
            :action="server"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :headers="headers"
            :before-upload="beforeAvatarUpload"
           >
            <img  v-if="repRecord.image" :src="repRecord.image" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="维修状态">
          <template slot-scope="scope">
            <el-radio-group v-model="repRecord.status">
              <el-radio :label="1">新报修</el-radio>
              <el-radio :label="2">维修中</el-radio>
              <el-radio :label="3">已完成</el-radio>
            </el-radio-group>
          </template>
        </el-form-item>
        <el-form-item label="故障描述">
          <el-input v-model="repRecord.description"/>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false" size="small" icon="el-icon-refresh-right">取 消</el-button>
        <el-button type="primary" icon="el-icon-check" @click="saveOrUpdate()" size="small">确 定</el-button>
      </span>
    </el-dialog>


  </div>
</template>

<script>

// 引入定义接口的js文件
import api from '@/api/report/report'

export default {
  // 核心代码
  name: 'RepRecord',
  // components: { ImageDialog },

  data() {
    return {


      dialogVisible:false,
      form: {},



      imageUrl: '',// 图片上传地址
      listLoading:true, // 数据是否正在加载
      list: [], // 角色列表
      total: 0, // 总记录数
      page: 1, // 页码
      limit: 5, // 每页记录数
      searchObj: {}, // 查询条件


      repRecord: {},// 初始值
      saveBtnDisabled: false,

      multipleSelection: [],// 批量删除选中的记录列表
      options: [{
        value: '电脑',
        label: '电脑'
      }, {
        value: '投影仪',
        label: '投影仪'
      }, {
        value: '打印机',
        label: '打印机'
      }, {
        value: '显示器',
        label: '显示器'
      }, {
        value: '其他',
        label: '其他'
      }],
      value: '',
      // 文件上传操作
      // 二进制流文件上传
      server:'https://www.njmmxx.com:8800/file/upload',
      headers:{
        "token" : localStorage.getItem("token")
      },
    }
  },
  // 页面渲染之前加载
  created() {
    // 进入页面之前就加载数据
    this.fetchData()
  },
  methods: { // 具体方法


    // TODO 查询角色列表数据
    fetchData(pageNum=1) {
      this.page = pageNum
      // 调用api
      api.getPageList(this.page, this.limit, this.searchObj).then(response => {
        if (response != null){
          console.log(response)
          this.listLoading = false
          this.list = response.data.records
          this.total = response.data.total
        }
      })
    },
    // 重置表单
    resetData() {
      console.log('重置查询表单')
      this.searchObj = {}
      this.fetchData()
    },
    removeDataById(id){
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => { // promise
        // 点击确定，远程调用ajax
        api.removeById(id)
          .then(response => {
            this.fetchData(this.page)
            this.$message.success(response.message || '删除成功')
          })
      })
    },
    //弹出添加的表单
    add(){
      this.dialogVisible = true
      this.repRecord = {}
    },
    //添加或更新
    saveOrUpdate() {
      if (!this.repRecord.id) {
        this.save()
      } else {
        this.update()
      }
    },

    //添加
    save() {
      api.save(this.repRecord).then(response => {
        this.$message.success(response.message || '操作成功')
        this.dialogVisible = false
        this.fetchData(this.page)
      })
    },
    //编辑
    edit(id) {
      this.dialogVisible = true
      api.getById(id).then(response => {
        this.repRecord = response.data
      })
    },
    handleAvatarSuccess(res, file) {
      this.repRecord.image = res.data.url
      console.log(res.data)
      console.log(file)
      this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;
      const typeArr = ["image/png","image/jpeg","image/jpg"]
      if (!typeArr.includes(file.type)){
        this.$message.error("上传图片只支持jpg，png，jpeg格式")
        return false
      }
      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },

    //更新
    update() {
      api.updateById(this.repRecord).then(response => {
        this.$message.success(response.message || '操作成功')
        this.dialogVisible = false
        this.fetchData(this.page)
      })
    },
    // 当多选选项发生变化的时候调用
    handleSelectionChange(selection) {
      console.log(selection)
      this.multipleSelection = selection
    },
    // 批量删除
    batchRemove() {
      if (this.multipleSelection.length === 0) {
        this.$message.warning('请选择要删除的记录！')
        return
      }
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 点击确定，远程调用ajax
        // 遍历selection，将id取出放入id列表
        var idList = []
        this.multipleSelection.forEach(item => {
          idList.push(item.id)
        })
        // 调用api
        return api.batchRemove(idList)
      }).then((response) => {
        this.fetchData()
        this.$message.success(response.message)
      }).catch(error => {
        if (error === 'cancel') {
          this.$message.info('取消删除')
        }
      })
    },

  }
}
</script>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
.search-div {
  padding:10px;border: 1px solid #EBEEF5;border-radius:3px;
}
.tools-div {
  margin-top: 10px;padding:10px;border: 1px solid #EBEEF5;border-radius:3px;
}
</style>
