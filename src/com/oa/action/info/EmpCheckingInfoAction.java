package com.oa.action.info;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.action.BaseAction;
import com.oa.bean.EmpChecking;
import com.oa.bean.EmpCheckingInfo;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpCheckingVOInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.service.CheckingService;
import com.oa.service.EmpCheckingService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工考勤详情
 * @author 程燕
 *
 */
public class EmpCheckingInfoAction extends BaseAction implements ServletRequestAware{
	private HttpServletRequest request;
	private Pager4EasyUI<EmpCheckingVOInfo> pager;
	private EmpCheckingService empCheckingService;
	
	private ControllerRequest reqMsg;//返回给页面的信息
	
	private final String className = this.getClass().getName();
	private List<EmpCheckingVOInfo> rows;
	private int total;
	
	/**
	 * 上司查询
	 * @return
	 */
	public String pagerInfo(){//上司查自己的,这个是上司查自己的
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String empName = request.getParameter("empName");
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String depid = "";
			if(!employee.getDepartment().getName().equals("总经理")){	depid = employee.getDepartment().getDepId();}
			pager = new Pager4EasyUI<EmpCheckingVOInfo>();
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			if(beginDate!=null&&endDate!=null){
				empCheckingService.queryPagerInfo(pager, depid, null, empName, beginDate, endDate, sort, order);
				pager.setTotal(empCheckingService.countPagerInfo(depid, null, empName, beginDate, endDate));
			}else{
				empCheckingService.queryPagerInfo4Moth(pager, depid, null, empName, 0, sort, order);
				pager.setTotal(empCheckingService.countPagerInfo4Moth(depid, null, empName, 0));
			}
			rows = pager.getRows();
			total = (int) pager.getTotal();
		}else{
			pageInfoById(employee);
		}
		return "pagerInfo";
	}

	/**
	 * 个人查询考勤详情
	 * @param employee
	 */
	private void pageInfoById(Employee employee){
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		if(beginDate!=null&&endDate!=null){
			empCheckingService.queryPagerInfo(pager, null, employee.getEmpId(), null, beginDate, endDate, sort, order);
			pager.setTotal(empCheckingService.countPagerInfo(null, employee.getEmpId(), null, beginDate, endDate));
		}else{
			empCheckingService.queryPagerInfo4Moth(pager, null, employee.getEmpId(), null, 0, sort, order);
			pager.setTotal(empCheckingService.countPagerInfo4Moth(null, employee.getEmpId(), null, 0));
		}
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	public List<EmpCheckingVOInfo> getRows() {
		return rows;
	}

	public int getTotal() {
		return total;
	}

	public void setEmpCheckingService(EmpCheckingService empCheckingService) {
		this.empCheckingService = empCheckingService;
	}
	public ControllerRequest getReqMsg() {
		return reqMsg;
	}


}
