package com.oa.action.info;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.oa.action.BaseAction;
import com.oa.bean.Employee;
import com.oa.bean.info.MeettingInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.info.MeettingInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class MeettingInfoAction extends BaseAction{

	private static final long serialVersionUID = -8412562330053444607L;

	private MeettingInfoService meettingInfoService;
	private List<MeettingInfo> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	
	private String empName;
	
	
	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public List<MeettingInfo> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public void setMeettingInfoService(MeettingInfoService meettingInfoService) {
		this.meettingInfoService = meettingInfoService;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req = arg0;
	}
	public String showMeettingInfo(){
		Employee emp = (Employee)WebUtil.getSessionValue(req, "employee");
		if(autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.info.MeettingInfoAction.showMeettingInfo")){
			return "showpage";
		}else{
			return ERROR;
		}
	}
	
	public String meettingPager(){
		Pager4EasyUI<MeettingInfo> pager = new Pager4EasyUI<MeettingInfo>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(meettingInfoService.count("Meetting"));
		pager = meettingInfoService.queryPager("MeettingInfo", pager);
		for(MeettingInfo meetting : pager.getRows()){
			if(meetting.getEmpName() == null ){
				meetting.setEmpName("暂无主持人");
			}
		}
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	
	public String pagerByName(){
		Pager4EasyUI<MeettingInfo> pager = new Pager4EasyUI<MeettingInfo>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = meettingInfoService.queryBySearch(pager, empName);
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
