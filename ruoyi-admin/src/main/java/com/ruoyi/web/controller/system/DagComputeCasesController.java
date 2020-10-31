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
import com.ruoyi.system.domain.DagComputeCases;
import com.ruoyi.system.service.IDagComputeCasesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 算法案例Controller
 *
 * @author d
 * @date 2020-10-30
 */
@RestController
@RequestMapping("/system/cases")
public class DagComputeCasesController extends BaseController
{
    @Autowired
    private IDagComputeCasesService dagComputeCasesService;

    /**
     * 查询算法案例列表
     */
    @PreAuthorize("@ss.hasPermi('system:cases:list')")
    @GetMapping("/list")
    public TableDataInfo list(DagComputeCases dagComputeCases)
    {
        startPage();
        List<DagComputeCases> list = dagComputeCasesService.selectDagComputeCasesList(dagComputeCases);
        return getDataTable(list);
    }

    /**
     * 导出算法案例列表
     */
    @PreAuthorize("@ss.hasPermi('system:cases:export')")
    @Log(title = "算法案例", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DagComputeCases dagComputeCases)
    {
        List<DagComputeCases> list = dagComputeCasesService.selectDagComputeCasesList(dagComputeCases);
        ExcelUtil<DagComputeCases> util = new ExcelUtil<DagComputeCases>(DagComputeCases.class);
        return util.exportExcel(list, "cases");
    }

    /**
     * 获取算法案例详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:cases:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(dagComputeCasesService.selectDagComputeCasesById(id));
    }

    /**
     * 新增算法案例
     */
    @PreAuthorize("@ss.hasPermi('system:cases:add')")
    @Log(title = "算法案例", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DagComputeCases dagComputeCases)
    {
        return toAjax(dagComputeCasesService.insertDagComputeCases(dagComputeCases));
    }

    /**
     * 修改算法案例
     */
    @PreAuthorize("@ss.hasPermi('system:cases:edit')")
    @Log(title = "算法案例", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DagComputeCases dagComputeCases)
    {
        return toAjax(dagComputeCasesService.updateDagComputeCases(dagComputeCases));
    }

    /**
     * 删除算法案例
     */
    @PreAuthorize("@ss.hasPermi('system:cases:remove')")
    @Log(title = "算法案例", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dagComputeCasesService.deleteDagComputeCasesByIds(ids));
    }
}
