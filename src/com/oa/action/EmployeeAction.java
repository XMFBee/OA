package com.oa.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.bean.info.DepEmp;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.EncryptUtil;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.DepartmentService;
import com.oa.service.DutyService;
import com.oa.service.EmployeeService;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends BaseAction  implements ServletRequestAware{
	private EmployeeService  employeeService;
	private DepartmentService departmentService;
	private DutyService dutyService;
	
	private final String className = this.getClass().getName();
	private String authorityMsg;
	private ControllerRequest reqMsg;//返回信息

	private Employee employee;
	private Pager4EasyUI<EmpBaseInfo> pager = new Pager4EasyUI<EmpBaseInfo>();
	private HttpServletRequest request ;
	
	private String depId;	//部门编号
	
	private Object[] roles ;
	private Map<String,String> departments;
	private Object[] emps;

	private int total;
	private List<EmpBaseInfo> rows;

	
	/**
	 * 各种方法
	 */
	public String save(){//增
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee emp = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String birthday = request.getParameter("birthday");
			String hireDay= request.getParameter("hireDay");
			String province = request.getParameter("province");
			String city = request.getParameter("city");
			String area= request.getParameter("area");
			employee.setAddress(province+city+area);
			employee.setBirthday(WebUtil.str2Date(birthday, "yyyy-MM-dd"));
			employee.setPwd(EncryptUtil.encrypt("123456"));
			employee.setHireDay(new Date());
			employee.setStatus(1);
			String old = employeeService.queryEmpByRole("经理",employee.getDepartment().getDepId());
			employee = employeeService.save(employee);
			employeeService.giveRole2Emp("普通",old);
			departmentService.giveDeptEmp(employee.getDepartment().getDepId(),employee.getEmpId());
		}else{
			reqMsg.getFailRequest("你没有相应的权限");
		}
		return "save";
	}
	
	/**
	 * 冻结
	 * @return
	 */
	public String delete(){//删,实为冻结
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee emp = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			employeeService.otherStatusUpdate(employee.getEmpId(),employee.getStatus());
			String oldDepName = 	departmentService.queryDepNameByDepId(employee.getDepartment().getDepId());
			String oldManageName = departmentService.managerRoleName(oldDepName);
			String old = employeeService.queryEmpByRole(oldManageName,employee.getDepartment().getDepId());//旧部门的管理人员的名称
			if(old.equals(employee.getEmpId())){//如果员工的id与旧部门管理员id相同,则把旧部门的管理员栏设为空
				departmentService.giveDeptEmp(employee.getDepartment().getDepId(),null);
			}
			dutyService.updEmp(employee.getEmpId(),"");
		}else {
			reqMsg = ControllerRequest.getFailRequest("没有足够的权限,请联系管理员");
		}
		return "delete";
	}
	
	/**
	 * 修改员工信息
	 * @return
	 */
	public String update(){//改
		//判断是否id传进来
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee emp = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			if(employee.getEmpId()==null || employee.getEmpId().equals("")) {//从页面传的数据,也就是是自己修改的,因为自己修改的话,是从session里得到数据
				//是自己在修改,从session中得到用户id,
				employeeService.selfUpdate(emp.getEmpId(), employee.getPwd(), employee.getEmail(), employee.getPhone(), employee.getQq(), employee.getWeChat(),employee.getAddress());
			}else {//是上司修改
				employeeService.update(employee);
			}
		}else {
			authorityMsg = "权限不足,请联系管理员";
		}
		return "update";
	}
	
	public String pager(){//查
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String empName = request.getParameter("empName");
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String status = request.getParameter("status");
			String order = request.getParameter("order");
			String sort = request.getParameter("sort");
			String depId = request.getParameter("depId");//后期使用session得到某部门的部门id
			
			Pager4EasyUI<EmpBaseInfo> pager = new Pager4EasyUI<EmpBaseInfo>();
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			
			/**
			 * 如果有pager权限,则执行查所有,
			 * 否则查员工单人
			 */
			if(depId!=null && !depId.equals("")){
				pager = employeeService.queryByDepWhe(pager, depId, empName, beginDate, endDate, status,sort,order);
				pager.setTotal(employeeService.count("Employee"));
			}else {
				pager = employeeService.queryByAllWhe(pager, empName, beginDate, endDate, status,sort,order);
				pager.setTotal(employeeService.count("Employee"));
			}
			
			
			total = (int) pager.getTotal();
			rows = pager.getRows();
		}else{
			authorityMsg = "权限不足,请联系管理员";
		}
		return "pager";
	}
	

	public String pagerById(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			employee = employeeService.queryById(Employee.class, request.getParameter("empId"));
		}else{
			authorityMsg = "权限不足,请联系管理员";
		}
		return "pagerById";
	}
	/**
	 * 修改员工状态,在删方法中.....
	 * @return
	 */
/*	public String updStatus(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee emp = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			if(employee.getStatus() == 1) {
				employee.setStatus(0);		//要冻结员工
				departmentService.giveDeptEmp(employee.getDepartment().getDepId(), null);//
			}else {		
				employee.setStatus(1);	
			}	
			employeeService.updateStatus("Employee","empId",employee.getStatus(),employee.getEmpId());
		}else{
			authorityMsg = "权限不足,请联系管理员";
		}
		return "updStatus";
	}*/
	
	
	public String showEmployee() {
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			departments = departmentService.queryAll();
			return "showEmployee";
		}
		return "error";
	}
	
	public String allRoles() {
		roles = employeeService.allRoles();
		return "allRoles";
	}
	public String selectEmps(){
		emps = employeeService.allEmps();
		return "selectEmps";
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request= request;
	}
	
	
	/**
	 * get/set
	 */
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public EmployeeAction(){
		departments= new HashMap<String,String>();
	}
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Integer getTotal() {
		return total;
	}
	public List<EmpBaseInfo> getRows() {
		return rows;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public Object[] getRoles() {
		return roles;
	}
	public Map<String, String> getDepartments() {
		return departments;
	}
	
	public Object[] getEmps() {
		return emps;
	}
	public void setDutyService(DutyService dutyService) {
		this.dutyService = dutyService;
	}
public ControllerRequest getReqMsg() {
		return reqMsg;
	}	//郭玉清 显示员工本人页面信息
	public String showUser() {
		departments = departmentService.queryAll();
		
		return "showUser";
	}
}
