package com.oa.dao.info;

import com.oa.bean.info.MeettingInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface MeettingInfoDAO extends BaseDAO<MeettingInfo>{
	public Pager4EasyUI<MeettingInfo> queryBySearch(Pager4EasyUI<MeettingInfo> pager,String empName);
}
