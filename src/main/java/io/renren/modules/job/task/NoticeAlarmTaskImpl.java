package io.renren.modules.job.task;

import io.renren.common.utils.DateUtils;
import io.renren.modules.project.entity.SysMonitorCheckEntity;
import io.renren.modules.project.service.SysMonitorCheckService;
import io.renren.modules.sys.entity.SysDeptEntity;
import io.renren.modules.sys.entity.SysNoticeEntity;
import io.renren.modules.sys.service.SysDeptService;
import io.renren.modules.sys.service.SysNoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 21:35
 */
@Component("noticeAlarmTask")
public class NoticeAlarmTaskImpl implements NoticeAlarmTask {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private SysNoticeService noticeService;
    @Autowired
    private SysMonitorCheckService monitorCheckService;
    @Autowired
    private SysDeptService deptService;
    @Override
    public void run(String params) {
        logger.debug("noticeAlarmTask定时任务正在执行，参数为：{}", params);
        try {
            List<SysMonitorCheckEntity> rsList = monitorCheckService.queryNoFinishMonitorCheck();
            if(rsList !=null && rsList.size()>0){
                for(SysMonitorCheckEntity monitorCheckEntity:rsList){
                   int days= DateUtils.daysBetween(monitorCheckEntity.getCreateTime(),new Date());
                   if(days>5){
                       //如果5天未完成需要预警
                       //接受任务，审批人信息
                       SysDeptEntity deptEntity =deptService.querySysDeptById(monitorCheckEntity.getDeptId());
                       long approveUserId= deptEntity.getApproveLeader();
                       SysNoticeEntity noticeEntity = new SysNoticeEntity();
                       noticeEntity.setStatus("0");
                       noticeEntity.setCreateTime(new Date());
                       //0 通知 1 预警
                       noticeEntity.setNoticeType("1");
                       noticeEntity.setReceiveStaff(approveUserId);
                       noticeEntity.setNoticeTitle("预警通知:你收到一条任务信息即将超时，请及时处理!");
                       noticeEntity.setNoticeContent(monitorCheckEntity.getMonitorTask());
                       noticeService.addNotice(noticeEntity);
                       Map paramMap=new HashMap<>();
                       paramMap.put("monitorState","2");
                       paramMap.put("monitorId",monitorCheckEntity.getMonitorId());
                       monitorCheckService.updateMonitorCheckState(paramMap);
                   }
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }
}
