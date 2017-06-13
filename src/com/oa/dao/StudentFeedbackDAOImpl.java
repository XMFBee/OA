package com.oa.dao;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Score;
import com.oa.bean.StudentFeedback;
import com.oa.common.bean.Pager4EasyUI;

public class StudentFeedbackDAOImpl extends AbstractBaseDAO<StudentFeedback> implements StudentFeedbackDAO{

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<StudentFeedback> queryPagerByGradeId(Pager4EasyUI<StudentFeedback> pager,
			Serializable gradeId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select stuId from Student where gradeId = ?");
		query.setParameter(0, gradeId);
		List<Object> list = query.list();
		if (list.size() > 0) {
			Criteria c = session.createCriteria(StudentFeedback.class).add(Restrictions.in("stu.stuId", list)); // 条件查询
			List<StudentFeedback> scores = c.list();
			pager.setRows(scores);
		} else {
			pager.setRows(new ArrayList<StudentFeedback>());
		}
		return pager;
	}
	
}
