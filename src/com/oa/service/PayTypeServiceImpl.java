package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.PayType;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.PayTypeDAO;

public class PayTypeServiceImpl implements PayTypeService{

	private PayTypeDAO payTypeDAO;

	
	public void setPayTypeDAO(PayTypeDAO payTypeDAO) {
		this.payTypeDAO = payTypeDAO;
	}

	@Override
	public PayType save(PayType t) {
		return payTypeDAO.save(t);
	}

	@Override
	public void delete(PayType t) {
		payTypeDAO.delete(t);
	}

	@Override
	public void update(PayType t) {
		payTypeDAO.update(t);
	}

	@Override
	public PayType queryById(Class<?> clazz, Serializable id) {
		return payTypeDAO.queryById(clazz, id);
	}

	@Override
	public List<PayType> queryAll(Serializable beanName) {
		return payTypeDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<PayType> queryPager(String beanName, Pager4EasyUI<PayType> pager) {
		return payTypeDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return payTypeDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		 payTypeDAO.updateStatus(beanName, beanId, status, id);
	}

	
}
