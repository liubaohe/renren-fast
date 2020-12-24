package io.renren.modules.project.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.project.entity.SysMonitorCheckEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/21 23:06
 */
@Mapper
public interface SysMonitorCheckDao extends BaseMapper<SysMonitorCheckEntity> {

    Page<SysMonitorCheckEntity> queryMonitorTask(IPage page, @Param("qryMap") Map params);


    int updateMonitorCheckFeedBack(SysMonitorCheckEntity monitorCheckEntity);

    int delMonitorCheck(long monitorId);

    int updateMonitorCheckState(Map params);

    List<Map> totalMonitorCheck(Map params);

    List<Map> totalWeekMonitorCheck(Map params);
}
