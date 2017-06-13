package com.oa.action;

import java.util.List;

import com.oa.bean.Employee;
import com.oa.bean.Salary;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.SalaryService;

public class SalaryAction extends BaseAction {
	private static final long serialVersionUID = -6384678641769918056L;

	private SalaryService salaryService;
	private ControllerRequest result;
	private List<Salary> rows;
	private long total;
	private Salary salary;
	private String eId;
	private Employee emp;

	private String name;
	private String value;

	public void setName(String name) {
		this.name = name;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String geteId() {
		return eId;
	}

	public Salary getSalary() {
		return salary;
	}

	public void setSalary(Salary salary) {
		this.salary = salary;
	}

	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}

	public ControllerRequest getResult() {
		return result;
	}

	public List<Salary> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public String showSalaryHome() {
		return "home";
	}

	public String salaryPager() {
		Pager4EasyUI<Salary> pager = new Pager4EasyUI<Salary>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = salaryService.queryPager("Salary", pager);
		pager.setTotal(salaryService.count("Salary"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}

	public String addSalary() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			SalaryInfo info = salaryService.queryById(salary.getEmployee().getEmpId());
			salary.setTotalsalary(
					info.getBasicSalary() + info.getJobSalary() - salary.getSubsalary() + salary.getExtrasalary());
			salaryService.save(salary);
			result = ControllerRequest.getSuccessRequest("添加成功！");
			return "add";
		}
		return ERROR;
	}

	public String updataSalary() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			System.out.println("_______________" + salary);
			salaryService.update(salary);
			result = ControllerRequest.getSuccessRequest("更新成功！");
			return "update";
		}
		return ERROR;
	}

	public String doSearch() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			System.out.println(name + ":" + value);
			Pager4EasyUI<Salary> pager = new Pager4EasyUI<Salary>();
			pager.setPageSize(WebUtil.getPageSize(req));
			pager.setPageNo(WebUtil.getPageNo(req));
			if (name.equals("name")) {
				pager = salaryService.queryBySearch(pager, value);
				rows = pager.getRows();
				total = pager.getTotal();
				if (rows != null) {
					result = ControllerRequest.getSuccessRequest("查找成功");
				} else {
					result = ControllerRequest.getFailRequest("没有记录");
				}
			} else if (name.equals("phone")) {
				pager = salaryService.queryBySearch(pager, value);
				rows = pager.getRows();
				total = pager.getTotal();
				if (rows != null) {
					result = ControllerRequest.getSuccessRequest("查找成功");
				} else {
					result = ControllerRequest.getFailRequest("没有记录");
				}
			}
			return "search";
		}
		return ERROR;
	}

}
