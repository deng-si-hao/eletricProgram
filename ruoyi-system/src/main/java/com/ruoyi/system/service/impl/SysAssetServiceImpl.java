package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import javafx.scene.control.ListViewBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAssetMapper;
import com.ruoyi.system.domain.SysAsset;
import com.ruoyi.system.service.ISysAssetService;

/**
 * 车辆信息Service业务层处理
 * 
 * @author d
 * @date 2020-10-16
 */
@Service
public class SysAssetServiceImpl implements ISysAssetService 
{
    @Autowired
    private SysAssetMapper sysAssetMapper;

    private static final Logger log = LoggerFactory.getLogger(SysAssetServiceImpl.class);

    /**
     * 查询车辆信息
     * 
     * @param id 车辆信息ID
     * @return 车辆信息
     */
    @Override
    public SysAsset selectSysAssetById(Long id)
    {
        return sysAssetMapper.selectSysAssetById(id);
    }

    /**
     * 查询车辆信息列表
     * 
     * @param sysAsset 车辆信息
     * @return 车辆信息
     */
    @Override
    public List<SysAsset> selectSysAssetList(SysAsset sysAsset)
    {
        return sysAssetMapper.selectSysAssetList(sysAsset);
    }

    /**
     * 新增车辆信息
     * 
     * @param sysAsset 车辆信息
     * @return 结果
     */
    @Override
    public int insertSysAsset(SysAsset sysAsset)
    {
        sysAsset.setCreateTime(DateUtils.getNowDate());
        return sysAssetMapper.insertSysAsset(sysAsset);
    }

    /**
     * 修改车辆信息
     * 
     * @param sysAsset 车辆信息
     * @return 结果
     */
    @Override
    public int updateSysAsset(SysAsset sysAsset)
    {
        sysAsset.setUpdateTime(DateUtils.getNowDate());
        return sysAssetMapper.updateSysAsset(sysAsset);
    }

    /**
     * 批量删除车辆信息
     * 
     * @param ids 需要删除的车辆信息ID
     * @return 结果
     */
    @Override
    public int deleteSysAssetByIds(Long[] ids)
    {
        return sysAssetMapper.deleteSysAssetByIds(ids);
    }

    /**
     * 删除车辆信息信息
     * 
     * @param id 车辆信息ID
     * @return 结果
     */
    @Override
    public int deleteSysAssetById(Long id)
    {
        return sysAssetMapper.deleteSysAssetById(id);
    }

    @Override
    public int addMysqlList(List<SysAsset> assets) {
        for(SysAsset asset:assets){
            if(asset.getCreateTime() == null){
                asset.setCreateTime(DateUtils.getNowDate());
            }
        }
        return sysAssetMapper.addListMysql(assets);
    }

    @Override
    public String importData(List<SysAsset> assetList, boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(assetList) || assetList.size() == 0)
        {
            throw new CustomException("导入数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
//        String password = configService.selectConfigByKey("sys.user.initPassword");
        for (SysAsset asset : assetList)
        {
            try
            {
                // 验证是否存在这个用户
                SysAsset a = sysAssetMapper.selectSysAssetById(asset.getId());
                if (StringUtils.isNull(a))
                {
                    asset.setCreateBy(operName);
                    this.insertSysAsset(asset);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、汽车 " + asset.getName() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    asset.setUpdateBy(operName);
                    this.updateSysAsset(asset);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、汽车 " + asset.getName() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、汽车 " + asset.getName() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、汽车 " + asset.getName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new CustomException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

}
