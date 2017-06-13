package com.oa.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.bean.info.EmpCheckInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.EmpCheckService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工值班Action
 * @author 程燕
 *
 */
public class EmpCheckAction extends BaseAction implements ServletRequestAware{
	
	private EmpCheckService empCheckService;
	private Pager4EasyUI<EmpCheckInfo> pager = new Pager4EasyUI<EmpCheckInfo>();
	
	private HttpServletRequest request;
	
	private int total;
	private List<EmpCheckInfo> rows;
	
	private final String className = this.getClass().getName();
	
	private final String WHE_ADDTYPE= "addType";
	private final String WHE_EMPID = "empId";
	private final String WHE_ADDID = "addId";
	private final String WHE_SORT = "sort";
	
	/**
	 * 没有权限的提示信息
	 */
	private String authorityMsg;

	public String pager(){
		authorityMsg= null;
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String addType = "grade";
			String empid = request.getParameter("empId");
			String empName = request.getParameter("empName");
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String addId = request.getParameter("addId");
			
			Calendar calendar=Calendar.getInstance();
			int month=calendar.get(Calendar.MONTH)+1;
			
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			if(request.getParameter(WHE_ADDTYPE)!=null && !request.getParameter(WHE_ADDTYPE).equals("")){//判断地址类型是否指定,指定则是 地址条件
				addType = request.getParameter(WHE_ADDTYPE);
			};
			if(request.getParameter(WHE_EMPID)!=null && !request.getParameter(WHE_EMPID).equals("")) {
				empid = request.getParameter(WHE_EMPID);
			}
			if((beginDate ==null || beginDate.equals(""))&&(endDate==null||endDate.equals("")) ){
					empCheckService.pagerByMonth(pager, month, addType, addId, empid, empName, sort, order);
					empCheckService.simpleCount("room", addId , empid);
			}else {
					empCheckService.simpleQueryCheck(pager, addType, addId, empid, empName, beginDate, endDate, sort, order);
			}
			rows = pager.getRows();
		}else{
			authorityMsg = "权限不足,请联系管理员";
		}
		return "pager";
	}
	
	
	
	public String showCheck() {
		authorityMsg= null;
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			return "showCheck";
		}
		return "error";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	/**
	 * get/set
	 */
	public void setEmpCheckService(EmpCheckService empCheckService) {
		this.empCheckService = empCheckService;
	}
	
	public int getTotal() {
		return total;
	}

	public List<EmpCheckInfo> getRows() {
		return rows;
	}

}
