package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.bean.Income;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.IncomeService;
import com.opensymphony.xwork2.ActionSupport;

public class IncomeAction extends BaseAction {
	private static final long serialVersionUID = -1913764056809647024L;

	private IncomeService incomeService;
	private List<Income> rows;
	private long total;

	private Income income;
	private Employee emp;

	public Income getIncome() {
		return income;
	}

	public void setIncome(Income income) {
		this.income = income;
	}

	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	public List<Income> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public String showIncomeHome() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			return "incomeHome";
		}
		return ERROR;
	}

	public String incomePager() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			Pager4EasyUI<Income> pager = new Pager4EasyUI<Income>();
			pager.setPageNo(WebUtil.getPageNo(req));
			pager.setPageSize(WebUtil.getPageSize(req));
			pager = incomeService.queryPager("Income", pager);
			pager.setTotal(incomeService.count("Income"));
			total = pager.getTotal();
			rows = pager.getRows();
			return "pager";
		}
		return ERROR;
	}

	public String allIncomeType() {

		return "all";
	}

	public String addIncomeType() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			incomeService.save(income);
			return "addIncomeType";
		}
		return ERROR;
	}

}
