package com.oa.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.info.EmpsSalary;
import com.oa.common.bean.Pager4EasyUI;

@SuppressWarnings("rawtypes")
public class EmpsSalaryDAOImpl extends AbstractBaseDAO implements EmpsSalaryDAO {

	@Override
	public long count(String sql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		Object obj = query.uniqueResult();
		long count = Long.valueOf(String.valueOf(obj));
		return count;
	}

	@Override
	public Pager4EasyUI<EmpsSalary> queryByEmpId(String eId, Pager4EasyUI<EmpsSalary> pager) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "select * from t_salaryinfo s where s.empId = '" + eId + "'";
		Query query = session.createSQLQuery(sql);
		List<EmpsSalary> list = new ArrayList<>();
		@SuppressWarnings("unchecked")
		List<Object[]> obj = query.list();
		for (Object[] o : obj) {
			EmpsSalary es = new EmpsSalary();
			es.setEmpId((String) o[0]);
			es.setEmpId((String) o[1]);
			es.setBasicSalary((Double) o[2]);
			es.setJobSalary((Double) o[3]);
			list.add(es);
		}
		pager.setRows(list);
		return pager;
	}
}
