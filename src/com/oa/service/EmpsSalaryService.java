package com.oa.service;

import com.oa.bean.info.EmpsSalary;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpsSalaryService {
	public Pager4EasyUI<EmpsSalary> queryByEmpId(String eId, Pager4EasyUI<EmpsSalary> pager);

	public long count(String sql);
}
