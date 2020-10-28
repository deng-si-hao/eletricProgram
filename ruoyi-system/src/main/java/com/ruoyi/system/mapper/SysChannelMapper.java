package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysChannel;
import java.util.List;

/**
 * 采集通道Mapper接口
 *
 * @author ruoyi
 * @date 2020-10-19
 */
public interface SysChannelMapper
{
    /**
     * 查询采集通道
     *
     * @param channelId 采集通道ID
     * @return 采集通道
     */
    public SysChannel selectSysChannelById(Long channelId);

    /**
     * 查询采集通道列表
     *
     * @param sysChannel 采集通道
     * @return 采集通道集合
     */
    public List<SysChannel> selectSysChannelList(SysChannel sysChannel);

    /**
     * 新增采集通道
     *
     * @param sysChannel 采集通道
     * @return 结果
     */
    public int insertSysChannel(SysChannel sysChannel);

    /**
     * 修改采集通道
     *
     * @param sysChannel 采集通道
     * @return 结果
     */
    public int updateSysChannel(SysChannel sysChannel);

    /**
     * 删除采集通道
     *
     * @param channelId 采集通道ID
     * @return 结果
     */
    public int deleteSysChannelById(Long channelId);

    /**
     * 批量删除采集通道
     *
     * @param channelIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysChannelByIds(Long[] channelIds);
}
