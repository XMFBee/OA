package com.oa.dao;

import java.util.Map;

import com.oa.bean.Department;

public interface DepartmentDAO extends BaseDAO<Department>{
	public void updateDep(Department dep);
	
	public Map<String,String> queryAll();
	
	public void giveDeptEmp(String depid,String empid);
	
	public String queryDepidByEmp(String empid);
	
	/**
	 * 以部门id查找部门名
	 * @param depname
	 * @return
	 */
	public String queryDepNameByDepId(String depid);
}
