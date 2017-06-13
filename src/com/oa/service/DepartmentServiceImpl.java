package com.oa.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.Department;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.DepartmentDAO;
import com.oa.dao.EmployeeDAO;

public class DepartmentServiceImpl implements DepartmentService{
	private DepartmentDAO departmentDAO;
	private EmployeeService employeeService;

	@Override
	public Department save(Department t) {
		return departmentDAO.save(t);
	}

	@Override
	public void delete(Department t) {
		departmentDAO.delete(t);
	}

	@Override
	public void update(Department t) {
		departmentDAO.update(t);
	}

	@Override
	public Department queryById(Class<?> clazz, Serializable id) {
		return departmentDAO.queryById(clazz, id);
	}

	@Override
	public List<Department> queryAll(Serializable beanName) {
		return departmentDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Department> queryPager(String beanName, Pager4EasyUI<Department> pager) {
		return departmentDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return departmentDAO.count(beanName);
	}
	
	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		departmentDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Map<String, String> queryAll() {
		// TODO Auto-generated method stub
		return departmentDAO.queryAll();
	}
	
	@Override
	public String queryDepNameByDepId(String depid){
		return departmentDAO.queryDepNameByDepId(depid);
	}
	
	@Override
	public void updateDep(Department dep) {
		try {
			String depName = queryDepNameByDepId(dep.getDepId());
			String manageRoleName = managerRoleName(depName);
			List<String> normRoleName =normRoleName(depName);
			
			String empid = employeeService.queryEmpByRole(manageRoleName,dep.getDepId());//获取该部门的旧经理的id
			departmentDAO.updateDep(dep);		//更新部门
			employeeService.giveRole2Emp(normRoleName.get(0),empid);//把旧员工讷为普通角色
			employeeService.giveRole2Emp(manageRoleName,dep.getEmployee().getEmpId());//把新员工设为主任
			
		}catch(Exception e) {
			System.out.println("DepartmentServiceImpl中的updateDep出现民异常");
			 throw new RuntimeException(e.getMessage());
			 
		}
	}

	
	/**
	 * 以下为get/set方法
	 * @return
	 */
	@JSON(serialize=false)
	public DepartmentDAO getDepartmentDAO() {
		return departmentDAO;
	}

	public void setDepartmentDAO(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}
	@JSON(serialize=false)
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@Override
	public void giveDeptEmp(String depid, String empid) {
		departmentDAO.giveDeptEmp(depid, empid);
	}

	@Override
	public String queryDepidByEmp(String empid) {
		return departmentDAO.queryDepidByEmp(empid);
	}
	
	@Override
	public List<String> normRoleName(String depName){
		List<String> roles = new ArrayList<String>();
		if(depName.equals("总部")){
		}else if(depName.equals("行政部")){
			roles.add("班主任");
		}else if(depName.equals("财务部")){
		}else if(depName.equals("后勤部")){
		}else if(depName.equals("教务部")){
			roles.add("任课老师");
			roles.add("辅导老师");
		}else if(depName.equals("招生部")){
			roles.add("招生老师");
		}
		return roles;
	}
	@Override
	public String managerRoleName(String depName){
		String roleName = "";
		if(depName.equals("总部")){
			roleName = "总经理";
		}else {
			roleName = depName+"主任";
		}
		return roleName;
	}

}
