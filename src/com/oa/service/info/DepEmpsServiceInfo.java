package com.oa.service.info;

import java.util.Map;

import com.oa.bean.Department;
import com.oa.bean.info.DepEmps;
import com.oa.common.bean.Pager4EasyUI;

public interface DepEmpsServiceInfo {
	public Pager4EasyUI<DepEmps> query(String sql, Pager4EasyUI<DepEmps> pager);
}
