package com.oa.action;

import java.util.List;


import com.oa.bean.EmpCheckingInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.CheckingService;

public class CheckingAction extends BaseAction{

	private static final long serialVersionUID = -3272379412422915647L;
	private CheckingService checkingService;
	private ControllerRequest resu; // 返回提示信息到easyUI页面

	private List<EmpCheckingInfo> rows;
	private long total;// 返回total总记录数到easyUI页面
	private EmpCheckingInfo empCheckingInfo;

	public EmpCheckingInfo getEmpCheckingInfo() {
		return empCheckingInfo;
	}

	public void setEmpCheckingInfo(EmpCheckingInfo empCheckingInfo) {
		this.empCheckingInfo = empCheckingInfo;
	}

	public List<EmpCheckingInfo> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setCheckingService(CheckingService checkingService) {
		this.checkingService = checkingService;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public String showChecking() {
		return "showChecking";
	}

	public String checkingPager() { // 分页显示公告类型
		Pager4EasyUI<EmpCheckingInfo> pager = new Pager4EasyUI<EmpCheckingInfo>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(checkingService.count("EmpCheckingInfo"));
		pager = checkingService.queryPager("EmpCheckingInfo", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "checking-pager";
	}

	public String addChecking() {
		checkingService.save(empCheckingInfo);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "checking-add";
	}

	public String updateChecking() {
		checkingService.update(empCheckingInfo);
		resu = ControllerRequest.getSuccessRequest("修改成功");
		return "checking-update";
	}

}
