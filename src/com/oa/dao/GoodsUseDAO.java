package com.oa.dao;

import java.util.Date;

import com.oa.bean.EmpFeedback;
import com.oa.bean.GoodsUse;
import com.oa.common.bean.Pager4EasyUI;

public interface GoodsUseDAO extends BaseDAO<GoodsUse>{
	public Pager4EasyUI<GoodsUse> queryNorm(Pager4EasyUI<GoodsUse> pager, String depid, String empid,String empname,Date beginDate, Date endDate,String believe,String sort, String order);
	
	public void updReturnDay(String useId,Date returnDay);
}
