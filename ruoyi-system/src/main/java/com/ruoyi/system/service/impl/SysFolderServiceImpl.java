package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysFolderMapper;
import com.ruoyi.system.domain.SysFolder;
import com.ruoyi.system.service.ISysFolderService;

/**
 * 文件储存路径Service业务层处理
 * 
 * @author d
 * @date 2020-10-13
 */
@Service
public class SysFolderServiceImpl implements ISysFolderService 
{
    @Autowired
    private SysFolderMapper sysFolderMapper;

    /**
     * 查询文件储存路径
     * 
     * @param id 文件储存路径ID
     * @return 文件储存路径
     */
    @Override
    public SysFolder selectSysFolderById(Long id)
    {
        return sysFolderMapper.selectSysFolderById(id);
    }

    /**
     * 查询文件储存路径列表
     * 
     * @param sysFolder 文件储存路径
     * @return 文件储存路径
     */
    @Override
    public List<SysFolder> selectSysFolderList(SysFolder sysFolder)
    {
        return sysFolderMapper.selectSysFolderList(sysFolder);
    }

    /**
     * 新增文件储存路径
     * 
     * @param sysFolder 文件储存路径
     * @return 结果
     */
    @Override
    public int insertSysFolder(SysFolder sysFolder)
    {
        sysFolder.setCreateTime(DateUtils.getNowDate());
        return sysFolderMapper.insertSysFolder(sysFolder);
    }

    /**
     * 修改文件储存路径
     * 
     * @param sysFolder 文件储存路径
     * @return 结果
     */
    @Override
    public int updateSysFolder(SysFolder sysFolder)
    {
        sysFolder.setUpdateTime(DateUtils.getNowDate());
        return sysFolderMapper.updateSysFolder(sysFolder);
    }

    /**
     * 批量删除文件储存路径
     * 
     * @param ids 需要删除的文件储存路径ID
     * @return 结果
     */
    @Override
    public int deleteSysFolderByIds(Long[] ids)
    {
        return sysFolderMapper.deleteSysFolderByIds(ids);
    }

    /**
     * 删除文件储存路径信息
     * 
     * @param id 文件储存路径ID
     * @return 结果
     */
    @Override
    public int deleteSysFolderById(Long id)
    {
        return sysFolderMapper.deleteSysFolderById(id);
    }
}
