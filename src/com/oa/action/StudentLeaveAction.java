package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.StudentLeave;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.StudentLeaveService;
import com.opensymphony.xwork2.ActionSupport;

public class StudentLeaveAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = -237725301596363703L;

	private HttpServletRequest req;
	
	private List<StudentLeave> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	
	
	private StudentLeaveService stuLeaveService;
	
	private String gradeId;
	
	
	
	
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public List<StudentLeave> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	
	public void setStuLeaveService(StudentLeaveService stuLeaveService) {
		this.stuLeaveService = stuLeaveService;
	}
	
	public String showStuLeave(){
		return "showStuLeave";
	}
	


	
	public String gradeByPager() {
		Pager4EasyUI<StudentLeave> pager = new Pager4EasyUI<StudentLeave>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(stuLeaveService.count("StudentLeave"));
		pager = stuLeaveService.queryPagerByGradeId(pager, gradeId);
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}

}
