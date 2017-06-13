package com.oa.service.info;

import com.oa.bean.info.MeettingInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface MeettingInfoService extends BaseService<MeettingInfo>{
	public Pager4EasyUI<MeettingInfo> queryBySearch(Pager4EasyUI<MeettingInfo> pager,String empName);
}
