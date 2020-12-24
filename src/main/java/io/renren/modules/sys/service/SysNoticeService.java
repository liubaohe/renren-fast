package io.renren.modules.sys.service;

import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.SysNoticeEntity;

import java.util.List;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 17:02
 */
public interface SysNoticeService {

    PageUtils queryNoticePage(Map<String, Object> params);

    SysNoticeEntity queryNoticeById(int noticeId);

    int updateNoticeStatus(int noticeId);

    int addNotice(SysNoticeEntity noticeEntity);


    int queryNoticeCount();

    List<SysNoticeEntity> queryNoReadNoticeList();
}
