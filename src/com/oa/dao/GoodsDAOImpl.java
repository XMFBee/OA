package com.oa.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Goods;
import com.oa.bean.GoodsType;
import com.oa.bean.info.GoodsInfo;
import com.oa.common.bean.Pager4EasyUI;

/**
 * @author XMF
 */

public class GoodsDAOImpl extends AbstractBaseDAO<Goods> implements GoodsDAO {

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<GoodsInfo> queryInfoPager(Pager4EasyUI<GoodsInfo> pager) {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createSQLQuery("select g.goodsid, g.name as goodsName,g.quantity,g.des,g.unitprice,g.buyday,g.status,gt.goodstypeid,gt.name as goodsTypeName from t_goods g ,t_goodstype gt where g.goodstypeid = gt.goodstypeid");
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		List<Object[]> list = query.list();
		List<GoodsInfo> goodsInfo = new ArrayList<GoodsInfo>();
		for(Object[] objs : list) {
			GoodsInfo ginfo = new GoodsInfo();
			ginfo.setGoodsId(objs[0].toString());
			ginfo.setName(objs[1].toString());
			ginfo.setQuantity((int) objs[2]);
			ginfo.setDes(objs[3].toString());
			ginfo.setUnitPrice((double) objs[4]);
			ginfo.setBuyDay((Date) objs[5]);
			ginfo.setStatus((int) objs[6]);
			ginfo.setGoodsTypeId(objs[7].toString());
			ginfo.setGoodsTypeName(objs[8].toString());
			goodsInfo.add(ginfo);
		}
		pager.setRows(goodsInfo);
		return pager;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GoodsType> queryNameAll() {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from GoodsType");	// 查询用品类型的数据
		return query.list();
	}

	@Override
	public void updateGoods(Goods goods) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("update t_goods set name=?, quantity=?, des=?, unitprice=?, "
				+ "goodstypeid=?, status=? where goodsId=?");
		query.setParameter(0, goods.getName());
		query.setParameter(1, goods.getQuantity());
		query.setParameter(2, goods.getDes());
		query.setParameter(3, goods.getUnitPrice());
		query.setParameter(4, goods.getGoodsTypeId().getGoodsTypeId());
		query.setParameter(5, goods.getStatus());
		query.setParameter(6, goods.getGoodsId());
		query.executeUpdate();
	}

	@Override
	public void updateQuantity(String goodsId, int quantity) {
		String sql = "update t_goods  set quantity=quantity ";
		String whe = " where goodsid = :goodsid";
		sql += "+" + quantity;
		sql += whe;
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.setParameter("goodsid", goodsId);
		query.executeUpdate();
	}

	@Override
	public int countGoodsByGT(String gtId) {
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery("select count(g.goodsId) from t_goodstype gt " 
			+ " left join t_goods g on gt.goodstypeid = g.goodstypeid where g.goodstypeid = ?;");
		query.setParameter(0, gtId);
		Object obj =  query.uniqueResult();
		BigInteger bigint = (BigInteger)obj;
		return bigint.intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<GoodsInfo> queryByName(Pager4EasyUI<GoodsInfo> pager, String gName) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("select g.goodsId, g.name as goodsName, g.quantity, "
        	+ "g.des, g.unitprice, g.buyday,g.status, "
       		+ " gt.goodstypeid, gt.name as gtName from t_goods g "
       		+ " left join t_goodstype gt on g.goodstypeid = gt.goodstypeid "
       		+ " where g.name like binary :name");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        query.setParameter("name", "%" + gName + "%");
		List<Object[]> row = query.list();
        List<GoodsInfo> list = new ArrayList<GoodsInfo>();
        for(Object[] o: row){
        	GoodsInfo gi = new GoodsInfo();
			gi.setGoodsId(o[0].toString());
			gi.setName(o[1].toString());
			gi.setQuantity((int) o[2]);
			gi.setDes(o[3].toString());
			gi.setUnitPrice((double) o[4]);
			gi.setBuyDay((Date) o[5]);
			gi.setStatus((int) o[6]);
			gi.setGoodsTypeId(o[7].toString());
			gi.setGoodsTypeName(o[8].toString());
			list.add(gi);
        }
        pager.setRows(list);
        return pager;
//		Session session = this.getSessionFactory().getCurrentSession();
//        Criteria c = session.createCriteria(GoodsInfo.class).add(Restrictions.like("name", "%"+gName+"%"));
//		List<GoodsInfo> list = (List<GoodsInfo>) c.list();
//		pager.setRows(list);
//		pager.setTotal(list.size());
//		return pager;
	}

	// 只查询用品总数 > 0 的数据
	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<GoodsInfo> queryByQuantity(Pager4EasyUI<GoodsInfo> pager, int quantity) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("select g.goodsId, g.name as goodsName, g.quantity, g.des, "
        	+ "g.unitprice, g.buyday,g.status, "
       		+ " gt.goodstypeid, gt.name as gtName from t_goods g "
       		+ " left join t_goodstype gt on g.goodstypeid = gt.goodstypeid "
       		+ " where g.quantity > 0");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
		List<Object[]> row = query.list();
        List<GoodsInfo> list = new ArrayList<GoodsInfo>();
        for(Object[] o: row){
        	GoodsInfo gi = new GoodsInfo();
			gi.setGoodsId(o[0].toString());
			gi.setName(o[1].toString());
			gi.setQuantity((int) o[2]);
			gi.setDes(o[3].toString());
			gi.setUnitPrice((double) o[4]);
			gi.setBuyDay((Date) o[5]);
			gi.setStatus((int) o[6]);
			gi.setGoodsTypeId(o[7].toString());
			gi.setGoodsTypeName(o[8].toString());
			list.add(gi);
        }
        pager.setRows(list);
        return pager;
	}

}
