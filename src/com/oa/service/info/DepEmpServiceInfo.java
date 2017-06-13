package com.oa.service.info;

import java.util.Map;

import com.oa.bean.Department;
import com.oa.bean.Role;
import com.oa.bean.info.DepEmp;
import com.oa.common.bean.Pager4EasyUI;

public interface DepEmpServiceInfo {
	public Pager4EasyUI<DepEmp> queryPager(Pager4EasyUI<DepEmp> pager);
	public Map<String,String> empSelect(Department dep);
	public Role queryRole(String rolename);
	
}
