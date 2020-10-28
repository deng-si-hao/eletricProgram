package com.ruoyi.web.controller.system;

import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.framework.hadoop.HadoopUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.SysAsset;
import com.ruoyi.system.domain.SysPicture;
import com.ruoyi.system.service.ISysAssetService;
import org.apache.zookeeper.data.Id;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysReport;
import com.ruoyi.system.service.ISysReportService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * 文档存储Controller
 * 
 * @author d
 * @date 2020-10-13
 */
@RestController
@RequestMapping("/system/report")
public class SysReportController extends BaseController
{
    @Autowired
    private ISysReportService sysReportService;

    @Resource
    private ISysAssetService sysAssetService;

    @Resource
    private HadoopUtils hadoopUtils;

    //服务器用户地址，如果是root用户则不需要
    private static final String BASEDIR = "user/dengsihao";

    /**
     * 查询文档存储列表
     */
    @PreAuthorize("@ss.hasPermi('system:report:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysReport sysReport)
    {
        startPage();
        LoginUser loginUser = SpringUtils.getBean(TokenService.class).getLoginUser(ServletUtils.getRequest());
        SysUser currentUser = loginUser.getUser();
        if(!currentUser.isAdmin()){
            if(sysReport.getUnit() == null){
                sysReport.setUnit(currentUser.getDept().getDeptName());
            }
        }
        List<SysReport> list = sysReportService.selectSysReportList(sysReport);
        return getDataTable(list);
    }



    /**
     * 获取文档存储详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:report:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysReportService.selectSysReportById(id));
    }

    /**
     * 新增文档存储
     */
    @PreAuthorize("@ss.hasPermi('system:report:add')")
    @Log(title = "文档存储", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestParam("name") String name, @RequestParam("reportPath") String reportPath,
                          @RequestParam("time") Date time, @RequestParam("additionalInfo") String additionalInfo,
                          @RequestParam("assetId") Long assetId, @RequestParam("files") List<MultipartFile> files)
    {
        String suffixPath = String.format("/%s/%s/%s",BASEDIR,assetId,reportPath);
        for(int i=0;i<files.size();i++){
            try {
                System.out.println("存储位置：》》》》》》"+suffixPath);
                System.out.println(">>>>>>>>>>"+files.get(i).getOriginalFilename()+"<<<<<<<<<<");
                hadoopUtils.createFile(suffixPath, files.get(i));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        SysReport sysReport = new SysReport();
        sysReport.setId(IdUtils.getNewId());
        sysReport.setName(name);
        sysReport.setReportPath(reportPath);
        sysReport.setAdditionalInfo(additionalInfo);
        sysReport.setAssetId(assetId);
        sysReport.setTime(time);
        return toAjax(sysReportService.insertSysReport(sysReport));
//        return toAjax(0);
    }

    /**
     * 修改文档存储
     */
    @PreAuthorize("@ss.hasPermi('system:report:edit')")
    @Log(title = "文档存储", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysReport sysReport)
    {
        return toAjax(sysReportService.updateSysReport(sysReport));
    }

    /**
     * 删除文档存储
     */
    @PreAuthorize("@ss.hasPermi('system:report:remove')")
    @Log(title = "文档存储", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        for(Long id:ids){
            SysReport sysReport = sysReportService.selectSysReportById(id);
            String suffixPath = String.format("/%s/%s/%s",BASEDIR,sysReport.getAssetId(),sysReport.getReportPath());
            try {
                hadoopUtils.delFile(suffixPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return toAjax(sysReportService.deleteSysReportByIds(ids));
    }

    /**
    * 下载文件
    *
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:report:download')")
    @Log(title = "文档存储", businessType = BusinessType.OTHER)
    @RequestMapping("/downloadFile")
    public void downloadFile(@RequestParam("name")String name,@RequestParam("reportPath")String reportPath, HttpServletResponse response){
        try {
            response.setContentType("application/octet-stream; charset=utf-8");
            response.addHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(name, "UTF-8"));
            hadoopUtils.copyFileAsStream(reportPath, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 导出文档存储列表
     */
    @PreAuthorize("@ss.hasPermi('system:report:export')")
    @Log(title = "文档存储", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysReport sysReport)
    {
        List<SysReport> list = sysReportService.selectSysReportList(sysReport);
        ExcelUtil<SysReport> util = new ExcelUtil<SysReport>(SysReport.class);
        return util.exportExcel(list, "report");
    }
    /**
     * 文档存储下发
     * */
    @PreAuthorize("@ss.hasAnyPermi('system:report:issue')")
    @Log(title = "文档存储",businessType = BusinessType.OTHER)
    @PostMapping("/issue")
    public AjaxResult issue(@RequestParam("id") Long id, @RequestParam("assetId") Long assetId){
        SysAsset sysAsset = sysAssetService.selectSysAssetById(assetId);
        SysReport sysReport = sysReportService.selectSysReportById(id);
        if(sysAsset == null){
            return new AjaxResult(404,"对应车辆不存在，请先添加车辆");
        }
        if(sysReport.getUnit() != null){
            return new AjaxResult(400,"已下发，请勿重复操作");
        }
        sysReport.setUnit(sysAsset.getUnit());
        return toAjax(sysReportService.updateSysReport(sysReport));
    }

    /**
    * 从hadoop获取文件列表
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:report:detail')")
    @Log(title = "文档存储",businessType = BusinessType.OTHER)
    @PostMapping("/detail")
    public AjaxResult listDetail(@RequestParam("reportPath") String path){
        try {
            List<Map<String,String>> res = hadoopUtils.listFile(path);
            return AjaxResult.success(res);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("操作失败");
        }
    }

    /**
    * 仅删除hadoop中的文件
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:report:detailDel')")
    @Log(title = "文档存储",businessType = BusinessType.OTHER)
    @RequestMapping("/delDetailFile")
    public AjaxResult delDetailFile(@RequestParam("path") String path){
        try {
            hadoopUtils.delFile(path);
            return AjaxResult.success("删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("删除失败");
        }
    }

    /**
    * 读取Hadoop中文件内容
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:report:preview')")
    @Log(title = "文档预览",businessType = BusinessType.OTHER)
    @RequestMapping("/preview")
    public AjaxResult readFile(@RequestParam("path") String path){
        try {
            StringBuffer stringBuffer = hadoopUtils.readFile(path);
            return AjaxResult.success(stringBuffer);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("操作失败");
        }
    }

}
