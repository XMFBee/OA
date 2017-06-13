package com.oa.service;

import java.util.List;

import com.oa.bean.Goods;
import com.oa.bean.GoodsType;
import com.oa.bean.info.GoodsInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.BaseDAO;

/**
 * @author XMF
 */

public interface GoodsService extends BaseDAO<Goods> {
	
	public List<GoodsType> queryNameAll();
	
	public Pager4EasyUI<GoodsInfo> queryInfoPaer(Pager4EasyUI<GoodsInfo> pager);
	
	public void updateGoods(Goods goods);
	
	// 更新总数
	public void updateQuantity(String goodsId, int quantity);
	
	public int countGoodsByGT(String gtId);
	
//	public Pager4EasyUI<GoodsInfo> queryByNameOrType(Pager4EasyUI<GoodsInfo> pager,String name,String gTypename);
	public Pager4EasyUI<GoodsInfo> queryByName(Pager4EasyUI<GoodsInfo> pager,String name);
	
	public Pager4EasyUI<GoodsInfo> queryByQuantity(Pager4EasyUI<GoodsInfo> pager, int quantity);
	
}
