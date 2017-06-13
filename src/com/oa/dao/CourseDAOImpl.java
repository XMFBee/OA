package com.oa.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Course;
import com.oa.common.bean.Pager4EasyUI;

public class CourseDAOImpl extends AbstractBaseDAO<Course> implements CourseDAO{

	@Override
	public Pager4EasyUI<Course> queryBySearch(Pager4EasyUI<Course> pager, String courseName) {
		Session session = this.getSessionFactory().getCurrentSession();
        Criteria c = session.createCriteria(Course.class).add(Restrictions.like("name", "%"+courseName+"%"));
        @SuppressWarnings("unchecked")
		List<Course> list = (List<Course>)c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		if(pager.getTotal() == 0){
			Session s = this.getSessionFactory().getCurrentSession();
	        Criteria cr = s.createCriteria(Course.class).add(Restrictions.like("des", "%"+courseName+"%"));
	        @SuppressWarnings("unchecked")
			List<Course> lists = (List<Course>)cr.list();
			pager.setRows(lists);
			pager.setTotal(lists.size());
		}
		return pager;
	}
}
