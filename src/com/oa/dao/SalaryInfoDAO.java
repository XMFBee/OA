package com.oa.dao;


import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface SalaryInfoDAO extends BaseDAO<SalaryInfo>{
	public Pager4EasyUI<SalaryInfo> queryBySearch(Pager4EasyUI<SalaryInfo> pager, String name);
	public Pager4EasyUI<SalaryInfo> queryByPhone(Pager4EasyUI<SalaryInfo> pager, String phone);
	
	public Pager4EasyUI<SalaryInfo> querySelfSalaryInfo(String empId, Pager4EasyUI<SalaryInfo> pager);
}
