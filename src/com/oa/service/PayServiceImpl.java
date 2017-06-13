package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Pay;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.PayDAO;
import com.oa.service.PayService;

/*郭玉清*/
public class PayServiceImpl implements PayService {

	private PayDAO payDAO;

	public PayDAO getPayDAO() {
		return payDAO;
	}

	public void setPayDAO(PayDAO payDAO) {
		this.payDAO = payDAO;
	}

	@Override
	public Pay save(Pay t) {
		return payDAO.save(t);
	}

	@Override
	public void delete(Pay t) {
		payDAO.delete(t);
	}

	@Override
	public void update(Pay t) {
		payDAO.update(t);
	}

	@Override
	public Pay queryById(Class<?> clazz, Serializable id) {
		return payDAO.queryById(clazz, id);
	}

	@Override
	public List<Pay> queryAll(Serializable beanName) {
		return payDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Pay> queryPager(String beanName, Pager4EasyUI<Pay> pager) {
		return payDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return payDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		payDAO.updateStatus(beanName, beanId, status, id);

	}

}
