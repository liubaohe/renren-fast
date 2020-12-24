package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.sys.entity.SysNoticeEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 17:02
 */
@Mapper
public interface SysNoticeDao extends BaseMapper<SysNoticeEntity> {
    int updateNoticeState(int noticeId);
}
