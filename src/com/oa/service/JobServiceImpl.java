package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Job;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.JobDAO;

public class JobServiceImpl implements JobService {

	private JobDAO jobDAO;

	public void setJobDAO(JobDAO jobDAO) {
		this.jobDAO = jobDAO;
	}

	@Override
	public Job save(Job t) {
		return jobDAO.save(t);
	}

	@Override
	public void delete(Job t) {
		jobDAO.delete(t);
	}

	@Override
	public void update(Job t) {
		jobDAO.update(t);
	}

	@Override
	public Job queryById(Class<?> clazz, Serializable id) {
		return jobDAO.queryById(clazz, id);
	}

	@Override
	public List<Job> queryAll(Serializable beanName) {
		return jobDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Job> queryPager(String beanName, Pager4EasyUI<Job> pager) {
		return jobDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return jobDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		jobDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Job> queryPagerByGradeId(Pager4EasyUI<Job> pager, Serializable gradeId) {
		return jobDAO.queryPagerByGradeId(pager, gradeId);
	}

}
