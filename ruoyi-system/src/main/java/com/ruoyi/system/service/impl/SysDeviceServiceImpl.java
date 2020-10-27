package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysDeviceMapper;
import com.ruoyi.system.domain.SysDevice;
import com.ruoyi.system.service.ISysDeviceService;

/**
 * 数据采集通道Service业务层处理
 * 
 * @author d
 * @date 2020-10-16
 */
@Service
public class SysDeviceServiceImpl implements ISysDeviceService 
{
    @Autowired
    private SysDeviceMapper sysDeviceMapper;

    /**
     * 查询数据采集通道
     * 
     * @param id 数据采集通道ID
     * @return 数据采集通道
     */
    @Override
    public SysDevice selectSysDeviceById(Long id)
    {
        return sysDeviceMapper.selectSysDeviceById(id);
    }

    /**
     * 查询数据采集通道列表
     * 
     * @param sysDevice 数据采集通道
     * @return 数据采集通道
     */
    @Override
    public List<SysDevice> selectSysDeviceList(SysDevice sysDevice)
    {
        return sysDeviceMapper.selectSysDeviceList(sysDevice);
    }

    /**
     * 新增数据采集通道
     * 
     * @param sysDevice 数据采集通道
     * @return 结果
     */
    @Override
    public int insertSysDevice(SysDevice sysDevice)
    {
        sysDevice.setCreateTime(DateUtils.getNowDate());
        return sysDeviceMapper.insertSysDevice(sysDevice);
    }

    /**
     * 修改数据采集通道
     * 
     * @param sysDevice 数据采集通道
     * @return 结果
     */
    @Override
    public int updateSysDevice(SysDevice sysDevice)
    {
        sysDevice.setUpdateTime(DateUtils.getNowDate());
        return sysDeviceMapper.updateSysDevice(sysDevice);
    }

    /**
     * 批量删除数据采集通道
     * 
     * @param ids 需要删除的数据采集通道ID
     * @return 结果
     */
    @Override
    public int deleteSysDeviceByIds(Long[] ids)
    {
        return sysDeviceMapper.deleteSysDeviceByIds(ids);
    }

    /**
     * 删除数据采集通道信息
     * 
     * @param id 数据采集通道ID
     * @return 结果
     */
    @Override
    public int deleteSysDeviceById(Long id)
    {
        return sysDeviceMapper.deleteSysDeviceById(id);
    }
}
