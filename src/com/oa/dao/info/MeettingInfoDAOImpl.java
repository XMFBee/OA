package com.oa.dao.info;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.info.EmpfeedbackInfo;
import com.oa.bean.info.MeettingInfo;
import com.oa.common.bean.Pager4EasyUI;

public class MeettingInfoDAOImpl extends AbstractBaseDAO<MeettingInfo> implements MeettingInfoDAO{

	

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<MeettingInfo> queryPager(String beanName, Pager4EasyUI<MeettingInfo> pager) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select t.name as empName,m.meettingday,m.createdday,m.des,m.meettingid,t.empid,m.status from t_meetting m left join t_emp t on t.empid = m.empid");           
		query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<Object[]> row = query.list();
        List<MeettingInfo> list = new ArrayList<MeettingInfo>();
        for(Object[] o : row){
        	MeettingInfo meetting = new MeettingInfo();
        	meetting.setEmpName((String) o[0]);
        	meetting.setMeettingDay((Date) o[1]);
        	meetting.setCreatedDay((Date) o[2]);
        	meetting.setDes((String) o[3]);
        	meetting.setMeettingId((String) o[4]);
        	meetting.setEmpId((String) o[5]);
        	meetting.setStatus((int) o[6]);
        	list.add(meetting);
        }
        pager.setRows(list);
		return pager;
	}

	@Override
	public Pager4EasyUI<MeettingInfo> queryBySearch(Pager4EasyUI<MeettingInfo> pager, String empName) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("select e.name as empName,e.empid,m.meettingid,m.createdday,m.des,m.meettingday,m.status from t_meetting m left join t_emp e on e.empid = m.empid where e.name like binary :name or m.des like binary :name  or m.meettingday like binary :name");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        query.setParameter("name", "%" + empName + "%");
        @SuppressWarnings("unchecked")
		List<Object[]> row = query.list();
        List<MeettingInfo> list = new ArrayList<MeettingInfo>();
        for(Object[] o: row){
        	MeettingInfo met = new MeettingInfo();
        	met.setEmpName((String) o[0]);
        	met.setEmpId((String) o[1]);
        	met.setMeettingId((String) o[2]);
        	met.setCreatedDay((Date) o[3]);
        	met.setDes((String) o[4]);
        	met.setMeettingDay((Date) o[5]);
        	met.setStatus((int) o[6]);
        	list.add(met);
        }
        pager.setRows(list);
        return pager;
	}

	

}
