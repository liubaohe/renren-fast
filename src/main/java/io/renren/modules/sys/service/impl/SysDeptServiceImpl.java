package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.Query;
import io.renren.modules.project.entity.SysMonitorCheckEntity;
import io.renren.modules.sys.dao.SysConfigDao;
import io.renren.modules.sys.dao.SysDeptDao;
import io.renren.modules.sys.entity.SysConfigEntity;
import io.renren.modules.sys.entity.SysDeptEntity;
import io.renren.modules.sys.service.SysConfigService;
import io.renren.modules.sys.service.SysDeptService;
import jdk.net.SocketFlow;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 13:22
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptDao, SysDeptEntity> implements SysDeptService {
    @Override
    public List<SysDeptEntity> queryList(Map params) {
        return this.list(new QueryWrapper<SysDeptEntity>()
                .eq(true,"dept_type","2")
                .eq(true, "status","0"));
    }

    @Override
    public SysDeptEntity querySysDeptById(long deptId) {
        return  this.getOne( new QueryWrapper<SysDeptEntity>().eq(true,"dept_id",deptId));
    }

    @Override
    public List<SysDeptEntity>  querySysDeptByUserId(long userId) {
        return  this.list( new QueryWrapper<SysDeptEntity>().eq(true,"approve_leader",userId));
    }
}
