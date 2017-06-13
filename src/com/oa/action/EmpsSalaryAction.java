package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.SalaryInfo;
import com.oa.bean.info.EmpsSalary;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.EmpsSalaryService;
import com.opensymphony.xwork2.ActionSupport;

public class EmpsSalaryAction extends ActionSupport implements ServletRequestAware {
	private static final long serialVersionUID = 8714952393580867202L;

	private HttpServletRequest request;
	private String eId;
	private SalaryInfo salaryInfo;
	private EmpsSalaryService empsSalaryService;

	private List<EmpsSalary> rows;
	private long total;

	public void setEmpsSalaryService(EmpsSalaryService empsSalaryService) {
		this.empsSalaryService = empsSalaryService;
	}

	public List<EmpsSalary> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public SalaryInfo getSalaryInfo() {
		return salaryInfo;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String queryById() {
		String sql = "select count(s.empid) from t_salaryinfo s where s.empid = '" + eId + "'";
		System.out.println("id_______________: " + eId);
		Pager4EasyUI<EmpsSalary> pager = new Pager4EasyUI<>();
		pager.setPageNo(WebUtil.getPageNo(request));
		pager.setPageSize(WebUtil.getPageSize(request));
		pager = empsSalaryService.queryByEmpId(eId, pager);
		pager.setTotal(empsSalaryService.count(sql));
		total = pager.getTotal();
		rows = pager.getRows();
		return "byId";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
