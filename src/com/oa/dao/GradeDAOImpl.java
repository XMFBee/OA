package com.oa.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Grade;
import com.oa.bean.Student;
import com.oa.common.bean.Pager4EasyUI;

public class GradeDAOImpl extends AbstractBaseDAO<Grade> implements GradeDAO{

	@Override
	public Pager4EasyUI<Grade> queryBySearch(Pager4EasyUI<Grade> pager, String stuName) {
		Session session = this.getSessionFactory().getCurrentSession();
        Criteria c = session.createCriteria(Grade.class).add(Restrictions.like("name", "%"+stuName+"%"));
        @SuppressWarnings("unchecked")
		List<Grade> list = (List<Grade>)c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}

	@Override
	public int queryByGradeId(String gradeId) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select count(t.stuId) from Student t where t.gradeId =:gradeid");
        query.setParameter("gradeid", gradeId);
        Long count = (long) query.uniqueResult();
        return count.intValue();
	}


}
