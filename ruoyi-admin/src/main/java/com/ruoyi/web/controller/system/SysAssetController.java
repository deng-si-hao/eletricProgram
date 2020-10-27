package com.ruoyi.web.controller.system;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.framework.hadoop.HadoopUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.sun.java.accessibility.util.EventID;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysAsset;
import com.ruoyi.system.service.ISysAssetService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * 车辆信息Controller
 * 
 * @author d
 * @date 2020-10-13
 */
@RestController
@RequestMapping("/system/asset")
public class SysAssetController extends BaseController
{
    @Autowired
    private ISysAssetService sysAssetService;

    @Resource
    private HadoopUtils hadoopUtils;

    @Autowired
    private TokenService tokenService;


    /**
     * 查询车辆信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:asset:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysAsset sysAsset)
    {
        startPage();
        LoginUser loginUser = SpringUtils.getBean(TokenService.class).getLoginUser(ServletUtils.getRequest());
        SysUser currentUser = loginUser.getUser();
        if(!currentUser.isAdmin()){
            if(sysAsset.getUnit() == null){
                sysAsset.setUnit(currentUser.getDept().getDeptName());
            }
        }
        List<SysAsset> list = sysAssetService.selectSysAssetList(sysAsset);
        return getDataTable(list);
    }

    /**
     * 导出车辆信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:asset:export')")
    @Log(title = "车辆信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysAsset sysAsset)
    {
        List<SysAsset> list = sysAssetService.selectSysAssetList(sysAsset);
        ExcelUtil<SysAsset> util = new ExcelUtil<SysAsset>(SysAsset.class);
        return util.exportExcel(list, "asset");
    }

    /**
     * 获取车辆信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:asset:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysAssetService.selectSysAssetById(id));
    }

    /**
     * 新增车辆信息
     */
    @PreAuthorize("@ss.hasPermi('system:asset:add')")
    @Log(title = "车辆信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysAsset sysAsset)
    {
        if(sysAsset.getId() == null){
            sysAsset.setId(IdUtils.getNewId());
        }
        String addPath=String.format("/%s",sysAsset.getId());
        try {
//            hadoopUtils.mkdir(addPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toAjax(sysAssetService.insertSysAsset(sysAsset));
    }

    /**
     * 修改车辆信息
     */
    @PreAuthorize("@ss.hasPermi('system:asset:edit')")
    @Log(title = "车辆信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysAsset sysAsset)
    {
        return toAjax(sysAssetService.updateSysAsset(sysAsset));
    }

    /**
     * 删除车辆信息
     */
    @PreAuthorize("@ss.hasPermi('system:asset:remove')")
    @Log(title = "车辆信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysAssetService.deleteSysAssetByIds(ids));
    }

    /**
    * 下发车辆信息
    *
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:asset:issue')")
    @Log(title = "车辆信息",businessType = BusinessType.OTHER)
    @PostMapping("/issue")
    public AjaxResult issue(@RequestParam("rowId") Long id,@RequestParam("deptName") String deptName,
                            @RequestParam("unitId")Long unitId){
        SysAsset sysAsset = sysAssetService.selectSysAssetById(id);
        if(sysAsset.getUnit() != null){
            return new AjaxResult(400,"已下发，请勿重复操作");
        }
        sysAsset.setUnit(deptName);
        sysAsset.setTenantId(unitId);
        return toAjax(sysAssetService.updateSysAsset(sysAsset));
    }

    @GetMapping("/importTemplate")
    public AjaxResult importTemplate()
    {
        ExcelUtil<SysAsset> util = new ExcelUtil<SysAsset>(SysAsset.class);
        return util.importTemplateExcel("用户数据");
    }

    @Log(title = "车辆信息", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('system:asset:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<SysAsset> util = new ExcelUtil<SysAsset>(SysAsset.class);
        List<SysAsset> assetList = util.importExcel(file.getInputStream());
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        String operName = loginUser.getUsername();
        String message = sysAssetService.importData(assetList, updateSupport, operName);
        return AjaxResult.success(message);
    }
}
