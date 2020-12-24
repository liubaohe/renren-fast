package io.renren.modules.project.service;

import io.renren.common.utils.PageUtils;
import io.renren.modules.project.entity.SysMonitorCheckEntity;

import java.util.List;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/21 23:12
 */
public interface SysMonitorCheckService {

    /**
     * 查询监督信息列表
     * @param params
     * @return
     */
    PageUtils queryMonitorCheckPage(Map<String, Object> params);

    /**
     * 添加任务
     * @param monitorCheckEntity
     * @return
     */
    int addMonitorCheck(SysMonitorCheckEntity monitorCheckEntity);

    /**
     * 更新反馈信息
     * @param monitorCheckEntity
     * @return
     */
    int updateMonitorCheckFeddBack(SysMonitorCheckEntity monitorCheckEntity);

    /**
     * 删除监督任务信息
     * @param monitorId
     * @return
     */
    int delMonitorCheck(int monitorId);


    SysMonitorCheckEntity getMonitorCheckById(Map params);

    List<SysMonitorCheckEntity> queryNoFinishMonitorCheck();

    int updateMonitorCheckState(Map params);

    Map totalMonitorCheckState(Map params);
}
