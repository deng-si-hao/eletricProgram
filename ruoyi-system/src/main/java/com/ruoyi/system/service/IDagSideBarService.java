package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.DagSideBar;

/**
 * 节点侧栏Service接口
 * 
 * @author d
 * @date 2020-10-30
 */
public interface IDagSideBarService 
{
    /**
     * 查询节点侧栏
     * 
     * @param id 节点侧栏ID
     * @return 节点侧栏
     */
    public DagSideBar selectDagSideBarById(Long id);

    /**
     * 查询节点侧栏列表
     * 
     * @param dagSideBar 节点侧栏
     * @return 节点侧栏集合
     */
    public List<DagSideBar> selectDagSideBarList(DagSideBar dagSideBar);

    /**
     * 新增节点侧栏
     * 
     * @param dagSideBar 节点侧栏
     * @return 结果
     */
    public int insertDagSideBar(DagSideBar dagSideBar);

    /**
     * 修改节点侧栏
     * 
     * @param dagSideBar 节点侧栏
     * @return 结果
     */
    public int updateDagSideBar(DagSideBar dagSideBar);

    /**
     * 批量删除节点侧栏
     * 
     * @param ids 需要删除的节点侧栏ID
     * @return 结果
     */
    public int deleteDagSideBarByIds(Long[] ids);

    /**
     * 删除节点侧栏信息
     * 
     * @param id 节点侧栏ID
     * @return 结果
     */
    public int deleteDagSideBarById(Long id);
}
