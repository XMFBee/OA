package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.StudentLeave;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.StudentLeaveDAO;

public class StudentLeaveServiceImpl implements StudentLeaveService{

	private StudentLeaveDAO stuLeaveDAO;
	
	
	public void setStuLeaveDAO(StudentLeaveDAO stuLeaveDAO) {
		this.stuLeaveDAO = stuLeaveDAO;
	}

	@Override
	public StudentLeave save(StudentLeave t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(StudentLeave t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(StudentLeave t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudentLeave queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudentLeave> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<StudentLeave> queryPager(String beanName, Pager4EasyUI<StudentLeave> pager) {
		return stuLeaveDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return stuLeaveDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<StudentLeave> queryPagerByGradeId(Pager4EasyUI<StudentLeave> pager, Serializable gradeId) {
		return stuLeaveDAO.queryPagerByGradeId(pager, gradeId);
	}

}
