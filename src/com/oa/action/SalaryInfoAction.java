package com.oa.action;

import java.util.List;

import com.oa.bean.Employee;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.SalaryInfoService;

/**
 * @author 賴泰君
 */
public class SalaryInfoAction extends BaseAction {

	private static final long serialVersionUID = -5017225881556956220L;

	private SalaryInfoService salaryInfoService;

	private List<SalaryInfo> rows;
	private long total;

	private SalaryInfo salaryInfo;
	private ControllerRequest result;
	private String value;
	private String name;
	private Employee emp;

	public void setValue(String value) {
		this.value = value;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ControllerRequest getResult() {
		return result;
	}

	public void setSalaryInfoService(SalaryInfoService salaryInfoService) {
		this.salaryInfoService = salaryInfoService;
	}

	public List<SalaryInfo> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public SalaryInfo getSalaryInfo() {
		return salaryInfo;
	}

	public void setSalaryInfo(SalaryInfo salaryInfo) {
		this.salaryInfo = salaryInfo;
	}

	/**
	 * 分页显示所有员工工资信息
	 * 
	 * @return pager
	 */
	public String salaryInfoPager() {
		Pager4EasyUI<SalaryInfo> pager = new Pager4EasyUI<SalaryInfo>();
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.salaryInfoPager")) {
			pager.setPageSize(WebUtil.getPageSize(req));
			pager.setPageNo(WebUtil.getPageNo(req));
			pager = salaryInfoService.queryPager("SalaryInfo", pager);
			pager.setTotal(salaryInfoService.count("SalaryInfo"));
			total = pager.getTotal();
			rows = pager.getRows();
			return "pager";
		} else {
			querySelfSalaryInfo();
		}
		return "pager";
	}

	/**
	 * 修改员工工资
	 * 
	 * @return updata
	 */
	public String updataSalary() {
		System.out.println("_____________" + salaryInfo);
		salaryInfoService.update(salaryInfo);
		result = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}

	/**
	 * 添加员工工资
	 * 
	 * @return add
	 */
	public String addSalary() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.addSalary")) {
			salaryInfo.setEmpId(salaryInfo.getEmp().getEmpId());
			salaryInfoService.save(salaryInfo);
			result = ControllerRequest.getSuccessRequest("添加成功");
			return "add";
		}
		return ERROR;
	}

	/**
	 * 分頁顯示支出類別信息
	 * 
	 * @return payTypePager
	 */
	public String payTypePager() {
		return "payTypePager";
	}

	/**
	 * 显示员工工资信息页面
	 * 
	 * @return showPager
	 */
	public String showSalaryInfoHome() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.showSalaryInfoHome")) {
			return "home";
		}
		return ERROR;
	}

	/**
	 * 显示所有支出類別页面
	 * 
	 * @return showPayTypePager
	 */
	public String showPayTypePager() {
		return "showPayTypePager";
	}

	public String doSearch() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.SalaryInfoAction.doSearch")) {
			System.out.println(name + ":" + value);
			Pager4EasyUI<SalaryInfo> pager = new Pager4EasyUI<SalaryInfo>();
			pager.setPageSize(WebUtil.getPageSize(req));
			pager.setPageNo(WebUtil.getPageNo(req));
			if (name.equals("name")) {
				pager = salaryInfoService.queryBySearch(pager, value);
				rows = pager.getRows();
				total = pager.getTotal();
				if (rows != null) {
					result = ControllerRequest.getSuccessRequest("查找成功");
				} else {
					result = ControllerRequest.getFailRequest("没有记录");
				}
			} else if (name.equals("phone")) {
				pager = salaryInfoService.queryBySearch(pager, value);
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

	public String querySelfSalaryInfo() {
		System.out.println("来~~~啊，快活啊");
		Pager4EasyUI<SalaryInfo> pager = new Pager4EasyUI<SalaryInfo>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = salaryInfoService.querySelfSalaryInfo(emp.getEmpId(), pager);
		pager.setTotal(salaryInfoService.count("SalaryInfo"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "selfSalaryInfo";
	}
}
