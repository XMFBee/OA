package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Grade;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.GradeDAO;

public class GradeServiceImpl implements GradeService {

	private GradeDAO gradeDAO;

	public void setGradeDAO(GradeDAO gradeDAO) {
		this.gradeDAO = gradeDAO;
	}

	@Override
	public Grade save(Grade t) {
		return gradeDAO.save(t);
	}

	@Override
	public void delete(Grade t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Grade t) {
		gradeDAO.update(t);
	}

	@Override
	public Grade queryById(Class<?> clazz, Serializable id) {
		return gradeDAO.queryById(clazz, id);
	}

	@Override
	public List<Grade> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Grade> queryPager(String beanName, Pager4EasyUI<Grade> pager) {
		return gradeDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return gradeDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		gradeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Grade> queryBySearch(Pager4EasyUI<Grade> pager, String stuName) {
		return gradeDAO.queryBySearch(pager, stuName);
	}

	@Override
	public int queryByGradeId(String gradeId) {
		return gradeDAO.queryByGradeId(gradeId);
	}



}
