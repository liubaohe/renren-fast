package io.renren.modules.project.controller;

import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.project.entity.SysMonitorCheckEntity;
import io.renren.modules.project.service.SysMonitorCheckService;
import io.renren.modules.sys.controller.AbstractController;
import io.renren.modules.sys.service.SysDeptService;
import io.renren.modules.sys.service.SysNoticeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/21 23:24
 */
@RestController
@RequestMapping("/project/monitor")
public class SysMonitorCheckController  {

    @Autowired
    private SysMonitorCheckService monitorCheckService;
    @Autowired
    private SysDeptService deptService;
    @Autowired
    private SysNoticeService noticeService;

    @PostMapping("/list")
    public R list(@RequestBody Map<String, Object> params){
        PageUtils page = monitorCheckService.queryMonitorCheckPage(params);
        return R.ok().put("page", page);
    }

    @PostMapping("/add")
    public R addMonitorTask(@RequestBody SysMonitorCheckEntity monitorCheckEntity){
         monitorCheckService.addMonitorCheck(monitorCheckEntity);
        return R.ok();
    }
    @PostMapping("/del")
    public R addMonitorTask(@RequestBody Map<String, Object> params){
        int monitorId=(Integer) params.get("monitorId");
        monitorCheckService.delMonitorCheck(monitorId);
        return R.ok();
    }

    @PostMapping("/detail")
    public R monitorTaskDetail(@RequestBody Map<String, Object> params){
        return R.ok().put("records", monitorCheckService.getMonitorCheckById(params));
    }
    @PostMapping("/feedBack")
    public R updateMonitorCheckFeddBack(@RequestBody SysMonitorCheckEntity monitorCheckEntity){
        monitorCheckService.updateMonitorCheckFeddBack(monitorCheckEntity);
        return R.ok();
    }
    @PostMapping("/deptList")
    public R getDeptList(@RequestBody  Map<String, Object> params){
        return R.ok().put("list",deptService.queryList(params));
    }

    @PostMapping("/noticeList")
    public R queryNoticePage(@RequestBody  Map<String, Object> params){
        return R.ok().put("list",noticeService.queryNoticePage(params));
    }

    @PostMapping("/noticeCount")
    public R queryNoticeCount(){
        return R.ok().put("count",noticeService.queryNoticeCount());
    }

    @PostMapping("/noticeDetail")
    public R queryNoticeDetail(@RequestBody  Map<String, Object> params){
        int noticeId =(Integer) params.get("noticeId");
        return R.ok().put("records",noticeService.queryNoticeById(noticeId));
    }

    @PostMapping("/updateNotice")
    public R updateNoticeStatus(@RequestBody  Map<String, Object> params){
        int noticeId =(Integer) params.get("noticeId");
        noticeService.updateNoticeStatus(noticeId);
        return R.ok();
    }

    @PostMapping("/total")
    public R totalMonitorCheckState(@RequestBody  Map<String, Object> params){
        return R.ok().put("records",monitorCheckService.totalMonitorCheckState(params));
    }
}
