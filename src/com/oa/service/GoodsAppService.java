package com.oa.service;

import com.oa.bean.GoodsApp;
import com.oa.dao.BaseDAO;

public interface GoodsAppService extends BaseDAO<GoodsApp>{
	
	public void updateGoodsApp(GoodsApp gooodsApp);
	
//	public Pager4EasyUI<GoodsAppInfo> queryPager(Pager4EasyUI<GoodsAppInfo> pager);
	
}
