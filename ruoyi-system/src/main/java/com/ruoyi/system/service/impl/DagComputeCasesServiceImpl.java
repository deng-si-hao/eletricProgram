package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.DagComputeCasesMapper;
import com.ruoyi.system.domain.DagComputeCases;
import com.ruoyi.system.service.IDagComputeCasesService;

/**
 * 算法案例Service业务层处理
 * 
 * @author d
 * @date 2020-10-30
 */
@Service
public class DagComputeCasesServiceImpl implements IDagComputeCasesService 
{
    @Autowired
    private DagComputeCasesMapper dagComputeCasesMapper;

    /**
     * 查询算法案例
     * 
     * @param id 算法案例ID
     * @return 算法案例
     */
    @Override
    public DagComputeCases selectDagComputeCasesById(Long id)
    {
        return dagComputeCasesMapper.selectDagComputeCasesById(id);
    }

    /**
     * 查询算法案例列表
     * 
     * @param dagComputeCases 算法案例
     * @return 算法案例
     */
    @Override
    public List<DagComputeCases> selectDagComputeCasesList(DagComputeCases dagComputeCases)
    {
        return dagComputeCasesMapper.selectDagComputeCasesList(dagComputeCases);
    }

    /**
     * 新增算法案例
     * 
     * @param dagComputeCases 算法案例
     * @return 结果
     */
    @Override
    public int insertDagComputeCases(DagComputeCases dagComputeCases)
    {
        return dagComputeCasesMapper.insertDagComputeCases(dagComputeCases);
    }

    /**
     * 修改算法案例
     * 
     * @param dagComputeCases 算法案例
     * @return 结果
     */
    @Override
    public int updateDagComputeCases(DagComputeCases dagComputeCases)
    {
        return dagComputeCasesMapper.updateDagComputeCases(dagComputeCases);
    }

    /**
     * 批量删除算法案例
     * 
     * @param ids 需要删除的算法案例ID
     * @return 结果
     */
    @Override
    public int deleteDagComputeCasesByIds(Long[] ids)
    {
        return dagComputeCasesMapper.deleteDagComputeCasesByIds(ids);
    }

    /**
     * 删除算法案例信息
     * 
     * @param id 算法案例ID
     * @return 结果
     */
    @Override
    public int deleteDagComputeCasesById(Long id)
    {
        return dagComputeCasesMapper.deleteDagComputeCasesById(id);
    }
}
