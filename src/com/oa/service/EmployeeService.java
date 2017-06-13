package com.oa.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.oa.bean.Department;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmployeeService extends BaseService<Employee>{
	public Employee login(Employee emp);
	
	public Object[] allRoles();
	
	public Object[] allEmps() ;
	
	public void giveRole2Emp(String rolename, String empid);
	
	public String queryEmpByRole(String rolename,String depid);
	
	public int countEmpsByDept(String deptid);
	
	
	/**
	 * update
	 * @param empid
	 * @param pwd
	 * @param email
	 * @param phone
	 * @param qq
	 * @param wechat
	 * @param address
	 */
	public void selfUpdate(String empid , String pwd, String email, String phone, String qq, String wechat,String address);
	public void otherUpdate(String empid,String depid, String roleid, String contactname,String contactphone,String bankname,String accountname,String accountno,String alipay,int status);
	
	public void otherStatusUpdate(String empid,int status);
	
	
	public Pager4EasyUI<EmpBaseInfo> queryByDepWhe(Pager4EasyUI<EmpBaseInfo> pager,String depId, String empName,String beginDate,String endDate, String status,String sort, String order);
	public Pager4EasyUI<EmpBaseInfo> queryByAllWhe(Pager4EasyUI<EmpBaseInfo> pager,String empName,String beginDate,String endDate, String status,String sort, String order);
	
}
