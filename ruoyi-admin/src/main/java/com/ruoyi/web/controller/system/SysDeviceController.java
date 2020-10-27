package com.ruoyi.web.controller.system;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.TimeUnit;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ExcelResolve;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.framework.influxdb.InfluxDbUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.SysAsset;
import com.ruoyi.system.service.ISysAssetService;
import org.influxdb.InfluxDB;
import org.influxdb.dto.BatchPoints;
import org.influxdb.dto.Point;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysDevice;
import com.ruoyi.system.service.ISysDeviceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * 数据采集通道Controller
 * 
 * @author d
 * @date 2020-10-13
 */
@RestController
@RequestMapping("/system/device")
public class SysDeviceController extends BaseController
{
    @Autowired
    private ISysDeviceService sysDeviceService;

    @Resource
    private ISysAssetService sysAssetService;

    @Resource
    private InfluxDB influxDB;

    @Resource
    private InfluxDbUtils influxDbUtils;

    @Value("${spring.influx.database}")
    private String database;

    /**
     * 查询数据采集通道列表
     */
    @PreAuthorize("@ss.hasPermi('system:device:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysDevice sysDevice)
    {
        startPage();
        LoginUser loginUser = SpringUtils.getBean(TokenService.class).getLoginUser(ServletUtils.getRequest());
        SysUser currentUser = loginUser.getUser();
        if(!currentUser.isAdmin()){
            if(sysDevice.getUnit() == null){
                sysDevice.setUnit(currentUser.getDept().getDeptName());
            }
        }
        List<SysDevice> list = sysDeviceService.selectSysDeviceList(sysDevice);
        return getDataTable(list);
    }

    /**
     * 导出数据采集通道列表
     */
    @PreAuthorize("@ss.hasPermi('system:device:export')")
    @Log(title = "数据采集通道", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysDevice sysDevice)
    {
        List<SysDevice> list = sysDeviceService.selectSysDeviceList(sysDevice);
        ExcelUtil<SysDevice> util = new ExcelUtil<SysDevice>(SysDevice.class);
        return util.exportExcel(list, "device");
    }

    /**
     * 获取数据采集通道详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:device:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysDeviceService.selectSysDeviceById(id));
    }

    /**
    * 从influxDb中获取信息
    *
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:device:detail')")
    @GetMapping
    public AjaxResult getDetail(@RequestParam("keys")String[] keys, @RequestParam("measurement")String measurement,
            /*@RequestParam("startDate")*/Date startDate,/*@RequestParam("endDate")*/Date endDate,
                                @RequestParam("page") Integer page){
        int pageSize = 10;
        String pageQuery = " LIMIT " + pageSize + " OFFSET " + (page - 1) * pageSize;
        String param = null;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" select ");
        if(keys != null){
            for(int i=0;i<keys.length;i++){
                if (keys.length<=1){
                    param="\""+keys[0]+"\"::field";
                    stringBuilder.append(param);
                    break;
                }
                param = "\""+keys[i]+"\"::field,";
                if(i==keys.length-1){
                    param=param.substring(0,param.length()-1);
                }
                stringBuilder.append(param);
            }
        }else {
            stringBuilder.append(" * ");
        }
        stringBuilder.append(" from ").append(measurement);
        if(startDate != null){
            stringBuilder.append(" where time >= '").append(startDate).append("'");
        }
        if (startDate != null && endDate != null){
            stringBuilder.append(" and time < '").append(endDate).append("'");
        }
        if(startDate ==null && endDate != null){
            stringBuilder.append("where time < '").append(endDate).append("'");
        }
        stringBuilder.append(" order by time desc").append(pageQuery);
        System.out.println(stringBuilder.toString());
        List<Object> result = influxDbUtils.fetchRecords(stringBuilder.toString());
        return AjaxResult.success(result);
    }


    /**
     * 新增数据采集通道
     */
    @PreAuthorize("@ss.hasPermi('system:device:add')")
    @Log(title = "数据采集通道", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestParam("name") String name,@RequestParam("type") String type,
                          @RequestParam("additionalInfo") String additionalInfo,
                          @RequestParam("assetId") Long assetId,@RequestParam("file") MultipartFile file)
    {
        if(file != null){
            String filename=file.getOriginalFilename();
            if(!filename.endsWith(".xlsx") && !filename.endsWith(".xls")){
                return AjaxResult.error("上传数据格式错误，请选择.xls(.xlsx)文件");
            }
            String tablename = null;
            if (filename.endsWith(".xlsx")) {
                tablename = filename.split(".xlsx")[0];
            }else {
                tablename = filename.split(".xls")[0];
            }
            HashMap<String, ArrayList<String[]>> exclData = null;
            try {
                exclData = ExcelResolve.analysisFile(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            ArrayList<String[]> result = new ArrayList<>();
            result=exclData.get("OK");
            Map<String,Object> records=new HashMap<>();
            Point point = null;
            String[] title=null;
            BatchPoints batchPoints = BatchPoints
                    .database(database)
                    .consistency(InfluxDB.ConsistencyLevel.ALL)
                    .build();
            for(int i=0;i<3;i++){
                Point.Builder builder = Point.measurement(assetId.toString());
                String [] content = result.get(i);
                if(i<=1){
                    title=result.get(0);
                    continue;
                }
                for(int j=0;j<content.length;j++){
                    records.put(title[j],content[j]);
                }
                point= builder.time(Long.parseLong(records.get("TIMESTAMP").toString()), TimeUnit.MILLISECONDS)
                        .fields(records).build();
                batchPoints.point(point);
                records.clear();
            }
            influxDB.write(batchPoints);
        }
        return toAjax(sysDeviceService.insertSysDevice(new SysDevice(IdUtils.getNewId(),name,type,additionalInfo,assetId,null)));
//    return toAjax(0);
    }


    /**
     * 修改数据采集通道
     */
    @PreAuthorize("@ss.hasPermi('system:device:edit')")
    @Log(title = "数据采集通道", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysDevice sysDevice)
    {
        return toAjax(sysDeviceService.updateSysDevice(sysDevice));
    }

    /**
     * 删除数据采集通道
     */
    @PreAuthorize("@ss.hasPermi('system:device:remove')")
    @Log(title = "数据采集通道", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {

        return toAjax(sysDeviceService.deleteSysDeviceByIds(ids));
    }

    /**
    * 采集数据下发
    * */
    @PreAuthorize("@ss.hasAnyPermi('system:device:issue')")
    @Log(title = "数据采集通道",businessType = BusinessType.OTHER)
    @PostMapping("/issue")
    public AjaxResult issue(@RequestParam("id") Long id,@RequestParam("assetId") Long assetId){
        SysAsset sysAsset = sysAssetService.selectSysAssetById(assetId);
        SysDevice sysDevice = sysDeviceService.selectSysDeviceById(id);
        if(sysAsset == null){
            return new AjaxResult(404,"对应车辆不存在，请先添加车辆");
        }
        if(sysDevice.getUnit() != null){
            return new AjaxResult(400,"已下发，请勿重复操作");
        }
        sysDevice.setUnit(sysAsset.getUnit());
        return toAjax(sysDeviceService.updateSysDevice(sysDevice));
//        return toAjax(0);
    }

}
