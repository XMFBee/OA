package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Grade;
import com.oa.bean.Progress;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.ProgressService;
import com.opensymphony.xwork2.ActionSupport;

public class ProgressAction extends ActionSupport implements ServletRequestAware{
	//郭昶 课程进度管理
	
	private static final long serialVersionUID = 3847241338121992847L;
	
	private ProgressService progressService;
	
	private HttpServletRequest req;
	
	private Progress progress;
	
	private List<Progress> rows;
	
	private long total;
	
	private ControllerRequest resu;
	
	private String id;
	
	private String empName;

	
	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setProgressService(ProgressService progressService) {
		this.progressService = progressService;
	}
	
	public List<Progress> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public Progress getProgress() {
		return progress;
	}
	public void setProgress(Progress progress) {
		this.progress = progress;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req = arg0;
	}

	public String showProgressPager(){
		return "showpager";
	}
	public String progressByPage(){ //分页查询
		Pager4EasyUI<Progress> pager = new Pager4EasyUI<Progress>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = progressService.queryPager("Progress", pager);
		pager.setTotal(progressService.count("Progress"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	public String progressSave(){
		progress.setStatus(1);
		progressService.save(progress);
		resu = ControllerRequest.getSuccessRequest("添加成功！");
		return "save";
	}
	public String progressUpdate(){
			progressService.update(progress);
			resu = ControllerRequest.getSuccessRequest("更新成功！");
			return "update";
	}
	public String progressDisable(){  // 禁用课程
		System.out.println("进入");
		progressService.updateStatus("Progress","progressId",0, id);
		return "dis";
	}
	
	public String progressEnabled(){  // 启用课程
		System.out.println("进入");
		progressService.updateStatus("Progress", "progressId", 1, id);
		return "ena";
	}
	public String pagerByName(){
		Pager4EasyUI<Progress> pager = new Pager4EasyUI<Progress>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = progressService.queryBySearch(pager, empName);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu =  ControllerRequest.getSuccessRequest("查找成功");
		} else {
			resu =  ControllerRequest.getFailRequest("没有记录");
		}
		return "queryByName";
	}

}
