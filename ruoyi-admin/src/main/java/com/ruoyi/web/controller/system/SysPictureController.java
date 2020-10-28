package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.hadoop.HadoopUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.SysAsset;
import com.ruoyi.system.domain.SysDevice;
import com.ruoyi.system.service.ISysAssetService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysPicture;
import com.ruoyi.system.service.ISysPictureService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * 图片存储Controller
 * 
 * @author d
 * @date 2020-10-13
 */
@RestController
@RequestMapping("/system/picture")
public class SysPictureController extends BaseController
{
    @Autowired
    private ISysPictureService sysPictureService;

    @Resource
    private ISysAssetService sysAssetService;

    @Resource
    private HadoopUtils hadoopUtils;

    /**
     * 查询图片存储列表
     */
    @PreAuthorize("@ss.hasPermi('system:picture:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPicture sysPicture)
    {
        startPage();
        LoginUser loginUser = SpringUtils.getBean(TokenService.class).getLoginUser(ServletUtils.getRequest());
        SysUser currentUser = loginUser.getUser();
        if(!currentUser.isAdmin()){
            if(sysPicture.getUnit() == null){
                sysPicture.setUnit(currentUser.getDept().getDeptName());
            }
        }
        List<SysPicture> list = sysPictureService.selectSysPictureList(sysPicture);
        return getDataTable(list);
    }

    /**
     * 导出图片存储列表
     */
    @PreAuthorize("@ss.hasPermi('system:picture:export')")
    @Log(title = "图片存储", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysPicture sysPicture)
    {
        List<SysPicture> list = sysPictureService.selectSysPictureList(sysPicture);
        ExcelUtil<SysPicture> util = new ExcelUtil<SysPicture>(SysPicture.class);
        return util.exportExcel(list, "picture");
    }

    /**
     * 获取图片存储详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:picture:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysPictureService.selectSysPictureById(id));
    }

    /**
     * 新增图片存储
     */
    @PreAuthorize("@ss.hasPermi('system:picture:add')")
    @Log(title = "图片存储", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestParam("name") String name,@RequestParam("picturePath") String picturePath,
                          @RequestParam("time")Date time,@RequestParam("additionalInfo")String additionalInfo,
                          @RequestParam("assetId")Long assetId,@RequestParam("files")List<MultipartFile> files)
    {
        String suffixPath = String.format("/%s/%s",assetId,picturePath);
        int rows = 0;
        try {
        if(files != null && files.size()>0) {
            for (int i = 0; i < files.size(); i++) {
                hadoopUtils.createFile(suffixPath, files.get(i));
            }
        }
        SysPicture sysPicture = new SysPicture();
        sysPicture.setName(name);
        sysPicture.setPicturePath(picturePath);
        sysPicture.setTime(time);
        sysPicture.setAdditionalInfo(additionalInfo);
        sysPicture.setAssetId(assetId);
        rows = sysPictureService.insertSysPicture(sysPicture);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toAjax(rows);
    }

    /**
     * 修改图片存储
     */
    @PreAuthorize("@ss.hasPermi('system:picture:edit')")
    @Log(title = "图片存储", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysPicture sysPicture)
    {
        return toAjax(sysPictureService.updateSysPicture(sysPicture));
    }

    /**
     * 删除图片存储
     */
    @PreAuthorize("@ss.hasPermi('system:picture:remove')")
    @Log(title = "图片存储", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        for(Long id:ids){
            SysPicture sysPicture = sysPictureService.selectSysPictureById(id);
            String suffixPath = String.format("/%s/%s/%s",sysPicture.getAssetId(),
                    sysPicture.getPicturePath(),sysPicture.getPictureFolderId());
            try {
                hadoopUtils.delFile(suffixPath);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return toAjax(sysPictureService.deleteSysPictureByIds(ids));
    }
    /**
     * 图片存储下发
     * */
    @PreAuthorize("@ss.hasAnyPermi('system:picture:issue')")
    @Log(title = "图片存储",businessType = BusinessType.OTHER)
    @PostMapping("/issue")
    public AjaxResult issue(@RequestParam("id") Long id, @RequestParam("assetId") Long assetId){
        SysAsset sysAsset = sysAssetService.selectSysAssetById(assetId);
        SysPicture sysPicture = sysPictureService.selectSysPictureById(id);
        if(sysAsset == null){
            return new AjaxResult(405,"对应车辆不存在，请先添加车辆");
        }
        if(sysPicture.getUnit() != null){
            return new AjaxResult(400,"已下发，请勿重复操作");
        }
        sysPicture.setUnit(sysAsset.getUnit());
        return toAjax(sysPictureService.updateSysPicture(sysPicture));
    }

    /**
    * 图片预览
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:picture:preview')")
    @Log(title = "图片预览",businessType = BusinessType.OTHER)
    @PostMapping("/preview")
    public AjaxResult readPic(@RequestParam("assetId")Long assetId,@RequestParam("path") String path){
        List<Map<String,String>> res = new ArrayList<>();
        StringBuffer[] buffers = new StringBuffer[20];
        List<String> filenameList = new ArrayList<>();
        String filepath = String.format("/%s/%s",assetId,path);
        try {
            res = hadoopUtils.listFile(filepath);
            for(Map<String,String> maps:res){
                filenameList.add(maps.get("filePath"));
            }
            if(filenameList.size()>0){
                for(int i=0;i<filenameList.size();i++){
                    buffers[i] = new StringBuffer();
                    buffers[i].append(hadoopUtils.readFile(filenameList.get(i)));
                }
            }
            return AjaxResult.success(buffers);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toAjax(0);
    }
}
