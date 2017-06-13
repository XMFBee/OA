package com.oa.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.EmpCheckingInfo;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpCheckingStatistics;
import com.oa.bean.info.EmpCheckingVOInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.service.CheckingService;
import com.oa.service.EmpCheckingService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工考勤Action
 * @author 程燕
 *
 */
public class EmpCheckingAction extends BaseAction implements ServletRequestAware{
	private HttpServletRequest request;
	private EmpCheckingInfo empCheckingInfo;
	private EmpCheckingService empCheckingService;
	private Pager4EasyUI<EmpCheckingStatistics> pager = new Pager4EasyUI<EmpCheckingStatistics>();
	private List<EmpCheckingInfo> checks;
	private CheckingService checkingService;
	
	private ControllerRequest reqMsg;//返回给页面的信息
	private final String className = this.getClass().getName();

	private List<EmpCheckingStatistics> rows;
	private int total;

	/**
	 * 保存考勤...在excel里导入
	 * @return
	 */
	public String save() {
		return "save";
	}
	/**
	 *  考勤统计
	 * @return
	 */
	public String pager() {
//		获取当前月,默认显示当前月的考勤
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String empName = request.getParameter("empName");
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String depid = "";
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			if(!employee.getDepartment().getName().equals("总经理")){	depid = employee.getDepartment().getDepId();}
			pager = new Pager4EasyUI<EmpCheckingStatistics>();
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			if(beginDate!=null&&endDate!=null){
				pager = empCheckingService.queryPagerStatistics(pager, depid, null, empName, beginDate, endDate, sort, order);
				pager.setTotal(empCheckingService.countPagerInfo(depid, null, empName, beginDate, endDate));
			}else{
				pager = empCheckingService.queryPagerStatistics4Moth(pager, depid, null, empName, 0, sort, order);
				pager.setTotal(empCheckingService.countPagerInfo4Moth(depid, null, empName, 0));
			}
			
			total = (int) pager.getTotal();
			rows = pager.getRows();
		}else {
			pagerById(employee);
		}
		return "pager";
	}
	
	/**
	 * 员工查看自己的考勤
	 * @param employee
	 */
	private void pagerById(Employee employee){
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		if(beginDate!=null&&endDate!=null){
			pager =empCheckingService.queryPagerStatistics(pager, null, employee.getEmpId(), null, beginDate, endDate, sort, order);
			pager.setTotal(empCheckingService.countPagerInfo(null, employee.getEmpId(), null, beginDate, endDate));
		}else{
			pager =empCheckingService.queryPagerStatistics4Moth(pager, null, employee.getEmpId(), null, 0, sort, order);
			pager.setTotal(empCheckingService.countPagerInfo4Moth(null, employee.getEmpId(), null, 0));
		}
	}
	
	
	public String showEmpChecking() {	//显示考勤总结页面
		return "showEmpChecking";
	}

	public String showEmpCheckingInfo(){	//显示详细考勤页面
		Pager4EasyUI<EmpCheckingInfo> checkingInfos = new Pager4EasyUI<EmpCheckingInfo>();
		checkingInfos.setPageNo(1);	checkingInfos.setPageSize(20);
		checkingService.queryPager("EmpCheckingInfo", checkingInfos);
		checks = checkingInfos.getRows();
		return "showEmpCheckingInfo";
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	
//	get/set
	public EmpCheckingInfo getEmpCheckingInfo() {
		return empCheckingInfo;
	}
	public List<EmpCheckingStatistics> getRows() {
		return rows;
	}
	public int getTotal() {
		return total;
	}
	public void setEmpCheckingService(EmpCheckingService empCheckingService) {
		this.empCheckingService = empCheckingService;
	}
	public List<EmpCheckingInfo> getChecks() {
		return checks;
	}
	public void setCheckingService(CheckingService checkingService) {
		this.checkingService = checkingService;
	}
}
