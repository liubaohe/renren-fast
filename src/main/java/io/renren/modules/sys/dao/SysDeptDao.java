package io.renren.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.sys.entity.SysDeptEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author liu.baohe
 * @version 1.0
 * @date 2020/12/22 13:16
 */
@Mapper
public interface SysDeptDao extends BaseMapper<SysDeptEntity> {
}
