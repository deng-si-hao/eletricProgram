package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.DagComputeCases;

/**
 * 算法案例Mapper接口
 * 
 * @author d
 * @date 2020-10-30
 */
public interface DagComputeCasesMapper 
{
    /**
     * 查询算法案例
     * 
     * @param id 算法案例ID
     * @return 算法案例
     */
    public DagComputeCases selectDagComputeCasesById(Long id);

    /**
     * 查询算法案例列表
     * 
     * @param dagComputeCases 算法案例
     * @return 算法案例集合
     */
    public List<DagComputeCases> selectDagComputeCasesList(DagComputeCases dagComputeCases);

    /**
     * 新增算法案例
     * 
     * @param dagComputeCases 算法案例
     * @return 结果
     */
    public int insertDagComputeCases(DagComputeCases dagComputeCases);

    /**
     * 修改算法案例
     * 
     * @param dagComputeCases 算法案例
     * @return 结果
     */
    public int updateDagComputeCases(DagComputeCases dagComputeCases);

    /**
     * 删除算法案例
     * 
     * @param id 算法案例ID
     * @return 结果
     */
    public int deleteDagComputeCasesById(Long id);

    /**
     * 批量删除算法案例
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDagComputeCasesByIds(Long[] ids);
}
