package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Meetting;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.MeettingDAO;

public class MeettingServiceImpl implements MeettingService {
	//郭昶 service实现类
	
	public MeettingDAO meettingDAO;
	
	
	public void setMeettingDAO(MeettingDAO meettingDAO) {
		this.meettingDAO = meettingDAO;
	}


	@Override
	public Meetting save(Meetting t) {
		return meettingDAO.save(t);
	}


	@Override
	public void delete(Meetting t) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void update(Meetting t) {
		meettingDAO.update(t);
	}


	@Override
	public Meetting queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Meetting> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Pager4EasyUI<Meetting> queryPager(String beanName, Pager4EasyUI<Meetting> pager) {
		return meettingDAO.queryPager(beanName, pager);
	}


	@Override
	public long count(Serializable beanName) {
		return meettingDAO.count(beanName);
	}


	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		meettingDAO.updateStatus(beanName, beanId, status, id);
	}

	

}
