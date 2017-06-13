package com.oa.action;

import java.util.List;

import com.oa.bean.Employee;
import com.oa.bean.IncomeType;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.IncomeTypeService;

public class IncomeTypeAction extends BaseAction {
	private static final long serialVersionUID = 2159609001612155404L;

	private IncomeTypeService incomeTypeService;
	private IncomeType incomeType;
	private ControllerRequest result;
	private Employee emp;

	private List<IncomeType> rows;
	private long total;

	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<IncomeType> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setIncomeTypeService(IncomeTypeService incomeTypeService) {
		this.incomeTypeService = incomeTypeService;
	}

	public IncomeType getIncomeType() {
		return incomeType;
	}

	public void setIncomeType(IncomeType incomeType) {
		this.incomeType = incomeType;
	}

	public ControllerRequest getResult() {
		return result;
	}

	public String showIncomTypeHome() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			return "home";
		}
		return ERROR;
	}

	public String addIncomeType() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			incomeTypeService.save(incomeType);
			result = ControllerRequest.getSuccessRequest("添加成功！");
			return "add";
		}
		return ERROR;
	}

	public String incomeTypePager() {
		Pager4EasyUI<IncomeType> pager = new Pager4EasyUI<IncomeType>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = incomeTypeService.queryPager("IncomeType", pager);
		pager.setTotal(incomeTypeService.count("IncomeType"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}

	public String updataIncomeType() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			System.out.println("____________:" + incomeType);
			incomeTypeService.update(incomeType);
			result = ControllerRequest.getSuccessRequest("更新成功！");
			return "update";
		}
		return ERROR;

	}

	public String disable() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			System.out.println(id);
			incomeTypeService.updateStatus("IncomeType", "incomeTypeId", 0, id);
			return "disable";
		}
		return ERROR;
	}

	public String enable() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			incomeTypeService.updateStatus("IncomeType", "incomeTypeId", 1, id);
			return "enable";
		}
		return ERROR;
	}
}
