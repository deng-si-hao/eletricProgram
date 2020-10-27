package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPictureMapper;
import com.ruoyi.system.domain.SysPicture;
import com.ruoyi.system.service.ISysPictureService;

/**
 * 图片存储Service业务层处理
 * 
 * @author d
 * @date 2020-10-16
 */
@Service
public class SysPictureServiceImpl implements ISysPictureService 
{
    @Autowired
    private SysPictureMapper sysPictureMapper;

    /**
     * 查询图片存储
     * 
     * @param id 图片存储ID
     * @return 图片存储
     */
    @Override
    public SysPicture selectSysPictureById(Long id)
    {
        return sysPictureMapper.selectSysPictureById(id);
    }

    /**
     * 查询图片存储列表
     * 
     * @param sysPicture 图片存储
     * @return 图片存储
     */
    @Override
    public List<SysPicture> selectSysPictureList(SysPicture sysPicture)
    {
        return sysPictureMapper.selectSysPictureList(sysPicture);
    }

    /**
     * 新增图片存储
     * 
     * @param sysPicture 图片存储
     * @return 结果
     */
    @Override
    public int insertSysPicture(SysPicture sysPicture)
    {
        if(sysPicture.getId() == null){
            sysPicture.setId(IdUtils.getNewId());
        }
        sysPicture.setCreateTime(DateUtils.getNowDate());
        return sysPictureMapper.insertSysPicture(sysPicture);
    }

    /**
     * 修改图片存储
     * 
     * @param sysPicture 图片存储
     * @return 结果
     */
    @Override
    public int updateSysPicture(SysPicture sysPicture)
    {
        sysPicture.setUpdateTime(DateUtils.getNowDate());
        return sysPictureMapper.updateSysPicture(sysPicture);
    }

    /**
     * 批量删除图片存储
     * 
     * @param ids 需要删除的图片存储ID
     * @return 结果
     */
    @Override
    public int deleteSysPictureByIds(Long[] ids)
    {
        return sysPictureMapper.deleteSysPictureByIds(ids);
    }

    /**
     * 删除图片存储信息
     * 
     * @param id 图片存储ID
     * @return 结果
     */
    @Override
    public int deleteSysPictureById(Long id)
    {
        return sysPictureMapper.deleteSysPictureById(id);
    }
}
