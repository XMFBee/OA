package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.GoodsApp;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.GoodsAppDAO;

/**
 * @author XMF
 */

public class GoodsAppServiceImpl implements GoodsAppService {
	
	private GoodsAppDAO goodsAppDAO;

	public void setGoodsAppDAO(GoodsAppDAO goodsAppDAO) {
		this.goodsAppDAO = goodsAppDAO;
	}

	@Override
	public GoodsApp save(GoodsApp t) {
		return goodsAppDAO.save(t);
	}

	@Override
	public void delete(GoodsApp t) {
		goodsAppDAO.delete(t);
	}

	@Override
	public void update(GoodsApp t) {
		goodsAppDAO.update(t);
	}

	@Override
	public GoodsApp queryById(Class<?> clazz, Serializable id) {
		return goodsAppDAO.queryById(clazz, id);
	}

	@Override
	public List<GoodsApp> queryAll(Serializable beanName) {
		return goodsAppDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<GoodsApp> queryPager(String beanName, Pager4EasyUI<GoodsApp> pager) {
		return goodsAppDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return goodsAppDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		goodsAppDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public void updateGoodsApp(GoodsApp gooodsApp) {
		goodsAppDAO.updateGoodsApp(gooodsApp);
	}

}
