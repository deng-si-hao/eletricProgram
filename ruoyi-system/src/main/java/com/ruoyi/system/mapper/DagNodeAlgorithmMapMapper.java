package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.DagNodeAlgorithmMap;

/**
 * 节点算法对应Mapper接口
 * 
 * @author d
 * @date 2020-10-30
 */
public interface DagNodeAlgorithmMapMapper 
{
    /**
     * 查询节点算法对应
     * 
     * @param id 节点算法对应ID
     * @return 节点算法对应
     */
    public DagNodeAlgorithmMap selectDagNodeAlgorithmMapById(Long id);

    /**
     * 查询节点算法对应列表
     * 
     * @param dagNodeAlgorithmMap 节点算法对应
     * @return 节点算法对应集合
     */
    public List<DagNodeAlgorithmMap> selectDagNodeAlgorithmMapList(DagNodeAlgorithmMap dagNodeAlgorithmMap);

    /**
     * 新增节点算法对应
     * 
     * @param dagNodeAlgorithmMap 节点算法对应
     * @return 结果
     */
    public int insertDagNodeAlgorithmMap(DagNodeAlgorithmMap dagNodeAlgorithmMap);

    /**
     * 修改节点算法对应
     * 
     * @param dagNodeAlgorithmMap 节点算法对应
     * @return 结果
     */
    public int updateDagNodeAlgorithmMap(DagNodeAlgorithmMap dagNodeAlgorithmMap);

    /**
     * 删除节点算法对应
     * 
     * @param id 节点算法对应ID
     * @return 结果
     */
    public int deleteDagNodeAlgorithmMapById(Long id);

    /**
     * 批量删除节点算法对应
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDagNodeAlgorithmMapByIds(Long[] ids);
}
