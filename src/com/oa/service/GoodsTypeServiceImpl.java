package com.oa.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.oa.bean.GoodsType;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.GoodsTypeDAO;

/**
 * @author XMF
 */

public class GoodsTypeServiceImpl implements GoodsTypeService {
	
	private GoodsTypeDAO gtDAO;

	public void setGtDAO(GoodsTypeDAO gtDAO) {
		this.gtDAO = gtDAO;
	}

	@Override
	public GoodsType save(GoodsType t) {
		return gtDAO.save(t);
	}

	@Override
	public void delete(GoodsType t) {
		gtDAO.delete(t);
	}

	@Override
	public void update(GoodsType t) {
		gtDAO.update(t);
	}

	@Override
	public GoodsType queryById(Class<?> clazz, Serializable id) {
		return gtDAO.queryById(clazz, id);
	}

	@Override
	public List<GoodsType> queryAll(Serializable beanName) {
		return gtDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<GoodsType> queryPager(String beanName, Pager4EasyUI<GoodsType> pager) {
		return gtDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return gtDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		gtDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Map<String, String> queryIdAndName() {
		return gtDAO.queryIdAndName();
	}

}
