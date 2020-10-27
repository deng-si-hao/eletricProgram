package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysReportMapper;
import com.ruoyi.system.domain.SysReport;
import com.ruoyi.system.service.ISysReportService;

/**
 * 文档存储Service业务层处理
 * 
 * @author d
 * @date 2020-10-16
 */
@Service
public class SysReportServiceImpl implements ISysReportService 
{
    @Autowired
    private SysReportMapper sysReportMapper;

    /**
     * 查询文档存储
     * 
     * @param id 文档存储ID
     * @return 文档存储
     */
    @Override
    public SysReport selectSysReportById(Long id)
    {
        return sysReportMapper.selectSysReportById(id);
    }

    /**
     * 查询文档存储列表
     * 
     * @param sysReport 文档存储
     * @return 文档存储
     */
    @Override
    public List<SysReport> selectSysReportList(SysReport sysReport)
    {
        return sysReportMapper.selectSysReportList(sysReport);
    }

    /**
     * 新增文档存储
     * 
     * @param sysReport 文档存储
     * @return 结果
     */
    @Override
    public int insertSysReport(SysReport sysReport)
    {
        sysReport.setCreateTime(DateUtils.getNowDate());
        return sysReportMapper.insertSysReport(sysReport);
    }

    /**
     * 修改文档存储
     * 
     * @param sysReport 文档存储
     * @return 结果
     */
    @Override
    public int updateSysReport(SysReport sysReport)
    {
        sysReport.setUpdateTime(DateUtils.getNowDate());
        return sysReportMapper.updateSysReport(sysReport);
    }

    /**
     * 批量删除文档存储
     * 
     * @param ids 需要删除的文档存储ID
     * @return 结果
     */
    @Override
    public int deleteSysReportByIds(Long[] ids)
    {
        return sysReportMapper.deleteSysReportByIds(ids);
    }

    /**
     * 删除文档存储信息
     * 
     * @param id 文档存储ID
     * @return 结果
     */
    @Override
    public int deleteSysReportById(Long id)
    {
        return sysReportMapper.deleteSysReportById(id);
    }
}
