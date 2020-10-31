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
import com.ruoyi.system.domain.DagComputeCaseEdges;
import com.ruoyi.system.service.IDagComputeCaseEdgesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 连线Controller
 *
 * @author d
 * @date 2020-10-30
 */
@RestController
@RequestMapping("/system/edges")
public class DagComputeCaseEdgesController extends BaseController
{
    @Autowired
    private IDagComputeCaseEdgesService dagComputeCaseEdgesService;

    /**
     * 查询连线列表
     */
    @PreAuthorize("@ss.hasPermi('system:edges:list')")
    @GetMapping("/list")
    public TableDataInfo list(DagComputeCaseEdges dagComputeCaseEdges)
    {
        startPage();
        List<DagComputeCaseEdges> list = dagComputeCaseEdgesService.selectDagComputeCaseEdgesList(dagComputeCaseEdges);
        return getDataTable(list);
    }

    /**
     * 导出连线列表
     */
    @PreAuthorize("@ss.hasPermi('system:edges:export')")
    @Log(title = "连线", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DagComputeCaseEdges dagComputeCaseEdges)
    {
        List<DagComputeCaseEdges> list = dagComputeCaseEdgesService.selectDagComputeCaseEdgesList(dagComputeCaseEdges);
        ExcelUtil<DagComputeCaseEdges> util = new ExcelUtil<DagComputeCaseEdges>(DagComputeCaseEdges.class);
        return util.exportExcel(list, "edges");
    }

    /**
     * 获取连线详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:edges:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(dagComputeCaseEdgesService.selectDagComputeCaseEdgesById(id));
    }

    /**
     * 新增连线
     */
    @PreAuthorize("@ss.hasPermi('system:edges:add')")
    @Log(title = "连线", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DagComputeCaseEdges dagComputeCaseEdges)
    {
        return toAjax(dagComputeCaseEdgesService.insertDagComputeCaseEdges(dagComputeCaseEdges));
    }

    /**
     * 修改连线
     */
    @PreAuthorize("@ss.hasPermi('system:edges:edit')")
    @Log(title = "连线", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DagComputeCaseEdges dagComputeCaseEdges)
    {
        return toAjax(dagComputeCaseEdgesService.updateDagComputeCaseEdges(dagComputeCaseEdges));
    }

    /**
     * 删除连线
     */
    @PreAuthorize("@ss.hasPermi('system:edges:remove')")
    @Log(title = "连线", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dagComputeCaseEdgesService.deleteDagComputeCaseEdgesByIds(ids));
    }
}
