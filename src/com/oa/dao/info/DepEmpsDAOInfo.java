package com.oa.dao.info;

import com.oa.bean.info.DepEmps;
import com.oa.common.bean.Pager4EasyUI;

public interface DepEmpsDAOInfo {
	public Pager4EasyUI<DepEmps> query(String sql, Pager4EasyUI<DepEmps> pager);
}
