package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.ChTreeSelect;
import com.ruoyi.common.core.domain.entity.SysChannel;
import java.util.List;

/**
 * 采集通道Service接口
 *
 * @author ruoyi
 * @date 2020-10-19
 */
public interface ISysChannelService
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
     * 构建通道列表
     *
     * @param sysChannel 采集通道
     * @return 结果
     */
    public List<SysChannel> buildChTree(List<SysChannel> sysChannel);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param sysChannel 部门列表
     * @return 下拉树结构列表
     */
    public List<ChTreeSelect> buildChTreeSelect(List<SysChannel> sysChannel);
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
     * 批量删除采集通道
     *
     * @param channelIds 需要删除的采集通道ID
     * @return 结果
     */
    public int deleteSysChannelByIds(Long[] channelIds);

    /**
     * 删除采集通道信息
     *
     * @param channelId 采集通道ID
     * @return 结果
     */
    public int deleteSysChannelById(Long channelId);
}
