package com.oa.service;

import java.util.List;
import java.util.Map;

import com.oa.bean.Department;

public interface DepartmentService extends BaseService<Department>{
	public Map<String,String> queryAll();
	
	public void updateDep(Department dep);
	public void giveDeptEmp(String depid,String empid);
	public String queryDepidByEmp(String empid);//以员工id相看该员工是否是该部门的经理
	
	public String queryDepNameByDepId(String depid);//以部门id查找部门名称
	
	/**
	 * 以部门名称得到相应的管理角色与普通角色
	 * @param depName
	 * @return
	 */
	public List<String> normRoleName(String depName);
	public String managerRoleName(String depName);
	
}
