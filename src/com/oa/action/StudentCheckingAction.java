package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Score;
import com.oa.bean.StudentChecking;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.StudentCheckingService;
import com.opensymphony.xwork2.ActionSupport;

public class StudentCheckingAction extends ActionSupport implements ServletRequestAware{

	
	private static final long serialVersionUID = 3235371706381959398L;

	private HttpServletRequest req;
	
	private List<StudentChecking> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	
	private String gradeId;
	
	private StudentCheckingService stuCheckingService;
	
	
	
	
	public void setStuCheckingService(StudentCheckingService stuCheckingService) {
		this.stuCheckingService = stuCheckingService;
	}
	public List<StudentChecking> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	
	

	
	
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	
	
	public String showStuChecking(){
		return "showStuChecking";
	}
	

	
	public String gradeByPager() {
		Pager4EasyUI<StudentChecking> pager = new Pager4EasyUI<StudentChecking>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(stuCheckingService.count("StudentChecking"));
		pager = stuCheckingService.queryPagerByGradeId(pager, gradeId);
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}

}
