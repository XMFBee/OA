package com.oa.action;

import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.Empappeal;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.EmpAppealService;
import com.opensymphony.xwork2.ActionSupport;

public class EmpAppealAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private Pager4EasyUI<EmpappealInfo> pager = new Pager4EasyUI<EmpappealInfo>();;
	private Empappeal empappeal;
	private EmpAppealService empAppealService;
	

	private List<EmpappealInfo> rows;
	private int total;
	
	/**
	 * 方法
	 * pager 分面显示信息
	 * save 存储请假信息
	 * update 审核请假是在这个方法
	 * @return
	 */
	public String pager(){//
		Enumeration<String> enumer=  request.getParameterNames();
		if(enumer.hasMoreElements()){
			System.out.println(enumer.nextElement());
		}
		String depId =request.getParameter("depId"); 
		String empId = request.getParameter("empId");//部门id有,则这是给外人看的,否则是给自己看的
		String firstlevel = request.getParameter("firstlevel");
		String secondlevel = request.getParameter("secondlevel");//有部门则有部门则first与second
		String pass = request.getParameter("pass");//有已审核,与未审核
		String status = request.getParameter("status");
		String beginDate= request.getParameter("beginDate");
		String endDate= request.getParameter("endDate");
		String appealId = request.getParameter("appealId");
		String hasFirst = request.getParameter("hasFirst");
		String hasSecond = request.getParameter("hasSecond");
		String hasPass= request.getParameter("hasPass");
		
		pager.setPageNo(WebUtil.getPageNo(request));
		pager.setPageSize(WebUtil.getPageSize(request));
		
		
		if(depId!=null && !depId.equals("")){//有部门,则是查部门所有
			empAppealService.queryByDept(pager, depId, empId, firstlevel,pass,hasPass, beginDate,endDate);
			//pager.setTotal(empAppealService.countByDept(depId, empId, firstlevel, hasFirst, pass, hasPass, beginDate, endDate));
		}else {//没有部门,则是真正的所有,或者是单独的id
			if(empId!=null && !empId.equals("")){//是个人查询
				empAppealService.queryById(pager, empId, pass, hasPass, beginDate,endDate);
				//pager.setTotal(empAppealService.countById(empId, pass, hasPass, beginDate,endDate));
			}else {//是大Boss查询
				empAppealService.queryByBoss(pager, secondlevel, pass, hasPass, beginDate,endDate);
				//pager.setTotal(empAppealService.countByBoss(secondlevel, hasSecond, pass, hasPass, beginDate,endDate));
			}
		}
		rows = pager.getRows();
		//total = (int) pager.getTotal();
		return "pager";
	}
	
	public String pagerById(){//员工自己的申诉分页
		return "pagerById";
	}
	
	public String save(){
		empappeal.setAppealDay(new Date());
		Employee employee = new Employee();
		employee.setEmpId("1");
		empappeal.setEmployee(employee);
		empAppealService.save(empappeal);
		
		return "save";
	}
	
	public String update() {
		Enumeration<String> enumer=  request.getParameterNames();
		if(enumer.hasMoreElements()){
			System.out.println(enumer.nextElement());
		}
		String pass = request.getParameter("pass");//有已审核,与未审核
		String status = request.getParameter("status");
		String appealId = request.getParameter("appealId");
		String level = request.getParameter("level");
		String firstlevel = "";
		String secondlevel = "";
		if(level.equals("1")){
			firstlevel = "1";
		}else{
			secondlevel= "2";
		}
		empAppealService.updateLevel(appealId, firstlevel, secondlevel, pass);
		return "update";
	}
	
	public String showEmpAppeal() {
		return "showEmpAppeal";
	}
	
	public String doEmpappeal(){
		return "doEmpappeal";
	}
	
	public String seeEmpappeal(){
		return "seeEmpappeal";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
	/**
	 *get/set 
	 */

	public Empappeal getEmpappeal() {
		return empappeal;
	}

	public void setEmpappeal(Empappeal empappeal) {
		this.empappeal = empappeal;
	}

	public List<EmpappealInfo> getRows() {
		return rows;
	}

	public int getTotal() {
		return total;
	}

	public void setEmpAppealService(EmpAppealService empAppealService) {
		this.empAppealService = empAppealService;
	}

}
