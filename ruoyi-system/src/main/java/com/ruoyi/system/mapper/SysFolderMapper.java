package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysFolder;

/**
 * 文件储存路径Mapper接口
 * 
 * @author d
 * @date 2020-10-13
 */
public interface SysFolderMapper 
{
    /**
     * 查询文件储存路径
     * 
     * @param id 文件储存路径ID
     * @return 文件储存路径
     */
    public SysFolder selectSysFolderById(Long id);

    /**
     * 查询文件储存路径列表
     * 
     * @param sysFolder 文件储存路径
     * @return 文件储存路径集合
     */
    public List<SysFolder> selectSysFolderList(SysFolder sysFolder);

    /**
     * 新增文件储存路径
     * 
     * @param sysFolder 文件储存路径
     * @return 结果
     */
    public int insertSysFolder(SysFolder sysFolder);

    /**
     * 修改文件储存路径
     * 
     * @param sysFolder 文件储存路径
     * @return 结果
     */
    public int updateSysFolder(SysFolder sysFolder);

    /**
     * 删除文件储存路径
     * 
     * @param id 文件储存路径ID
     * @return 结果
     */
    public int deleteSysFolderById(Long id);

    /**
     * 批量删除文件储存路径
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysFolderByIds(Long[] ids);
}
