package com.oa.dao.info;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.Department;
import com.oa.bean.Role;
import com.oa.bean.info.DepEmp;
import com.oa.common.bean.Pager4EasyUI;

public interface DepEmpDAOInfo {
	public Pager4EasyUI<DepEmp> query(Pager4EasyUI<DepEmp> pager);
	
	public Map<String,String> empSelect(Department dep);
	
	
	public Role queryRole(String rolename);
	
}
