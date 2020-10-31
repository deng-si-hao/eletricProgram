package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 节点数据对象 dag_compute_case_nodes
 * 
 * @author d
 * @date 2020-10-30
 */
public class DagComputeCaseNodes extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 节点对应算法id */
    @Excel(name = "节点对应算法id")
    private Long nodeAlgorithmId;

    /** 算例id */
    @Excel(name = "算例id")
    private Long computeCaseId;

    /** 节点名称 */
    @Excel(name = "节点名称")
    private String name;

    /** 输入接口 */
    @Excel(name = "输入接口")
    private String inPorts;

    /** 输出接口 */
    @Excel(name = "输出接口")
    private String outPorts;

    /** 横坐标 */
    @Excel(name = "横坐标")
    private String posX;

    /** 纵坐标 */
    @Excel(name = "纵坐标")
    private String posY;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 小图标 */
    @Excel(name = "小图标")
    private String icon;

    /** 说明 */
    @Excel(name = "说明")
    private String description;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setNodeAlgorithmId(Long nodeAlgorithmId) 
    {
        this.nodeAlgorithmId = nodeAlgorithmId;
    }

    public Long getNodeAlgorithmId() 
    {
        return nodeAlgorithmId;
    }
    public void setComputeCaseId(Long computeCaseId) 
    {
        this.computeCaseId = computeCaseId;
    }

    public Long getComputeCaseId() 
    {
        return computeCaseId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setInPorts(String inPorts) 
    {
        this.inPorts = inPorts;
    }

    public String getInPorts() 
    {
        return inPorts;
    }
    public void setOutPorts(String outPorts) 
    {
        this.outPorts = outPorts;
    }

    public String getOutPorts() 
    {
        return outPorts;
    }
    public void setPosX(String posX) 
    {
        this.posX = posX;
    }

    public String getPosX() 
    {
        return posX;
    }
    public void setPosY(String posY) 
    {
        this.posY = posY;
    }

    public String getPosY() 
    {
        return posY;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("nodeAlgorithmId", getNodeAlgorithmId())
            .append("computeCaseId", getComputeCaseId())
            .append("name", getName())
            .append("inPorts", getInPorts())
            .append("outPorts", getOutPorts())
            .append("posX", getPosX())
            .append("posY", getPosY())
            .append("type", getType())
            .append("icon", getIcon())
            .append("description", getDescription())
            .toString();
    }
}
