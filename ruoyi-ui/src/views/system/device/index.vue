<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="采集通道名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入采集通道名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="数据类型" prop="type">-->
<!--        <el-select v-model="queryParams.type" placeholder="请选择数据类型" clearable size="small">-->
<!--          <el-option label="请选择字典生成" value="" />-->
<!--        </el-select>-->
<!--      </el-form-item>-->
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
          v-hasPermi="['system:device:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:device:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:device:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:device:export']"
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

    <el-table v-loading="loading" :data="deviceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="主键" align="center" prop="id" />-->
      <el-table-column label="采集通道名称" align="center" prop="name" />
      <el-table-column label="数据类型" align="center" prop="type" />
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
            v-hasPermi="['system:device:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:device:remove']"
          >删除</el-button>
          <template>
            <el-button  size="mini"
                        type="text"
                        icon="el-icon-share"
                        v-hasPermi="['system:device:issue']"
                        @click="openIssue(scope.row)"
                        v-if="scope.row.unit === null"
            >下发</el-button>
          </template>
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

    <!-- 添加或修改数据采集通道对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="数据名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入采集通道名称" />
        </el-form-item>
        <el-form-item label="数据类型">
          <el-select v-model="form.type" placeholder="请选择数据类型">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="additionalInfo">
          <el-input v-model="form.additionalInfo" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="车辆id" prop="assetId">
          <el-input v-model="form.assetId" style="width: 60%" disabled placeholder="请输入所属车辆id" />&nbsp;
          <el-button @click="dialogTableVisible = true" size="small" type="primary">选择</el-button>
        </el-form-item>
        <el-form-item label="所属单位" prop="unit">
          <el-input v-model="form.unit" disabled="disabled" placeholder="下发时自动填入" />
        </el-form-item>
        <el-form-item>
          <el-upload class="upload" action :http-request="dataUpload">
               <el-button type="primary" size="small" class="choose">上传数据</el-button>
             </el-upload>
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
import { listDevice, getDevice, delDevice, addDevice, updateDevice, exportDevice,issue,listAsset } from "@/api/system/device";

export default {
  name: "Device",
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

      //文件参数
      file:null,
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
      // 数据采集通道表格数据
      deviceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        type: null,
        additionalInfo: null,
        assetId: null,
        unit: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "采集通道名称不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "数据类型不能为空", trigger: "blur" }
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

    //上传文件
    dataUpload(params) {
      console.log(params)
      this.file = params.file
      this.form.name = params.file.name
    },
    /** 查询数据采集通道列表 */
    getList() {
      this.loading = true;
      listDevice(this.queryParams).then(response => {
        this.deviceList = response.rows;
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
        type: null,
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
      this.title = "添加数据采集通道";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDevice(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改数据采集通道";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDevice(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            const formData = new FormData()
            formData.append('name', this.form.name)
            formData.append('type', this.form.type)
            formData.append('additionalInfo', this.form.additionalInfo)
            formData.append('assetId', this.form.assetId)
            formData.append('file', this.file)
            addDevice(formData).then(response => {
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
      this.$confirm('是否确认删除数据采集通道编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delDevice(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有数据采集通道数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportDevice(queryParams);
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
