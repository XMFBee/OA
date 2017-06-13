package com.oa.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.Authority;


public class AuthorityDAOImpl extends AbstractBaseDAO<Authority> implements AuthorityDAO{

	@Override
	public boolean queryAuthority(String roleId, String actionName) {
		Session session = sessionFactory.getCurrentSession();
		Query query =  session.createQuery("from Roleaut where role.roleId =:roleid and aut.className =:actionName");
		query.setParameter("roleid",roleId );
		query.setParameter("actionName", actionName);
		@SuppressWarnings("unchecked")
		List<Authority> aut = query.list();
		if(aut != null && aut.size() > 0 ){
			return true;
		}
		return false;
		
	}

}
