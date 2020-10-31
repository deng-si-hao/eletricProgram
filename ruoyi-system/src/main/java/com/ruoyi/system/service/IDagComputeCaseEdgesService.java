package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.DagComputeCaseEdges;

/**
 * 连线Service接口
 * 
 * @author d
 * @date 2020-10-30
 */
public interface IDagComputeCaseEdgesService 
{
    /**
     * 查询连线
     * 
     * @param id 连线ID
     * @return 连线
     */
    public DagComputeCaseEdges selectDagComputeCaseEdgesById(Long id);

    /**
     * 查询连线列表
     * 
     * @param dagComputeCaseEdges 连线
     * @return 连线集合
     */
    public List<DagComputeCaseEdges> selectDagComputeCaseEdgesList(DagComputeCaseEdges dagComputeCaseEdges);

    /**
     * 新增连线
     * 
     * @param dagComputeCaseEdges 连线
     * @return 结果
     */
    public int insertDagComputeCaseEdges(DagComputeCaseEdges dagComputeCaseEdges);

    /**
     * 修改连线
     * 
     * @param dagComputeCaseEdges 连线
     * @return 结果
     */
    public int updateDagComputeCaseEdges(DagComputeCaseEdges dagComputeCaseEdges);

    /**
     * 批量删除连线
     * 
     * @param ids 需要删除的连线ID
     * @return 结果
     */
    public int deleteDagComputeCaseEdgesByIds(Long[] ids);

    /**
     * 删除连线信息
     * 
     * @param id 连线ID
     * @return 结果
     */
    public int deleteDagComputeCaseEdgesById(Long id);
}
