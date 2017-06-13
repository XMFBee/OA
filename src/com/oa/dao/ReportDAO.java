package com.oa.dao;

import java.util.Date;

import com.oa.bean.Report;
import com.oa.bean.info.ReportInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface ReportDAO extends BaseDAO<Report>{
	
	public Pager4EasyUI<ReportInfo> baseQuery(Pager4EasyUI<ReportInfo> pager,String depid, String empid, Date beginDate, Date endDate,String status,String sort);

	public int baseCount(String depid, String empid, Date beginDate, Date endDate,String status,String sort);
}
