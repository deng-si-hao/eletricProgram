package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DagComputeCaseEdgesMapper;
import com.ruoyi.system.domain.DagComputeCaseEdges;
import com.ruoyi.system.service.IDagComputeCaseEdgesService;

/**
 * 连线Service业务层处理
 * 
 * @author d
 * @date 2020-10-30
 */
@Service
public class DagComputeCaseEdgesServiceImpl implements IDagComputeCaseEdgesService 
{
    @Autowired
    private DagComputeCaseEdgesMapper dagComputeCaseEdgesMapper;

    /**
     * 查询连线
     * 
     * @param id 连线ID
     * @return 连线
     */
    @Override
    public DagComputeCaseEdges selectDagComputeCaseEdgesById(Long id)
    {
        return dagComputeCaseEdgesMapper.selectDagComputeCaseEdgesById(id);
    }

    /**
     * 查询连线列表
     * 
     * @param dagComputeCaseEdges 连线
     * @return 连线
     */
    @Override
    public List<DagComputeCaseEdges> selectDagComputeCaseEdgesList(DagComputeCaseEdges dagComputeCaseEdges)
    {
        return dagComputeCaseEdgesMapper.selectDagComputeCaseEdgesList(dagComputeCaseEdges);
    }

    /**
     * 新增连线
     * 
     * @param dagComputeCaseEdges 连线
     * @return 结果
     */
    @Override
    public int insertDagComputeCaseEdges(DagComputeCaseEdges dagComputeCaseEdges)
    {
        return dagComputeCaseEdgesMapper.insertDagComputeCaseEdges(dagComputeCaseEdges);
    }

    /**
     * 修改连线
     * 
     * @param dagComputeCaseEdges 连线
     * @return 结果
     */
    @Override
    public int updateDagComputeCaseEdges(DagComputeCaseEdges dagComputeCaseEdges)
    {
        return dagComputeCaseEdgesMapper.updateDagComputeCaseEdges(dagComputeCaseEdges);
    }

    /**
     * 批量删除连线
     * 
     * @param ids 需要删除的连线ID
     * @return 结果
     */
    @Override
    public int deleteDagComputeCaseEdgesByIds(Long[] ids)
    {
        return dagComputeCaseEdgesMapper.deleteDagComputeCaseEdgesByIds(ids);
    }

    /**
     * 删除连线信息
     * 
     * @param id 连线ID
     * @return 结果
     */
    @Override
    public int deleteDagComputeCaseEdgesById(Long id)
    {
        return dagComputeCaseEdgesMapper.deleteDagComputeCaseEdgesById(id);
    }
}
