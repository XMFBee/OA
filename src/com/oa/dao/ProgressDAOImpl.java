package com.oa.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Progress;
import com.oa.common.bean.Pager4EasyUI;

public class ProgressDAOImpl extends  AbstractBaseDAO<Progress> implements ProgressDAO {
	

	@Override
	public Pager4EasyUI<Progress> queryBySearch(Pager4EasyUI<Progress> pager, String empName) {
		Session session = this.getSessionFactory().getCurrentSession();
        Criteria c = session.createCriteria(Progress.class);
        Criteria empCriteria = c.createCriteria("employees");
        empCriteria.add(Restrictions.like("name", "%"+empName+"%"));
        @SuppressWarnings("unchecked")
		List<Progress> list = (List<Progress>)c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		if(pager.getTotal() == 0){
			Session s = this.getSessionFactory().getCurrentSession();
	        Criteria criteria = s.createCriteria(Progress.class);
	        Criteria empCriterias = criteria.createCriteria("grades");
	        empCriterias.add(Restrictions.like("name", "%"+empName+"%"));
			@SuppressWarnings("unchecked")
			List<Progress> lists = (List<Progress>)criteria.list();
			pager.setRows(lists);
			pager.setTotal(lists.size());
		}
		return pager;
	}

}
