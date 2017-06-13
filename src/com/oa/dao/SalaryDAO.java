package com.oa.dao;

import com.oa.bean.Salary;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface SalaryDAO extends BaseDAO<Salary> {
	public SalaryInfo queryById(String id);
	public Pager4EasyUI<Salary> queryBySearch(Pager4EasyUI<Salary> pager, String name);
}
