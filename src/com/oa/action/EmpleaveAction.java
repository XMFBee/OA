package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Empleave;
import com.oa.bean.info.EmpleaveInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.EmpleaveService;
import com.oa.service.EmpleaveServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class EmpleaveAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private Empleave empleave;
	private Pager4EasyUI<EmpleaveInfo> pager ;
	private EmpleaveService empleaveService;

	private int total;
	private List<EmpleaveInfo> rows;
	
	public String save(){
		String startDateStr =  request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");
		System.out.println("startDateStr : " +startDateStr );
		Date startDate = WebUtil.str2Date(startDateStr, "yyyy-MM-dd HH:mm:ss");
		Date endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd HH:mm:ss");
		empleave.setLeaveDay(new Date());
		empleave.setStartTime(startDate);
		empleave.setEndTime(endDate);
		empleaveService.save(empleave);
		return "save";
	}
	
	public String update(){
		String leaveid = request.getParameter("leaveid");
		String pass = request.getParameter("pass");
		
		
	/*	int status = 0;
	 * if(pass.equals("1")){ //部门审核需要判断是否大于 3天
			status = 1;
		}else if(pass.equals("2")){
			int diff = Integer.valueOf(request.getParameter("diff"));
			if(diff<3){
				status =1 ;	
			}else {
				pass= "0";
			}
		}*/
		empleaveService.baseUpdSecondLeave(leaveid,pass);
		return "update";
	}
	
	public String pager(){
		pager = new Pager4EasyUI<EmpleaveInfo>();
		pager.setPageNo(WebUtil.getPageNo(request));
		pager.setPageSize(WebUtil.getPageSize(request));
		String depId =request.getParameter("depId"); 
		String empId = request.getParameter("empId");//部门id有,则这是给外人看的,否则是给自己看的
		String firstlevel = request.getParameter("firstlevel");
		String secondlevel = request.getParameter("secondlevel");//有部门则有部门则first与second
		String pass = request.getParameter("pass");//有已审核,与未审核
		String status = request.getParameter("status");
		String beginDate= request.getParameter("beginDate");
		String endDate= request.getParameter("endDate");
		String appealId = request.getParameter("appealId");
		String hasPass= request.getParameter("hasPass");
		String startBegin = "";
		String startEnd = "";
		String endBegin = "";
		String endEnd = "";
		String beginLeave = "";
		String endLeave = "";
		
		if(depId!=null && !depId.equals("")){//有部门,则是查部门所有
			empleaveService.queryByDept(pager, depId, empId, firstlevel, pass,hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave);
			pager.setTotal(empleaveService.countByDept(depId, empId, firstlevel,  pass, hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave));
		}else {//没有部门,则是真正的所有,或者是单独的id
			if(empId!=null && !empId.equals("")){//是个人查询
				empleaveService.queryById(pager, empId, pass,hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave);
				pager.setTotal(empleaveService.countById(empId, pass, hasPass,startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave));
			}else {//是大Boss查询
				empleaveService.queryByBoss(pager, secondlevel,pass, hasPass,startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave);
				pager.setTotal(empleaveService.countByBoss(secondlevel,  pass, hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave));
			}
		}
		
		
		rows = pager.getRows();
/*		total = (int) pager.getTotal();
*/		return "pager";
	}
	
	
	public String showEmpleave(){
		return "showEmpleave";
	}
	
	public String doEmpleave(){
		return "doEmpleave";
	}
	public String seeEmpleave(){
		return "seeEmpleave";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
	
	/**
	 * get/set
	 */
	public Empleave getEmpleave() {
		return empleave;
	}

	public void setEmpleave(Empleave empleave) {
		this.empleave = empleave;
	}

	public int getTotal() {
		return total;
	}

	public List<EmpleaveInfo> getRows() {
		return rows;
	}

	public void setEmpleaveService(EmpleaveService empleaveService) {
		this.empleaveService = empleaveService;
	}
}
