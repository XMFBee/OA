package com.oa.service;

import com.oa.bean.Salary;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface SalaryService extends BaseService<Salary> {
	public SalaryInfo queryById(String id);
	public Pager4EasyUI<Salary> queryBySearch(Pager4EasyUI<Salary> pager, String name);
}
