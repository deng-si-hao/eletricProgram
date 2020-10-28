package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysChannel;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.influxdb.InfluxDbUtils;
import com.ruoyi.system.service.ISysChannelService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 采集通道Controller
 *
 * @author ruoyi
 * @date 2020-10-19
 */
@RestController
@RequestMapping("/system/channel")
public class SysChannelController extends BaseController
{
    @Autowired
    private ISysChannelService sysChannelService;

    @Resource
    private InfluxDbUtils influxDbDao;
    /**
     * 查询采集通道列表
     */
    @PreAuthorize("@ss.hasPermi('system:channel:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysChannel sysChannel)
    {
        startPage();
        List<SysChannel> list = sysChannelService.selectSysChannelList(sysChannel);

        return getDataTable(list);
    }

    /**
     * 查询采集通道列表
     */
    @PreAuthorize("@ss.hasPermi('system:channel:list')")
    @GetMapping("/treelist")
    public AjaxResult treeList(SysChannel sysChannel)
    {
        startPage();
        List<SysChannel> list = sysChannelService.selectSysChannelList(sysChannel);
        return AjaxResult.success(sysChannelService.buildChTreeSelect(list));
    }

    /**
     * 导出采集通道列表
     */
    @PreAuthorize("@ss.hasPermi('system:channel:export')")
    @Log(title = "采集通道", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysChannel sysChannel)
    {
        List<SysChannel> list = sysChannelService.selectSysChannelList(sysChannel);
        ExcelUtil<SysChannel> util = new ExcelUtil<SysChannel>(SysChannel.class);
        return util.exportExcel(list, "channel");
    }

    /**
     * 获取采集通道详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:channel:query')")
    @GetMapping(value = "/{channelId}")
    public AjaxResult getInfo(@PathVariable("channelId") Long channelId)
    {
        return AjaxResult.success(sysChannelService.selectSysChannelById(channelId));
    }

    /**
     * 新增采集通道
     */
    @PreAuthorize("@ss.hasPermi('system:channel:add')")
    @Log(title = "采集通道", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysChannel sysChannel)
    {
        return toAjax(sysChannelService.insertSysChannel(sysChannel));
    }

    /**
     * 修改采集通道
     */
    @PreAuthorize("@ss.hasPermi('system:channel:edit')")
    @Log(title = "采集通道", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysChannel sysChannel)
    {
        return toAjax(sysChannelService.updateSysChannel(sysChannel));
    }

    /**
     * 删除采集通道
     */
    @PreAuthorize("@ss.hasPermi('system:channel:remove')")
    @Log(title = "采集通道", businessType = BusinessType.DELETE)
	@DeleteMapping("/{channelIds}")
    public AjaxResult remove(@PathVariable Long[] channelIds)
    {
        return toAjax(sysChannelService.deleteSysChannelByIds(channelIds));
    }

    /**
     * 查询采集通道参数
     */
    @PreAuthorize("@ss.hasPermi('system:channel:remove')")
    @GetMapping("/scann/{query}")
    public Map<String, Object> scann(@PathVariable("query") String[] query) {
        List<Object> res = influxDbDao.getByKeys(query,"test01");
        Map<String, List> channelData = new HashMap<String, List>();
        Map<String,String> fistData = (Map<String,String>)res.get(0);
        Set<String> chNames = fistData.keySet();
        for (Iterator<String> chNa = chNames.iterator(); chNa.hasNext();) {
            channelData.put(chNa.next(), new ArrayList());
        }
        for (Iterator<Object> it = res.iterator(); it.hasNext(); ) {
            Map<String,String> next = (Map<String,String>)it.next();
            for(Map.Entry<String,String> entry:next.entrySet() ){
                String chName = entry.getKey();
                String value = entry.getValue();
                channelData.get(chName).add(value);
            }
        }
        Map<String, Object> resoult = new HashMap<>();


        Map<String, Object> selected = new HashMap<>();

        ArrayList<Map> series = new ArrayList<>();
        ArrayList<Map> legendSeries = new ArrayList<>();

        for (Map.Entry<String, List> entry : channelData.entrySet()) {
            if (entry.getKey().equals("time")) {
                resoult.put("xAD", entry.getValue());
            }else {
                Map<String, Object> dataPoint = new HashMap<>();
                dataPoint.put("name", entry.getKey());
                dataPoint.put("data", entry.getValue());
                dataPoint.put("type", "line");
                dataPoint.put("smooth", true);
                dataPoint.put("smoothMonotone","x");
                dataPoint.put("cursor","pointer");
                dataPoint.put("showSymbol", false);
                series.add(dataPoint);

                Map<String, String> legendData = new HashMap<>();
                legendData.put("name", entry.getKey());
                legendData.put("icon","path://M512 139.81262864a286.42534744 286.42534744 0 1 0 286.42534744 286.42534744 286.42534744 286.42534744 0 0 0-286.42534744-286.42534744z m0 477.3755789a190.95023144 190.95023144 0 1 1 190.95023144-190.95023146 190.95023144 190.95023144 0 0 1-190.95023144 190.95023146z");
                legendSeries.add(legendData);

                selected.put(entry.getKey(), true);
            }
        }
        resoult.put("data", series);
        resoult.put("selected", selected);
        resoult.put("legend", legendSeries);
        return resoult;
    }
}
