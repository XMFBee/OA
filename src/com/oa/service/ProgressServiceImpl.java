package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Progress;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.ProgressDAO;

public class ProgressServiceImpl implements ProgressService {

	public ProgressDAO progressDAO;
	
	public void setProgressdao(ProgressDAO progressDAO) {
		this.progressDAO = progressDAO;
	}

	@Override
	public Progress save(Progress t) {
		return progressDAO.save(t);
	}

	@Override
	public void update(Progress t) {
		progressDAO.update(t);
	}

	@Override
	public Progress queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Progress> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Progress> queryPager(String beanName, Pager4EasyUI<Progress> pager) {
		return progressDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return progressDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		progressDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public void delete(Progress t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<Progress> queryBySearch(Pager4EasyUI<Progress> pager, String empName) {
		return progressDAO.queryBySearch(pager, empName);
	}
	
}
