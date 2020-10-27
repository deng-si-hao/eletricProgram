<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="图片名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入图片名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="图片所属文件夹id" prop="pictureFolderId">-->
<!--        <el-input-->
<!--          v-model="queryParams.pictureFolderId"-->
<!--          placeholder="请输入图片所属文件夹id"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="图片所属文件夹路径" prop="picturePath">-->
<!--        <el-input-->
<!--          v-model="queryParams.picturePath"-->
<!--          placeholder="请输入图片所属文件夹路径"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="上传时间" prop="time">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.time"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择上传时间">
        </el-date-picker>
      </el-form-item>
<!--      <el-form-item label="备注" prop="additionalInfo">-->
<!--        <el-input-->
<!--          v-model="queryParams.additionalInfo"-->
<!--          placeholder="请输入备注"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="所属车辆id" prop="assetId">
        <el-input
          v-model="queryParams.assetId"
          placeholder="请输入所属车辆id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属单位" prop="unit">
        <el-input
          v-model="queryParams.unit"
          placeholder="请输入所属单位"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:picture:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:picture:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:picture:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:picture:export']"
        >导出</el-button>
      </el-col>
      <div class="top-right-btn">
        <el-tooltip class="item" effect="dark" content="刷新" placement="top">
          <el-button size="mini" circle icon="el-icon-refresh" @click="handleQuery" />
        </el-tooltip>
        <el-tooltip class="item" effect="dark" :content="showSearch ? '隐藏搜索' : '显示搜索'" placement="top">
          <el-button size="mini" circle icon="el-icon-search" @click="showSearch=!showSearch" />
        </el-tooltip>
      </div>
    </el-row>

    <el-table v-loading="loading" :data="pictureList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="图片名称" align="center" prop="name" />
<!--      <el-table-column label="图片所属文件夹id" align="center" prop="pictureFolderId" />-->
      <el-table-column label="图片文件路径" align="center" prop="picturePath" />
      <el-table-column label="上传时间" align="center" prop="time" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.time, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="additionalInfo" />
      <el-table-column label="所属车辆id" align="center" prop="assetId" />
      <el-table-column label="所属单位" align="center" prop="unit" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:picture:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:picture:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-share"
            @click="openIssue(scope.row)"
            v-hasPermi="['system:picture:issue']"
            v-if="scope.row.unit === null"
          >下发</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改图片存储对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="图片文件名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入图片名称" />
        </el-form-item>
<!--        <el-form-item label="图片所属文件夹id" prop="pictureFolderId">-->
<!--          <el-input v-model="form.pictureFolderId" placeholder="请输入图片所属文件夹id" />-->
<!--        </el-form-item>-->
        <el-form-item label="图片路径" prop="picturePath">
          <el-input v-model="form.picturePath" placeholder="请输入图片所属文件夹路径" />
        </el-form-item>
        <el-form-item label="上传时间" prop="time">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.time"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择上传时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="additionalInfo">
          <el-input v-model="form.additionalInfo" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="车辆id" prop="assetId">
          <el-input v-model="form.assetId" style="width: 80%;" disabled placeholder="请输入所属车辆id" />&nbsp;
          <el-button @click="dialogTableVisible = true" size="small" type="primary">选择</el-button>
        </el-form-item>
        <el-form-item label="所属单位" prop="unit">
          <el-input v-model="form.unit" disabled="disabled" placeholder="下发时自动填入" />
        </el-form-item>

        <el-form-item>
          <el-upload
            :multiple="multiple"
            :headers="myHeaders"
            action
            list-type="picture-card"
            :auto-upload="false"
            :http-request="uploadFile"
            ref="upload"
            :on-preview="handlePictureCardPreview"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt="">
          </el-dialog>
        </el-form-item>




      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--车辆id选择器-->
    <el-dialog title="选择车辆" :visible.sync="dialogTableVisible" custom-class="role-mask">
      <!-- 表单 -->
      <el-form :model="queryParamList" ref="queryFormAsset" :inline="true" v-show="showSearchd" label-width="68px">
        <el-form-item label="车辆名称" prop="name">
          <el-input
            v-model="queryParamList.name"
            placeholder="请输入车辆名称"
            clearable
            size="small"
            @keyup.enter.native="handleQueryAsset"
          />
        </el-form-item>
        <el-form-item label="所属单位" prop="unit">
          <el-input
            v-model="queryParamList.unit"
            placeholder="请输入所属单位"
            clearable
            size="small"
            @keyup.enter.native="handleQueryAsset"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQueryAsset">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQueryAsset">重置</el-button>
        </el-form-item>
      </el-form>
      <div class="top-right-btn">
        <el-tooltip class="item" effect="dark" :content="showSearchd ? '隐藏搜索' : '显示搜索'" placement="top">
          <el-button size="mini" circle icon="el-icon-search" @click="showSearchd=!showSearchd" />
        </el-tooltip>
      </div>
      <!-- 表格 -->
      <!-- 表格 height="390"  固定高度-->
      <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        style="width: 100%"
        height="390"
        class="single-select-table"
        @selection-change="handleSelectionChanges"
      >
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column prop="name" label="车辆名称" width="120"></el-table-column>
        <el-table-column prop="type" label="车辆类别" width="120"></el-table-column>
        <el-table-column prop="id" label="车辆id" width="150"></el-table-column>
        <el-table-column prop="unit" label="所属单位" show-overflow-tooltip></el-table-column>
      </el-table>
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParamList.pageNum"
        :limit.sync="queryParamList.pageSize"
        @pagination="getList"
      />
      <!-- 底部按钮 -->
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogTableVisible = false">取 消</el-button>
        <el-button type="primary" @click="handlerOk">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPicture, getPicture, delPicture, addPicture, updatePicture, exportPicture,issue,listAsset } from "@/api/system/picture";

