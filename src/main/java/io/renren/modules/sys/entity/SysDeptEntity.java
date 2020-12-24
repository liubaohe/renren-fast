package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 13:16
 */
@Data
@TableName("sys_dept")
public class SysDeptEntity implements Serializable {
    private long deptId;
    private long parentId;
    private String ancestors;
    private String deptName;
    private int orderNum;
    private int deptType;
    private long approveLeader;
    private String phone;
    private String status;
    private String delFlag;
    private long createBy;
    private Date createTime;
    private long updateBy;
    private Date updateTime;
}
