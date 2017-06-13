package com.oa.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.GoodsUse;
import com.oa.common.bean.Pager4EasyUI;

public class GoodsUseDAOImpl extends  AbstractBaseDAO<GoodsUse> implements GoodsUseDAO{

	@Override
	public Pager4EasyUI<GoodsUse> queryNorm(Pager4EasyUI<GoodsUse> pager, String depid, String empid,
			String empname, Date beginDate, Date endDate, String believe, String sort, String order) {

		String hql = "";
		String seleceStr = "select new GoodsUse(g.useId,g.quantity,g.useDay,g.eReturnDay,g.returnDay,g.goods.goodsId,g.employee.empId,g.goods.name,g.employee.name,g.employee.department.depId,g.employee.department.name)"
				+ " from GoodsUse as g, Employee e , Goods gs,Department d  ";
		StringBuffer wheStr = new StringBuffer();
		String orderby = "";
		wheStr.append(" where g.employee.empId = e.empId and e.department.depId = d.depId and g.goods.goodsId = gs.goodsId ");
		
		if(depid!=null&&!depid.equals("")){wheStr.append(" and d.depId = :depid ");}
		if(empid!=null&&!empid.equals("")){wheStr.append(" and e.empId = :empid ");}
		if(empname!=null&&!empname.equals("")){wheStr.append(" and e.name like :empname ");}
		if(beginDate!=null){wheStr.append(" and g.returnDay >= :beginDate ");}
		if(endDate!=null){			wheStr.append(" and  g.returnDay<= :endDate " );		}
		if(believe!=null&&!believe.equals("")){
			if(believe.equals("0")){
				wheStr.append(" and g.returnDay > g.useDay ");
			}else if(believe.equals("1")){
				wheStr.append(" and g.returnDay > g.useDay ");
			}
			
		}
		if(sort!=null&&!sort.equals("")){	if(order!=null&&!order.equals("")){	orderby = " order by g."+ sort + " " + order;	}		}

		hql = seleceStr + wheStr.toString()+ orderby;
		
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		
		query.setFirstResult((pager.getPageNo()-1)*pager.getPageSize());
		query.setMaxResults(pager.getPageSize());
		if(depid!=null&&!depid.equals("")){query.setParameter(":depid", depid);}
		if(empid!=null&&!empid.equals("")){query.setParameter("empid", empid);}
		if(empname!=null&&!empname.equals("")){query.setParameter("empname", empname);}
		if(beginDate!=null){query.setParameter("beginDate", beginDate);}
		if(endDate!=null){		query.setParameter("endDate", endDate);}
		List result = query.list();
		pager.setRows(result);
		return pager;
	}

	@Override
	public void updReturnDay(String useId, Date returnDay) {
		String sql = "update t_goodsUse set returnDay = :returnDay where useid=:useid";
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("returnDay", returnDay);
		query.setParameter("useid", useId);
		query.executeUpdate();
	
	} 

}
