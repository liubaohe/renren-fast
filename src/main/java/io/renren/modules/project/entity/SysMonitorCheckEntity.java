package io.renren.modules.project.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/21 23:06
 */
@Data
@TableName("sys_monitor_check")
public class SysMonitorCheckEntity implements Serializable {
    @TableId
    private int monitorId;
    private String monitorTitle;
    private String monitorTask;
    private int deptId;
    private String deptName;
    private String monitorFeedBack;
    private Date createTime;
    private long createStaff;
    private String createStaffName;
    private Date finishTime;
    private long finishStaff;
    private String finishStaffName;
    private String monitorState;
    private String state;

    public String getMonitorState() {
        if(monitorState !=null && "".equals(monitorState) ){
            if("0".equals(monitorState)){
                return "未完成";
            } else if("1".equals(monitorState)){
                return "已完成";
            } else if("2".equals(monitorState)){
                return "超时";
            }
        }
        return monitorState;
    }
}
