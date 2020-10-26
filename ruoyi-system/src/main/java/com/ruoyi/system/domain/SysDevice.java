package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 数据采集通道对象 sys_device
 * 
 * @author d
 * @date 2020-10-16
 */
public class SysDevice extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 采集通道名称 */
    @Excel(name = "采集通道名称")
    private String name;

    /** 数据类型 */
    @Excel(name = "数据类型")
    private String type;

    /** 备注 */
    @Excel(name = "备注")
    private String additionalInfo;

    /** 所属车辆id */
    @Excel(name = "所属车辆id")
    private Long assetId;

    /** 所属单位 */
    @Excel(name = "所属单位")
    private String unit;

    public SysDevice() {
    }

    public SysDevice(Long id, String name, String type, String additionalInfo, Long assetId, String unit) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.additionalInfo = additionalInfo;
        this.assetId = assetId;
        this.unit = unit;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setAdditionalInfo(String additionalInfo) 
    {
        this.additionalInfo = additionalInfo;
    }

    public String getAdditionalInfo() 
    {
        return additionalInfo;
    }
    public void setAssetId(Long assetId) 
    {
        this.assetId = assetId;
    }

    public Long getAssetId() 
    {
        return assetId;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("type", getType())
            .append("additionalInfo", getAdditionalInfo())
            .append("assetId", getAssetId())
            .append("unit", getUnit())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
