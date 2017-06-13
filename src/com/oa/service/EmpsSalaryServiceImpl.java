package com.oa.service;

import com.oa.bean.info.EmpsSalary;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.EmpsSalaryDAO;

public class EmpsSalaryServiceImpl implements EmpsSalaryService {
	private EmpsSalaryDAO empsSalaryDAO;

	public void setEmpsSalaryDAO(EmpsSalaryDAO empsSalaryDAO) {
		this.empsSalaryDAO = empsSalaryDAO;
	}

	@Override
	public long count(String sql) {
		return empsSalaryDAO.count(sql);
	}

	@Override
	public Pager4EasyUI<EmpsSalary> queryByEmpId(String eId, Pager4EasyUI<EmpsSalary> pager) {
		return empsSalaryDAO.queryByEmpId(eId, pager);
	}

}
