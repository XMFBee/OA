package com.oa.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.service.EmployeeService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements ServletRequestAware {

	
	private static final long serialVersionUID = -2934746257124678376L;
	public HttpServletRequest req;
	
	public EmployeeService empService;

	public void setEmpService(EmployeeService empService) {
		this.empService = empService;
	}
	private Employee emp;
	
	
	
	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public String login(){
		return "showLogin";
	}
	
	public String loginPage(){
		
		return "home";
	}
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

}
