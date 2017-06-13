package com.oa.action.info;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.info.EmpfeedbackInfo;
import com.oa.bean.info.MeettingInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.info.EmpfeedbackInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class EmpfeedbackInfoAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 2869313911219177248L;

	private HttpServletRequest req;
	private EmpfeedbackInfoService empfeedbackInfoService;
	private List<EmpfeedbackInfo> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	
	private ControllerRequest resu;
	
	private String empName;
	
	
	public ControllerRequest getResu() {
		return resu;
	}
	public void setResu(ControllerRequest resu) {
		this.resu = resu;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public List<EmpfeedbackInfo> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	public void setEmpfeedbackInfoService(EmpfeedbackInfoService empfeedbackInfoService) {
		this.empfeedbackInfoService = empfeedbackInfoService;
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req = arg0;
	}
	
	public String queryPager(){
		Pager4EasyUI<EmpfeedbackInfo> pager = new Pager4EasyUI<EmpfeedbackInfo>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(empfeedbackInfoService.count("EmpFeedback"));
		pager = empfeedbackInfoService.queryPager("EmpfeedbackInfo", pager);
		for(EmpfeedbackInfo empfeedback : pager.getRows()){
			if(empfeedback.getEmpName() == null ){
				empfeedback.setEmpName("暂无反馈人");
			}
		}
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	
	public String pagerByName(){
		Pager4EasyUI<EmpfeedbackInfo> pager = new Pager4EasyUI<EmpfeedbackInfo>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = empfeedbackInfoService.queryBySearch(pager, empName);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu =  ControllerRequest.getSuccessRequest("查找成功");
		}else{
			resu =  ControllerRequest.getFailRequest("没有您查询的记录");
		}
		return "queryByName";
	}
	
}
