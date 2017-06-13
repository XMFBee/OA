package com.oa.action.info;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.info.PayInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.info.PayInfoService;
import com.opensymphony.xwork2.ActionSupport;

//郭玉清
public class PayInfoAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = -8532791406733036993L;

	private PayInfoService piService;
	private HttpServletRequest req;
	private ControllerRequest result;
	
	private List<PayInfo> rows;
	private PayInfo pi;
	private long total;
	
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}


	public PayInfo getPi() {
		return pi;
	}


	public void setPi(PayInfo pi) {
		this.pi = pi;
	}


	public ControllerRequest getResult() {
		return result;
	}


	public List<PayInfo> getRows() {
		return rows;
	}


	public long getTotal() {
		return total;
	}


	public void setPiService(PayInfoService piService) {
		this.piService = piService;
	}
	
	public String query_page(){
		Pager4EasyUI<PayInfo> pager = new Pager4EasyUI<PayInfo>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = piService.queryPayInfoPage(1, pager);
		pager.setTotal(piService.count("Pay"));
		rows = pager.getRows();
		total = pager.getTotal();
		return "query_page";
	}
	
	public String showPayInfo(){
		return "showPayInfo";
	}
	
	

}





















