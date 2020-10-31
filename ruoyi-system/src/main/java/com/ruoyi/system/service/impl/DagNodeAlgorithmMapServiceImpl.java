package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DagNodeAlgorithmMapMapper;
import com.ruoyi.system.domain.DagNodeAlgorithmMap;
import com.ruoyi.system.service.IDagNodeAlgorithmMapService;

/**
 * 节点算法对应Service业务层处理
 * 
 * @author d
 * @date 2020-10-30
 */
@Service
public class DagNodeAlgorithmMapServiceImpl implements IDagNodeAlgorithmMapService 
{
    @Autowired
    private DagNodeAlgorithmMapMapper dagNodeAlgorithmMapMapper;

    /**
     * 查询节点算法对应
     * 
     * @param id 节点算法对应ID
     * @return 节点算法对应
     */
    @Override
    public DagNodeAlgorithmMap selectDagNodeAlgorithmMapById(Long id)
    {
        return dagNodeAlgorithmMapMapper.selectDagNodeAlgorithmMapById(id);
    }

    /**
     * 查询节点算法对应列表
     * 
     * @param dagNodeAlgorithmMap 节点算法对应
     * @return 节点算法对应
     */
    @Override
    public List<DagNodeAlgorithmMap> selectDagNodeAlgorithmMapList(DagNodeAlgorithmMap dagNodeAlgorithmMap)
    {
        return dagNodeAlgorithmMapMapper.selectDagNodeAlgorithmMapList(dagNodeAlgorithmMap);
    }

    /**
     * 新增节点算法对应
     * 
     * @param dagNodeAlgorithmMap 节点算法对应
     * @return 结果
     */
    @Override
    public int insertDagNodeAlgorithmMap(DagNodeAlgorithmMap dagNodeAlgorithmMap)
    {
        return dagNodeAlgorithmMapMapper.insertDagNodeAlgorithmMap(dagNodeAlgorithmMap);
    }

    /**
     * 修改节点算法对应
     * 
     * @param dagNodeAlgorithmMap 节点算法对应
     * @return 结果
     */
    @Override
    public int updateDagNodeAlgorithmMap(DagNodeAlgorithmMap dagNodeAlgorithmMap)
    {
        return dagNodeAlgorithmMapMapper.updateDagNodeAlgorithmMap(dagNodeAlgorithmMap);
    }

    /**
     * 批量删除节点算法对应
     * 
     * @param ids 需要删除的节点算法对应ID
     * @return 结果
     */
    @Override
    public int deleteDagNodeAlgorithmMapByIds(Long[] ids)
    {
        return dagNodeAlgorithmMapMapper.deleteDagNodeAlgorithmMapByIds(ids);
    }

    /**
     * 删除节点算法对应信息
     * 
     * @param id 节点算法对应ID
     * @return 结果
     */
    @Override
    public int deleteDagNodeAlgorithmMapById(Long id)
    {
        return dagNodeAlgorithmMapMapper.deleteDagNodeAlgorithmMapById(id);
    }
}
