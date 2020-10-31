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
import com.ruoyi.system.domain.DagComputeCaseNodes;
import com.ruoyi.system.service.IDagComputeCaseNodesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 节点数据Controller
 *
 * @author d
 * @date 2020-10-30
 */
@RestController
@RequestMapping("/system/nodes")
public class DagComputeCaseNodesController extends BaseController
{
    @Autowired
    private IDagComputeCaseNodesService dagComputeCaseNodesService;

    /**
     * 查询节点数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:nodes:list')")
    @GetMapping("/list")
    public TableDataInfo list(DagComputeCaseNodes dagComputeCaseNodes)
    {
        startPage();
        List<DagComputeCaseNodes> list = dagComputeCaseNodesService.selectDagComputeCaseNodesList(dagComputeCaseNodes);
        return getDataTable(list);
    }

    /**
     * 导出节点数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:nodes:export')")
    @Log(title = "节点数据", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DagComputeCaseNodes dagComputeCaseNodes)
    {
        List<DagComputeCaseNodes> list = dagComputeCaseNodesService.selectDagComputeCaseNodesList(dagComputeCaseNodes);
        ExcelUtil<DagComputeCaseNodes> util = new ExcelUtil<DagComputeCaseNodes>(DagComputeCaseNodes.class);
        return util.exportExcel(list, "nodes");
    }

    /**
     * 获取节点数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:nodes:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(dagComputeCaseNodesService.selectDagComputeCaseNodesById(id));
    }

    /**
     * 新增节点数据
     */
    @PreAuthorize("@ss.hasPermi('system:nodes:add')")
    @Log(title = "节点数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DagComputeCaseNodes dagComputeCaseNodes)
    {
        return toAjax(dagComputeCaseNodesService.insertDagComputeCaseNodes(dagComputeCaseNodes));
    }

    /**
     * 修改节点数据
     */
    @PreAuthorize("@ss.hasPermi('system:nodes:edit')")
    @Log(title = "节点数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DagComputeCaseNodes dagComputeCaseNodes)
    {
        return toAjax(dagComputeCaseNodesService.updateDagComputeCaseNodes(dagComputeCaseNodes));
    }

    /**
     * 删除节点数据
     */
    @PreAuthorize("@ss.hasPermi('system:nodes:remove')")
    @Log(title = "节点数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dagComputeCaseNodesService.deleteDagComputeCaseNodesByIds(ids));
    }
}
