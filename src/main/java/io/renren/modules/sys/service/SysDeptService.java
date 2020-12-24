package io.renren.modules.sys.service;

import io.renren.modules.sys.entity.SysDeptEntity;

import java.util.List;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 13:20
 */
public interface SysDeptService {

    public List<SysDeptEntity> queryList(Map params);


    public SysDeptEntity querySysDeptById(long deptId);

    public List<SysDeptEntity>  querySysDeptByUserId(long userId);
}
