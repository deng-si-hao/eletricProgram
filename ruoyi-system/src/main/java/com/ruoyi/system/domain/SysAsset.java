package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车辆信息对象 sys_asset
 * 
 * @author d
 * @date 2020-10-16
 */
public class SysAsset extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "试验编号")
    private Long id;

    /** 车辆名称 */
    @Excel(name = "车辆名称")
    private String name;

    /** 车辆类别 */
    @Excel(name = "车辆类别")
    private String type;

    /** 车辆详情 */
    @Excel(name = "车辆详情")
    private String additionalInfo;

    /** 租户id */
    @Excel(name = "租户id")
    private Long tenantId;

    /** 所属单位 */
    @Excel(name = "所属单位")
    private String unit;

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
    public void setTenantId(Long tenantId) 
    {
        this.tenantId = tenantId;
    }

    public Long getTenantId() 
    {
        return tenantId;
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
            .append("tenantId", getTenantId())
            .append("unit", getUnit())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
