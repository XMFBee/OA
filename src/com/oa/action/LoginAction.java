package com.oa.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.EncryptUtil;
import com.oa.service.EmployeeService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = -8853616415660510756L;
	private HttpServletRequest req;
	private HttpSession session;
	private Employee employee;
	private EmployeeService employeeService;
	private String empId;
	private ControllerRequest resu;
	
	
	public ControllerRequest getResu() {
		return resu;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	

	public String showStudent(){
    	return "showStudent";
    }
    
    public String showEmployee(){
    	return "showEmployee";
    }

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req= req;
	}
	
	public String emplogin(){
		session = req.getSession();
		String pwd = employee.getPwd();
		employee.setPwd(EncryptUtil.encrypt(pwd));
		employee = employeeService.login(employee);
		if(employee != null){
			session.setAttribute("employee", employee);
			return "emplogin-ok";
		}
			return "emplogin-no";
	}
    
}




















