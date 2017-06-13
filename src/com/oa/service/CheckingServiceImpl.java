package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.EmpCheckingInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.CheckingDAO;

public class CheckingServiceImpl implements CheckingService{

	private CheckingDAO checkingDAO;
	


	public void setCheckingDAO(CheckingDAO checkingDAO) {
		this.checkingDAO = checkingDAO;
	}

	@Override
	public EmpCheckingInfo save(EmpCheckingInfo t) {
		return checkingDAO.save(t);
	}

	@Override
	public void delete(EmpCheckingInfo t) {
		checkingDAO.delete(t);
	}

	@Override
	public void update(EmpCheckingInfo t) {
		checkingDAO.update(t);
	}

	@Override
	public EmpCheckingInfo queryById(Class<?> clazz, Serializable id) {
		return checkingDAO.queryById(clazz, id);
	}

	@Override
	public List<EmpCheckingInfo> queryAll(Serializable beanName) {
		return checkingDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<EmpCheckingInfo> queryPager(String beanName, Pager4EasyUI<EmpCheckingInfo> pager) {
		return checkingDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return checkingDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		 checkingDAO.updateStatus(beanName, beanId, status, id);
	}

	
	
}
