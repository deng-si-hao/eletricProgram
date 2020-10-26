package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysPicture;

/**
 * 图片存储Mapper接口
 * 
 * @author d
 * @date 2020-10-16
 */
public interface SysPictureMapper 
{
    /**
     * 查询图片存储
     * 
     * @param id 图片存储ID
     * @return 图片存储
     */
    public SysPicture selectSysPictureById(Long id);

    /**
     * 查询图片存储列表
     * 
     * @param sysPicture 图片存储
     * @return 图片存储集合
     */
    public List<SysPicture> selectSysPictureList(SysPicture sysPicture);

    /**
     * 新增图片存储
     * 
     * @param sysPicture 图片存储
     * @return 结果
     */
    public int insertSysPicture(SysPicture sysPicture);

    /**
     * 修改图片存储
     * 
     * @param sysPicture 图片存储
     * @return 结果
     */
    public int updateSysPicture(SysPicture sysPicture);

    /**
     * 删除图片存储
     * 
     * @param id 图片存储ID
     * @return 结果
     */
    public int deleteSysPictureById(Long id);

    /**
     * 批量删除图片存储
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysPictureByIds(Long[] ids);
}
