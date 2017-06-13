package com.oa.service.info;

import com.oa.bean.info.DepEmps;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.info.DepEmpsDAOInfo;

public class DepEmpsServiceInfoImpl implements DepEmpsServiceInfo{
	private DepEmpsDAOInfo depEmpsDAOInfo;

	public void setDepEmpsDAOInfo(DepEmpsDAOInfo depEmpsDAOInfo) {
		this.depEmpsDAOInfo = depEmpsDAOInfo;
	}

	@Override
	public Pager4EasyUI<DepEmps> query(String sql, Pager4EasyUI<DepEmps> pager) {
		return depEmpsDAOInfo.query(sql, pager);
	}

	
}
