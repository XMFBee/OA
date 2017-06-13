package com.oa.dao.info;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

import com.oa.bean.info.DepEmp;

public class CommonDAOImpl extends  AbstractBaseDAO<DepEmp> implements CommonDAO{

	@Override
	public List mohu(DetachedCriteria  dc) {
		Session session = getSessionFactory().getCurrentSession();
		Criteria criteria = dc.getExecutableCriteria(session);
		List list = criteria.list();
		return list;
	}
	
}
