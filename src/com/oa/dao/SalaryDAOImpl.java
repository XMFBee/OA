package com.oa.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Salary;
import com.oa.bean.SalaryInfo;
import com.oa.common.bean.Pager4EasyUI;

public class SalaryDAOImpl extends AbstractBaseDAO<Salary> implements SalaryDAO {

	@Override
	public SalaryInfo queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from SalaryInfo s where s.empId = :eId");
		query.setParameter("eId", id);
		SalaryInfo si = (SalaryInfo) query.uniqueResult();
		return si;
	}

	@Override
	public Pager4EasyUI<Salary> queryBySearch(Pager4EasyUI<Salary> pager, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
        Criteria c = session.createCriteria(Salary.class);
        Criteria empCriteria = c.createCriteria("employee");
        empCriteria.add(Restrictions.like("name", "%"+name+"%"));
        @SuppressWarnings("unchecked")
		List<Salary> list = (List<Salary>)c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}

}
