package com.oa.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.StudentChecking;
import com.oa.common.bean.Pager4EasyUI;

public class StudentCheckingDAOImpl extends AbstractBaseDAO<StudentChecking> implements StudentCheckingDAO {

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<StudentChecking> queryPagerByGradeId(Pager4EasyUI<StudentChecking> pager, Serializable gradeId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select stuId from Student where gradeId = ?");
		query.setParameter(0, gradeId);
		List<Object> list = query.list();
		if (list.size() > 0) {
			Criteria c = session.createCriteria(StudentChecking.class).add(Restrictions.in("stu.stuId", list)); // 条件查询
			List<StudentChecking> scores = c.list();
			pager.setRows(scores);
		} else {
			pager.setRows(new ArrayList<StudentChecking>());
		}
		return pager;
	}
}
