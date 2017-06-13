package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.oa.bean.EmpFeedback;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpfeedbackInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.EmpFeedbackService;

public class EmpfeedbackAction extends BaseAction{
	//郭昶 员工反馈管理
	
	private static final long serialVersionUID = 3847241338121992847L;
	
	private EmpFeedbackService empfeedbackService;
	
	private EmpFeedback empfeedback;
	
	private EmpfeedbackInfo empfeedbackinfo;
	
	private List<EmpFeedback> rows;
	
	private long total;
	
	private ControllerRequest resu;
	
	private String id;
	
	private Employee emp;
	
	public EmpfeedbackInfo getEmpfeedbackinfo() {
		return empfeedbackinfo;
	}

	public void setEmpfeedbackinfo(EmpfeedbackInfo empfeedbackinfo) {
		this.empfeedbackinfo = empfeedbackinfo;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}

	public List<EmpFeedback> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}
	public ControllerRequest getResu() {
		return resu;
	}

	
	public EmpFeedback getEmpfeedback() {
		return empfeedback;
	}

	public void setEmpfeedback(EmpFeedback empfeedback) {
		this.empfeedback = empfeedback;
	}

	public void setEmpfeedbackService(EmpFeedbackService empfeedbackService) {
		this.empfeedbackService = empfeedbackService;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req = arg0;
	}

	public String showEmpfeedbackPager(){ //转发到教务反馈页面
		emp = (Employee)WebUtil.getSessionValue(req, "employee");
		if(autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.EmpfeedbackAction.showEmpfeedbackPager")){
			return "showpager";
		}else{
			return ERROR;
		}
	}
	
	public String showMyEmpfeedbackPager(){	//转发到我的教务反馈页面
		Employee emp = (Employee)WebUtil.getSessionValue(req, "employee");
		if(autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.EmpfeedbackAction.showMyEmpfeedbackPager")){
			return "showmypager";
		}else{
			return ERROR;
		}
	}
	
	public String empfeedbackByPage(){ //分页查询
		Pager4EasyUI<EmpFeedback> pager = new Pager4EasyUI<EmpFeedback>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = empfeedbackService.queryPager("EmpFeedback", pager);
		pager.setTotal(empfeedbackService.count("EmpFeedback"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	public String empfeedbackSave(){	//员工反馈添加
		emp = (Employee)WebUtil.getSessionValue(req, "employee");
		System.out.println("获取的员工id"+emp.getEmpId());
		System.out.println("获取的角色id"+emp.getRole().getRoleId());
		empfeedback.setStatus(1);
		empfeedback.setEmpId(emp.getEmpId());
		empfeedbackService.save(empfeedback);
		resu = ControllerRequest.getSuccessRequest("添加成功！");
		return "save";
	}
	public String empfeedbackUpdate(){	//员工反馈更新
		empfeedback = new EmpFeedback();
		empfeedback.setFeedbackId(empfeedbackinfo.getFeedbackId());
		empfeedback.setEmpId(empfeedbackinfo.getEmpId());
		empfeedback.setFeedbackDay(empfeedbackinfo.getFeedbackDay());
		empfeedback.setStatus(empfeedbackinfo.getStatus());
		empfeedback.setDes(empfeedbackinfo.getDes());
		empfeedbackService.update(empfeedback);
		resu = ControllerRequest.getSuccessRequest("更新成功！");
		return "update";
	}
	
	public String empfeedbackBySele(){	//查询自己的反馈
		emp = (Employee)WebUtil.getSessionValue(req, "employee");
		Pager4EasyUI<EmpFeedback> pager = new Pager4EasyUI<EmpFeedback>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = empfeedbackService.queryById(emp.getEmpId(), pager);
		pager.setTotal(empfeedbackService.count("EmpFeedback"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "Id";
	}
	
	public String empfeedbackDisable(){  // 禁用反馈
		empfeedbackService.updateStatus("EmpFeedback","feedbackId",0, id);
		return "dis";
	}
	
	public String empfeedbackEnabled(){  // 启用反馈
		empfeedbackService.updateStatus("EmpFeedback", "feedbackId", 1, id);
		return "ena";
	}
}
