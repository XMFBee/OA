package com.oa.service.info;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.info.GoodsAppInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.info.GoodsAppInfoDAO;

public class GoodsAppInfoServiceImpl implements GoodsAppInfoService {
	
	private GoodsAppInfoDAO goodsAppInfoDAO;

	public void setGoodsAppInfoDAO(GoodsAppInfoDAO goodsAppInfoDAO) {
		this.goodsAppInfoDAO = goodsAppInfoDAO;
	}

	@Override
	public GoodsAppInfo save(GoodsAppInfo t) {
		return goodsAppInfoDAO.save(t);
	}

	@Override
	public void delete(GoodsAppInfo t) {
		goodsAppInfoDAO.delete(t);
	}

	@Override
	public void update(GoodsAppInfo t) {
		goodsAppInfoDAO.update(t);
	}

	@Override
	public GoodsAppInfo queryById(Class<?> clazz, Serializable id) {
		return goodsAppInfoDAO.queryById(clazz, id);
	}

	@Override
	public List<GoodsAppInfo> queryAll(Serializable beanName) {
		return goodsAppInfoDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<GoodsAppInfo> queryPager(String beanName, Pager4EasyUI<GoodsAppInfo> pager) {
		return goodsAppInfoDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return goodsAppInfoDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		goodsAppInfoDAO.updateStatus(beanName, beanId, status, id);
	}
	
}
