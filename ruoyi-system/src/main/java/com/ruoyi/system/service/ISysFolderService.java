package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysFolder;

/**
 * 文件储存路径Service接口
 * 
 * @author d
 * @date 2020-10-13
 */
public interface ISysFolderService 
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
     * 批量删除文件储存路径
     * 
     * @param ids 需要删除的文件储存路径ID
     * @return 结果
     */
    public int deleteSysFolderByIds(Long[] ids);

    /**
     * 删除文件储存路径信息
     * 
     * @param id 文件储存路径ID
     * @return 结果
     */
    public int deleteSysFolderById(Long id);
}
