package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Grade;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.GradeService;
import com.opensymphony.xwork2.ActionSupport;

public class GradeAction extends ActionSupport implements ServletRequestAware{

	
	private static final long serialVersionUID = 6028528711963379385L;
	private GradeService gradeService;
	private HttpServletRequest req;
	
	private List<Grade> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	private Grade grade;		//
	
	private String empId1;
	private String empId2;
	private String empId3;
	
	private String gradeName;
	
	

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public void setEmpId1(String empId1) {
		this.empId1 = empId1;
	}

	public void setEmpId2(String empId2) {
		this.empId2 = empId2;
	}

	public void setEmpId3(String empId3) {
		this.empId3 = empId3;
	}

	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	
	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public List<Grade> getRows() {
		return rows;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	
	public String showGrade(){  // 转发到班级信息页面
		return "showGrade"; 
	}
	
	
	public String gradePager(){  // 分页显示班级信息
		Pager4EasyUI<Grade> pager = new Pager4EasyUI<Grade>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(gradeService.count("Grade"));
		pager = gradeService.queryPager("Grade", pager);
		int count = 0;
		total = pager.getTotal();
		for(Grade g: pager.getRows()){
			count = gradeService.queryByGradeId(g.getGradeId());
			g.setFact(count);
		}
		rows = pager.getRows();
		return "pager";
	}
	
	public String pagerByName(){
		Pager4EasyUI<Grade> pager = new Pager4EasyUI<Grade>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = gradeService.queryBySearch(pager, gradeName);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu =  ControllerRequest.getSuccessRequest("查找成功");
		} else {
			resu =  ControllerRequest.getFailRequest("没有记录");
		}
		return "queryByName";
	}
	
	public String gradeSave(){ // 添加班级
		grade.setStatus(1);
		grade.setEmpIds1(empId1);
		grade.setEmpIds2(empId2);
		grade.setEmpIds3(empId3);
		
		gradeService.save(grade);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "save";
	}
	
	public String gradeUpdate(){ // 更新班级
		gradeService.update(grade);;
		resu = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}
	
	


	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}

}
