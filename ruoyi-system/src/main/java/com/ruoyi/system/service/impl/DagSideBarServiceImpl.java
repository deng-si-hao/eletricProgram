package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DagSideBarMapper;
import com.ruoyi.system.domain.DagSideBar;
import com.ruoyi.system.service.IDagSideBarService;

/**
 * 节点侧栏Service业务层处理
 * 
 * @author d
 * @date 2020-10-30
 */
@Service
public class DagSideBarServiceImpl implements IDagSideBarService 
{
    @Autowired
    private DagSideBarMapper dagSideBarMapper;

    /**
     * 查询节点侧栏
     * 
     * @param id 节点侧栏ID
     * @return 节点侧栏
     */
    @Override
    public DagSideBar selectDagSideBarById(Long id)
    {
        return dagSideBarMapper.selectDagSideBarById(id);
    }

    /**
     * 查询节点侧栏列表
     * 
     * @param dagSideBar 节点侧栏
     * @return 节点侧栏
     */
    @Override
    public List<DagSideBar> selectDagSideBarList(DagSideBar dagSideBar)
    {
        return dagSideBarMapper.selectDagSideBarList(dagSideBar);
    }

    /**
     * 新增节点侧栏
     * 
     * @param dagSideBar 节点侧栏
     * @return 结果
     */
    @Override
    public int insertDagSideBar(DagSideBar dagSideBar)
    {
        dagSideBar.setCreateTime(DateUtils.getNowDate());
        return dagSideBarMapper.insertDagSideBar(dagSideBar);
    }

    /**
     * 修改节点侧栏
     * 
     * @param dagSideBar 节点侧栏
     * @return 结果
     */
    @Override
    public int updateDagSideBar(DagSideBar dagSideBar)
    {
        dagSideBar.setUpdateTime(DateUtils.getNowDate());
        return dagSideBarMapper.updateDagSideBar(dagSideBar);
    }

    /**
     * 批量删除节点侧栏
     * 
     * @param ids 需要删除的节点侧栏ID
     * @return 结果
     */
    @Override
    public int deleteDagSideBarByIds(Long[] ids)
    {
        return dagSideBarMapper.deleteDagSideBarByIds(ids);
    }

    /**
     * 删除节点侧栏信息
     * 
     * @param id 节点侧栏ID
     * @return 结果
     */
    @Override
    public int deleteDagSideBarById(Long id)
    {
        return dagSideBarMapper.deleteDagSideBarById(id);
    }
}
