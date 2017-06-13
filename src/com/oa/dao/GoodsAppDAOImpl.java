package com.oa.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.GoodsApp;

/**
 * @author XMF
 */
public class GoodsAppDAOImpl extends AbstractBaseDAO<GoodsApp> implements GoodsAppDAO {

	@Override
	public void updateGoodsApp(GoodsApp gooodsApp) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update t_goodsapp set empid=?, goodsname=?, quantity=?, des=?, status=? where goodsappid=?";
		Query query = session.createSQLQuery(sql);
		query.setParameter(0, "4028809959641d0701596422a1c20001");
		query.setParameter(1, gooodsApp.getGoodsName());
		query.setParameter(2, gooodsApp.getQuantity());
		query.setParameter(3, gooodsApp.getDes());
		query.setParameter(4, gooodsApp.getStatus());
		query.setParameter(5, gooodsApp.getGoodsAppId());
		query.executeUpdate();
	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public Pager4EasyUI<GoodsAppInfo> queryPager(Pager4EasyUI<GoodsAppInfo> pager) {
//		Session session = getSessionFactory().getCurrentSession();
//		String sql = "select ga.goodsappid, e.empid, e.name AS empName, ga.goodsname, "
//				+ " ga.quantity, ga.appday, ga.des, ga.status, ga.appstatus "
//				+ " from t_goodsapp ga, t_emp e where ga.empid = e.empid";
//		Query query = session.createSQLQuery(sql);
//		query.setFirstResult(pager.getBeginIndex());
//		query.setMaxResults(pager.getPageSize());
//		List<Object[]> list = query.list();
//		List<GoodsAppInfo> gaiIs = new ArrayList<GoodsAppInfo>();
//		for(Object[] objs : list) {
//			GoodsAppInfo gai = new GoodsAppInfo();
//			gai.setGoodsAppId(objs[0].toString());
//			gai.setEmpId(objs[1].toString());
//			gai.setEmpName(objs[2].toString());
//			gai.setGoodsName(objs[3].toString());
//			gai.setQuantity((int) objs[4]);
//			gai.setAppDay((Date) objs[5]);
//			gai.setDes(objs[6].toString());
//			gai.setStatus((int) objs[7]);
//			gaiIs.add(gai);
//		}
//		pager.setRows(gaiIs);
//		return pager;
//	}

}
