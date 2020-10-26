package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysDevice;

/**
 * 数据采集通道Service接口
 * 
 * @author d
 * @date 2020-10-16
 */
public interface ISysDeviceService 
{
    /**
     * 查询数据采集通道
     * 
     * @param id 数据采集通道ID
     * @return 数据采集通道
     */
    public SysDevice selectSysDeviceById(Long id);

    /**
     * 查询数据采集通道列表
     * 
     * @param sysDevice 数据采集通道
     * @return 数据采集通道集合
     */
    public List<SysDevice> selectSysDeviceList(SysDevice sysDevice);

    /**
     * 新增数据采集通道
     * 
     * @param sysDevice 数据采集通道
     * @return 结果
     */
    public int insertSysDevice(SysDevice sysDevice);

    /**
     * 修改数据采集通道
     * 
     * @param sysDevice 数据采集通道
     * @return 结果
     */
    public int updateSysDevice(SysDevice sysDevice);

    /**
     * 批量删除数据采集通道
     * 
     * @param ids 需要删除的数据采集通道ID
     * @return 结果
     */
    public int deleteSysDeviceByIds(Long[] ids);

    /**
     * 删除数据采集通道信息
     * 
     * @param id 数据采集通道ID
     * @return 结果
     */
    public int deleteSysDeviceById(Long id);
}
