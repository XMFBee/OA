package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Job;
import com.oa.bean.Score;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.JobService;
import com.opensymphony.xwork2.ActionSupport;

public class JobAction extends ActionSupport implements ServletRequestAware {


	private static final long serialVersionUID = 1472213673573666408L;
	private JobService jobService;
	private ControllerRequest resu; // 返回提示信息到easyUI页面
	private HttpServletRequest req;  //从前台页面获取值

	private List<Job> rows;
	private Job job;// 返回total总记录数到easyUI页面
	private long total;
	
	private String gradeId; 
	private String id;
	
	

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public List<Job> getRows() {
		return rows;
	}

	public void setJobService(JobService jobService) {
		this.jobService = jobService;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public long getTotal() {
		return total;
	}
	
	//显示页面
	public String showJob(){
		return "showJob";
	}
	
	//分页查询所有
	public String gradeByPager() {
		Pager4EasyUI<Job> pager = new Pager4EasyUI<Job>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(jobService.count("Job"));
		pager = jobService.queryPagerByGradeId(pager, gradeId);
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	public String addJob(){
		jobService.save(job);
		resu = ControllerRequest.getSuccessRequest("添加成功！");
		return "add";
	}
	
	public String updateJob(){
		jobService.update(job);
		resu = ControllerRequest.getSuccessRequest("更新成功！");
		return "update";
	}
	
	public String jobDisable(){  // 禁用意向学生
		jobService.updateStatus("Job","jobId",0, id);
		return "disable";
	}
	
	public String jobActivate(){  // 启用意向学生
		jobService.updateStatus("Job","jobId",1, id);
		return "activate";
	}

}


















