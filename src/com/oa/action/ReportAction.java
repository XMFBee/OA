package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Report;
import com.oa.bean.info.ReportInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.dao.ReportDAO;
import com.oa.service.ReportService;
import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends ActionSupport implements ServletRequestAware{
	private ReportService reportService;
	private Report report;
	private Pager4EasyUI<ReportInfo> pager ;
	private HttpServletRequest request;
	
	private int total;
	private List<ReportInfo> rows;
	
	public String save(){
		report.setReportday(new Date());
		report.setStatus(1);;
		reportService.save(report);
		return "save";
	}
	
	public String pager(){
		String empid = request.getParameter("empid");
		String depid = request.getParameter("depid");
		String beginday = request.getParameter("beginDate");
		String endday = request.getParameter("endDate");
		String sort = request.getParameter("sort");
		String status = request.getParameter("status");
		
		pager = new Pager4EasyUI<ReportInfo>();
		pager.setPageNo(WebUtil.getPageNo(request));
		pager.setPageSize(WebUtil.getPageSize(request));
		if(depid!=null&&!depid.equals("")){//部门查
			reportService.queryByDept(pager, depid, empid, beginday, endday, status, sort);
			pager.setTotal(reportService.countByDept(depid, empid, beginday, endday, status, sort));
		}else {
			if(empid!=null && !empid.equals("")){//员工查
				reportService.queryById(pager, empid, beginday, endday, status, sort);
				pager.setTotal(reportService.countById(empid, beginday, endday, status, sort));
			}else{//查所有
				reportService.queryByBoss(pager, beginday, endday, status, sort);
				pager.setTotal(reportService.countByBoss(beginday, endday, status, sort));
				
			}
		}
		/**
		 * 页面传什么就收什么
		 * 1.如果页面什么都没有传,
		 *   	则默认自己,以时间默认最新
		 */
		rows = pager.getRows();
		total = (int) pager.getTotal();
		return "pager";
	}
	
	public String showReport() {
		return "showReport";
	}
	
	public String myReport(){
		return "myReport";
		
	}
	public String otherReport(){
		return "otherReport";
	}
	
	

	/**
	 * get/set
	 * @return
	 */
	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public int getTotal() {
		return total;
	}

	public List<ReportInfo> getRows() {
		return rows;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	

}
