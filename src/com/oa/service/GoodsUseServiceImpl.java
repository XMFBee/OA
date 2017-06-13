package com.oa.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.oa.bean.GoodsUse;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.dao.GoodsUseDAO;

public class GoodsUseServiceImpl implements GoodsUseService{
	private GoodsUseDAO goodsUseDAO;


	@Override
	public Pager4EasyUI<GoodsUse> queryBySelf(Pager4EasyUI<GoodsUse> pager, String empid, String beginDate, String endDate,
			String believe, String sort, String order) {
		Date begin = null;	Date end = null; 
		if(beginDate!=null&&!beginDate.equals("")){begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");}
		if(endDate!=null&&!endDate.equals("")){end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		
		
		return goodsUseDAO.queryNorm(pager,null, empid,	null,  begin,  end,  believe,  sort,  order);
	}

	@Override
	public Pager4EasyUI<GoodsUse> queryByDep(Pager4EasyUI<GoodsUse> pager, String depid, String empid, String empname,
			String beginDate, String endDate, String believe, String sort, String order) {
		// TODO Auto-generated method stub
		Date begin = null;	Date end = null; 
		if(beginDate!=null&&!beginDate.equals("")){begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");}
		if(endDate!=null&&!endDate.equals("")){end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		
		return goodsUseDAO.queryNorm(pager, depid, empid, empname, begin, end, believe, sort, order);
	}

	@Override
	public Pager4EasyUI<GoodsUse> queryByAll(Pager4EasyUI<GoodsUse> pager, String depid, String empid, String empname,
			String beginDate, String endDate, String believe, String sort, String order) {
		Date begin = null;	Date end = null; 
		if(beginDate!=null&&!beginDate.equals("")){begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");}
		if(endDate!=null&&!endDate.equals("")){end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		
		return goodsUseDAO.queryNorm(pager, depid, empid, empname, begin, end, believe, sort, order);
	}

	/**
	 * 
	 * Base
	 * save 保存
	 * delete 删除
	 * update 更改
	 * queryById 以goodsuse id查goodsuse
	 * queryAll 查询所有goodsuse
	 */
	
	@Override
	public GoodsUse save(GoodsUse t) {
		return goodsUseDAO.save(t);
	}

	@Override
	public void delete(GoodsUse t) {
		goodsUseDAO.delete(t);
	}

	@Override
	public void update(GoodsUse t) {
		goodsUseDAO.update(t);
	}

	@Override
	public GoodsUse queryById(Class<?> clazz, Serializable id) {
		return goodsUseDAO.queryById(clazz, id);
	}

	@Override
	public List<GoodsUse> queryAll(Serializable beanName) {
		return goodsUseDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<GoodsUse> queryPager(String beanName, Pager4EasyUI<GoodsUse> pager) {
		return goodsUseDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return goodsUseDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void returnGoods(String useId){
		goodsUseDAO.updReturnDay(useId,new Date());
	}
	

	public void setGoodsUseDAO(GoodsUseDAO goodsUseDAO) {
		this.goodsUseDAO = goodsUseDAO;
	}
	
}
