package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.StudentChecking;
import com.oa.bean.StudentFeedback;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.StudentFeedbackDAO;

public class StudentFeedbackServiceImpl implements StudentFeedbackService{

	private StudentFeedbackDAO stuFeedbackDAO;
	
	
	public void setStuFeedbackDAO(StudentFeedbackDAO stuFeedbackDAO) {
		this.stuFeedbackDAO = stuFeedbackDAO;
	}

	@Override
	public StudentFeedback save(StudentFeedback t) {
		return stuFeedbackDAO.save(t);
	}

	@Override
	public void delete(StudentFeedback t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(StudentFeedback t) {
		stuFeedbackDAO.update(t);
	}

	@Override
	public StudentFeedback queryById(Class<?> clazz, Serializable id) {
		return null;
	}

	@Override
	public List<StudentFeedback> queryAll(Serializable beanName) {
		return stuFeedbackDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<StudentFeedback> queryPager(String beanName, Pager4EasyUI<StudentFeedback> pager) {
		return stuFeedbackDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return stuFeedbackDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuFeedbackDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<StudentFeedback> queryPagerByGradeId(Pager4EasyUI<StudentFeedback> pager,Serializable gradeId) {   
		return stuFeedbackDAO.queryPagerByGradeId(pager, gradeId);
	}

}