export default {
  name: "Picture",
  data() {
    return {
      tableData:[],
      multipleSelection: [],
      dialogTableVisible: false,
      //对话框查询参数
      queryParamList: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        unit: null,
      },
      //显示对话框搜索条件
      showSearchd:false,

      formDate:"",
      dialogVisible: false,
      dialogImageUrl: '',

      //文件数组
      fileDate:[],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 图片存储表格数据
      pictureList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        pictureFolderId: null,
        picturePath: null,
        time: null,
        additionalInfo: null,
        assetId: null,
        unit: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "图片名称不能为空", trigger: "blur" }
        ],
        picturePath: [
          { required: true, message: "图片所属文件夹路径不能为空", trigger: "blur" }
        ],
        assetId: [
          { required: true, message: "所属车辆id不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getListAsset();
  },
  methods: {

    //对话框
    handleSelectionChanges(val) {
      // 单选
      if (val.length > 1) {
        this.$nextTick(()=>{
          this.$refs.multipleTable.clearSelection()
          this.$refs.multipleTable.toggleRowSelection(val.pop())
        })
      }
      this.multipleSelection = val;
    },

    handlerOk() {
      console.log(this.multipleSelection);
      this.multipleSelection.map((item) =>{
        this.form.assetId = item.id
      })
      // console.log("点击的是确定按钮");
      this.dialogTableVisible = false;
    },


    //下发按钮
    openIssue(row) {
      const data = new FormData();
      data.append('id',row.id)
      data.append('assetId',row.assetId)
      this.$confirm('此操作将下发该文件, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function () {
        return issue(data);
      }).then(() => {
        this.getList();
        this.msgSuccess("下发成功")
      }).catch(function () {});
    },

    uploadFile(file){
      this.fileDate.append('files', file.file);
    },
    /** 查询图片存储列表 */
    getList() {
      this.loading = true;
      listPicture(this.queryParams).then(response => {
        this.pictureList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询对话框数据列表 */
    getListAsset(){
      this.loading = true;
      listAsset(this.queryParamList).then(response =>{
        this.tableData = response.rows;
        this.total = response.total;
        this.loading = false;
      });

    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        pictureFolderId: null,
        picturePath: null,
        time: null,
        additionalInfo: null,
        assetId: null,
        unit: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },

    /** 对话框搜索按钮操作 */
    handleQueryAsset(){
      this.queryParamList.pageNum = 1;
      this.getListAsset();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },

    /** 对话框重置按钮操作 */
    resetQueryAsset(){
      this.resetForm("queryFormAsset");
      this.handleQueryAsset();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加图片存储";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPicture(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改图片存储";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePicture(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            this.fileDate = new FormData()
            this.fileDate.append('name',this.form.name)
            this.fileDate.append('picturePath',this.form.picturePath)
            this.fileDate.append('time',this.form.time)
            this.fileDate.append('additionalInfo',this.form.additionalInfo)
            this.fileDate.append('assetId',this.form.assetId)
            this.$refs.upload.submit();
            addPicture(this.fileDate).then(response => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除图片存储编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delPicture(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有图片存储数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportPicture(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
<style>
  .single-select-table thead .el-table-column--selection .cell{
    display: none;
  }
</style>
