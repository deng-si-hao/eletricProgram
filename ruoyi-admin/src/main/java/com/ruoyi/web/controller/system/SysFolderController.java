package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.framework.hadoop.HadoopUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysFolder;
import com.ruoyi.system.service.ISysFolderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.annotation.Resource;

/**
 * 文件储存路径Controller
 * 
 * @author d
 * @date 2020-10-13
 */
@RestController
@RequestMapping("/system/folder")
public class SysFolderController extends BaseController
{
    @Autowired
    private ISysFolderService sysFolderService;

    @Resource
    private HadoopUtils hadoopUtils;

    /**
     * 查询文件储存路径列表
     */
    @PreAuthorize("@ss.hasPermi('system:folder:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysFolder sysFolder)
    {
        startPage();
        List<SysFolder> list = sysFolderService.selectSysFolderList(sysFolder);
        return getDataTable(list);
    }

    /**
     * 导出文件储存路径列表
     */
    @PreAuthorize("@ss.hasPermi('system:folder:export')")
    @Log(title = "文件储存路径", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysFolder sysFolder)
    {
        List<SysFolder> list = sysFolderService.selectSysFolderList(sysFolder);
        ExcelUtil<SysFolder> util = new ExcelUtil<SysFolder>(SysFolder.class);
        return util.exportExcel(list, "folder");
    }

    /**
     * 获取文件储存路径详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:folder:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysFolderService.selectSysFolderById(id));
    }

    /**
     * 新增文件储存路径
     */
    @PreAuthorize("@ss.hasPermi('system:folder:add')")
    @Log(title = "文件储存路径", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysFolder sysFolder)
    {
        String suffixPath = String.format("/%s/%s",sysFolder.getAssetId(),sysFolder.getName());
        try {
            hadoopUtils.mkdir(suffixPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toAjax(sysFolderService.insertSysFolder(sysFolder));
    }

    /**
     * 修改文件储存路径
     */
    @PreAuthorize("@ss.hasPermi('system:folder:edit')")
    @Log(title = "文件储存路径", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysFolder sysFolder)
    {
        return toAjax(sysFolderService.updateSysFolder(sysFolder));
    }

    /**
     * 删除文件储存路径
     */
    @PreAuthorize("@ss.hasPermi('system:folder:remove')")
    @Log(title = "文件储存路径", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        for(Long id:ids){
            SysFolder sysFolder = sysFolderService.selectSysFolderById(id);
            String suffixPath = String.format("/%S/%s",sysFolder.getAssetId(),sysFolder.getName());
            try {
                hadoopUtils.delFile(suffixPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return toAjax(sysFolderService.deleteSysFolderByIds(ids));
    }
}
