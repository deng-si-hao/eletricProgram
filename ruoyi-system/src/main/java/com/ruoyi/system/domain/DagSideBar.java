package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 节点侧栏对象 dag_side_bar
 * 
 * @author d
 * @date 2020-10-30
 */
public class DagSideBar extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 图标 */
    @Excel(name = "图标")
    private String icon;

    /** 激活状态 */
    @Excel(name = "激活状态")
    private String active;

    /** 模型参数 */
    @Excel(name = "模型参数")
    private String form;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 节点对应算法id */
    @Excel(name = "节点对应算法id")
    private Long nodeAlgorithmId;

    /** 父id */
    @Excel(name = "父id")
    private Long parentId;

    /** 祖级列表 */
    @Excel(name = "祖级列表")
    private String ancestors;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }
    public void setActive(String active) 
    {
        this.active = active;
    }

    public String getActive() 
    {
        return active;
    }
    public void setForm(String form) 
    {
        this.form = form;
    }

    public String getForm() 
    {
        return form;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setNodeAlgorithmId(Long nodeAlgorithmId) 
    {
        this.nodeAlgorithmId = nodeAlgorithmId;
    }

    public Long getNodeAlgorithmId() 
    {
        return nodeAlgorithmId;
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
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
    {
        return orderNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("icon", getIcon())
            .append("active", getActive())
            .append("form", getForm())
            .append("name", getName())
            .append("nodeAlgorithmId", getNodeAlgorithmId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
