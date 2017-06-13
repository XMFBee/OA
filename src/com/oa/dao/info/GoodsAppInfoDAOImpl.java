package com.oa.dao.info;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.info.GoodsAppInfo;
import com.oa.common.bean.Pager4EasyUI;

public class GoodsAppInfoDAOImpl extends AbstractBaseDAO<GoodsAppInfo> implements GoodsAppInfoDAO {

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<GoodsAppInfo> queryPager(String beanName, Pager4EasyUI<GoodsAppInfo> pager) {
		Session session = getSessionFactory().getCurrentSession();
		String sql = "select ga.goodsappid, ga.appday, ga.quantity, ga.des, ga.'status', " 
				+ " ga.appstatus, e.empid, e.name as empName, g.goodsId, g.'name' as goodsname "
				+ " from t_goodsapp ga left join t_emp e on ga.empid = e.empid " 
				+ " left join t_goods g on ga.goodsname = g.'name'";
		Query query = session.createSQLQuery(sql);
		query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<Object[]> row = query.list();
        List<GoodsAppInfo> list = new ArrayList<GoodsAppInfo>();
        for(Object[] o: row){
        	GoodsAppInfo gi = new GoodsAppInfo();
        	gi.setGoodsAppId(o[0].toString());
        	gi.setAppDay((Date) o[1]);
        	gi.setQuantity((int) o[2]);
        	gi.setDes(o[3].toString());
        	gi.setStatus((int) o[4]);
        	gi.setAppStatus((int) o[5]);
        	gi.setEmpId(o[6].toString());
        	gi.setEmpName(o[7].toString());
        	gi.setGoodsName(o[8].toString());
        	list.add(gi);
        }
        pager.setRows(list);
		return null;
	}

}
