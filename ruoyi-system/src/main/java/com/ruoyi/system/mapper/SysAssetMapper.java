package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysAsset;

/**
 * 车辆信息Mapper接口
 * 
 * @author d
 * @date 2020-10-16
 */
public interface SysAssetMapper 
{
    /**
     * 查询车辆信息
     * 
     * @param id 车辆信息ID
     * @return 车辆信息
     */
    public SysAsset selectSysAssetById(Long id);

    /**
     * 查询车辆信息列表
     * 
     * @param sysAsset 车辆信息
     * @return 车辆信息集合
     */
    public List<SysAsset> selectSysAssetList(SysAsset sysAsset);

    /**
     * 新增车辆信息
     * 
     * @param sysAsset 车辆信息
     * @return 结果
     */
    public int insertSysAsset(SysAsset sysAsset);

    /**
     * 修改车辆信息
     * 
     * @param sysAsset 车辆信息
     * @return 结果
     */
    public int updateSysAsset(SysAsset sysAsset);

    /**
     * 删除车辆信息
     * 
     * @param id 车辆信息ID
     * @return 结果
     */
    public int deleteSysAssetById(Long id);

    /**
     * 批量删除车辆信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysAssetByIds(Long[] ids);

    /**
    * 批量导入asset数据
    *
    * */
    public int addListMysql(List<SysAsset> assets);
}
