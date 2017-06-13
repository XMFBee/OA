package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.StudentChecking;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.StudentCheckingDAO;

public class StudentCheckingServiceImpl implements StudentCheckingService{

	private StudentCheckingDAO stuCheckingDAO;
	
	

	public void setStuCheckingDAO(StudentCheckingDAO stuCheckingDAO) {
		this.stuCheckingDAO = stuCheckingDAO;
	}

	@Override
	public StudentChecking save(StudentChecking t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(StudentChecking t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(StudentChecking t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudentChecking queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudentChecking> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<StudentChecking> queryPager(String beanName, Pager4EasyUI<StudentChecking> pager) {
		return null;
	}

	@Override
	public long count(Serializable beanName) {
		return stuCheckingDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<StudentChecking> queryPagerByGradeId(Pager4EasyUI<StudentChecking> pager, Serializable gradeId) {
		return stuCheckingDAO.queryPagerByGradeId(pager, gradeId);
	}

}
