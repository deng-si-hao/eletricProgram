package com.ruoyi.common.core.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.ruoyi.common.core.domain.entity.SysChannel;
import com.ruoyi.common.core.domain.entity.SysMenu;
import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Treeselect树结构实体类
 *
 * @author ruoyi
 */
public class ChTreeSelect implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 节点ID */
    private Long id;

    /** 节点名称 */
    private String label;

    /** 子节点 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<ChTreeSelect> children;

    public ChTreeSelect()
    {

    }

    public ChTreeSelect(SysChannel dept)
    {
        this.id = dept.getChannelId();
        this.label = dept.getChannelName();
        this.children = dept.getChildren().stream().map(ChTreeSelect::new).collect(Collectors.toList());
    }

    public ChTreeSelect(SysMenu menu)
    {
        this.id = menu.getMenuId();
        this.label = menu.getMenuName();
        this.children = menu.getChildren().stream().map(ChTreeSelect::new).collect(Collectors.toList());
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getLabel()
    {
        return label;
    }

    public void setLabel(String label)
    {
        this.label = label;
    }

    public List<ChTreeSelect> getChildren()
    {
        return children;
    }

    public void setChildren(List<ChTreeSelect> children)
    {
        this.children = children;
    }
}
