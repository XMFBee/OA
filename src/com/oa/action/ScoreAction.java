package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Score;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.ScoreService;
import com.opensymphony.xwork2.ActionSupport;

public class ScoreAction extends ActionSupport implements ServletRequestAware{

	
	private static final long serialVersionUID = 6766263173710525080L;

	private HttpServletRequest req;
	
	private List<Score> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	private Score Score;		
	private String gradeId;
	
	private String course;
	
	
	private ScoreService scoreService;
	
	
	
	public void setCourse(String course) {
		this.course = course;
	}
	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}
	public List<Score> getRows() {
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
	
	public String showScore(){
		return "showScore";
	}
	
	
	
	public String gradeByPager() {
		Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(scoreService.count("Score"));
		pager = scoreService.queryPagerByGradeId(pager, gradeId);
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	public String pagerByCourse(){
		Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = scoreService.queryBySearch(pager, course);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu =  ControllerRequest.getSuccessRequest("查找成功");
		} 
		return "queryByCourse";
	}
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}

}
