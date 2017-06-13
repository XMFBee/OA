package com.oa.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Duty;
import com.oa.bean.Employee;
import com.oa.bean.info.DutyInfo;
import com.oa.common.web.WebUtil;
import com.oa.dao.DutyDAO;
import com.oa.service.DutyService;
import com.oa.service.EmployeeService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 值班
 * @author Administrator
 *
 */
public class DutyAction extends BaseAction implements ServletRequestAware{


	private DutyService dutyService;
	private List<String> address;
	private EmployeeService employeeService;
	private HttpServletRequest request;
	
	private final String className = this.getClass().getName();
	private String authorityMsg;
	
	private Duty duty;
	private Object[] employees;

	private List<Duty> rows;
	private int total;
	public DutyAction() {
	}
	
	public String update() {
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			dutyService.updateDuty(duty);
		}else {
			authorityMsg = "权限不足,请联系管理员";
		}
		return "update";
	}
	
	public String allDuty() {
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String weekday = request.getParameter("weekday");
			happs();
			if(weekday==null||weekday.equals("")){
				rows = dutyService.queryTab();
			}else {
				rows = dutyService.currDuty();
			}
			return "allDuty";
		}
		return "error"; 
	}

	public String showDuty() {
		address = dutyService.queryAddress();
		employees = employeeService.allEmps();
		return "showDuty";
	}
	public String currDuty(){
		List list= dutyService.currDuty();
		if(list.size() >0) {
			duty =  (Duty) list.get(0);
		}
		return "currDuty";
	}
	

	/**
	 * 添加地址
	 * @return
	 */
	public String saveAdd(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String add = request.getParameter("addadd");
			dutyService.addAddress(add);
		}else{
			authorityMsg = "权限不足,请联系管理员";
		}
		return "saveAdd";
	}

	/**
	 * 更新地址
	 * @return
	 */
	public String updAdd(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String oldAdd = request.getParameter("oldadd");
			String newAdd = request.getParameter("newadd");
		
			dutyService.updAddress(oldAdd,newAdd);
		}else{
			authorityMsg = "权限不足,请联系管理员";
		}
		return "updAdd";
	}
	
	
	public String happs(){
		address = dutyService.queryAddress();
		return "happs";
	}
	
	public String hemps() {
		employees = employeeService.allEmps();
		return "hemps";
	}
	
	
	
	/**
	 * get/set
	 */
	public void setDutyService(DutyService dutyService) {
		this.dutyService = dutyService;
	}

	public List<Duty> getRows() {
		return rows;
	}

	public int getTotal() {
		return total;
	}


	public List<String> getAddress() {
		return address;
	}

	public Object[] getEmployees() {
		return employees;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Duty getDuty() {
		return duty;
	}

	public void setDuty(Duty duty) {
		this.duty = duty;
	}
	

}

