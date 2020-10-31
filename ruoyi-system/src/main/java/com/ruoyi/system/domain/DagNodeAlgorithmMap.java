package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 节点算法对应对象 dag_node_algorithm_map
 * 
 * @author d
 * @date 2020-10-30
 */
public class DagNodeAlgorithmMap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 节点对应算法id */
    @Excel(name = "节点对应算法id")
    private Long nodeAlgorithmId;

    /** 算法接口名 */
    @Excel(name = "算法接口名")
    private String algorithmName;

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
    public void setAlgorithmName(String algorithmName) 
    {
        this.algorithmName = algorithmName;
    }

    public String getAlgorithmName() 
    {
        return algorithmName;
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
            .append("algorithmName", getAlgorithmName())
            .append("description", getDescription())
            .toString();
    }
}
