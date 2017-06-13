package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Income;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.IncomeDAO;

public class IncomeServiceImpl implements IncomeService {

	private IncomeDAO incomeDAO;

	public void setIncomeDAO(IncomeDAO incomeDAO) {
		this.incomeDAO = incomeDAO;
	}

	@Override
	public Income save(Income t) {
		return incomeDAO.save(t);
	}

	@Override
	public void delete(Income t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Income t) {
		// TODO Auto-generated method stub

	}

	@Override
	public Income queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Income> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Income> queryPager(String beanName, Pager4EasyUI<Income> pager) {
		return incomeDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return incomeDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub

	}

}
