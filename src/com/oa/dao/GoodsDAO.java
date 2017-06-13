package com.oa.dao;

import java.util.List;

import com.oa.bean.Goods;
import com.oa.bean.GoodsType;
import com.oa.bean.info.GoodsInfo;
import com.oa.common.bean.Pager4EasyUI;

/**
 * @author XMF
 */

public interface GoodsDAO extends BaseDAO<Goods> {
	
	public void updateGoods(Goods Goods);
	
	public List<GoodsType> queryNameAll();
	
	public Pager4EasyUI<GoodsInfo> queryInfoPager(Pager4EasyUI<GoodsInfo> pager);
	
	// 更新总数
	public void updateQuantity(String goodsId, int quantity);
	
	public int countGoodsByGT(String gtId);
	
	// 根据输入的用品名称/用品类型查询
//	public Pager4EasyUI<GoodsInfo> queryByNameOrType(Pager4EasyUI<GoodsInfo> pager,String name,String gTypename);
	public Pager4EasyUI<GoodsInfo> queryByName(Pager4EasyUI<GoodsInfo> pager,String name);
	
	// 查询用品总数 > 0 的数据
	public Pager4EasyUI<GoodsInfo> queryByQuantity(Pager4EasyUI<GoodsInfo> pager,int quantity);
	
}