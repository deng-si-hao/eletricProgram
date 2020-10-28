package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 采集通道对象 sys_channel
 *
 * @author ruoyi
 * @date 2020-10-19
 */
public class SysChannel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 通道id */
    private Long channelId;

    /** 一级目录id */
    @Excel(name = "一级目录id")
    private Long parentId;

    /** 祖级列表 */
    @Excel(name = "祖级列表")
    private String ancestors;

    /** 通道名称 */
    @Excel(name = "通道名称")
    private String channelName;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 所属车辆id */
    @Excel(name = "所属车辆id")
    private Long carId;

    public List<SysChannel> getChildren() {
        return children;
    }

    public void setChildren(List<SysChannel> children) {
        this.children = children;
    }

    /** 子通道 */
    private List<SysChannel> children = new ArrayList<SysChannel>();

    public void setChannelId(Long channelId)
    {
        this.channelId = channelId;
    }

    public Long getChannelId()
    {
        return channelId;
    }
    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Long getParentId()
    {
        return parentId;
    }
    public void setAncestors(String ancestors)
    {
        this.ancestors = ancestors;
    }

    public String getAncestors()
    {
        return ancestors;
    }
    public void setChannelName(String channelName)
    {
        this.channelName = channelName;
    }

    public String getChannelName()
    {
        return channelName;
    }
    public void setOrderNum(Long orderNum)
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum()
    {
        return orderNum;
    }
    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getUnit()
    {
        return unit;
    }
    public void setCarId(Long carId)
    {
        this.carId = carId;
    }

    public Long getCarId()
    {
        return carId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("channelId", getChannelId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("channelName", getChannelName())
            .append("orderNum", getOrderNum())
            .append("unit", getUnit())
            .append("carId", getCarId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
