package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.project.entity.SysMonitorCheckEntity;
import io.renren.modules.sys.dao.SysDeptDao;
import io.renren.modules.sys.dao.SysNoticeDao;
import io.renren.modules.sys.entity.SysDeptEntity;
import io.renren.modules.sys.entity.SysNoticeEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysDeptService;
import io.renren.modules.sys.service.SysNoticeService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.util.EnumSet;
import java.util.List;
import java.util.Map;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 17:05
 */
@Service
public class SysNoticeServiceImpl extends ServiceImpl<SysNoticeDao, SysNoticeEntity> implements SysNoticeService {
    @Override
    public PageUtils queryNoticePage(Map<String, Object> params) {
        SysUserEntity userEntity= (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String noticeTitle = (String)params.get("noticeTitle");
        String noticeType = (String)params.get("noticeType");
        String status = (String)params.get("status");
        if(StringUtils.isEmpty(status)){
            status="0";
        }
        IPage<SysNoticeEntity> page = this.page(
                new Query<SysNoticeEntity>().getPage(params),
                new QueryWrapper<SysNoticeEntity>()
                        .like(StringUtils.isNotBlank(noticeTitle),"notice_title", noticeTitle)
                        .eq(StringUtils.isNotBlank(noticeType),"notice_type", noticeType)
                        .eq("status", status)
                        .eq("receive_staff", userEntity.getUserId())
                        .orderBy(true,false,"create_time")
        );
        return new PageUtils(page);
    }

    @Override
    public SysNoticeEntity queryNoticeById(int noticeId) {
        return baseMapper.selectOne(new QueryWrapper<SysNoticeEntity>().eq("notice_id", noticeId));
    }

    @Override
    public int updateNoticeStatus(int noticeId) {
        baseMapper.updateNoticeState(noticeId);
        return 0;
    }

    @Override
    public int addNotice(SysNoticeEntity noticeEntity) {
        this.save(noticeEntity);
        return 0;
    }

    @Override
    public int queryNoticeCount() {
        SysUserEntity userEntity= (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<SysNoticeEntity> rsList = baseMapper.selectList(new QueryWrapper<SysNoticeEntity>() .eq("status", "0")
                .eq("receive_staff", userEntity.getUserId()));
        if(rsList ==null || rsList.size()==0){
            return 0;
        } else{
            return rsList.size();
        }
    }

    @Override
    public List<SysNoticeEntity> queryNoReadNoticeList() {
        List<SysNoticeEntity> rsList = baseMapper.selectList(new QueryWrapper<SysNoticeEntity>().eq("status", "0"));
        return rsList;
    }
}
