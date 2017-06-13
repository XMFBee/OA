package com.oa.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.Department;
import com.oa.bean.Employee;
import com.oa.bean.Role;
import com.oa.bean.info.DepEmp;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.DepartmentService;
import com.oa.service.EmployeeService;
import com.oa.service.info.DepEmpServiceInfo;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction  extends BaseAction implements ServletRequestAware{
	private DepartmentService  departmentService;
	private DepEmpServiceInfo  depEmpServiceInfo;
	private EmployeeService employeeService;
	/**
	 * 没有权限的提示信息
	 */
	private ControllerRequest reqMsg;
	private final String className = this.getClass().getName();

	private Department department;
	private Pager4EasyUI<DepEmp> pager = new Pager4EasyUI<DepEmp>();
	private HttpServletRequest request ;
	private String name;

	private Map<String,String> selects;

	public Map<String, String> getSelects() {
		return selects;
	}

	public void setSelects(Map<String, String> selects) {
		this.selects = selects;
	}

	private int total;
	private List<DepEmp> rows;
	
	
	private Map<String ,String> maps;
	
	/**
	 * get/set
	 * @return
	 */
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	public int getTotal() {
		return total;
	}
	public List<DepEmp> getRows() {
		return rows;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	
	/**
	 * 各种方法
	 */
	public String save(){//增
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			department.setStatus(1);
			department = departmentService.save(department);
		}else {
			reqMsg.getFailRequest( "你没有相应的权限"); 
		}
		return "save";
	}
	
	public String delete(){//删
		departmentService.delete(department);
		return "delete";
	}
	public String update(){//改
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			departmentService.updateDep(department);
		}else{
			reqMsg.getFailRequest( "你没有相应的权限");
		}
		return "update";
	}
	
	public String pager(){//查
		pager = new Pager4EasyUI<DepEmp>();
		pager.setPageNo(WebUtil.getPageNo(request));
		pager.setPageSize(WebUtil.getPageSize(request));
		pager = depEmpServiceInfo.queryPager(pager);
		pager.setTotal(departmentService.count("Department"));
		
		total = (int) pager.getTotal();
		rows = pager.getRows();
		
		return "pager";
	}
	
	public String updStatus () {
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			if(department.getStatus() == 1) {
				department.setStatus(0);
			}else {
				department.setStatus(1);
			}
			departmentService.updateStatus("Department","depId",department.getStatus(),department.getDepId());
		}else{
			reqMsg.getFailRequest( "你没有相应的权限");
		}
		return "updStatus";
	}
	
	
	
	public String queryEmployees() {
		selects = depEmpServiceInfo.empSelect(department);
		return "queryEmployees";
	}
	
	public String showDepartment(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			return "showDepartment";
		}else {
			return "error";
		}
	}

	
	/**
	 * Other
	 */
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request= request;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JSON(serialize=false)
	public DepEmpServiceInfo getDepEmpServiceInfo() {
		return depEmpServiceInfo;
	}

	public void setDepEmpServiceInfo(DepEmpServiceInfo depEmpServiceInfo) {
		this.depEmpServiceInfo = depEmpServiceInfo;
	}

	public Map<String ,String> getMaps() {
		return maps;
	}

	public void setMaps(Map<String ,String> maps) {
		this.maps = maps;
	}
	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
}
