package com.oa.service.info;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.info.MeettingInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.MeettingDAO;
import com.oa.dao.info.MeettingInfoDAO;

public class MeettingInfoServiceImpl implements MeettingInfoService {

	public MeettingInfoDAO meettingInfoDAO;
	
	public void setMeettingInfoDAO(MeettingInfoDAO meettingInfoDAO) {
		this.meettingInfoDAO = meettingInfoDAO;
	}

	@Override
	public MeettingInfo save(MeettingInfo t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(MeettingInfo t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(MeettingInfo t) {
		meettingInfoDAO.update(t);
	}

	@Override
	public MeettingInfo queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MeettingInfo> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<MeettingInfo> queryPager(String beanName, Pager4EasyUI<MeettingInfo> pager) {
		return meettingInfoDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return meettingInfoDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<MeettingInfo> queryBySearch(Pager4EasyUI<MeettingInfo> pager, String empName) {
		return meettingInfoDAO.queryBySearch(pager, empName);
	}

	

	
	
}
