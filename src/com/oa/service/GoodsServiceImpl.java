package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Goods;
import com.oa.bean.GoodsType;
import com.oa.bean.info.GoodsInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.GoodsDAO;

/**
 * @author XMF
 */

public class GoodsServiceImpl implements GoodsService {
	
	private GoodsDAO goodsDAO;
	
	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	@Override
	public Goods save(Goods t) {
		return goodsDAO.save(t);
	}

	@Override
	public void delete(Goods t) {
		goodsDAO.delete(t);
	}

	@Override
	public void update(Goods t) {
		goodsDAO.update(t);
	}

	@Override
	public Goods queryById(Class<?> clazz, Serializable id) {
		return goodsDAO.queryById(clazz, id);
	}

	@Override
	public List<Goods> queryAll(Serializable beanName) {
		return goodsDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Goods> queryPager(String beanName, Pager4EasyUI<Goods> pager) {
		return goodsDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return goodsDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		goodsDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<GoodsInfo> queryInfoPaer(Pager4EasyUI<GoodsInfo> pager) {
		return goodsDAO.queryInfoPager(pager);
	}

	@Override
	public List<GoodsType> queryNameAll() {
		return goodsDAO.queryNameAll();
	}

	@Override
	public void updateGoods(Goods goods) {
		goodsDAO.updateGoods(goods);
	}

	@Override
	public void updateQuantity(String goodsId, int quantity) {
		goodsDAO.updateQuantity(goodsId, quantity);
	}

	@Override
	public int countGoodsByGT(String gtId) {
		return goodsDAO.countGoodsByGT(gtId);
	}

//	@Override
//	public Pager4EasyUI<GoodsInfo> queryByNameOrType(Pager4EasyUI<GoodsInfo> pager, String name, String gTypename) {
//		return goodsDAO.queryByNameOrType(pager, name, gTypename);
//	}
	
	@Override
	public Pager4EasyUI<GoodsInfo> queryByName(Pager4EasyUI<GoodsInfo> pager, String name) {
		return goodsDAO.queryByName(pager, name);
	}

	@Override
	public Pager4EasyUI<GoodsInfo> queryByQuantity(Pager4EasyUI<GoodsInfo> pager, int quantity) {
		return goodsDAO.queryByQuantity(pager, quantity);
	}

}
