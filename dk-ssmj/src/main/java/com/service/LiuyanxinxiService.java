package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.LiuyanxinxiEntity;
import java.util.Map;

/**
 *  服务类
 * @author 
 * @since 2021-02-26
 */
public interface LiuyanxinxiService extends IService<LiuyanxinxiEntity> {

     PageUtils queryPage(Map<String, Object> params);

}