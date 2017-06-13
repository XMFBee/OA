package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.NoticeType;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.SystemDAO;

public class SystemServiceImpl implements SystemService {

	private SystemDAO systemDAO;
	
	public void setSystemDAO(SystemDAO systemDAO) {
		this.systemDAO = systemDAO;
	}

	@Override
	public NoticeType save(NoticeType t) {
		return systemDAO.save(t);
	}

	@Override
	public void delete(NoticeType t) {
		systemDAO.delete(t);
	}

	@Override
	public void update(NoticeType t) {
		systemDAO.update(t);
	}

	@Override
	public NoticeType queryById(Class<?> clazz, Serializable id) {
		return systemDAO.queryById(clazz, id);
	}

	@Override
	public List<NoticeType> queryAll(Serializable beanName) {
		return systemDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<NoticeType> queryPager(String beanName, Pager4EasyUI<NoticeType> pager) {
		return systemDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return systemDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		systemDAO.updateStatus(beanName, beanId, status, id);
	}

}
