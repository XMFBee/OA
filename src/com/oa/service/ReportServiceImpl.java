package com.oa.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.oa.bean.Report;
import com.oa.bean.info.ReportInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.dao.ReportDAO;

public class ReportServiceImpl implements ReportService{
	private Date beginDate;
	private Date endDate;
	
	private ReportDAO reportDAO;
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}

	@Override
	public Report save(Report t) {
		return reportDAO.save(t);
	}

	@Override
	public void delete(Report t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Report t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Report queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Report> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Report> queryPager(String beanName, Pager4EasyUI<Report> pager) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count(Serializable beanName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 根据功能
	 */
	@Override
	public Pager4EasyUI<ReportInfo> queryById(Pager4EasyUI<ReportInfo> pager, String empid, String beginDateStr, String endDateStr, String status,String sort) {
		
		if(beginDateStr!=null&&!beginDateStr.equals("")){			beginDate =  WebUtil.str2Date(beginDateStr, "yyyy-MM-dd");		}else {beginDate = null;}
		if(endDateStr!=null&&!endDateStr.equals("")){ endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd");}else {endDate=null;}
		return reportDAO.baseQuery(pager, null, empid, beginDate, endDate, status,sort);
	}

	@Override
	public Pager4EasyUI<ReportInfo> queryByDept(Pager4EasyUI<ReportInfo> pager, String depid, String empid,
			String beginDateStr, String endDateStr, String status,String sort) {
		if(beginDateStr!=null&&!beginDateStr.equals("")){			beginDate =  WebUtil.str2Date(beginDateStr, "yyyy-MM-dd");		}else {beginDate = null;}
		if(endDateStr!=null&&!endDateStr.equals("")){ endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd");}else {endDate=null;}
		return reportDAO.baseQuery(pager, depid, empid, beginDate, endDate, status,sort);
	}

	@Override
	public Pager4EasyUI<ReportInfo> queryByBoss(Pager4EasyUI<ReportInfo> pager, String beginDateStr, String endDateStr,
			String status,String sort) {
		if(beginDateStr!=null&&!beginDateStr.equals("")){			beginDate =  WebUtil.str2Date(beginDateStr, "yyyy-MM-dd");		}else {beginDate = null;}
		if(endDateStr!=null&&!endDateStr.equals("")){ endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd");}else {endDate=null;}
		return reportDAO.baseQuery(pager, null, null, beginDate, endDate, status,sort);
	}

	@Override
	public int countById(String empid, String beginDateStr, String endDateStr, String status, String sort) {
		if(beginDateStr!=null&&!beginDateStr.equals("")){			beginDate =  WebUtil.str2Date(beginDateStr, "yyyy-MM-dd");		}else {beginDate = null;}
		if(endDateStr!=null&&!endDateStr.equals("")){ endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd");}else {endDate=null;}
		return reportDAO.baseCount(null, empid, beginDate, endDate, status,sort);
	}

	@Override
	public int countByDept(String depid, String empid, String beginDateStr, String endDateStr, String status,
			String sort) {
		if(beginDateStr!=null&&!beginDateStr.equals("")){			beginDate =  WebUtil.str2Date(beginDateStr, "yyyy-MM-dd");		}else {beginDate = null;}
		if(endDateStr!=null&&!endDateStr.equals("")){ endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd");}else {endDate=null;}
		return reportDAO.baseCount(depid, empid, beginDate, endDate, status,sort);
	}

	@Override
	public int countByBoss(String beginDateStr, String endDateStr, String status, String sort) {
		if(beginDateStr!=null&&!beginDateStr.equals("")){			beginDate =  WebUtil.str2Date(beginDateStr, "yyyy-MM-dd");		}else {beginDate = null;}
		if(endDateStr!=null&&!endDateStr.equals("")){ endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd");}else {endDate=null;}

		return reportDAO.baseCount(null, null, beginDate, endDate, status,sort);
	}



}
