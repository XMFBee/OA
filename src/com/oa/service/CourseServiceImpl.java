package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Course;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.CourseDAO;
import com.oa.dao.CourseDAOImpl;

public class CourseServiceImpl implements CourseService{

	public CourseDAO courseDAO;

	public void setCourseDAO(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public Course save(Course t) {
		return courseDAO.save(t);
	}

	@Override
	public void delete(Course t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Course t) {
		courseDAO.update(t);
	}

	@Override
	public Course queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Course> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Course> queryPager(String beanName, Pager4EasyUI<Course> pager) {
		return courseDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return courseDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		courseDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Course> queryBySearch(Pager4EasyUI<Course> pager, String courseName) {
		return courseDAO.queryBySearch(pager, courseName);
	}
	
	

}
