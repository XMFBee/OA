package com.oa.service;

import java.util.Date;

import com.oa.bean.GoodsUse;
import com.oa.common.bean.Pager4EasyUI;

public interface GoodsUseService extends BaseService<GoodsUse>{
	public Pager4EasyUI<GoodsUse> queryBySelf(Pager4EasyUI<GoodsUse> pager, String empid,
			String beginDate, String endDate, String believe, String sort, String order);
	
	public Pager4EasyUI<GoodsUse> queryByDep(Pager4EasyUI<GoodsUse> pager, String depid, String empid,
			String empname, String beginDate, String endDate, String believe, String sort, String order);
	
	public Pager4EasyUI<GoodsUse> queryByAll(Pager4EasyUI<GoodsUse> pager, String depid, String empid,
			String empname, String beginDate, String endDate, String believe, String sort, String order);
	
	public void returnGoods(String useId);
	
}
