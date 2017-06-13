package com.oa.action.info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Department;
import com.oa.bean.info.DepEmps;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.EmployeeService;
import com.oa.service.info.DepEmpsServiceInfo;
/**
 * datagrid 显示一个部门的员工并分页
 * @author Administrator
 *
 */
public class DepEmpsAction implements ServletRequestAware{
	private DepEmpsServiceInfo depEmpsServiceInfo;
	private EmployeeService employeeService;
	private Pager4EasyUI<DepEmps> pager = new Pager4EasyUI<DepEmps>();
	private HttpServletRequest request;
	private Department department;
	 
	
	private List<DepEmps> rows;
	private int total;
	
	public String execute() {
		if(request.getParameter("depId")!=null){
			pager.setTotal(employeeService.countEmpsByDept(request.getParameter("depId")));
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			String sql2 = "from Department d left join d.employees e where d.depId = '" + request.getParameter("depId")+"' and e.status =1 ";
			depEmpsServiceInfo.query(sql2, pager);
			
			rows = pager.getRows();
			total = (int) pager.getTotal();
		}else {
			rows = new ArrayList();
		}
		return "success";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * set/get
	 * @return
	 */

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	public List<DepEmps> getRows() {
		return rows;
	}

	public int getTotal() {
		return total;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	
	public void setDepEmpsServiceInfo(DepEmpsServiceInfo depEmpsServiceInfo) {
		this.depEmpsServiceInfo = depEmpsServiceInfo;
	}
}
