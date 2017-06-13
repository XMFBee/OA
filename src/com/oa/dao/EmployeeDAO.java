package com.oa.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;

import com.oa.bean.Department;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmployeeDAO extends BaseDAO<Employee>{
	public Employee login(Employee emp);
	
	/**
	 * 返回所有角色的id与name
	 * @return
	 */
	public List<Map<String, String>> allRoles();
	
	/**
	 * 
	 * @return
	 */
	public List<Map<String, String>> allEmps();
	/**
	 * 把角色分配给员工
	 * @param roleid	角色id
	 * @param empid		员工id
	 */
	public void giveRole2Emp(String roleid, String empid);
	
	public String queryEmpByRole(String roleid,String depid);
	
	public void updBaseEmp(Employee e);
	
	/**
	 * 计数部门员工
	 * @param deptid
	 * @return
	 */
	public int countEmpsByDept(String deptid);
	
	
	/**
	 * 
	 * @param pager		分页
	 * @param depId		部门id
	 * @param empName	员工姓名模糊
	 * @param beginDate	员工入职的开始时间
	 * @param endDate	员工入职的最后时间
	 * @param status	员工是否已离职,1为未离职,0为已离职
	 * @param sort		需要排序的字段
	 * @param order		排序顺序
	 * @return
	 */
	public Pager4EasyUI<EmpBaseInfo> queryNorm(Pager4EasyUI<EmpBaseInfo> pager,String depId, String empName,Date beginDate,Date endDate, String status,String sort, String order);
	
	
	/**
	 * 计数条件
	 * @param depId 部门id
	 * @param empName 员工姓名模糊
	 * @param beginDate 员工入职的开始时间
	 * @param endDate 员工入职的最后时间
	 * @param status 员工是否已离职,1为未离职,0为已离职
	 * @return
	 */
	public int countNorm(String depId, String empName,Date beginDate,Date endDate, String status);
}
