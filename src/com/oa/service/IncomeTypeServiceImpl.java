package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.IncomeType;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.IncomeTypeDAO;

public class IncomeTypeServiceImpl implements IncomeTypeService {

	private IncomeTypeDAO incomeTypeDAO;

	public void setIncomeTypeDAO(IncomeTypeDAO incomeTypeDAO) {
		this.incomeTypeDAO = incomeTypeDAO;
	}

	@Override
	public IncomeType save(IncomeType t) {
		return incomeTypeDAO.save(t);
	}

	@Override
	public void delete(IncomeType t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(IncomeType t) {
		incomeTypeDAO.update(t);
	}

	@Override
	public IncomeType queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<IncomeType> queryAll(Serializable beanName) {
		return incomeTypeDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<IncomeType> queryPager(String beanName, Pager4EasyUI<IncomeType> pager) {
		return incomeTypeDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return incomeTypeDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		incomeTypeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public IncomeType queryByName(String name) {
		return incomeTypeDAO.queryByName(name);
	}

}
