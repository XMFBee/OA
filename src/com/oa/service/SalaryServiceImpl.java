package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Salary;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.SalaryDAO;

public class SalaryServiceImpl implements SalaryService{
	
	private SalaryDAO salaryDAO;
	
	public void setSalaryDAO(SalaryDAO salaryDAO) {
		this.salaryDAO = salaryDAO;
	}

	@Override
	public Salary save(Salary t) {
		return salaryDAO.save(t);
	}

	@Override
	public void delete(Salary t) {
		salaryDAO.delete(t);
	}

	@Override
	public void update(Salary t) {
		salaryDAO.update(t);
	}

	@Override
	public Salary queryById(Class<?> clazz, Serializable id) {
		return salaryDAO.queryById(clazz, id);
	}

	@Override
	public List<Salary> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Salary> queryPager(String beanName, Pager4EasyUI<Salary> pager) {
		return salaryDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return salaryDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		salaryDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public SalaryInfo queryById(String id) {
		return salaryDAO.queryById(id);
	}

	@Override
	public Pager4EasyUI<Salary> queryBySearch(Pager4EasyUI<Salary> pager, String name) {
		return salaryDAO.queryBySearch(pager, name);
	}
}
