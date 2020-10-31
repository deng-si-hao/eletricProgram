package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 连线对象 dag_compute_case_edges
 * 
 * @author d
 * @date 2020-10-30
 */
public class DagComputeCaseEdges extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 算例id */
    @Excel(name = "算例id")
    private Long computeCaseId;

    /** 目标节点接口索引 */
    @Excel(name = "目标节点接口索引")
    private Long dstInputIdx;

    /** 目标节点id */
    @Excel(name = "目标节点id")
    private Long dstNodeId;

    /** 源节点id */
    @Excel(name = "源节点id")
    private Long srcNodeId;

    /** 源节点接口索引 */
    @Excel(name = "源节点接口索引")
    private Long srcOutputIdx;

    /** 连线说明 */
    @Excel(name = "连线说明")
    private String edgestext;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setComputeCaseId(Long computeCaseId) 
    {
        this.computeCaseId = computeCaseId;
    }

    public Long getComputeCaseId() 
    {
        return computeCaseId;
    }
    public void setDstInputIdx(Long dstInputIdx) 
    {
        this.dstInputIdx = dstInputIdx;
    }

    public Long getDstInputIdx() 
    {
        return dstInputIdx;
    }
    public void setDstNodeId(Long dstNodeId) 
    {
        this.dstNodeId = dstNodeId;
    }

    public Long getDstNodeId() 
    {
        return dstNodeId;
    }
    public void setSrcNodeId(Long srcNodeId) 
    {
        this.srcNodeId = srcNodeId;
    }

    public Long getSrcNodeId() 
    {
        return srcNodeId;
    }
    public void setSrcOutputIdx(Long srcOutputIdx) 
    {
        this.srcOutputIdx = srcOutputIdx;
    }

    public Long getSrcOutputIdx() 
    {
        return srcOutputIdx;
    }
    public void setEdgestext(String edgestext) 
    {
        this.edgestext = edgestext;
    }

    public String getEdgestext() 
    {
        return edgestext;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("computeCaseId", getComputeCaseId())
            .append("dstInputIdx", getDstInputIdx())
            .append("dstNodeId", getDstNodeId())
            .append("srcNodeId", getSrcNodeId())
            .append("srcOutputIdx", getSrcOutputIdx())
            .append("edgestext", getEdgestext())
            .toString();
    }
}
