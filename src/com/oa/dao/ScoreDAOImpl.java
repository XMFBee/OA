package com.oa.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Course;
import com.oa.bean.Grade;
import com.oa.bean.Score;
import com.oa.common.bean.Pager4EasyUI;

public class ScoreDAOImpl extends AbstractBaseDAO<Score> implements ScoreDAO{

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<Score> queryPagerByGradeId(Pager4EasyUI<Score> pager, Serializable gradeId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select stuId from Student where gradeId = ?");
		query.setParameter(0, gradeId);
		List<Object> list = query.list();
		if (list.size() > 0) {
			Criteria c = session.createCriteria(Score.class).add(Restrictions.in("stu.stuId", list)); // 条件查询
			List<Score> scores = c.list();
			pager.setRows(scores);
		} else {
			pager.setRows(new ArrayList<Score>());
		}
		return pager;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<Score> queryBySearch(Pager4EasyUI<Score> pager, String course) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select courseId from Course where name like :course");
		query.setParameter("course", "%"+course+"%");
		List<Object> list = query.list();
        if (list.size() > 0) {
        	Criteria c = session.createCriteria(Score.class).add(Restrictions.in("course.courseId", list));
			List<Score> scores = c.list();
			pager.setRows(scores);
		} else {
			pager.setRows(new ArrayList<Score>());
		}
		return pager;
	}

}
