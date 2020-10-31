package com.ruoyi.web.controller.system;

import java.util.List;
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
import com.ruoyi.system.domain.DagNodeAlgorithmMap;
import com.ruoyi.system.service.IDagNodeAlgorithmMapService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 节点算法对应Controller
 *
 * @author d
 * @date 2020-10-30
 */
@RestController
@RequestMapping("/system/map")
public class DagNodeAlgorithmMapController extends BaseController
{
    @Autowired
    private IDagNodeAlgorithmMapService dagNodeAlgorithmMapService;

    /**
     * 查询节点算法对应列表
     */
    @PreAuthorize("@ss.hasPermi('system:map:list')")
    @GetMapping("/list")
    public TableDataInfo list(DagNodeAlgorithmMap dagNodeAlgorithmMap)
    {
        startPage();
        List<DagNodeAlgorithmMap> list = dagNodeAlgorithmMapService.selectDagNodeAlgorithmMapList(dagNodeAlgorithmMap);
        return getDataTable(list);
    }

    /**
     * 导出节点算法对应列表
     */
    @PreAuthorize("@ss.hasPermi('system:map:export')")
    @Log(title = "节点算法对应", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DagNodeAlgorithmMap dagNodeAlgorithmMap)
    {
        List<DagNodeAlgorithmMap> list = dagNodeAlgorithmMapService.selectDagNodeAlgorithmMapList(dagNodeAlgorithmMap);
        ExcelUtil<DagNodeAlgorithmMap> util = new ExcelUtil<DagNodeAlgorithmMap>(DagNodeAlgorithmMap.class);
        return util.exportExcel(list, "map");
    }

    /**
     * 获取节点算法对应详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:map:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(dagNodeAlgorithmMapService.selectDagNodeAlgorithmMapById(id));
    }

    /**
     * 新增节点算法对应
     */
    @PreAuthorize("@ss.hasPermi('system:map:add')")
    @Log(title = "节点算法对应", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DagNodeAlgorithmMap dagNodeAlgorithmMap)
    {
        return toAjax(dagNodeAlgorithmMapService.insertDagNodeAlgorithmMap(dagNodeAlgorithmMap));
    }

    /**
     * 修改节点算法对应
     */
    @PreAuthorize("@ss.hasPermi('system:map:edit')")
    @Log(title = "节点算法对应", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DagNodeAlgorithmMap dagNodeAlgorithmMap)
    {
        return toAjax(dagNodeAlgorithmMapService.updateDagNodeAlgorithmMap(dagNodeAlgorithmMap));
    }

    /**
     * 删除节点算法对应
     */
    @PreAuthorize("@ss.hasPermi('system:map:remove')")
    @Log(title = "节点算法对应", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dagNodeAlgorithmMapService.deleteDagNodeAlgorithmMapByIds(ids));
    }
}
