package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.ChTreeSelect;
import com.ruoyi.common.core.domain.entity.SysChannel;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.SysChannelMapper;
import com.ruoyi.system.service.ISysChannelService;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 采集通道Service业务层处理
 *
 * @author ruoyi
 * @date 2020-10-19
 */
@Service
public class SysChannelServiceImpl implements ISysChannelService
{
    @Autowired
    private SysChannelMapper sysChannelMapper;

    /**
     * 查询采集通道
     *
     * @param channelId 采集通道ID
     * @return 采集通道
     */
    @Override
    public SysChannel selectSysChannelById(Long channelId)
    {
        return sysChannelMapper.selectSysChannelById(channelId);
    }

    /**
     * 查询采集通道列表
     *
     * @param sysChannel 采集通道
     * @return 采集通道
     */
    @Override
    public List<SysChannel> selectSysChannelList(SysChannel sysChannel)
    {
        return sysChannelMapper.selectSysChannelList(sysChannel);
    }

    @Override
    public List<SysChannel> buildChTree(List<SysChannel> sysChannel){
        List<SysChannel> returnList = new ArrayList<SysChannel>();
        List<Long> tempList = new ArrayList<Long>();
        for (SysChannel ch : sysChannel)
        {
            tempList.add(ch.getChannelId());
        }
        for (Iterator<SysChannel> iterator = sysChannel.iterator(); iterator.hasNext();)
        {
            SysChannel ch = (SysChannel) iterator.next();
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(ch.getParentId()))
            {
                recursionFn(sysChannel, ch);
                returnList.add(ch);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = sysChannel;
        }
        return returnList;
    }

    /**
     * 构建前端所需要下拉树结构
     *
     * @param sysChannel 部门列表
     * @return 下拉树结构列表
     */
    @Override
    public List<ChTreeSelect> buildChTreeSelect(List<SysChannel> sysChannel)
    {
        List<SysChannel> ChTrees = buildChTree(sysChannel);
        return ChTrees.stream().map(ChTreeSelect::new).collect(Collectors.toList());
    }
    /**
     * 新增采集通道
     *
     * @param sysChannel 采集通道
     * @return 结果
     */
    @Override
    public int insertSysChannel(SysChannel sysChannel)
    {
        sysChannel.setCreateTime(DateUtils.getNowDate());
        return sysChannelMapper.insertSysChannel(sysChannel);
    }

    /**
     * 修改采集通道
     *
     * @param sysChannel 采集通道
     * @return 结果
     */
    @Override
    public int updateSysChannel(SysChannel sysChannel)
    {
        sysChannel.setUpdateTime(DateUtils.getNowDate());
        return sysChannelMapper.updateSysChannel(sysChannel);
    }

    /**
     * 批量删除采集通道
     *
     * @param channelIds 需要删除的采集通道ID
     * @return 结果
     */
    @Override
    public int deleteSysChannelByIds(Long[] channelIds)
    {
        return sysChannelMapper.deleteSysChannelByIds(channelIds);
    }

    /**
     * 删除采集通道信息
     *
     * @param channelId 采集通道ID
     * @return 结果
     */
    @Override
    public int deleteSysChannelById(Long channelId)
    {
        return sysChannelMapper.deleteSysChannelById(channelId);
    }
    /**
     * 递归列表
     */
    private void recursionFn(List<SysChannel> list, SysChannel t)
    {
        // 得到子节点列表
        List<SysChannel> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysChannel tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<SysChannel> getChildList(List<SysChannel> list, SysChannel t)
    {
        List<SysChannel> tlist = new ArrayList<SysChannel>();
        Iterator<SysChannel> it = list.iterator();
        while (it.hasNext())
        {
            SysChannel n = (SysChannel) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getChannelId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysChannel> list, SysChannel t)
    {
        return getChildList(list, t).size() > 0 ? true : false;
    }

}
