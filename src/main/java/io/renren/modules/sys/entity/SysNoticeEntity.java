package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 16:58
 */
@Data
@TableName("sys_notice")
public class SysNoticeEntity implements Serializable {
    @TableId
    private long noticeId;

    private String noticeTitle;

    private String noticeType;

    private String noticeContent;

    private long receiveStaff;

    private String status;

    private String remark;

    private Date createTime;

}
