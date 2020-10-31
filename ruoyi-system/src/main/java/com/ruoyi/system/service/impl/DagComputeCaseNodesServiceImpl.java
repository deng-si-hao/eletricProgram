package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DagComputeCaseNodesMapper;
import com.ruoyi.system.domain.DagComputeCaseNodes;
import com.ruoyi.system.service.IDagComputeCaseNodesService;

/**
 * 节点数据Service业务层处理
 * 
 * @author d
 * @date 2020-10-30
 */
@Service
public class DagComputeCaseNodesServiceImpl implements IDagComputeCaseNodesService 
{
    @Autowired
    private DagComputeCaseNodesMapper dagComputeCaseNodesMapper;

    /**
     * 查询节点数据
     * 
     * @param id 节点数据ID
     * @return 节点数据
     */
    @Override
    public DagComputeCaseNodes selectDagComputeCaseNodesById(Long id)
    {
        return dagComputeCaseNodesMapper.selectDagComputeCaseNodesById(id);
    }

    /**
     * 查询节点数据列表
     * 
     * @param dagComputeCaseNodes 节点数据
     * @return 节点数据
     */
    @Override
    public List<DagComputeCaseNodes> selectDagComputeCaseNodesList(DagComputeCaseNodes dagComputeCaseNodes)
    {
        return dagComputeCaseNodesMapper.selectDagComputeCaseNodesList(dagComputeCaseNodes);
    }

    /**
     * 新增节点数据
     * 
     * @param dagComputeCaseNodes 节点数据
     * @return 结果
     */
    @Override
    public int insertDagComputeCaseNodes(DagComputeCaseNodes dagComputeCaseNodes)
    {
        return dagComputeCaseNodesMapper.insertDagComputeCaseNodes(dagComputeCaseNodes);
    }

    /**
     * 修改节点数据
     * 
     * @param dagComputeCaseNodes 节点数据
     * @return 结果
     */
    @Override
    public int updateDagComputeCaseNodes(DagComputeCaseNodes dagComputeCaseNodes)
    {
        return dagComputeCaseNodesMapper.updateDagComputeCaseNodes(dagComputeCaseNodes);
    }

    /**
     * 批量删除节点数据
     * 
     * @param ids 需要删除的节点数据ID
     * @return 结果
     */
    @Override
    public int deleteDagComputeCaseNodesByIds(Long[] ids)
    {
        return dagComputeCaseNodesMapper.deleteDagComputeCaseNodesByIds(ids);
    }

    /**
     * 删除节点数据信息
     * 
     * @param id 节点数据ID
     * @return 结果
     */
    @Override
    public int deleteDagComputeCaseNodesById(Long id)
    {
        return dagComputeCaseNodesMapper.deleteDagComputeCaseNodesById(id);
    }
}
