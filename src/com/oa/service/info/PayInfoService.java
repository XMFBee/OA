package com.oa.service.info;

import com.oa.bean.info.PayInfo;
import com.oa.common.bean.Pager4EasyUI;

//郭玉清
public interface PayInfoService extends BaseService<PayInfo> {

	public Pager4EasyUI<PayInfo> queryPayInfoPage(int status, Pager4EasyUI<PayInfo> pager);
	
}
