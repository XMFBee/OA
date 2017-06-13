package com.oa.service;

import java.util.Date;

import com.oa.bean.EmpFeedback;
import com.oa.bean.Report;
import com.oa.bean.info.ReportInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface ReportService  extends BaseService<Report>{
	/*public Pager4EasyUI<ReportInfo> baseQuery(Pager4EasyUI<ReportInfo> pager,String depid, String empid, Date beginDate, Date endDate, int status) ;*/
	public Pager4EasyUI<ReportInfo> queryById(Pager4EasyUI<ReportInfo> pager, String empid, String beginDateStr, String endDateStr, String status,String sort);
	
	public Pager4EasyUI<ReportInfo> queryByDept(Pager4EasyUI<ReportInfo> pager,String depid, String empid, String beginDateStr, String endDateStr ,String status,String sort);
	
	public Pager4EasyUI<ReportInfo> queryByBoss(Pager4EasyUI<ReportInfo> pager, String beginDateStr, String endDateStr, String status,String sort);
	
	
	public int countById(String empid, String beginDateStr, String endDateStr, String status,String sort);
	
	public int countByDept(String depid, String empid, String beginDateStr, String endDateStr ,String status,String sort);
	
	public int countByBoss(String beginDateStr, String endDateStr, String status,String sort);
}
