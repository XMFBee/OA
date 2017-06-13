package com.oa.action;

import java.util.List;

import com.oa.bean.Department;
import com.oa.bean.Pay;
import com.oa.bean.info.PayInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.PayService;
import com.oa.service.info.PayInfoService;

/*郭玉清*/
public class PayAction extends BaseAction{

	private static final long serialVersionUID = 5978600515014725933L;
	private PayInfoService piService;
	private PayService payService;
	private List<PayInfo> rows;
	private long total;
	private ControllerRequest result;
	private Pay pay;
	private Department department;
	private PayInfo pi;

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}


	public Pay getPay() {
		return pay;
	}

	public void setPay(Pay pay) {
		this.pay = pay;
	}

	public PayInfo getPi() {
		return pi;
	}

	public void setPi(PayInfo pi) {
		this.pi = pi;
	}

	public List<PayInfo> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public ControllerRequest getResult() {
		return result;
	}

	public void setPiService(PayInfoService piService) {
		this.piService = piService;
	}

	public void setPayService(PayService payService) {
		this.payService = payService;
	}


	public String query_page() {
		Pager4EasyUI<PayInfo> pager = new Pager4EasyUI<PayInfo>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = piService.queryPayInfoPage(1, pager);
		pager.setTotal(piService.count("PayType"));
		rows = pager.getRows();
		total = pager.getTotal();
		return "query_page";
	}

	public String save() {
		pay.setEmpId(pi.getEmpId());
		payService.save(pay);
		result = ControllerRequest.getSuccessRequest("添加支出记录成功！");
		return "save";
	}

	public String update() {
		payService.update(pay);
		result = ControllerRequest.getSuccessRequest("更新支出记录成功！");
		return "update";
	}

}
