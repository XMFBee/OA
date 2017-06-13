package com.oa.dao;

import com.oa.bean.GoodsApp;

public interface GoodsAppDAO extends BaseDAO<GoodsApp>{
	
	public void updateGoodsApp(GoodsApp goodsApp);
	
//	public Pager4EasyUI<GoodsAppInfo> queryPager(Pager4EasyUI<GoodsAppInfo> pager);
	
}
