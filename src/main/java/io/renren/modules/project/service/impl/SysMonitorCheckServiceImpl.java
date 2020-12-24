package io.renren.modules.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.project.dao.SysMonitorCheckDao;
import io.renren.modules.project.entity.SysMonitorCheckEntity;
import io.renren.modules.project.service.SysMonitorCheckService;
import io.renren.modules.sys.entity.SysDeptEntity;
import io.renren.modules.sys.entity.SysNoticeEntity;
import io.renren.modules.sys.entity.SysRoleEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysDeptService;
import io.renren.modules.sys.service.SysNoticeService;
import io.renren.modules.sys.service.SysUserRoleService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.java2d.pipe.SolidTextRenderer;
import sun.tools.tree.LessExpression;

import java.util.*;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/21 23:15
 */
@Service
public class SysMonitorCheckServiceImpl extends ServiceImpl<SysMonitorCheckDao, SysMonitorCheckEntity> implements SysMonitorCheckService {
    @Autowired
    private SysDeptService deptService;
    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private SysNoticeService noticeService;

    @Override
    public PageUtils queryMonitorCheckPage(Map<String, Object> params) {
        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userEntity.getUserId());
        boolean isJDXF = false;
        boolean isAdmin = true;
        if (userEntity.getUserId() != Constant.SUPER_ADMIN) {
            isAdmin = false;
        }
        if (roleIdList != null && roleIdList.size() > 0) {
            for (long l : roleIdList) {
                if (l == 1) {
                    isJDXF = true;
                    break;
                }
            }
        }
        List<Long> deptList = new ArrayList<>();
        if (!isJDXF) {
            //监督接受任务的，根据部门id来查询
            List<SysDeptEntity> deptEntities = deptService.querySysDeptByUserId(userEntity.getUserId());
            if (deptEntities != null && deptEntities.size() > 0) {
                for (SysDeptEntity dept : deptEntities) {
                    deptList.add(dept.getDeptId());
                }

            }
        }
        //查询需要根据角色判断
        String monitorTitle = (String) params.get("monitorTitle");
        String monitorState = (String) params.get("monitorState");
        if (isAdmin) {
            IPage<SysMonitorCheckEntity> page = this.page(
                    new Query<SysMonitorCheckEntity>().getPage(params),
                    new QueryWrapper<SysMonitorCheckEntity>()
                            .like(StringUtils.isNotBlank(monitorTitle), "monitor_title", monitorTitle)
                            .eq(StringUtils.isNotBlank(monitorState), "monitor_state", monitorState)
                            .eq("state", "A")
                            .orderBy(true, false, "create_time")
            );
            return new PageUtils(page);
        } else {
            IPage<SysMonitorCheckEntity> page = this.page(
                    new Query<SysMonitorCheckEntity>().getPage(params),
                    new QueryWrapper<SysMonitorCheckEntity>()
                            .like(StringUtils.isNotBlank(monitorTitle), "monitor_title", monitorTitle)
                            .eq(StringUtils.isNotBlank(monitorState), "monitor_state", monitorState)
                            .eq("state", "A")
                            .eq(isJDXF, "create_staff", userEntity.getUserId())
                            .in(!isJDXF, "dept_id", deptList)
                            .orderBy(true, false, "create_time")
            );
            return new PageUtils(page);
        }

    }

    @Override
    public int addMonitorCheck(SysMonitorCheckEntity monitorCheckEntity) {
        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        monitorCheckEntity.setCreateStaff(userEntity.getUserId());
        monitorCheckEntity.setCreateStaffName(userEntity.getUsername());
        SysDeptEntity deptEntity = deptService.querySysDeptById(monitorCheckEntity.getDeptId());
        monitorCheckEntity.setDeptName(deptEntity.getDeptName());
        monitorCheckEntity.setCreateTime(new Date());
        monitorCheckEntity.setState("A");
        monitorCheckEntity.setMonitorState("0");
        boolean flag = this.save(monitorCheckEntity);
        if (flag) {
            //接受任务，审批人信息
            long approveUserId = deptEntity.getApproveLeader();
            //保存
            SysNoticeEntity noticeEntity = new SysNoticeEntity();
            noticeEntity.setStatus("0");
            noticeEntity.setCreateTime(new Date());
            //0 通知 1 预警
            noticeEntity.setNoticeType("0");
            noticeEntity.setReceiveStaff(approveUserId);
            noticeEntity.setNoticeTitle("温馨提醒:你收到一条任务信息，请及时处理!");
            noticeEntity.setNoticeContent(monitorCheckEntity.getMonitorTask());
            noticeService.addNotice(noticeEntity);
            return 1;
        }
        return 0;
    }

    @Override
    public int updateMonitorCheckFeddBack(SysMonitorCheckEntity monitorCheckEntity) {
        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        monitorCheckEntity.setFinishStaff(userEntity.getUserId());
        monitorCheckEntity.setFinishStaffName(userEntity.getUsername());
        return baseMapper.updateMonitorCheckFeedBack(monitorCheckEntity);
    }

    @Override
    public int delMonitorCheck(int monitorId) {
        return baseMapper.delMonitorCheck(monitorId);
    }

    @Override
    public SysMonitorCheckEntity getMonitorCheckById(Map params) {
        String monitorId = params.get("monitorId").toString();
        return this.getOne(new QueryWrapper<SysMonitorCheckEntity>().eq(true, "monitor_id", monitorId));
    }

    @Override
    public List<SysMonitorCheckEntity> queryNoFinishMonitorCheck() {
        List<SysMonitorCheckEntity> rsList = baseMapper.selectList(new QueryWrapper<SysMonitorCheckEntity>().eq("monitor_state", "0").eq("state", "A"));
        return rsList;
    }

    @Override
    public int updateMonitorCheckState(Map params) {
        return baseMapper.updateMonitorCheckState(params);
    }

    @Override
    public Map totalMonitorCheckState(Map params) {
        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userEntity.getUserId());
        boolean isJDXF = false;
        boolean isAdmin = true;
        List<Long> deptList = new ArrayList<>();
        if (!String.valueOf(userEntity.getUserId()).equals(Constant.SUPER_ADMIN+"")) {
            isAdmin = false;
            if (roleIdList != null && roleIdList.size() > 0) {
                for (long l : roleIdList) {
                    if (l == 1) {
                        isJDXF = true;
                        break;
                    }
                }
            }
            if (!isJDXF) {
                //监督接受任务的，根据部门id来查询
                List<SysDeptEntity> deptEntities = deptService.querySysDeptByUserId(userEntity.getUserId());
                if (deptEntities != null && deptEntities.size() > 0) {
                    for (SysDeptEntity dept : deptEntities) {
                        deptList.add(dept.getDeptId());
                    }

                }
            }
        }
        Map qryMap = new HashMap();
        if (isJDXF) {
            qryMap.put("userId", userEntity.getUserId());
        } else {
            if (deptList != null && deptList.size() > 0) {
                qryMap.put("deptList", deptList);
            }
        }
        List<Map> rsList = baseMapper.totalMonitorCheck(qryMap);
        long finishNum = 0, timeOutNum = 0, totalNum = 0, noFinishNum = 0;
        if (rsList != null && rsList.size() > 0) {
            for (Map tmp : rsList) {
                String state = (String) tmp.get("monitor_state");
                long num = (Long) tmp.get("num");
                if ("0".equals(state)) {
                    noFinishNum += num;
                } else if ("1".equals(state)) {
                    finishNum += num;
                } else if ("2".equals(state)) {
                    timeOutNum += num;
                }
            }
            totalNum = finishNum + timeOutNum + noFinishNum;
        }
        //查询近一周的折线数据
        qryMap.put("monitorState","0");
        List<Map> lineList = baseMapper.totalWeekMonitorCheck(qryMap);
        List<Long> noFinishList = new ArrayList<>();
        Set<String> xAxisSet=new HashSet<>();
        for(Map tmp:lineList){
            String dateStr=tmp.get("day_date").toString();
            long num = (Long) tmp.get("num");
            xAxisSet.add(dateStr);
            noFinishList.add(num);
        }
        List<Long> finishList = new ArrayList<>();
        qryMap.put("monitorState","1");
        lineList = baseMapper.totalWeekMonitorCheck(qryMap);
        for(Map tmp:lineList){
            long num = (Long) tmp.get("num");
            finishList.add(num);
        }
        qryMap.put("monitorState","2");
        lineList = baseMapper.totalWeekMonitorCheck(qryMap);
        List<Long> timeOutList = new ArrayList<>();
        for(Map tmp:lineList){
            long num = (Long) tmp.get("num");
            timeOutList.add(num);
        }
        List<String> xAxisList = new ArrayList<>(xAxisSet);
        Map lineMap =new HashMap();
        lineMap.put("xAxis",xAxisList);
        lineMap.put("finish",finishList);
        lineMap.put("noFinish",noFinishList);
        lineMap.put("timeOut",timeOutList);

        Map rsMap = new HashMap();
        rsMap.put("finish", finishNum);
        rsMap.put("noFinish", noFinishNum);
        rsMap.put("timeOut", timeOutNum);
        rsMap.put("total", totalNum);
        rsMap.put("line",lineMap);
        return rsMap;
    }
}
