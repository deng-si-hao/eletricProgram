package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysReport;

/**
 * 文档存储Mapper接口
 * 
 * @author d
 * @date 2020-10-16
 */
public interface SysReportMapper 
{
    /**
     * 查询文档存储
     * 
     * @param id 文档存储ID
     * @return 文档存储
     */
    public SysReport selectSysReportById(Long id);

    /**
     * 查询文档存储列表
     * 
     * @param sysReport 文档存储
     * @return 文档存储集合
     */
    public List<SysReport> selectSysReportList(SysReport sysReport);

    /**
     * 新增文档存储
     * 
     * @param sysReport 文档存储
     * @return 结果
     */
    public int insertSysReport(SysReport sysReport);

    /**
     * 修改文档存储
     * 
     * @param sysReport 文档存储
     * @return 结果
     */
    public int updateSysReport(SysReport sysReport);

    /**
     * 删除文档存储
     * 
     * @param id 文档存储ID
     * @return 结果
     */
    public int deleteSysReportById(Long id);

    /**
     * 批量删除文档存储
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysReportByIds(Long[] ids);
}
