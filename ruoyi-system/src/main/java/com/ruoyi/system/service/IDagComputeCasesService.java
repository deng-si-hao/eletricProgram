package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.DagComputeCases;

/**
 * 算法案例Service接口
 * 
 * @author d
 * @date 2020-10-30
 */
public interface IDagComputeCasesService 
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
     * 批量删除算法案例
     * 
     * @param ids 需要删除的算法案例ID
     * @return 结果
     */
    public int deleteDagComputeCasesByIds(Long[] ids);

    /**
     * 删除算法案例信息
     * 
     * @param id 算法案例ID
     * @return 结果
     */
    public int deleteDagComputeCasesById(Long id);
}
