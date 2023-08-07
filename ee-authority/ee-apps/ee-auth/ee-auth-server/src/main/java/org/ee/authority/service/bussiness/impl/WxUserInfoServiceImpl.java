package org.ee.authority.service.bussiness.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.ee.authority.entity.bussiness.WxUserInfo;
import org.ee.authority.mapper.bussiness.WxUserInfoMapper;
import org.ee.authority.service.bussiness.WxUserInfoService;
import org.springframework.stereotype.Service;

/**
 * @author ss_419
 */
@Service("wxUserInfoService")
public class WxUserInfoServiceImpl extends ServiceImpl<WxUserInfoMapper, WxUserInfo>
    implements WxUserInfoService {

}