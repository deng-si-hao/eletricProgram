package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 图片存储对象 sys_picture
 * 
 * @author d
 * @date 2020-10-16
 */
public class SysPicture extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 图片名称 */
    @Excel(name = "图片名称")
    private String name;

    /** 图片所属文件夹id */
    @Excel(name = "图片所属文件夹id")
    private Long pictureFolderId;

    /** 图片所属文件夹路径 */
    @Excel(name = "图片所属文件夹路径")
    private String picturePath;

    /** 上传时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上传时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date time;

    /** 备注 */
    @Excel(name = "备注")
    private String additionalInfo;

    /** 所属车辆id */
    @Excel(name = "所属车辆id")
    private Long assetId;

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
    public void setPictureFolderId(Long pictureFolderId) 
    {
        this.pictureFolderId = pictureFolderId;
    }

    public Long getPictureFolderId() 
    {
        return pictureFolderId;
    }
    public void setPicturePath(String picturePath) 
    {
        this.picturePath = picturePath;
    }

    public String getPicturePath() 
    {
        return picturePath;
    }
    public void setTime(Date time) 
    {
        this.time = time;
    }

    public Date getTime() 
    {
        return time;
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
            .append("pictureFolderId", getPictureFolderId())
            .append("picturePath", getPicturePath())
            .append("time", getTime())
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
