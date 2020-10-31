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
import com.ruoyi.system.domain.DagSideBar;
import com.ruoyi.system.service.IDagSideBarService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 节点侧栏Controller
 *
 * @author d
 * @date 2020-10-30
 */
@RestController
@RequestMapping("/system/bar")
public class DagSideBarController extends BaseController
{
    @Autowired
    private IDagSideBarService dagSideBarService;

    /**
     * 查询节点侧栏列表
     */
    @PreAuthorize("@ss.hasPermi('system:bar:list')")
    @GetMapping("/list")
    public TableDataInfo list(DagSideBar dagSideBar)
    {
        startPage();
        List<DagSideBar> list = dagSideBarService.selectDagSideBarList(dagSideBar);
        return getDataTable(list);
    }

    /**
     * 导出节点侧栏列表
     */
    @PreAuthorize("@ss.hasPermi('system:bar:export')")
    @Log(title = "节点侧栏", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DagSideBar dagSideBar)
    {
        List<DagSideBar> list = dagSideBarService.selectDagSideBarList(dagSideBar);
        ExcelUtil<DagSideBar> util = new ExcelUtil<DagSideBar>(DagSideBar.class);
        return util.exportExcel(list, "bar");
    }

    /**
     * 获取节点侧栏详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:bar:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(dagSideBarService.selectDagSideBarById(id));
    }

    /**
     * 新增节点侧栏
     */
    @PreAuthorize("@ss.hasPermi('system:bar:add')")
    @Log(title = "节点侧栏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DagSideBar dagSideBar)
    {
        return toAjax(dagSideBarService.insertDagSideBar(dagSideBar));
    }

    /**
     * 修改节点侧栏
     */
    @PreAuthorize("@ss.hasPermi('system:bar:edit')")
    @Log(title = "节点侧栏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DagSideBar dagSideBar)
    {
        return toAjax(dagSideBarService.updateDagSideBar(dagSideBar));
    }

    /**
     * 删除节点侧栏
     */
    @PreAuthorize("@ss.hasPermi('system:bar:remove')")
    @Log(title = "节点侧栏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(dagSideBarService.deleteDagSideBarByIds(ids));
    }
}
