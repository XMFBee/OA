package com.oa.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.IncomeType;

public class IncomeTypeDAOImpl extends AbstractBaseDAO<IncomeType> implements IncomeTypeDAO{

	@Override
	public IncomeType queryByName(String name) {
		 Session session = sessionFactory.getCurrentSession();
		 Query query = session.createQuery("from IncomeType it where it.name =:name");
		 query.setParameter("name", name);
		 return (IncomeType)query.uniqueResult();
	}

}
