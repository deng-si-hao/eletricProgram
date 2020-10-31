package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.DagComputeCaseNodes;

/**
 * 节点数据Service接口
 * 
 * @author d
 * @date 2020-10-30
 */
public interface IDagComputeCaseNodesService 
{
    /**
     * 查询节点数据
     * 
     * @param id 节点数据ID
     * @return 节点数据
     */
    public DagComputeCaseNodes selectDagComputeCaseNodesById(Long id);

    /**
     * 查询节点数据列表
     * 
     * @param dagComputeCaseNodes 节点数据
     * @return 节点数据集合
     */
    public List<DagComputeCaseNodes> selectDagComputeCaseNodesList(DagComputeCaseNodes dagComputeCaseNodes);

    /**
     * 新增节点数据
     * 
     * @param dagComputeCaseNodes 节点数据
     * @return 结果
     */
    public int insertDagComputeCaseNodes(DagComputeCaseNodes dagComputeCaseNodes);

    /**
     * 修改节点数据
     * 
     * @param dagComputeCaseNodes 节点数据
     * @return 结果
     */
    public int updateDagComputeCaseNodes(DagComputeCaseNodes dagComputeCaseNodes);

    /**
     * 批量删除节点数据
     * 
     * @param ids 需要删除的节点数据ID
     * @return 结果
     */
    public int deleteDagComputeCaseNodesByIds(Long[] ids);

    /**
     * 删除节点数据信息
     * 
     * @param id 节点数据ID
     * @return 结果
     */
    public int deleteDagComputeCaseNodesById(Long id);
}
